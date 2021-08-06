inherited frmGeContasAReceber: TfrmGeContasAReceber
  Top = 218
  Caption = 'Controle de Contas A Receber'
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
      ExplicitLeft = 0
      ExplicitTop = 0
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
            Title.Caption = 'No. Lan'#231'. '
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
            FieldName = 'NOMECLIENTE'
            Title.Caption = 'Ciente '
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CNPJ'
            Title.Caption = 'CPF / CNPJ '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALORREC'
            Title.Caption = 'A Receber (R$) '
            Width = 90
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
            Title.Caption = 'Saldo (R$) '
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clBlue
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 90
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
            FieldName = 'PAGO_'
            Title.Caption = 'Pago? '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTREC'
            Title.Alignment = taCenter
            Title.Caption = 'Recebimento '
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
          Width = 205
          Height = 13
          Caption = '* Lan'#231'amentos a receber em aberto'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblLancamentoVencido: TLabel [1]
          Tag = -1
          Left = 2
          Top = 24
          Width = 196
          Height = 13
          Caption = '* Lan'#231'amentos a receber vencidos'
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
        object lblLancamentoCancelado: TLabel [2]
          Left = 2
          Top = 44
          Width = 152
          Height = 13
          Caption = '* Lan'#231'amentos cancelados'
          Font.Charset = ANSI_CHARSET
          Font.Color = 7303023
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
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
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 926
      ExplicitHeight = 489
      inherited Bevel8: TBevel
        Top = 281
        Width = 926
        ExplicitTop = 241
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
        Top = 372
        Width = 926
        Height = 4
        Align = alBottom
        Shape = bsSpacer
        ExplicitTop = 364
      end
      object Bevel9: TBevel [3]
        Left = 0
        Top = 201
        Width = 926
        Height = 4
        Align = alTop
        Shape = bsSpacer
        ExplicitTop = 161
      end
      inherited GrpBxDadosNominais: TGroupBox
        Width = 926
        Height = 81
        ExplicitWidth = 926
        ExplicitHeight = 81
        object lblCliente: TLabel [1]
          Left = 87
          Top = 24
          Width = 37
          Height = 13
          Caption = 'Cliente:'
          FocusControl = dbCliente
        end
        object lblQuitado: TLabel [2]
          Left = 768
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
        object lblCNPJ: TLabel [3]
          Left = 368
          Top = 24
          Width = 58
          Height = 13
          Caption = 'CPF / CNPJ:'
          FocusControl = dbCNPJ
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblVenda: TLabel [4]
          Left = 552
          Top = 24
          Width = 58
          Height = 13
          Caption = 'No. Venda:'
          FocusControl = daVenda
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblNFe: TLabel [5]
          Left = 680
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
        inherited dbCodigo: TDBEdit
          Color = clMoneyGreen
          DataField = 'NUMLANC'
        end
        object dbQuitado: TDBEdit
          Left = 768
          Top = 40
          Width = 129
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'BAIXADO'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
        end
        object dbCNPJ: TDBEdit
          Left = 368
          Top = 40
          Width = 177
          Height = 21
          Color = clMoneyGreen
          DataField = 'CNPJ'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object daVenda: TDBEdit
          Left = 552
          Top = 40
          Width = 41
          Height = 21
          Color = clMoneyGreen
          DataField = 'ANOVENDA'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object dnVenda: TDBEdit
          Left = 600
          Top = 40
          Width = 73
          Height = 21
          Color = clMoneyGreen
          DataField = 'NUMVENDA'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
        object dbNFe: TDBEdit
          Left = 680
          Top = 40
          Width = 83
          Height = 21
          Color = clMoneyGreen
          DataField = 'NFE_VENDA'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
        end
        object dbCliente: TJvDBComboEdit
          Left = 87
          Top = 40
          Width = 274
          Height = 21
          ButtonHint = 'Pesquisar Cliente (Ctrl+P)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clMoneyGreen
          DataField = 'NOMECLIENTE'
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
          TabOrder = 1
          OnButtonClick = dbClienteButtonClick
        end
      end
      object GrpBxDadosValores: TGroupBox
        Left = 0
        Top = 85
        Width = 926
        Height = 116
        Align = alTop
        Caption = 'A Receber'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object lblParcela: TLabel
          Left = 16
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
        object lblValorAReceber: TLabel
          Left = 16
          Top = 64
          Width = 89
          Height = 13
          Caption = 'A Receber (R$):'
          FocusControl = dbValorAReceber
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblFormaPagto: TLabel
          Left = 120
          Top = 64
          Width = 124
          Height = 13
          Caption = '&Forma de Pagamento:'
          FocusControl = dbFormaPagto
        end
        object lblValorMulta: TLabel
          Left = 352
          Top = 64
          Width = 63
          Height = 13
          Caption = 'Multa (R$):'
          FocusControl = dbValorMulta
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblTotalAReceber: TLabel
          Left = 520
          Top = 64
          Width = 115
          Height = 13
          Caption = 'Total Recebido (R$):'
          FocusControl = dbTotalAReceber
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblPercDesconto: TLabel
          Left = 456
          Top = 64
          Width = 49
          Height = 13
          Caption = '% Desc.:'
          FocusControl = dbPercDesconto
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblEmissao: TLabel
          Left = 71
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
          Left = 183
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
        object lblCompetenciaApuracao: TLabel
          Left = 294
          Top = 24
          Width = 151
          Height = 13
          Caption = 'Compet'#234'ncia de Apura'#231#227'o:'
          FocusControl = dbCompetenciaApuracao
        end
        object lblTipoReceita: TLabel
          Left = 455
          Top = 24
          Width = 90
          Height = 13
          Caption = 'Tipo de Receita:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblSaldoAPagar: TLabel
          Left = 655
          Top = 64
          Width = 123
          Height = 13
          Caption = 'Saldo A Receber (R$):'
          FocusControl = dbSaldoAReceber
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbParcela: TDBEdit
          Left = 16
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
          TabOrder = 0
        end
        object dbValorAReceber: TDBEdit
          Left = 16
          Top = 80
          Width = 97
          Height = 21
          DataField = 'VALORREC'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
          OnExit = ControlEditExit
        end
        object dbFormaPagto: TDBLookupComboBox
          Left = 120
          Top = 80
          Width = 225
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
          OnClick = dbFormaPagtoClick
        end
        object dbValorMulta: TDBEdit
          Left = 352
          Top = 80
          Width = 97
          Height = 21
          DataField = 'VALORMULTA'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 7
          OnExit = ControlEditExit
        end
        object dbTotalAReceber: TDBEdit
          Left = 520
          Top = 80
          Width = 129
          Height = 21
          Color = clMoneyGreen
          DataField = 'VALORRECTOT'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 9
          OnExit = ControlEditExit
        end
        object dbPercDesconto: TDBEdit
          Left = 456
          Top = 80
          Width = 57
          Height = 21
          DataField = 'PERCENTDESCONTO'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 8
        end
        object dbEmissao: TJvDBDateEdit
          Left = 71
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
          TabOrder = 1
        end
        object dbVencimento: TJvDBDateEdit
          Left = 183
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
          TabOrder = 2
        end
        object dbCompetenciaApuracao: TDBLookupComboBox
          Left = 294
          Top = 40
          Width = 155
          Height = 21
          DataField = 'COMPETENCIA_APURACAO'
          DataSource = DtSrcTabela
          DropDownRows = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'CMP_NUM'
          ListField = 'CMP_DESC'
          ListSource = dtsCompetencia
          ParentFont = False
          TabOrder = 3
        end
        object dbTipoReceita: TDBLookupComboBox
          Left = 455
          Top = 40
          Width = 357
          Height = 21
          DataField = 'CODTPREC'
          DataSource = DtSrcTabela
          DropDownRows = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'COD'
          ListField = 'TIPOREC'
          ListSource = dtsTpReceita
          ParentFont = False
          TabOrder = 4
        end
        object dbSaldoAReceber: TDBEdit
          Left = 655
          Top = 80
          Width = 123
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
          TabOrder = 10
        end
      end
      object pgcMaisDados: TPageControl
        Left = 0
        Top = 376
        Width = 926
        Height = 113
        ActivePage = tbsHistorico
        Align = alBottom
        TabOrder = 4
        object tbsHistorico: TTabSheet
          Caption = 'Hist'#243'rico'
          object dbObservacao: TDBMemo
            Left = 0
            Top = 0
            Width = 918
            Height = 85
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
        Top = 285
        Width = 926
        Height = 87
        Hint = 
          'Para a exclus'#227'o de baixas basta pressionar CTRL + DELETE'#13#10#13#10'Obse' +
          'rva'#231#227'o:'#13#10'======================='#13#10'Apenas usu'#225'rios nas fun'#231#245'es Di' +
          'retoria, Gerente Financeiro, Gerente ADM'#13#10'e/ou Masterdados podem' +
          ' excluir registros de pagamentos.'
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
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 3
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = [fsBold]
        OnDrawColumnCell = dbgDadosDrawColumnCell
        OnKeyDown = dbgPagamentosKeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'SEQ'
            Title.Alignment = taCenter
            Title.Caption = '# '
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATA_PAGTO'
            Title.Alignment = taCenter
            Title.Caption = 'Data Pagto. '
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FORMA_PAGTO_DESC'
            Title.Caption = 'Forma de Pagamento '
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
            Title.Caption = 'Valor Pago (R$) '
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
            Title.Caption = 'No. Cheque '
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BCO_NOME'
            Title.Caption = 'Banco '
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DOCUMENTO_BAIXA'
            Title.Caption = 'Doc. Baixa '
            Width = 120
            Visible = True
          end>
      end
      object GrpBxDadosBoleto: TGroupBox
        Left = 0
        Top = 205
        Width = 926
        Height = 76
        Align = alTop
        Caption = 'Dados do Boleto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object lblBanco: TLabel
          Left = 16
          Top = 24
          Width = 33
          Height = 13
          Caption = 'Banco:'
          FocusControl = dbBanco
        end
        object lblNossoNumero: TLabel
          Left = 272
          Top = 24
          Width = 73
          Height = 13
          Caption = 'Nosso N'#250'mero:'
          FocusControl = dbNossoNumero
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblPercJuros: TLabel
          Left = 384
          Top = 24
          Width = 44
          Height = 13
          Caption = '% Juros:'
          FocusControl = dbPercJuros
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblPercMulta: TLabel
          Left = 448
          Top = 24
          Width = 44
          Height = 13
          Caption = '% Multa:'
          FocusControl = dbPercMulta
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblDataBoleto: TLabel
          Left = 512
          Top = 24
          Width = 60
          Height = 13
          Caption = 'Data Boleto:'
          FocusControl = dbDataBoleto
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblDataPagto: TLabel
          Left = 616
          Top = 24
          Width = 62
          Height = 13
          Caption = 'Data Pagto.:'
          FocusControl = dbDataPagto
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object dbBanco: TDBLookupComboBox
          Left = 16
          Top = 40
          Width = 249
          Height = 21
          Color = clMoneyGreen
          DataField = 'CODBANCO'
          DataSource = DtSrcTabela
          DropDownRows = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'BCO_COD'
          ListField = 'BCO_NOME_AGENCIA_CONTA'
          ListSource = dtsBanco
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object dbNossoNumero: TDBEdit
          Left = 272
          Top = 40
          Width = 105
          Height = 21
          Color = clMoneyGreen
          DataField = 'NOSSONUMERO'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object dbPercJuros: TDBEdit
          Left = 384
          Top = 40
          Width = 57
          Height = 21
          Color = clMoneyGreen
          DataField = 'PERCENTJUROS'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object dbPercMulta: TDBEdit
          Left = 448
          Top = 40
          Width = 57
          Height = 21
          Color = clMoneyGreen
          DataField = 'PERCENTMULTA'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object dbDataBoleto: TDBEdit
          Left = 512
          Top = 40
          Width = 97
          Height = 21
          Color = clMoneyGreen
          DataField = 'DATAPROCESSOBOLETO'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
        object dbDataPagto: TDBEdit
          Left = 616
          Top = 40
          Width = 97
          Height = 21
          Color = clMoneyGreen
          DataField = 'DTREC'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
        end
        object dbEnviado: TDBCheckBox
          Left = 720
          Top = 42
          Width = 105
          Height = 17
          Caption = 'Boleto Enviado'
          DataField = 'ENVIADO'
          DataSource = DtSrcTabela
          ReadOnly = True
          TabOrder = 6
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
    end
  end
  inherited tlbBotoes: TPanel
    Top = 522
    Width = 934
    ExplicitTop = 522
    ExplicitWidth = 934
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
    object Bevel10: TBevel [6]
      Left = 84
      Top = 0
      Width = 4
      Height = 35
      Align = alLeft
      Shape = bsSpacer
      ExplicitLeft = 81
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
      Hint = 'Efetuar Baixa'
      Align = alRight
      Caption = 'E&fetuar Baixa'
      Enabled = False
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
    SelectSQL.Strings = (
      'Select'
      '    r.Anolanc'
      '  , r.Numlanc'
      '  , r.Parcela'
      '  , r.Empresa'
      '  , r.Cliente'
      '  , r.Cnpj'
      '  , r.Forma_pagto'
      '  , r.Tippag'
      '  , r.Codtprec'
      '  , r.Historic'
      '  , r.Numrec'
      '  , r.Dtemiss'
      '  , r.Dtvenc'
      '  , r.Dtrec'
      '  , r.Docbaix'
      '  , r.Valorrec'
      '  , r.Valormulta'
      '  , r.Valorrectot'
      '  , r.Numcontrato'
      '  , r.Codbanco'
      '  , r.Nossonumero'
      '  , r.Remessa'
      '  , r.Valorsaldo'
      '  , r.Percentjuros'
      '  , r.Percentmulta'
      '  , r.Percentdesconto'
      '  , r.Dataprocessoboleto'
      '  , r.Baixado'
      '  , r.Enviado'
      '  , r.Anovenda'
      '  , r.Numvenda'
      '  , r.AnoOS'
      '  , r.NumOS'
      '  , r.Situacao'
      '  , r.Competencia_apuracao'
      '  , c.Nome as NomeCliente'
      '  , Case when r.Baixado = 1 then '#39'X'#39' else '#39'.'#39' end as Pago_'
      '  , vn.Serie'
      '  , vn.Nfe'
      
        '  , right('#39'0000000'#39' || vn.Nfe, 7) || '#39'/'#39' || trim(vn.Serie) as NF' +
        'E_VENDA'
      '  , os.nfs_serie'
      '  , os.nfs_numero'
      
        '  , right('#39'0000000'#39' || os.nfs_numero, 7) || '#39'/'#39' || trim(os.nfs_s' +
        'erie) as NFSE_OS'
      'from TBCONTREC r'
      '  left join TBCLIENTE c on (c.Codigo = r.Cliente)'
      
        '  left join TBVENDAS vn on (vn.Ano = r.Anovenda and vn.Codcontro' +
        'l = r.Numvenda)'
      
        '  left join TBOS os on (os.Ano = r.AnoOS and os.Controle = r.Num' +
        'OS)')
    GeneratorField.Field = 'NUMLANC'
    GeneratorField.Generator = 'GEN_CONTAREC_NUM_2011'
  end
  inherited DtSrcTabela: TDataSource
    DataSet = fdQryTabela
    OnDataChange = DtSrcTabelaDataChange
    Left = 704
    Top = 32
  end
  inherited IbUpdTabela: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  ANOLANC,'
      '  NUMLANC,'
      '  EMPRESA,'
      '  CLIENTE,'
      '  CNPJ,'
      '  FORMA_PAGTO,'
      '  TIPPAG,'
      '  HISTORIC,'
      '  NUMREC,'
      '  DTEMISS,'
      '  DTVENC,'
      '  DTREC,'
      '  DOCBAIX,'
      '  VALORREC,'
      '  VALORMULTA,'
      '  VALORRECTOT,'
      '  VALORSALDO,'
      '  NUMCONTRATO,'
      '  PARCELA,'
      '  STATUS,'
      '  CODBANCO,'
      '  BANCO_FEBRABAN,'
      '  NOSSONUMERO,'
      '  REMESSA,'
      '  PERCENTJUROS,'
      '  PERCENTMULTA,'
      '  PERCENTDESCONTO,'
      '  DATAPROCESSOBOLETO,'
      '  BAIXADO,'
      '  ENVIADO,'
      '  ANOVENDA,'
      '  NUMVENDA,'
      '  CODTPREC,'
      '  SITUACAO,'
      '  LOTE,'
      '  COMPETENCIA_APURACAO'
      'from TBCONTREC '
      'where'
      '  ANOLANC = :ANOLANC and'
      '  NUMLANC = :NUMLANC')
    ModifySQL.Strings = (
      'update TBCONTREC'
      'set'
      '  ANOLANC = :ANOLANC,'
      '  ANOVENDA = :ANOVENDA,'
      '  BAIXADO = :BAIXADO,'
      '  CLIENTE = :CLIENTE,'
      '  CNPJ = :CNPJ,'
      '  CODBANCO = :CODBANCO,'
      '  CODTPREC = :CODTPREC,'
      '  COMPETENCIA_APURACAO = :COMPETENCIA_APURACAO,'
      '  DATAPROCESSOBOLETO = :DATAPROCESSOBOLETO,'
      '  DOCBAIX = :DOCBAIX,'
      '  DTEMISS = :DTEMISS,'
      '  DTREC = :DTREC,'
      '  DTVENC = :DTVENC,'
      '  EMPRESA = :EMPRESA,'
      '  ENVIADO = :ENVIADO,'
      '  FORMA_PAGTO = :FORMA_PAGTO,'
      '  HISTORIC = :HISTORIC,'
      '  NOSSONUMERO = :NOSSONUMERO,'
      '  NUMCONTRATO = :NUMCONTRATO,'
      '  NUMLANC = :NUMLANC,'
      '  NUMREC = :NUMREC,'
      '  NUMVENDA = :NUMVENDA,'
      '  PARCELA = :PARCELA,'
      '  PERCENTDESCONTO = :PERCENTDESCONTO,'
      '  PERCENTJUROS = :PERCENTJUROS,'
      '  PERCENTMULTA = :PERCENTMULTA,'
      '  REMESSA = :REMESSA,'
      '  SITUACAO = :SITUACAO,'
      '  TIPPAG = :TIPPAG,'
      '  VALORMULTA = :VALORMULTA,'
      '  VALORREC = :VALORREC,'
      '  VALORRECTOT = :VALORRECTOT,'
      '  VALORSALDO = :VALORSALDO'
      'where'
      '  ANOLANC = :OLD_ANOLANC and'
      '  NUMLANC = :OLD_NUMLANC')
    InsertSQL.Strings = (
      'insert into TBCONTREC'
      
        '  (ANOLANC, ANOVENDA, BAIXADO, CLIENTE, CNPJ, CODBANCO, CODTPREC' +
        ', COMPETENCIA_APURACAO, '
      
        '   DATAPROCESSOBOLETO, DOCBAIX, DTEMISS, DTREC, DTVENC, EMPRESA,' +
        ' ENVIADO, '
      
        '   FORMA_PAGTO, HISTORIC, NOSSONUMERO, NUMCONTRATO, NUMLANC, NUM' +
        'REC, NUMVENDA, '
      
        '   PARCELA, PERCENTDESCONTO, PERCENTJUROS, PERCENTMULTA, REMESSA' +
        ', SITUACAO, '
      '   TIPPAG, VALORMULTA, VALORREC, VALORRECTOT, VALORSALDO)'
      'values'
      
        '  (:ANOLANC, :ANOVENDA, :BAIXADO, :CLIENTE, :CNPJ, :CODBANCO, :C' +
        'ODTPREC, '
      
        '   :COMPETENCIA_APURACAO, :DATAPROCESSOBOLETO, :DOCBAIX, :DTEMIS' +
        'S, :DTREC, '
      
        '   :DTVENC, :EMPRESA, :ENVIADO, :FORMA_PAGTO, :HISTORIC, :NOSSON' +
        'UMERO, '
      
        '   :NUMCONTRATO, :NUMLANC, :NUMREC, :NUMVENDA, :PARCELA, :PERCEN' +
        'TDESCONTO, '
      
        '   :PERCENTJUROS, :PERCENTMULTA, :REMESSA, :SITUACAO, :TIPPAG, :' +
        'VALORMULTA, '
      '   :VALORREC, :VALORRECTOT, :VALORSALDO)')
    DeleteSQL.Strings = (
      'delete from TBCONTREC'
      'where'
      '  ANOLANC = :OLD_ANOLANC and'
      '  NUMLANC = :OLD_NUMLANC')
  end
  inherited ImgList: TImageList
    Left = 608
    Top = 0
  end
  inherited fdQryTabela: TFDQuery
    BeforePost = fdQryTabelaBeforePost
    AfterScroll = fdQryTabelaAfterScroll
    UpdateOptions.AssignedValues = [uvFetchGeneratorsPoint, uvGeneratorName]
    UpdateOptions.FetchGeneratorsPoint = gpImmediate
    UpdateOptions.GeneratorName = 'GEN_CONTAREC_NUM_2019'
    UpdateOptions.KeyFields = 'ANOLANC;NUMLANC'
    UpdateOptions.AutoIncFields = 'NUMLANC'
    SQL.Strings = (
      'Select'
      '    r.Anolanc'
      '  , r.Numlanc'
      '  , r.Parcela'
      '  , r.Empresa'
      '  , r.Cliente'
      '  , r.Cnpj'
      '  , r.Forma_pagto'
      '  , r.Tippag'
      '  , r.Codtprec'
      '  , r.Historic'
      '  , r.Numrec'
      '  , r.Dtemiss'
      '  , r.Dtvenc'
      '  , r.Dtrec'
      '  , r.Docbaix'
      '  , r.Valorrec'
      '  , r.Valormulta'
      '  , r.Valorrectot'
      '  , r.Numcontrato'
      '  , r.Codbanco'
      '  , r.Nossonumero'
      '  , r.Remessa'
      '  , r.Valorsaldo'
      '  , r.Percentjuros'
      '  , r.Percentmulta'
      '  , r.Percentdesconto'
      '  , r.Dataprocessoboleto'
      '  , r.Baixado'
      '  , r.Enviado'
      '  , r.Anovenda'
      '  , r.Numvenda'
      '  , r.AnoOS'
      '  , r.NumOS'
      '  , r.Situacao'
      '  , r.Competencia_apuracao'
      '  , c.Nome as NomeCliente'
      '  , Case when r.Baixado = 1 then '#39'X'#39' else '#39'.'#39' end as Pago_'
      '  , vn.Serie'
      '  , vn.Nfe'
      
        '  , right('#39'0000000'#39' || vn.Nfe, 7) || '#39'/'#39' || trim(vn.Serie) as NF' +
        'E_VENDA'
      '  , os.nfs_serie'
      '  , os.nfs_numero'
      
        '  , right('#39'0000000'#39' || os.nfs_numero, 7) || '#39'/'#39' || trim(os.nfs_s' +
        'erie) as NFSE_OS'
      'from TBCONTREC r'
      '  left join TBCLIENTE c on (c.Codigo = r.Cliente)'
      
        '  left join TBVENDAS vn on (vn.Ano = r.Anovenda and vn.Codcontro' +
        'l = r.Numvenda)'
      
        '  left join TBOS os on (os.Ano = r.AnoOS and os.Controle = r.Num' +
        'OS)')
    object fdQryTabelaANOLANC: TSmallintField
      FieldName = 'ANOLANC'
      Origin = 'ANOLANC'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object fdQryTabelaNUMLANC: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'NUMLANC'
      Origin = 'NUMLANC'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object fdQryTabelaPARCELA: TSmallintField
      Alignment = taCenter
      DisplayLabel = 'Parcela'
      FieldName = 'PARCELA'
      Origin = 'PARCELA'
      DisplayFormat = '#00'
    end
    object fdQryTabelaEMPRESA: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      Origin = 'EMPRESA'
      Size = 18
    end
    object fdQryTabelaCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
      Origin = 'CLIENTE'
      Required = True
    end
    object fdQryTabelaCNPJ: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      Size = 18
    end
    object fdQryTabelaFORMA_PAGTO: TSmallintField
      DisplayLabel = 'Forma de Pagamento'
      FieldName = 'FORMA_PAGTO'
      Origin = 'FORMA_PAGTO'
    end
    object fdQryTabelaTIPPAG: TStringField
      FieldName = 'TIPPAG'
      Origin = 'TIPPAG'
      Size = 35
    end
    object fdQryTabelaCODTPREC: TSmallintField
      DisplayLabel = 'Tipo de Receita'
      FieldName = 'CODTPREC'
      Origin = 'CODTPREC'
      Required = True
    end
    object fdQryTabelaHISTORIC: TMemoField
      DisplayLabel = 'Hist'#243'rico'
      FieldName = 'HISTORIC'
      Origin = 'HISTORIC'
      BlobType = ftMemo
    end
    object fdQryTabelaNUMREC: TStringField
      DisplayLabel = 'No. Recebimento'
      FieldName = 'NUMREC'
      Origin = 'NUMREC'
      Size = 15
    end
    object fdQryTabelaDTEMISS: TDateField
      DisplayLabel = 'Emiss'#227'o'
      FieldName = 'DTEMISS'
      Origin = 'DTEMISS'
      Required = True
      DisplayFormat = 'dd/mm/yyyy'
    end
    object fdQryTabelaDTVENC: TDateField
      DisplayLabel = 'Vencimento'
      FieldName = 'DTVENC'
      Origin = 'DTVENC'
      Required = True
      DisplayFormat = 'dd/mm/yyyy'
    end
    object fdQryTabelaCOMPETENCIA_APURACAO: TIntegerField
      DisplayLabel = 'Compet'#234'ncia de Apura'#231#227'o'
      FieldName = 'COMPETENCIA_APURACAO'
      Origin = 'COMPETENCIA_APURACAO'
      Required = True
    end
    object fdQryTabelaDTREC: TDateField
      DisplayLabel = 'Recebimento'
      FieldName = 'DTREC'
      Origin = 'DTREC'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object fdQryTabelaDOCBAIX: TStringField
      DisplayLabel = 'Doc. Baixa'
      FieldName = 'DOCBAIX'
      Origin = 'DOCBAIX'
      Size = 15
    end
    object fdQryTabelaNUMCONTRATO: TStringField
      DisplayLabel = 'No. Contrato'
      FieldName = 'NUMCONTRATO'
      Origin = 'NUMCONTRATO'
      Size = 15
    end
    object fdQryTabelaCODBANCO: TIntegerField
      DisplayLabel = 'Banco'
      FieldName = 'CODBANCO'
      Origin = 'CODBANCO'
    end
    object fdQryTabelaNOSSONUMERO: TStringField
      DisplayLabel = 'Nosso N'#250'mero'
      FieldName = 'NOSSONUMERO'
      Origin = 'NOSSONUMERO'
    end
    object fdQryTabelaREMESSA: TIntegerField
      FieldName = 'REMESSA'
      Origin = 'REMESSA'
    end
    object fdQryTabelaDATAPROCESSOBOLETO: TDateField
      DisplayLabel = 'Proc. Boleto'
      FieldName = 'DATAPROCESSOBOLETO'
      Origin = 'DATAPROCESSOBOLETO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object fdQryTabelaBAIXADO: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'BAIXADO'
      Origin = 'BAIXADO'
      Required = True
      OnGetText = fdQryTabelaBAIXADOGetText
    end
    object fdQryTabelaENVIADO: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'ENVIADO'
      Origin = 'ENVIADO'
      Required = True
    end
    object fdQryTabelaANOVENDA: TSmallintField
      Alignment = taCenter
      FieldName = 'ANOVENDA'
      Origin = 'ANOVENDA'
      DisplayFormat = '0000'
    end
    object fdQryTabelaNUMVENDA: TIntegerField
      Alignment = taCenter
      FieldName = 'NUMVENDA'
      Origin = 'NUMVENDA'
      DisplayFormat = '0000000'
    end
    object fdQryTabelaANOOS: TSmallintField
      FieldName = 'ANOOS'
      Origin = 'ANOOS'
      DisplayFormat = '0000'
    end
    object fdQryTabelaNUMOS: TIntegerField
      FieldName = 'NUMOS'
      Origin = 'NUMOS'
      DisplayFormat = '0000000'
    end
    object fdQryTabelaPAGO_: TStringField
      Alignment = taCenter
      AutoGenerateValue = arDefault
      DisplayLabel = 'Baixado?'
      FieldName = 'PAGO_'
      Origin = 'PAGO_'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object fdQryTabelaNOMECLIENTE: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Cliente'
      FieldName = 'NOMECLIENTE'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object fdQryTabelaSITUACAO: TSmallintField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
    end
    object fdQryTabelaSERIE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'SERIE'
      Origin = 'SERIE'
      ProviderFlags = []
      Size = 4
    end
    object fdQryTabelaNFE: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'NFE'
      Origin = 'NFE'
      ProviderFlags = []
    end
    object fdQryTabelaNFE_VENDA: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'NF-e'
      FieldName = 'NFE_VENDA'
      Origin = 'NFE_VENDA'
      ProviderFlags = []
      Size = 32
    end
    object fdQryTabelaNFS_SERIE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NFS_SERIE'
      Origin = 'NFS_SERIE'
      ProviderFlags = []
      Size = 4
    end
    object fdQryTabelaNFS_NUMERO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'NFS_NUMERO'
      Origin = 'NFS_NUMERO'
      ProviderFlags = []
    end
    object fdQryTabelaNFSE_OS: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NFSE_OS'
      Origin = 'NFSE_OS'
      ProviderFlags = []
      Size = 23
    end
    object fdQryTabelaVALORREC: TFMTBCDField
      FieldName = 'VALORREC'
      Origin = 'VALORREC'
      Precision = 18
      Size = 2
    end
    object fdQryTabelaVALORMULTA: TFMTBCDField
      FieldName = 'VALORMULTA'
      Origin = 'VALORMULTA'
      Precision = 18
      Size = 2
    end
    object fdQryTabelaVALORRECTOT: TFMTBCDField
      FieldName = 'VALORRECTOT'
      Origin = 'VALORRECTOT'
      Precision = 18
      Size = 2
    end
    object fdQryTabelaVALORSALDO: TFMTBCDField
      FieldName = 'VALORSALDO'
      Origin = 'VALORSALDO'
      Precision = 18
      Size = 2
    end
    object fdQryTabelaPERCENTJUROS: TCurrencyField
      FieldName = 'PERCENTJUROS'
      Origin = 'PERCENTJUROS'
    end
    object fdQryTabelaPERCENTMULTA: TCurrencyField
      FieldName = 'PERCENTMULTA'
      Origin = 'PERCENTMULTA'
    end
    object fdQryTabelaPERCENTDESCONTO: TCurrencyField
      FieldName = 'PERCENTDESCONTO'
      Origin = 'PERCENTDESCONTO'
    end
  end
  inherited fdUpdTabela: TFDUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO TBCONTREC'
      '(ANOLANC, NUMLANC, EMPRESA, CLIENTE, CNPJ, '
      '  FORMA_PAGTO, TIPPAG, HISTORIC, NUMREC, '
      '  DTEMISS, DTVENC, DTREC, DOCBAIX, VALORREC, '
      '  VALORMULTA, VALORRECTOT, VALORSALDO, NUMCONTRATO, '
      '  PARCELA, CODBANCO, NOSSONUMERO, REMESSA, '
      '  PERCENTJUROS, PERCENTMULTA, PERCENTDESCONTO, '
      '  DATAPROCESSOBOLETO, BAIXADO, ENVIADO, ANOVENDA, '
      '  NUMVENDA, ANOOS, NUMOS, CODTPREC, SITUACAO, '
      '  COMPETENCIA_APURACAO)'
      
        'VALUES (:NEW_ANOLANC, :NEW_NUMLANC, :NEW_EMPRESA, :NEW_CLIENTE, ' +
        ':NEW_CNPJ, '
      '  :NEW_FORMA_PAGTO, :NEW_TIPPAG, :NEW_HISTORIC, :NEW_NUMREC, '
      
        '  :NEW_DTEMISS, :NEW_DTVENC, :NEW_DTREC, :NEW_DOCBAIX, :NEW_VALO' +
        'RREC, '
      
        '  :NEW_VALORMULTA, :NEW_VALORRECTOT, :NEW_VALORSALDO, :NEW_NUMCO' +
        'NTRATO, '
      '  :NEW_PARCELA, :NEW_CODBANCO, :NEW_NOSSONUMERO, :NEW_REMESSA, '
      '  :NEW_PERCENTJUROS, :NEW_PERCENTMULTA, :NEW_PERCENTDESCONTO, '
      
        '  :NEW_DATAPROCESSOBOLETO, :NEW_BAIXADO, :NEW_ENVIADO, :NEW_ANOV' +
        'ENDA, '
      
        '  :NEW_NUMVENDA, :NEW_ANOOS, :NEW_NUMOS, :NEW_CODTPREC, :NEW_SIT' +
        'UACAO, '
      '  :NEW_COMPETENCIA_APURACAO)')
    ModifySQL.Strings = (
      'UPDATE TBCONTREC'
      
        'SET ANOLANC = :NEW_ANOLANC, NUMLANC = :NEW_NUMLANC, EMPRESA = :N' +
        'EW_EMPRESA, '
      
        '  CLIENTE = :NEW_CLIENTE, CNPJ = :NEW_CNPJ, FORMA_PAGTO = :NEW_F' +
        'ORMA_PAGTO, '
      
        '  TIPPAG = :NEW_TIPPAG, HISTORIC = :NEW_HISTORIC, NUMREC = :NEW_' +
        'NUMREC, '
      
        '  DTEMISS = :NEW_DTEMISS, DTVENC = :NEW_DTVENC, DTREC = :NEW_DTR' +
        'EC, '
      
        '  DOCBAIX = :NEW_DOCBAIX, VALORREC = :NEW_VALORREC, VALORMULTA =' +
        ' :NEW_VALORMULTA, '
      '  VALORRECTOT = :NEW_VALORRECTOT, VALORSALDO = :NEW_VALORSALDO, '
      '  NUMCONTRATO = :NEW_NUMCONTRATO, PARCELA = :NEW_PARCELA, '
      '  CODBANCO = :NEW_CODBANCO, NOSSONUMERO = :NEW_NOSSONUMERO, '
      '  REMESSA = :NEW_REMESSA, PERCENTJUROS = :NEW_PERCENTJUROS, '
      
        '  PERCENTMULTA = :NEW_PERCENTMULTA, PERCENTDESCONTO = :NEW_PERCE' +
        'NTDESCONTO, '
      
        '  DATAPROCESSOBOLETO = :NEW_DATAPROCESSOBOLETO, BAIXADO = :NEW_B' +
        'AIXADO, '
      
        '  ENVIADO = :NEW_ENVIADO, ANOVENDA = :NEW_ANOVENDA, NUMVENDA = :' +
        'NEW_NUMVENDA, '
      
        '  ANOOS = :NEW_ANOOS, NUMOS = :NEW_NUMOS, CODTPREC = :NEW_CODTPR' +
        'EC, '
      
        '  SITUACAO = :NEW_SITUACAO, COMPETENCIA_APURACAO = :NEW_COMPETEN' +
        'CIA_APURACAO'
      'WHERE ANOLANC = :OLD_ANOLANC AND NUMLANC = :OLD_NUMLANC')
    DeleteSQL.Strings = (
      'DELETE FROM TBCONTREC'
      'WHERE ANOLANC = :OLD_ANOLANC AND NUMLANC = :OLD_NUMLANC')
    FetchRowSQL.Strings = (
      'Select'
      '    r.Anolanc'
      '  , r.Numlanc'
      '  , r.Parcela'
      '  , r.Empresa'
      '  , r.Cliente'
      '  , r.Cnpj'
      '  , r.Forma_pagto'
      '  , r.Tippag'
      '  , r.Codtprec'
      '  , r.Historic'
      '  , r.Numrec'
      '  , r.Dtemiss'
      '  , r.Dtvenc'
      '  , r.Dtrec'
      '  , r.Docbaix'
      '  , r.Valorrec'
      '  , r.Valormulta'
      '  , r.Valorrectot'
      '  , r.Numcontrato'
      '  , r.Codbanco'
      '  , r.Nossonumero'
      '  , r.Remessa'
      '  , r.Valorsaldo'
      '  , r.Percentjuros'
      '  , r.Percentmulta'
      '  , r.Percentdesconto'
      '  , r.Dataprocessoboleto'
      '  , r.Baixado'
      '  , r.Enviado'
      '  , r.Anovenda'
      '  , r.Numvenda'
      '  , r.AnoOS'
      '  , r.NumOS'
      '  , r.Situacao'
      '  , r.Competencia_apuracao'
      '  , c.Nome as NomeCliente'
      '  , Case when r.Baixado = 1 then '#39'X'#39' else '#39'.'#39' end as Pago_'
      '  , vn.Serie'
      '  , vn.Nfe'
      
        '  , right('#39'0000000'#39' || vn.Nfe, 7) || '#39'/'#39' || trim(vn.Serie) as NF' +
        'E_VENDA'
      '  , os.nfs_serie'
      '  , os.nfs_numero'
      
        '  , right('#39'0000000'#39' || os.nfs_numero, 7) || '#39'/'#39' || trim(os.nfs_s' +
        'erie) as NFSE_OS'
      'from TBCONTREC r'
      '  left join TBCLIENTE c on (c.Codigo = r.Cliente)'
      
        '  left join TBVENDAS vn on (vn.Ano = r.Anovenda and vn.Codcontro' +
        'l = r.Numvenda)'
      
        '  left join TBOS os on (os.Ano = r.AnoOS and os.Controle = r.Num' +
        'OS)'
      'WHERE r.ANOLANC = :ANOLANC AND r.NUMLANC = :NUMLANC')
  end
  object dtsEmpresa: TDataSource
    DataSet = fdQryEmpresa
    Left = 896
    Top = 8
  end
  object dtsFormaPagto: TDataSource
    DataSet = fdQryFormaPagto
    Left = 896
    Top = 40
  end
  object dtsCondicaoPagto: TDataSource
    DataSet = fdQryCondicaoPagto
    Left = 896
    Top = 72
  end
  object dtsPagamentos: TDataSource
    AutoEdit = False
    DataSet = cdsPagamentos
    Left = 328
    Top = 344
  end
  object dtsBanco: TDataSource
    DataSet = fdQryBanco
    Left = 896
    Top = 104
  end
  object FrReciboA5: TfrxReport
    Version = '6.3.7'
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
      Frame.Typ = []
      MirrorMode = []
      object BndPageHeader: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 98.267780000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        OnAfterCalcHeight = 'BndPageHeaderOnAfterCalcHeight'
        object frdEmpresaLogo: TfrxPictureView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 7.559059999999999000
          Width = 109.606370000000000000
          Height = 79.370130000000000000
          DataField = 'LOGO'
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Frame.Typ = []
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object frdEmpresaRZSOC: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 7.559060000000000000
          Width = 464.882190000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frdEmpresa."RZSOC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdEmpresaCNPJ: TfrxMemoView
          AllowVectorExport = True
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
          Frame.Typ = []
          Memo.UTF8W = (
            
              'CNPJ.: [FormatMaskText('#39'##.###.###/####-##;0;'#39',<frdEmpresa."CNPJ' +
              '">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdEmpresaFone: TfrxMemoView
          AllowVectorExport = True
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
          Frame.Typ = []
          Memo.UTF8W = (
            'FONE: [FormatMaskText('#39'(##)####.####;0;'#39',<frdEmpresa."FONE">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdEmpresaEndereco: TfrxMemoView
          AllowVectorExport = True
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
          Frame.Typ = []
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
          AllowVectorExport = True
          Top = 94.488250000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object frdEmpresaEmail: TfrxMemoView
          AllowVectorExport = True
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
          Frame.Typ = []
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
          AllowVectorExport = True
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
          AllowVectorExport = True
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
        Frame.Typ = []
        Height = 30.236240000000000000
        Top = 529.134200000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
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
          AllowVectorExport = True
          Top = 15.118119999999980000
          Width = 582.047620000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' Impresso em [Date] '#224's [Time] por [Usuario]')
          ParentFont = False
          WordWrap = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
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
        Frame.Typ = []
        Height = 162.519790000000000000
        Top = 177.637910000000000000
        Width = 718.110700000000000000
        Child = FrReciboA5.BndChildAssinatura
        DataSet = FrdRecibo
        DataSetName = 'FrdRecibo'
        RowCount = 0
        Stretched = True
        object Rich1: TfrxRichView
          AllowVectorExport = True
          Top = 102.047310000000000000
          Width = 718.110700000000000000
          Height = 60.472480000000000000
          StretchMode = smMaxHeight
          Frame.Typ = []
          GapX = 2.000000000000000000
          GapY = 1.000000000000000000
          RichEdit = {
            7B5C727466315C616E73695C616E7369637067313235325C64656666305C6E6F
            7569636F6D7061745C6465666C616E67313034367B5C666F6E7474626C7B5C66
            305C666E696C5C666368617273657430205461686F6D613B7D7D0D0A7B5C2A5C
            67656E657261746F722052696368656432302031302E302E31393034317D5C76
            6965776B696E64345C756331200D0A5C706172645C6669313030305C6C693134
            305C72693138305C73623132305C73613132305C736C3336305C736C6D756C74
            315C716A5C66305C66733230205265636562656D6F7320646F20636C69656E74
            65205C62205B46726452656369626F2E224E4F4D455F434C49454E5445225D5C
            623020206120696D706F72745C2765326E636961206465205C62205B46726452
            656369626F2E2256414C4F525F42414958415F455854454E534F225D5C623020
            207265666572656E7465205C276530205C62205B46726452656369626F2E2248
            4953544F5249434F225D2E5C623020205B494946283C46726452656369626F2E
            224241495841444F223E3D302C2027272C2027506F7220657374652064616D6F
            732071756974615C2765375C2765336F20746F74616C20646F206C616E5C2765
            37616D65746F2027202B20466F726D6174466C6F6174282730303030272C203C
            46726452656369626F2E22414E4F4C414E43223E29202B20272F27202B20466F
            726D6174466C6F6174282723232330303030303030272C203C46726452656369
            626F2E224E554D4C414E43223E29202B20272E27295D5C7061720D0A7D0D0A00}
        end
        object Rich2: TfrxRichView
          AllowVectorExport = True
          Width = 718.110700000000000000
          Height = 102.047310000000000000
          Frame.Typ = []
          GapX = 2.000000000000000000
          GapY = 1.000000000000000000
          RichEdit = {
            7B5C727466315C616E73695C616E7369637067313235325C64656666305C6E6F
            7569636F6D7061745C6465666C616E67313034367B5C666F6E7474626C7B5C66
            305C666E696C5C666368617273657430205461686F6D613B7D7D0D0A7B5C2A5C
            67656E657261746F722052696368656432302031302E302E31393034317D5C76
            6965776B696E64345C756331200D0A5C706172645C6669313030305C6C693134
            305C72693138305C73623132305C73613132305C736C3336305C736C6D756C74
            315C71635C625C66305C66733332205B546974756C6F5D5C7061720D0A0D0A5C
            706172645C6669313030305C6C693134305C72693138305C73623132305C7361
            3132305C736C3336305C736C6D756C74315C71725C62305C667332342056616C
            6F723A205C756C5C62205224205B466F726D6174466C6F617428272C302E3030
            272C3C46726452656369626F2E2256414C4F525F4241495841223E295D5C756C
            6E6F6E655C62305C7061720D0A7D0D0A00}
        end
      end
      object BndChildAssinatura: TfrxChild
        FillType = ftBrush
        Frame.Typ = []
        Height = 105.826840000000000000
        Top = 362.834880000000000000
        Width = 718.110700000000000000
        ToNRows = 0
        ToNRowsMode = rmCount
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 79.370130000000000000
          Top = 86.929190000000000000
          Width = 377.953000000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            
              ' CNPJ.: [FormatMaskText('#39'##.###.###/####-##;0;'#39',<FrdRecibo."EMPR' +
              'ESA_CNPJ">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 79.370130000000000000
          Top = 64.252010000000000000
          Width = 377.953000000000000000
          Height = 22.677180000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' [FrdRecibo."EMPRESA"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Rich3: TfrxRichView
          AllowVectorExport = True
          Width = 718.110700000000000000
          Height = 30.236240000000000000
          StretchMode = smMaxHeight
          Frame.Typ = []
          GapX = 2.000000000000000000
          GapY = 1.000000000000000000
          RichEdit = {
            7B5C727466315C616E73695C616E7369637067313235325C64656666305C6E6F
            7569636F6D7061745C6465666C616E67313034367B5C666F6E7474626C7B5C66
            305C666E696C5C666368617273657430205461686F6D613B7D7D0D0A7B5C2A5C
            67656E657261746F722052696368656432302031302E302E31393034317D5C76
            6965776B696E64345C756331200D0A5C706172645C6669313030305C6C693134
            305C72693138305C73623132305C73613132305C736C3336305C736C6D756C74
            315C716A5C66305C66733230205B4369646164655D2F5B55465D2C205B466F72
            6D61744461746554696D652827646420222064652022206D6D6D6D2022206465
            20222079797979272C203C46726452656369626F2E22444154415F504147544F
            223E295D2E5C7061720D0A7D0D0A00}
        end
      end
    end
  end
  object FrdRecibo: TfrxDBDataset
    UserName = 'FrdRecibo'
    CloseDataSource = True
    FieldAliases.Strings = (
      'ANOLANC=ANOLANC'
      'NUMLANC=NUMLANC'
      'PARCELA=PARCELA'
      'CLIENTE=CLIENTE'
      'RZSOC=EMPRESA'
      'EMPRESA_CNPJ=EMPRESA_CNPJ'
      'NOME=NOME_CLIENTE'
      'PESSOA_FISICA=PESSOA_FISICA'
      'CNPJ=CNPJ'
      'TIPPAG=TIPPAG'
      'DTEMISS=DTEMISS'
      'DTVENC=DTVENC'
      'DTREC=DTREC'
      'VALORREC=VALORREC'
      'BANCO=BANCO'
      'BCO_NOME=BCO_NOME'
      'NUMERO_CHEQUE=NUMERO_CHEQUE'
      'PAGO_=PAGO_'
      'DOCBAIX=DOCBAIX'
      'BAIXADO=BAIXADO'
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
  object ACBrExtenso: TACBrExtenso
    StrMoeda = 'Real'
    StrMoedas = 'Reais'
    StrCentavo = 'Centavo'
    StrCentavos = 'Centavos'
    Left = 620
    Top = 289
  end
  object DspRecibo: TDataSetProvider
    DataSet = fdQryRecibo
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
    object CdsReciboCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
    end
    object CdsReciboRZSOC: TStringField
      FieldName = 'RZSOC'
      ReadOnly = True
      Size = 60
    end
    object CdsReciboEMPRESA_CNPJ: TStringField
      FieldName = 'EMPRESA_CNPJ'
      ReadOnly = True
      Size = 18
    end
    object CdsReciboNOME: TStringField
      FieldName = 'NOME'
      ReadOnly = True
      Size = 100
    end
    object CdsReciboPESSOA_FISICA: TSmallintField
      FieldName = 'PESSOA_FISICA'
      ReadOnly = True
    end
    object CdsReciboCNPJ: TStringField
      FieldName = 'CNPJ'
      ReadOnly = True
      Size = 18
    end
    object CdsReciboTIPPAG: TStringField
      FieldName = 'TIPPAG'
      Size = 35
    end
    object CdsReciboDTEMISS: TDateField
      FieldName = 'DTEMISS'
    end
    object CdsReciboDTVENC: TDateField
      FieldName = 'DTVENC'
    end
    object CdsReciboDTREC: TDateField
      FieldName = 'DTREC'
    end
    object CdsReciboBANCO: TSmallintField
      FieldName = 'BANCO'
      ReadOnly = True
    end
    object CdsReciboBCO_NOME: TStringField
      FieldName = 'BCO_NOME'
      ReadOnly = True
      Size = 50
    end
    object CdsReciboNUMERO_CHEQUE: TStringField
      FieldName = 'NUMERO_CHEQUE'
      ReadOnly = True
      Size = 30
    end
    object CdsReciboPAGO_: TStringField
      FieldName = 'PAGO_'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object CdsReciboDOCBAIX: TStringField
      FieldName = 'DOCBAIX'
      Size = 15
    end
    object CdsReciboBAIXADO: TSmallintField
      FieldName = 'BAIXADO'
      Required = True
    end
    object CdsReciboSEQ: TSmallintField
      FieldName = 'SEQ'
      ReadOnly = True
    end
    object CdsReciboDATA_PAGTO: TDateField
      FieldName = 'DATA_PAGTO'
      ReadOnly = True
    end
    object CdsReciboFORMA_PAGTO: TSmallintField
      FieldName = 'FORMA_PAGTO'
      ReadOnly = True
    end
    object CdsReciboFORMA_PAGTO_DESC: TStringField
      FieldName = 'FORMA_PAGTO_DESC'
      ReadOnly = True
      Size = 30
    end
    object CdsReciboHISTORICO: TMemoField
      FieldName = 'HISTORICO'
      ReadOnly = True
      BlobType = ftMemo
    end
    object CdsReciboVALORREC: TFMTBCDField
      FieldName = 'VALORREC'
      Precision = 18
      Size = 2
    end
    object CdsReciboVALOR_BAIXA: TFMTBCDField
      FieldName = 'VALOR_BAIXA'
      ReadOnly = True
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
    object popGerarReciboA4: TMenuItem
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
      Caption = 'Gerar Recibo (Formato A&4)'
      OnClick = popGerarReciboClick
    end
    object popGerarReciboA5: TMenuItem
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
      Caption = 'Gerar Recibo (Formato A&5)'
      OnClick = popGerarReciboClick
    end
  end
  object dtsCompetencia: TDataSource
    DataSet = fdQryCompetencia
    Left = 896
    Top = 136
  end
  object dtsTpReceita: TDataSource
    Left = 896
    Top = 168
  end
  object FrReciboA4: TfrxReport
    Version = '6.3.7'
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
    Top = 256
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
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object BndPageHeader: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 98.267780000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        OnAfterCalcHeight = 'BndPageHeaderOnAfterCalcHeight'
        object frdEmpresaLogo: TfrxPictureView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 7.559059999999999000
          Width = 109.606370000000000000
          Height = 79.370130000000000000
          DataField = 'LOGO'
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Frame.Typ = []
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object frdEmpresaRZSOC: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 7.559060000000000000
          Width = 464.882190000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frdEmpresa."RZSOC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdEmpresaCNPJ: TfrxMemoView
          AllowVectorExport = True
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
          Frame.Typ = []
          Memo.UTF8W = (
            
              'CNPJ.: [FormatMaskText('#39'##.###.###/####-##;0;'#39',<frdEmpresa."CNPJ' +
              '">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdEmpresaFone: TfrxMemoView
          AllowVectorExport = True
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
          Frame.Typ = []
          Memo.UTF8W = (
            'FONE: [FormatMaskText('#39'(##)####.####;0;'#39',<frdEmpresa."FONE">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdEmpresaEndereco: TfrxMemoView
          AllowVectorExport = True
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
          Frame.Typ = []
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
          AllowVectorExport = True
          Top = 94.488250000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object frdEmpresaEmail: TfrxMemoView
          AllowVectorExport = True
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
          Frame.Typ = []
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
          AllowVectorExport = True
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
          AllowVectorExport = True
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
        Frame.Typ = []
        Height = 30.236240000000000000
        Top = 529.134200000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
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
          AllowVectorExport = True
          Top = 15.118119999999980000
          Width = 582.047620000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' Impresso em [Date] '#224's [Time] por [Usuario]')
          ParentFont = False
          WordWrap = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
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
        Frame.Typ = []
        Height = 162.519790000000000000
        Top = 177.637910000000000000
        Width = 718.110700000000000000
        Child = FrReciboA4.BndChildAssinatura
        DataSet = FrdRecibo
        DataSetName = 'FrdRecibo'
        RowCount = 0
        Stretched = True
        object Rich1: TfrxRichView
          AllowVectorExport = True
          Top = 102.047310000000000000
          Width = 718.110700000000000000
          Height = 60.472480000000000000
          StretchMode = smMaxHeight
          Frame.Typ = []
          GapX = 2.000000000000000000
          GapY = 1.000000000000000000
          RichEdit = {
            7B5C727466315C616E73695C616E7369637067313235325C64656666305C6E6F
            7569636F6D7061745C6465666C616E67313034367B5C666F6E7474626C7B5C66
            305C666E696C5C666368617273657430205461686F6D613B7D7D0D0A7B5C2A5C
            67656E657261746F722052696368656432302031302E302E31393034317D5C76
            6965776B696E64345C756331200D0A5C706172645C6669313030305C6C693134
            305C72693138305C73623132305C73613132305C736C3336305C736C6D756C74
            315C716A5C66305C66733230205265636562656D6F7320646F20636C69656E74
            65205C62205B46726452656369626F2E224E4F4D455F434C49454E5445225D5C
            623020206120696D706F72745C2765326E636961206465205C62205B46726452
            656369626F2E2256414C4F525F42414958415F455854454E534F225D5C623020
            207265666572656E7465205C276530205C62205B46726452656369626F2E2248
            4953544F5249434F225D2E205C6230205B494946283C46726452656369626F2E
            224241495841444F223E3D302C2027272C2027506F7220657374652064616D6F
            732071756974615C2765375C2765336F20746F74616C20646F206C616E5C2765
            37616D65746F2027202B20466F726D6174466C6F6174282730303030272C203C
            46726452656369626F2E22414E4F4C414E43223E29202B20272F27202B20466F
            726D6174466C6F6174282723232330303030303030272C203C46726452656369
            626F2E224E554D4C414E43223E29202B20272E27295D5C7061720D0A7D0D0A00}
        end
        object Rich2: TfrxRichView
          AllowVectorExport = True
          Width = 718.110700000000000000
          Height = 102.047310000000000000
          Frame.Typ = []
          GapX = 2.000000000000000000
          GapY = 1.000000000000000000
          RichEdit = {
            7B5C727466315C616E73695C616E7369637067313235325C64656666305C6E6F
            7569636F6D7061745C6465666C616E67313034367B5C666F6E7474626C7B5C66
            305C666E696C5C666368617273657430205461686F6D613B7D7D0D0A7B5C2A5C
            67656E657261746F722052696368656432302031302E302E31393034317D5C76
            6965776B696E64345C756331200D0A5C706172645C6669313030305C6C693134
            305C72693138305C73623132305C73613132305C736C3336305C736C6D756C74
            315C71635C625C66305C66733332205B546974756C6F5D5C7061720D0A0D0A5C
            706172645C6669313030305C6C693134305C72693138305C73623132305C7361
            3132305C736C3336305C736C6D756C74315C71725C62305C667332342056616C
            6F723A205C756C5C62205224205B466F726D6174466C6F617428272C302E3030
            272C3C46726452656369626F2E2256414C4F525F4241495841223E295D5C756C
            6E6F6E655C62305C7061720D0A7D0D0A00}
        end
      end
      object BndChildAssinatura: TfrxChild
        FillType = ftBrush
        Frame.Typ = []
        Height = 105.826840000000000000
        Top = 362.834880000000000000
        Width = 718.110700000000000000
        ToNRows = 0
        ToNRowsMode = rmCount
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 79.370130000000000000
          Top = 86.929190000000000000
          Width = 377.953000000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            
              ' CNPJ.: [FormatMaskText('#39'##.###.###/####-##;0;'#39',<FrdRecibo."EMPR' +
              'ESA_CNPJ">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 79.370130000000000000
          Top = 64.252010000000000000
          Width = 377.953000000000000000
          Height = 22.677180000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' [FrdRecibo."EMPRESA"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Rich3: TfrxRichView
          AllowVectorExport = True
          Width = 718.110700000000000000
          Height = 30.236240000000000000
          StretchMode = smMaxHeight
          Frame.Typ = []
          GapX = 2.000000000000000000
          GapY = 1.000000000000000000
          RichEdit = {
            7B5C727466315C616E73695C616E7369637067313235325C64656666305C6E6F
            7569636F6D7061745C6465666C616E67313034367B5C666F6E7474626C7B5C66
            305C666E696C5C666368617273657430205461686F6D613B7D7D0D0A7B5C2A5C
            67656E657261746F722052696368656432302031302E302E31393034317D5C76
            6965776B696E64345C756331200D0A5C706172645C6669313030305C6C693134
            305C72693138305C73623132305C73613132305C736C3336305C736C6D756C74
            315C716A5C66305C66733230205B4369646164655D2F5B55465D2C205B466F72
            6D61744461746554696D652827646420222064652022206D6D6D6D2022206465
            20222079797979272C203C46726452656369626F2E22444154415F504147544F
            223E295D2E5C7061720D0A7D0D0A00}
        end
      end
    end
  end
  object fdQryEmpresa: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    e.cnpj'
      '  , e.codigo'
      '  , e.razao'
      '  , e.fantasia'
      'from VW_EMPRESA e'
      'order by'
      '    e.razao')
    Left = 864
    Top = 8
  end
  object fdQryCondicaoPagto: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    c.cond_cod'
      '  , c.cond_descricao'
      '  , c.cond_descricao_full'
      '  , c.cond_descricao_pdv'
      '  , c.cond_prazo'
      '  , c.cond_qtde_parcelas'
      'from VW_CONDICAOPAGTO c'
      'order by'
      '    c.cond_descricao_full')
    Left = 864
    Top = 72
  end
  object fdQryCompetencia: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    c.cmp_num'
      '  , c.cmp_desc'
      'from TBCOMPETENCIA c'
      'order by'
      '    c.cmp_num DESC')
    Left = 864
    Top = 136
  end
  object fdQryFormaPagto: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '      f.cod'
      '    , f.descri'
      '    , count(x.conta_corrente) as conta_corrente'
      'from TBFORMPAGTO f'
      '  left join ('
      '    Select'
      '        fc.forma_pagto'
      '      , fc.conta_corrente'
      '      , c.descricao'
      '    from TBFORMPAGTO_CONTACOR fc'
      
        '      inner join TBCONTA_CORRENTE c on (c.codigo = fc.conta_corr' +
        'ente and c.empresa = :empresa)'
      '    where c.tipo = 1'
      '  ) x on (x.forma_pagto = f.cod)'
      'group by'
      '      f.cod'
      '    , f.descri'
      'order by'
      '      f.descri')
    Left = 864
    Top = 40
    ParamData = <
      item
        Name = 'EMPRESA'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
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
    Left = 864
    Top = 104
  end
  object fdQryRecibo: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    r.Anolanc'
      '  , r.Numlanc'
      '  , r.Parcela'
      '  , r.cliente'
      '  , e.rzsoc'
      '  , e.cnpj as empresa_cnpj'
      '  , c.nome'
      '  , c.pessoa_fisica'
      '  , c.cnpj'
      '  , r.Tippag'
      '  , r.Dtemiss'
      '  , r.Dtvenc'
      '  , r.dtrec'
      '  , r.Valorrec'
      '  , bx.banco'
      '  , b.Bco_nome'
      '  , bx.numero_cheque'
      '  , Case when r.baixado = 1 then '#39'X'#39' else '#39'.'#39' end as Pago_'
      '  , r.Docbaix'
      '  , r.baixado'
      ''
      '  , bx.seq'
      '  , bx.data_pagto'
      '  , bx.forma_pagto'
      '  , fp.descri as forma_pagto_desc'
      '  , bx.historico'
      '  , bx.valor_baixa'
      'from TBCONTREC r'
      '  inner join TBEMPRESA e on (e.cnpj = r.empresa)'
      '  inner join TBCLIENTE c on (c.codigo = r.cliente)'
      
        '  inner join TBCONTREC_BAIXA bx on (bx.anolanc = r.anolanc and b' +
        'x.numlanc = r.numlanc)'
      
        '  left join TBBANCO_BOLETO b on (b.Bco_cod = bx.banco and b.empr' +
        'esa = r.empresa)'
      '  left join TBFORMPAGTO fp on (fp.cod = bx.forma_pagto)'
      ''
      'where r.anolanc = :ano'
      '  and r.numlanc = :numero'
      '  and bx.seq    = :baixa')
    Left = 560
    Top = 336
    ParamData = <
      item
        Position = 1
        Name = 'ano'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end
      item
        Position = 2
        Name = 'numero'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end
      item
        Position = 3
        Name = 'baixa'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end>
  end
  object cdsPagamentos: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
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
      '  , p.Numero_cheque'
      '  , p.banco'
      '  ,p.banco_febraban'
      '  , coalesce(b2.nome, b1.bco_nome) as bco_nome'
      '  , p.Documento_baixa'
      'from TBCONTREC_BAIXA p'
      '  left join TBFORMPAGTO f on (f.Cod = p.Forma_pagto)'
      
        '  left join TBBANCO_BOLETO b1 on (b1.Bco_cod = p.Banco and b1.em' +
        'presa = p.empresa)'
      '  left join TBBANCO b2 on (b2.cod = p.banco_febraban)')
    Left = 296
    Top = 344
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
      ReadOnly = True
      Size = 30
    end
    object cdsPagamentosNUMERO_CHEQUE: TStringField
      DisplayLabel = 'No. Cheque'
      FieldName = 'NUMERO_CHEQUE'
      Origin = 'NUMERO_CHEQUE'
      Size = 30
    end
    object cdsPagamentosVALOR_BAIXA: TFMTBCDField
      FieldName = 'VALOR_BAIXA'
      Origin = 'VALOR_BAIXA'
      Precision = 18
      Size = 2
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
      FieldName = 'BCO_NOME'
      Origin = 'BCO_NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object cdsPagamentosDOCUMENTO_BAIXA: TStringField
      DisplayLabel = 'Doc. Baixa'
      FieldName = 'DOCUMENTO_BAIXA'
      Origin = 'DOCUMENTO_BAIXA'
      Size = 10
    end
  end
  object fdQryTipoReceita: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select *'
      'from TBTPRECEITA r'
      'where (r.ativo = :ativo) or (:todos = 1)'
      'order by r.tiporec'
      '')
    Left = 864
    Top = 168
    ParamData = <
      item
        Name = 'ATIVO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'TODOS'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
end
