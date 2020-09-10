inherited frmGeNFComplementar: TfrmGeNFComplementar
  ActiveControl = dbEmpresa
  Caption = 'Controle de Notas Fiscais Complementares'
  ClientHeight = 617
  ClientWidth = 1036
  ExplicitWidth = 1052
  ExplicitHeight = 656
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 613
    Width = 1036
    ExplicitTop = 562
    ExplicitWidth = 1043
  end
  inherited Bevel3: TBevel
    Top = 574
    Width = 1036
    ExplicitTop = 523
    ExplicitWidth = 1043
  end
  inherited pgcGuias: TPageControl
    Width = 1036
    Height = 574
    OnChange = pgcGuiasChange
    ExplicitWidth = 1036
    ExplicitHeight = 574
    inherited tbsTabela: TTabSheet
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 1028
      ExplicitHeight = 545
      inherited Bevel4: TBevel
        Top = 479
        Width = 1028
        ExplicitTop = 428
        ExplicitWidth = 1035
      end
      inherited dbgDados: TDBGrid
        Width = 1028
        Height = 479
        Columns = <
          item
            Expanded = False
            FieldName = 'NFC_NUMERO'
            Title.Caption = 'C'#243'digo'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NFC_EMISSAO'
            Title.Caption = 'Emiss'#227'o'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NFC_VALOR_TOTAL_NOTA'
            Title.Caption = 'Valor NFC (R$)'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESTINATARIO_NFE'
            Title.Caption = 'NF-e Origem'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESTINATARIO_RAZAO'
            Title.Caption = 'Destinar'#225'rio'
            Width = 350
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESTINATARIO_CNPJ'
            Title.Caption = 'CPF / CNPJ'
            Width = 150
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'NUMERO'
            Font.Charset = ANSI_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            Title.Alignment = taCenter
            Title.Caption = 'NF-e'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clMaroon
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 75
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'SERIE'
            Font.Charset = ANSI_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            Title.Alignment = taCenter
            Title.Caption = 'S'#233'rie'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clMaroon
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 35
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        Top = 483
        Width = 1028
        ExplicitTop = 483
        ExplicitWidth = 1028
        inherited grpBxFiltro: TGroupBox
          Left = 352
          Width = 672
          ExplicitLeft = 352
          ExplicitWidth = 672
          inherited lbltFiltrar: TLabel
            Left = 286
            Width = 73
            Caption = 'Destinat'#225'rio:'
            ExplicitLeft = 286
            ExplicitWidth = 73
          end
          object lblData: TLabel [1]
            Left = 14
            Top = 27
            Width = 49
            Height = 13
            Caption = 'Emiss'#227'o:'
            FocusControl = e1Data
          end
          inherited edtFiltrar: TEdit
            Left = 365
            Width = 258
            TabOrder = 2
            ExplicitLeft = 365
            ExplicitWidth = 258
          end
          inherited btnFiltrar: TcxButton
            Left = 627
            TabOrder = 3
            ExplicitLeft = 627
          end
          object e1Data: TJvDateEdit
            Left = 72
            Top = 23
            Width = 99
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
            Left = 176
            Top = 23
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
      ExplicitWidth = 1028
      ExplicitHeight = 545
      inherited Bevel8: TBevel
        Top = 113
        Width = 1028
        ExplicitTop = 113
        ExplicitWidth = 1035
      end
      object Bevel5: TBevel [1]
        Left = 0
        Top = 233
        Width = 1028
        Height = 4
        Align = alTop
        Shape = bsSpacer
        ExplicitWidth = 1108
      end
      object Bevel6: TBevel [2]
        Left = 0
        Top = 388
        Width = 1028
        Height = 4
        Align = alBottom
        Shape = bsSpacer
        ExplicitTop = 420
        ExplicitWidth = 1108
      end
      inherited GrpBxDadosNominais: TGroupBox
        Width = 1028
        Height = 113
        ExplicitWidth = 1028
        ExplicitHeight = 113
        object lblDataHora: TLabel [1]
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
        object lblEmpresa: TLabel [2]
          Left = 247
          Top = 24
          Width = 45
          Height = 13
          Caption = 'Empresa:'
          FocusControl = dbEmpresa
        end
        object lblSerie: TLabel [3]
          Left = 16
          Top = 64
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
        object lblNFe: TLabel [4]
          Left = 56
          Top = 64
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
        object lblDataEmissao: TLabel [5]
          Left = 160
          Top = 64
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
        object lblNFeOrigem: TLabel [6]
          Left = 678
          Top = 24
          Width = 113
          Height = 13
          Caption = 'Nota de Origem (NF-e):'
          FocusControl = dbNFeOrigem
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblDestintario: TLabel [7]
          Left = 247
          Top = 64
          Width = 62
          Height = 13
          Caption = 'Destinat'#225'rio:'
          FocusControl = dbDestintario
        end
        object lblDestinatarioCnpj: TLabel [8]
          Left = 678
          Top = 64
          Width = 58
          Height = 13
          Caption = 'CPF / CNPJ:'
          FocusControl = dbDestinatarioCnpj
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblEmissor: TLabel [9]
          Left = 812
          Top = 64
          Width = 79
          Height = 13
          Caption = 'Usu'#225'rio Emissor:'
          FocusControl = dbEmissor
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        inherited dbCodigo: TDBEdit
          Width = 90
          TabStop = False
          Color = clMoneyGreen
          DataField = 'NFC_NUMERO'
          ExplicitWidth = 90
        end
        object dbDataHora: TDBEdit
          Left = 112
          Top = 40
          Width = 129
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'NFC_DATA'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object dbEmpresa: TDBLookupComboBox
          Left = 247
          Top = 40
          Width = 425
          Height = 21
          DataField = 'NFC_EMPRESA'
          DataSource = DtSrcTabela
          DropDownRows = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'CNPJ'
          ListField = 'RZSOC'
          ListSource = dtsEmpresa
          ParentFont = False
          TabOrder = 2
        end
        object dbSerie: TDBEdit
          Left = 16
          Top = 80
          Width = 33
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'SERIE'
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
        object dbNFe: TDBEdit
          Left = 56
          Top = 80
          Width = 97
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'NUMERO'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
        end
        object dbDataEmissao: TDBEdit
          Left = 160
          Top = 80
          Width = 81
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'NFC_EMISSAO'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 7
        end
        object dbNFeOrigem: TJvDBComboEdit
          Left = 678
          Top = 40
          Width = 128
          Height = 21
          ButtonHint = 'Pesquisar NF-e (Ctrl+P)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clMoneyGreen
          DataField = 'DESTINATARIO_NFE'
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
          Anchors = [akLeft, akTop, akRight]
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 3
          OnButtonClick = dbNFeOrigemButtonClick
        end
        object dbDestintario: TJvDBComboEdit
          Left = 247
          Top = 80
          Width = 425
          Height = 21
          TabStop = False
          ButtonFlat = True
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clMoneyGreen
          DataField = 'DESTINATARIO_RAZAO'
          DataSource = DtSrcTabela
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
          Anchors = [akLeft, akTop, akRight]
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 8
        end
        object dbDestinatarioCnpj: TDBEdit
          Left = 678
          Top = 80
          Width = 128
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'DESTINATARIO_CNPJ'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 9
        end
        object dbTipo: TDBRadioGroup
          Left = 812
          Top = 24
          Width = 205
          Height = 37
          Caption = 'Tipo '
          Columns = 2
          DataField = 'NFC_TIPO'
          DataSource = DtSrcTabela
          Items.Strings = (
            'Entrada'
            'Sa'#237'da')
          ReadOnly = True
          TabOrder = 4
          Values.Strings = (
            '0'
            '1')
        end
        object dbEmissor: TDBEdit
          Left = 812
          Top = 80
          Width = 205
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'NFC_EMISSOR'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 10
        end
      end
      object GrpBxDadosProduto: TGroupBox
        Left = 0
        Top = 117
        Width = 1028
        Height = 116
        Align = alTop
        Caption = 'Dados do produto'
        TabOrder = 1
        object lblProduto: TLabel
          Left = 88
          Top = 24
          Width = 42
          Height = 13
          Caption = 'Produto:'
          FocusControl = dbProduto
        end
        object lblQuantidade: TLabel
          Left = 88
          Top = 64
          Width = 38
          Height = 13
          Caption = 'Quant.:'
          FocusControl = dbQuantidade
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblValorDiferenca: TLabel
          Left = 252
          Top = 64
          Width = 72
          Height = 13
          Caption = 'Valor Dif. (R$):'
          FocusControl = dbValorDiferenca
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblValorUn: TLabel
          Left = 156
          Top = 64
          Width = 72
          Height = 13
          Caption = 'Valor Un. (R$):'
          FocusControl = dbValorUn
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblUnidade: TLabel
          Left = 676
          Top = 24
          Width = 27
          Height = 13
          Caption = 'Und.:'
          FocusControl = dbUnidade
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblCFOP: TLabel
          Left = 723
          Top = 24
          Width = 31
          Height = 13
          Caption = 'CFOP:'
          FocusControl = dbCFOP
        end
        object lblAliquota: TLabel
          Left = 846
          Top = 24
          Width = 57
          Height = 13
          Caption = '% Al'#237'quota:'
          FocusControl = dbAliquota
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblCST: TLabel
          Left = 807
          Top = 24
          Width = 23
          Height = 13
          Caption = 'CST:'
          FocusControl = dbCST
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Bevel7: TBevel
          Left = 2
          Top = 15
          Width = 4
          Height = 99
          Align = alLeft
          Shape = bsSpacer
        end
        object lblAliquotaST: TLabel
          Left = 926
          Top = 24
          Width = 72
          Height = 13
          Caption = '% Al'#237'quota ST:'
          FocusControl = dbAliquotaST
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblValorBcIcms: TLabel
          Left = 560
          Top = 64
          Width = 69
          Height = 13
          Caption = 'BC ICMS (R$):'
          FocusControl = dbValorBcIcms
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblValorIcms: TLabel
          Left = 676
          Top = 64
          Width = 80
          Height = 13
          Caption = 'Valor ICMS (R$):'
          FocusControl = dbValorIcms
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblValorBcIcmsST: TLabel
          Left = 792
          Top = 64
          Width = 84
          Height = 13
          Caption = 'BC ICMS ST (R$):'
          FocusControl = dbValorBcIcmsST
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblValorIcmsST: TLabel
          Left = 907
          Top = 64
          Width = 95
          Height = 13
          Caption = 'Valor ICMS ST (R$):'
          FocusControl = dbValorIcmsST
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblValorTotalGeral: TLabel
          Left = 444
          Top = 64
          Width = 80
          Height = 13
          Caption = 'Total Geral (R$):'
          FocusControl = dbValorTotalGeral
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblValorTotal: TLabel
          Left = 348
          Top = 64
          Width = 79
          Height = 13
          Caption = 'Valor Total (R$):'
          FocusControl = dbValorTotal
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object dbProdutoNome: TDBEdit
          Left = 184
          Top = 40
          Width = 486
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'DESCRI_APRESENTACAO'
          DataSource = DtSrcTabelaItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object dbQuantidade: TDBEdit
          Left = 88
          Top = 80
          Width = 62
          Height = 21
          Color = clWhite
          DataField = 'QUANTIDADE'
          DataSource = DtSrcTabelaItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
          OnExit = ControlEditExit
        end
        object dbValorDiferenca: TDBEdit
          Left = 252
          Top = 80
          Width = 90
          Height = 21
          Color = clMoneyGreen
          DataField = 'VALOR_DIFERENCA'
          DataSource = DtSrcTabelaItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 10
        end
        object dbValorUn: TDBEdit
          Left = 156
          Top = 80
          Width = 90
          Height = 21
          Color = clWhite
          DataField = 'MOV_VALOR_UN_NOVO'
          DataSource = DtSrcTabelaItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
          OnExit = ControlEditExit
        end
        object dbUnidade: TDBEdit
          Left = 676
          Top = 40
          Width = 41
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'MOV_UNIDADE_SIGLA'
          DataSource = DtSrcTabelaItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object dbAliquota: TDBEdit
          Left = 846
          Top = 40
          Width = 73
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'ALIQUOTA_ICMS'
          DataSource = DtSrcTabelaItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
        end
        object dbCST: TDBEdit
          Left = 807
          Top = 40
          Width = 33
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'MOV_CST'
          DataSource = DtSrcTabelaItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
        end
        object pnlBotoesProduto: TPanel
          Left = 6
          Top = 15
          Width = 70
          Height = 99
          Align = alLeft
          AutoSize = True
          BevelOuter = bvNone
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object btnProdutoEditar: TBitBtn
            Left = 0
            Top = 0
            Width = 70
            Height = 25
            Hint = 'Editar Produto'
            Align = alTop
            Caption = 'Editar'
            Enabled = False
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              180000000000000600000000000000000000000000000000000000FF0000FF00
              00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
              0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
              FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
              00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
              0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
              FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
              00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
              0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
              FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00B0A090604830
              60483060483060483060483060483060483060483060483060483070504000FF
              0000FF0000FF0000FF009C9C9C43434343434343434343434343434343434343
              43434343434343434343434E4E4E00FF0000FF0000FF0000FF00C0A8A0FFFFFF
              E0E8E0E0E0E0E0E0D0E0D8D0E0D0C0E0C8C0E0C8B0E0C0B0C0A8A070504000FF
              0000FF0000FF0000FF00A8A8A8FFFFFFE4E4E4E0E0E0DBDBDBD6D6D6CCCCCCC8
              C8C8C3C3C3BEBEBEA8A8A84E4E4E00FF0000FF0000FF0000FF00C0B0A0FFFFFF
              E0C8C0D0C0B0D0C0B0FFF0E0D0B0A0D0B0A0D0B0A0F0D8D0C0A8A070504000FF
              0000FF0000FF0000FF00ACACACFFFFFFC8C8C8BCBCBCBCBCBCECECECAEAEAEAE
              AEAEAEAEAED8D8D8A8A8A84E4E4E00FF0000FF0000FF0000FF00D0B8A0FFFFFF
              FFFFFFFFFFFFFFF8F0FFF8F0707070505850000000D0C0B0D0B0A070504000FF
              0000FF0000FF0000FF00B3B3B3FFFFFFFFFFFFFFFFFFF6F6F6F6F6F670707054
              5454000000BCBCBCAEAEAE4E4E4E00FF0000FF0000FF0000FF00D0B8A0FFFFFF
              E0C8C0E0C8C0E0C8C0FFF8F0A0A0A0FFFFFF5090B0101010C0B0B080605000FF
              0000FF0000FF0000FF00B3B3B3FFFFFFC8C8C8C8C8C8C8C8C8F6F6F6A0A0A0FF
              FFFF939393101010B1B1B15E5E5E00FF0000FF0000FF0000FF00D0B8A0FFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFA0A0A090B8C070D0E05098B010101080706000FF
              0000FF0000FF0000FF00B3B3B3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA0A0A0B6
              B6B6CBCBCB9898981010106C6C6C00FF0000FF0000FF0000FF00D0B8A0FFFFFF
              E0C8C0E0C8C0E0C8C0FFFFFFC0B8B050A0B090E0F060C0D05098B0101010C8C0
              B400FF0000FF0000FF00B3B3B3FFFFFFC8C8C8C8C8C8C8C8C8FFFFFFB6B6B69C
              9C9CDCDCDCBBBBBB989898101010BDBDBD00FF0000FF0000FF00D0B8A0FFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFF8F0D0D0D050A0B090E0F060C0D05098B01010
              10C8C1B400FF0000FF00B3B3B3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6D0
              D0D09C9C9CDCDCDCBBBBBB989898101010BDBDBD00FF0000FF00F0B090F0A890
              F0A890F0A080F09870E09060E08860E09060D0A89060A8B090E0F060C0D05098
              B0101010D5C8B900FF00ACACACA8A8A8A8A8A89E9E9E94949489898984848489
              8989A4A4A4A3A3A3DCDCDCBBBBBB989898101010C4C4C400FF00F0B090FFC0A0
              FFC0A0FFB8A0FFB890FFB090FFA880FFA880F0A880D0B0A070B0C090E0F070C8
              E0808880303890BCAEB6ACACACBCBCBCBCBCBCB7B7B7B3B3B3AEAEAEA4A4A4A4
              A4A4A3A3A3AEAEAEAEAEAEDCDCDCC6C6C6848484515151B1B1B1F0B090F0A890
              F0A890F0A890F0A080F0A070E09870E09060E08850E09060D0988080B0C0D0B8
              B07088D06070B0303890ACACACA8A8A8A8A8A8A8A8A89E9E9E99999993939389
              8989808080898989969696B0B0B0B8B8B89B9B9B81818151515100FF0000FF00
              00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00DDD4CA6070
              B07090E06078D06070B000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
              FF0000FF0000FF0000FF00D1D1D1818181A4A4A490909081818100FF0000FF00
              00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00D0C6
              CE6070B06070B0DFD2D100FF0000FF0000FF0000FF0000FF0000FF0000FF0000
              FF0000FF0000FF0000FF0000FF00C9C9C9818181818181D3D3D3}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            OnClick = btnProdutoEditarClick
          end
          object btnProdutoSalvar: TBitBtn
            Left = 0
            Top = 74
            Width = 70
            Height = 25
            Hint = 'Salvar Produto'
            Align = alBottom
            Caption = 'Salvar'
            Enabled = False
            Glyph.Data = {
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
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            OnClick = btnProdutoSalvarClick
          end
          object btnProdutoCancelar: TBitBtn
            Left = 0
            Top = 49
            Width = 70
            Height = 25
            Hint = 'Cancelar Edi'#231#227'o'
            Align = alBottom
            Caption = 'Cancel'
            Enabled = False
            Glyph.Data = {
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
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnClick = btnProdutoCancelarClick
          end
        end
        object dbAliquotaST: TDBEdit
          Left = 926
          Top = 40
          Width = 91
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'ALIQUOTA_ICMS_ST'
          DataSource = DtSrcTabelaItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
        end
        object dbProduto: TJvDBComboEdit
          Left = 88
          Top = 40
          Width = 89
          Height = 21
          ButtonFlat = True
          ButtonHint = 'Pesquisar Produto (Ctrl+P)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clMoneyGreen
          DataField = 'PRODUTO'
          DataSource = DtSrcTabelaItens
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
          ShowHint = False
          TabOrder = 1
        end
        object dbCFOP: TJvDBComboEdit
          Left = 723
          Top = 40
          Width = 78
          Height = 21
          TabStop = False
          ButtonFlat = True
          ButtonHint = 'Pesquisar CFOP (Ctrl+P)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clMoneyGreen
          DataField = 'MOV_CFOP'
          DataSource = DtSrcTabelaItens
          Flat = False
          ParentFlat = False
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
          ShowHint = False
          TabOrder = 4
        end
        object dbValorBcIcms: TDBEdit
          Left = 560
          Top = 80
          Width = 110
          Height = 21
          Color = clWhite
          DataField = 'BC_ICMS'
          DataSource = DtSrcTabelaItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 13
          OnExit = ControlEditExit
        end
        object dbValorIcms: TDBEdit
          Left = 676
          Top = 80
          Width = 110
          Height = 21
          Color = clWhite
          DataField = 'VALOR_ICMS'
          DataSource = DtSrcTabelaItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 14
        end
        object dbValorBcIcmsST: TDBEdit
          Left = 792
          Top = 80
          Width = 109
          Height = 21
          Color = clWhite
          DataField = 'BC_ICMS_ST'
          DataSource = DtSrcTabelaItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 15
          OnExit = ControlEditExit
        end
        object dbValorIcmsST: TDBEdit
          Left = 907
          Top = 80
          Width = 110
          Height = 21
          Color = clWhite
          DataField = 'VALOR_ICMS_ST'
          DataSource = DtSrcTabelaItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 16
          OnExit = ControlEditExit
        end
        object dbValorTotalGeral: TDBEdit
          Left = 444
          Top = 80
          Width = 110
          Height = 21
          Color = clMoneyGreen
          DataField = 'MOV_TOTAL_GERAL'
          DataSource = DtSrcTabelaItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 12
        end
        object dbValorTotal: TDBEdit
          Left = 348
          Top = 80
          Width = 90
          Height = 21
          Color = clMoneyGreen
          DataField = 'VALOR_TOTAL'
          DataSource = DtSrcTabelaItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 11
        end
      end
      object pgcMaisDados: TPageControl
        Left = 0
        Top = 392
        Width = 1028
        Height = 153
        ActivePage = tbsObservacoes
        Align = alBottom
        TabOrder = 2
        object tbsValores: TTabSheet
          BorderWidth = 4
          Caption = 'Valores'
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object GrpBxDadosValores: TGroupBox
            Left = 0
            Top = 0
            Width = 1012
            Height = 117
            Align = alClient
            Caption = 'Valores (R$)'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object lblValorFrete: TLabel
              Left = 238
              Top = 64
              Width = 30
              Height = 13
              Caption = 'Frete:'
              FocusControl = dbValorFrete
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblBaseICMS: TLabel
              Left = 16
              Top = 24
              Width = 55
              Height = 13
              Caption = 'Base ICMS:'
              FocusControl = dbBaseICMS
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblBaseICMSSubs: TLabel
              Left = 119
              Top = 24
              Width = 95
              Height = 13
              Caption = 'Base ICMS Substit.:'
              FocusControl = dbBaseICMSSubs
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblTotalProduto: TLabel
              Left = 238
              Top = 24
              Width = 80
              Height = 13
              Caption = 'Total Produto:'
              FocusControl = dbTotalProduto
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblValorOutros: TLabel
              Left = 436
              Top = 24
              Width = 37
              Height = 13
              Caption = 'Outros:'
              FocusControl = dbValorOutros
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblTotalNotaFiscal: TLabel
              Left = 531
              Top = 24
              Width = 95
              Height = 13
              Caption = 'Total Nota Fiscal:'
              FocusControl = dbTotalNotaFiscal
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblValorDesconto: TLabel
              Left = 341
              Top = 24
              Width = 49
              Height = 13
              Caption = 'Desconto:'
              FocusControl = dbValorDesconto
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblValorIPI: TLabel
              Left = 436
              Top = 64
              Width = 45
              Height = 13
              Caption = 'Total IPI:'
              FocusControl = dbValorIPI
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblValorICMSSubs: TLabel
              Left = 119
              Top = 64
              Width = 96
              Height = 13
              Caption = 'Valor ICMS Substit.:'
              FocusControl = dbValorICMSSubs
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblValorIcmsNF: TLabel
              Left = 16
              Top = 64
              Width = 56
              Height = 13
              Caption = 'Valor ICMS:'
              FocusControl = dbValorIcmsNF
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblValorSeguro: TLabel
              Left = 341
              Top = 64
              Width = 43
              Height = 13
              Caption = 'Seguros:'
              FocusControl = dbValorSeguro
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object dbValorFrete: TDBEdit
              Left = 238
              Top = 80
              Width = 97
              Height = 21
              Color = clWhite
              DataField = 'NFC_VALOR_FRETE'
              DataSource = DtSrcTabela
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 5
            end
            object dbBaseICMS: TDBEdit
              Left = 16
              Top = 40
              Width = 97
              Height = 21
              DataField = 'NFC_VALOR_BASE_ICMS'
              DataSource = DtSrcTabela
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object dbBaseICMSSubs: TDBEdit
              Left = 119
              Top = 40
              Width = 113
              Height = 21
              DataField = 'NFC_VALOR_BASE_ICMS_SUBST'
              DataSource = DtSrcTabela
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
            end
            object dbTotalProduto: TDBEdit
              Left = 238
              Top = 40
              Width = 97
              Height = 21
              Color = clMoneyGreen
              DataField = 'NFC_VALOR_TOTAL_PRODUTO'
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
            object dbValorOutros: TDBEdit
              Left = 436
              Top = 40
              Width = 89
              Height = 21
              DataField = 'NFC_VALOR_OUTROS'
              DataSource = DtSrcTabela
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 8
            end
            object dbTotalNotaFiscal: TDBEdit
              Left = 531
              Top = 40
              Width = 124
              Height = 21
              Color = clMoneyGreen
              DataField = 'NFC_VALOR_TOTAL_NOTA'
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
            object dbValorDesconto: TDBEdit
              Left = 341
              Top = 40
              Width = 89
              Height = 21
              DataField = 'NFC_VALOR_DESCONTO'
              DataSource = DtSrcTabela
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 6
            end
            object dbValorIPI: TDBEdit
              Left = 436
              Top = 80
              Width = 89
              Height = 21
              DataField = 'NFC_VALOR_TOTAL_IPI'
              DataSource = DtSrcTabela
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 9
            end
            object dbValorICMSSubs: TDBEdit
              Left = 119
              Top = 80
              Width = 113
              Height = 21
              DataField = 'NFC_VALOR_ICMS_SUBST'
              DataSource = DtSrcTabela
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
            end
            object dbValorIcmsNF: TDBEdit
              Left = 16
              Top = 80
              Width = 97
              Height = 21
              DataField = 'NFC_VALOR_ICMS'
              DataSource = DtSrcTabela
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
            object dbValorSeguro: TDBEdit
              Left = 341
              Top = 80
              Width = 89
              Height = 21
              DataField = 'NFC_VALOR_SEGURO'
              DataSource = DtSrcTabela
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 7
            end
          end
        end
        object tbsObservacoes: TTabSheet
          Caption = 'Informa'#231#245'es adicionais'
          ImageIndex = 1
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnlObservacao: TPanel
            Left = 0
            Top = 0
            Width = 1020
            Height = 125
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object lblObservacao: TLabel
              Left = 0
              Top = 0
              Width = 67
              Height = 13
              Align = alTop
              Caption = '&Observa'#231#245'es:'
            end
            object Bevel14: TBevel
              Left = 1016
              Top = 17
              Width = 4
              Height = 108
              Align = alRight
              Shape = bsSpacer
              ExplicitLeft = 516
              ExplicitHeight = 137
            end
            object Bevel15: TBevel
              Left = 0
              Top = 13
              Width = 1020
              Height = 4
              Align = alTop
              Shape = bsSpacer
              ExplicitWidth = 520
            end
            object dbObservacao: TDBMemo
              Left = 0
              Top = 17
              Width = 1016
              Height = 108
              Align = alClient
              DataField = 'NFC_TEXTO'
              DataSource = DtSrcTabela
              ScrollBars = ssBoth
              TabOrder = 0
            end
          end
        end
        object tbsTransporte: TTabSheet
          Caption = 'Dados Transporte'
          ImageIndex = 2
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
        end
        object TbsInformeNFe: TTabSheet
          Caption = 'Informa'#231#245'es de Envio NF-e'
          ImageIndex = 3
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object lblLogNFeLote: TLabel
            Left = 8
            Top = 0
            Width = 78
            Height = 13
            Caption = 'Lote de Envio:'
            FocusControl = dbLogNFeLote
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblLogNFeLoteDataEmissao: TLabel
            Left = 112
            Top = 0
            Width = 112
            Height = 13
            Caption = 'Data/Hora Emiss'#227'o:'
            FocusControl = d1LogNFeLoteDataEmissao
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblLogNFeLoteChave: TLabel
            Left = 201
            Top = 80
            Width = 38
            Height = 13
            Caption = 'Chave:'
            FocusControl = dbLogNFeLoteChave
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblLogNFeLoteRecibo: TLabel
            Left = 264
            Top = 0
            Width = 41
            Height = 13
            Caption = 'Recibo:'
            FocusControl = dbLogNFeLoteRecibo
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblLogNFeLoteProtocolo: TLabel
            Left = 407
            Top = 0
            Width = 57
            Height = 13
            Caption = 'Protocolo:'
            FocusControl = dbLogNFeLoteProtocolo
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblLogNFeLoteArquivo: TLabel
            Left = 200
            Top = 40
            Width = 124
            Height = 13
            Caption = 'Nome do arquivo XML:'
            FocusControl = dbLogNFeLoteArquivo
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblLogNFeCancelMotivo: TLabel
            Left = 728
            Top = 0
            Width = 142
            Height = 13
            Caption = 'Motivo de cancelamento:'
            FocusControl = dbLogNFeCancelMotivo
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblLogNFeCancelUsuario: TLabel
            Left = 568
            Top = 40
            Width = 83
            Height = 13
            Caption = 'Cancelada por:'
            FocusControl = dbLogNFeCancelUsuario
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblLogNFeCancelData: TLabel
            Left = 568
            Top = 80
            Width = 82
            Height = 13
            Caption = 'Cancelada em:'
            FocusControl = dbLogNFeCancelData
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblLogNFeUsuario: TLabel
            Left = 568
            Top = 0
            Width = 66
            Height = 13
            Caption = 'Gerada por:'
            FocusControl = dbLogNFeUsuario
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object BtnLimparDadosNFe: TSpeedButton
            Left = 8
            Top = 87
            Width = 185
            Height = 30
            Hint = 'Limpar LOG de Envio'
            Caption = 'Limpar LOG de Envio'
            Flat = True
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              18000000000000060000C40E0000C40E00000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A090604830
              604830604830604830604830604830604830604830604830604830604830FFFF
              FFFFFFFFFFFFFFFFFFFF8F9EAD33435733435733435733435733435733435733
              4357334357334357334357334357FFFFFFFFFFFFFFFFFFFFFFFFC0A890FFF8F0
              FFF0E0F0E8E0F0E0D0F0D0C0F0C8B0E0C0A0E0B8A0E0B090E0A890604830FFFF
              FFFFFFFFFFFFFFFFFFFF95A3B2F4F6F7E8ECEFE1E6EAD6DDE3C5CED6BBC5CFAE
              BAC6A9B5C19DABB999A7B5334357FFFFFFFFFFFFFFFFFFFFFFFFC0A8A0FFFFF0
              C0A8A0B0A0A0F0E8E0B0A090B09890B09890B09890B09890E0B090604830FFFF
              FFFFFFFFFFFFFFFFFFFF9AA8B6F9FAFA9AA8B692A1B0E1E6EA8E9DAC8998A889
              98A88998A88998A89DABB9334357FFFFFFFFFFFFFFFFFFFFFFFFC0A8A0FFFFF0
              FFFFF0FFF8F0FFF0E0F0E8E0F0E0D0F0D0C0F0C8B0E0C0A0E0B8A0604830FFFF
              FFFFFFFFFFFFFFFFFFFF9AA8B6F9FAFAF9FAFAF4F6F7E8ECEFE1E6EAD6DDE3C5
              CED6BBC5CFAEBAC6A9B5C1334357FFFFFFFFFFFFFFFFFFFFFFFFC0A8A0FFFFF0
              B0A8A0B0A0A0FFF8F0B0A090B09890B09890B09890B09890E0C0A0604830FFFF
              FFFFFFFFFFFFFFFFFFFF9AA8B6F9FAFA98A6B492A1B0F4F6F78E9DAC8998A889
              98A88998A88998A8AEBAC6334357FFFFFFFFFFFFFFFFFFFFFFFFC0B0A0FFFFF0
              FFFFF0FFFFF0FFFFF0FFF8F0FFF0E0F0E8E0F0E0D0F0D0C0F0C8B0604830FFFF
              FFFFFFFFFFFFFFFFFFFFA0ADBAF9FAFAF9FAFAF9FAFAF9FAFAF4F6F7E8ECEFE1
              E6EAD6DDE3C5CED6BBC5CF334357FFFFFFFFFFFFFFFFFFFFFFFFC0B0A0FFFFF0
              FFFFF0FFFFF0FFFFF0FFFFF0FFF8F0C0C8C0406070F0E0D0F0D0C0604830FFFF
              FFFFFFFFFFFFFFFFFFFFA0ADBAF9FAFAF9FAFAF9FAFAF9FAFAF9FAFAF4F6F7B9
              C4CE4F6175D6DDE3C5CED6334357FFFFFFFFFFFFFFFFFFFFFFFFC0B0A0FFFFFF
              E0E8F0607880E0E0E0FFFFF0C0C8D050607030A8D0203840B0A0A0604830FFFF
              FFFFFFFFA0B39A408050A0ADBAFFFFFFE4E9ED66778ADAE0E5F9FAFABFC9D250
              627698A6B428374A92A1B0334357FFFFFFFFFFFF9BA9B7586A7ED0B0A0FFFFFF
              90A8B080D0E0506070B0B8C050607060C0E050607030B8F01028301030401028
              3070747D40784050A860A1AEBBFFFFFF99A7B5C1CBD4506276ADB9C5506276B3
              BEC9506276ADB9C51A27382331441A27386576894E607477889AD0B8A0FFFFFF
              E0E8F090A8B080E0F050607080D0E050607060D0F040607030B0E02098D02088
              B020507050886050B060A6B3C0FFFFFFE4E9ED99A7B5D2D9E0506276C1CBD450
              6276C3CCD54F6175A2AFBC8C9BAB77889A4354686475887D8D9ED0B8A0D0B8A0
              D0B8A0C0B0A090A8B080E0F050607080E0F040587060D0F050C8F040C0F020B0
              E020A0D060987050B870A6B3C0A6B3C0A6B3C0A0ADBA99A7B5D2D9E0506276D2
              D9E04B5C70C3CCD5BCC6D0B4BFCAA0ADBA909FAE7485978696A6FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFF90A8B080E0F040587080E0F070D8F060D0F050C8F040C0
              F030B8F070A88060C080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99A7B5D2D9E04B
              5C70D2D9E0CBD3DBC3CCD5BCC6D0B4BFCAADB9C58595A592A1B0FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF90A8B080E0F080E0F080E0F070D8F060D0F060B0
              D0808890B0C0A090D0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99A7B5D2
              D9E0D2D9E0D2D9E0CBD3DBC3CCD5A3B0BD78899BA7B4C0AEBAC6FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF90A8B090A0B090A0A08098A08090A08088
              90B9B9BDA0B8A0B0C0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99
              A7B593A2B18F9EAD8797A78292A378899BAEBAC6A1AEBBA7B4C0FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            NumGlyphs = 2
          end
          object dbLogNFeLote: TDBEdit
            Left = 8
            Top = 16
            Width = 97
            Height = 21
            TabStop = False
            Color = clMoneyGreen
            DataField = 'NUMERO'
            DataSource = DtSrcTabela
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object d1LogNFeLoteDataEmissao: TDBEdit
            Left = 112
            Top = 16
            Width = 81
            Height = 21
            TabStop = False
            Color = clMoneyGreen
            DataField = 'DATAEMISSAO'
            DataSource = dtsNFE
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object d2LogNFeLoteDataEmissao: TDBEdit
            Left = 200
            Top = 16
            Width = 57
            Height = 21
            TabStop = False
            Color = clMoneyGreen
            DataField = 'HORAEMISSAO'
            DataSource = dtsNFE
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
          end
          object dbLogNFeLoteChave: TDBEdit
            Left = 200
            Top = 96
            Width = 360
            Height = 21
            TabStop = False
            Color = clMoneyGreen
            DataField = 'CHAVE'
            DataSource = dtsNFE
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 6
          end
          object dbLogNFeLoteRecibo: TDBEdit
            Left = 264
            Top = 16
            Width = 137
            Height = 21
            TabStop = False
            Color = clMoneyGreen
            DataField = 'RECIBO'
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
          object dbLogNFeLoteProtocolo: TDBEdit
            Left = 407
            Top = 16
            Width = 153
            Height = 21
            TabStop = False
            Color = clMoneyGreen
            DataField = 'PROTOCOLO'
            DataSource = dtsNFE
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
          end
          object dbLogNFeLoteArquivo: TDBEdit
            Left = 200
            Top = 56
            Width = 361
            Height = 21
            TabStop = False
            Color = clMoneyGreen
            DataField = 'XML_FILENAME'
            DataSource = dtsNFE
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
          end
          object dbLogNFeCancelMotivo: TDBMemo
            Left = 727
            Top = 16
            Width = 286
            Height = 101
            TabStop = False
            Color = clMoneyGreen
            DataField = 'CANCELADA_MOTIVO'
            DataSource = DtSrcTabela
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            ScrollBars = ssVertical
            TabOrder = 10
          end
          object dbLogNFeCancelUsuario: TDBEdit
            Left = 568
            Top = 56
            Width = 153
            Height = 21
            TabStop = False
            Color = clMoneyGreen
            DataField = 'CANCELADA_USUARIO'
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
          object dbLogNFeCancelData: TDBEdit
            Left = 568
            Top = 96
            Width = 153
            Height = 21
            TabStop = False
            Color = clMoneyGreen
            DataField = 'CANCELADA_DATAHORA'
            DataSource = DtSrcTabela
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 9
          end
          object dbLogNFeUsuario: TDBEdit
            Left = 568
            Top = 16
            Width = 153
            Height = 21
            TabStop = False
            Color = clMoneyGreen
            DataField = 'NFC_EMISSOR'
            DataSource = DtSrcTabela
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 7
          end
        end
      end
      object dbgProdutos: TDBGrid
        Left = 0
        Top = 237
        Width = 1028
        Height = 151
        TabStop = False
        Align = alClient
        DataSource = DtSrcTabelaItens
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = [fsBold]
        OnDrawColumnCell = dbgDadosDrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'NFC_ITEM'
            Title.Alignment = taCenter
            Title.Caption = '#'
            Width = 23
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRODUTO'
            Title.Caption = 'Produto'
            Width = 68
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRI_APRESENTACAO'
            Title.Caption = 'Nome do Produto'
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MOV_CST'
            Title.Alignment = taCenter
            Title.Caption = 'CST'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MOV_CSOSN'
            Title.Caption = 'CSOSN'
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MOV_CFOP'
            Title.Alignment = taCenter
            Title.Caption = 'CFOP'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ALIQUOTA_ICMS'
            Title.Caption = '% Al'#237'q.'
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QUANTIDADE'
            Title.Caption = 'Qtde.'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MOV_UNIDADE_SIGLA'
            Title.Caption = 'Und.'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MOV_VALOR_UN_NOVO'
            Title.Caption = 'Valor Un. (R$)'
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_DIFERENCA'
            Title.Caption = 'Dif. (R$)'
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_TOTAL'
            Title.Caption = 'Valor Total'
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BC_ICMS'
            Title.Caption = 'BC ICMS (R$)'
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_ICMS'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            Title.Caption = 'Valor ICMS'
            Width = 85
            Visible = True
          end>
      end
    end
  end
  inherited tlbBotoes: TPanel
    Top = 578
    Width = 1036
    ExplicitTop = 578
    ExplicitWidth = 1036
    inherited bvlTool3: TBevel
      Left = 953
      ExplicitLeft = 960
    end
    inherited bvlTool4: TBevel
      Left = 1032
      ExplicitLeft = 1039
    end
    inherited btbtnFechar: TcxButton
      Left = 957
      ExplicitLeft = 957
    end
    inherited btbtnSelecionar: TcxButton
      Left = 833
      ExplicitLeft = 833
    end
    object btbtnGerarNFe: TcxButton
      Tag = 11
      Left = 593
      Top = 0
      Width = 120
      Height = 35
      Align = alRight
      Caption = '&Gerar NF-e'
      Enabled = False
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        424D360800000000000036000000280000002000000010000000010020000000
        000000000000C40E0000C40E0000000000000000000000FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF000000FF0000C0A8A0FF6048
        30FF604830FF604830FF604830FF604830FF604830FF00FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF000000FF0000A8A8A8FF4343
        43FF434343FF434343FF434343FF434343FF434343FF00FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF000000FF0000C0A8A0FFFFF0
        F0FFF0D8D0FFE0D0C0FFE0C8B0FFE0C0B0FF604830FF00FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF000000FF0000A8A8A8FFF1F1
        F1FFD8D8D8FFCCCCCCFFC3C3C3FFBEBEBEFF434343FF00FF000000FF000000FF
        0000A6A3CCFF1048E0FF1048E0FF1048E0FF00FF000000FF0000C0B0A0FFFFF8
        F0FF707070FFF0E8E0FF707070FFE0C8B0FF604830FF00FF000000FF000000FF
        0000AFAFAFFF707070FF707070FF707070FF00FF000000FF0000ACACACFFF6F6
        F6FF707070FFE6E6E6FF707070FFC3C3C3FF434343FF00FF000000FF000000FF
        00004070F0FF9E9FD3FF00FF000000FF000000FF000000FF0000D0B0A0FFFFFF
        FFFFFFF8F0FFFFF0F0FFF0E8E0FFE0D0C0FF604830FF00FF000000FF000000FF
        0000919191FFAEAEAEFF00FF000000FF000000FF000000FF0000AEAEAEFFFFFF
        FFFFF6F6F6FFF1F1F1FFE6E6E6FFCCCCCCFF434343FF00FF000000FF000000FF
        00001048F0FF00FF000000FF000000FF000000FF000000FF0000D0B8A0FFFFFF
        FFFF808880FFFFF8F0FF707070FFF0D8D0FF604830FF00FF000000FF000000FF
        0000747474FF00FF000000FF000000FF000000FF000000FF0000B3B3B3FFFFFF
        FFFF848484FFF6F6F6FF707070FFD8D8D8FF434343FF00FF000000FF00006080
        F0FF3058F0FF1048E0FF00FF000000FF000000FF000000FF0000D0B0A0FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFF8F0FFFFF0F0FF604830FF00FF000000FF00009E9E
        9EFF818181FF707070FF00FF000000FF000000FF000000FF0000AEAEAEFFFFFF
        FFFFFFFFFFFFFFFFFFFFF6F6F6FFF1F1F1FF434343FF00FF000000FF0000D0CE
        E0FF80A0FFFFD0CADCFF00FF000000FF000000FF000000FF0000C0B0A0FFC0B0
        A0FFC0B0A0FFC0B0A0FFC0B0A0FFC0A8A0FFC0A8A0FF00FF000000FF0000D3D3
        D3FFB9B9B9FFD0D0D0FF00FF000000FF000000FF000000FF0000ACACACFFACAC
        ACFFACACACFFACACACFFACACACFFA8A8A8FFA8A8A8FF00FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF0000C0A8A0FF604830FF6048
        30FF604830FF604830FF604830FF604830FF00FF000000FF000000FF000000FF
        0000D5D1E3FF1048E0FFD1CFE1FF00FF000000FF0000A8A8A8FF434343FF4343
        43FF434343FF434343FF434343FF434343FF00FF000000FF000000FF000000FF
        0000D6D6D6FF707070FFD4D4D4FF00FF000000FF0000C0A8A0FFFFF0F0FFF0D8
        D0FFE0D0C0FFE0C8B0FFE0C0B0FF604830FF00FF000000FF000000FF000000FF
        000080A0FFFF3060F0FF1048E0FF00FF000000FF0000A8A8A8FFF1F1F1FFD8D8
        D8FFCCCCCCFFC3C3C3FFBEBEBEFF434343FF00FF000000FF000000FF000000FF
        0000B9B9B9FF868686FF707070FF00FF000000FF0000C0B0A0FFFFF8F0FF7070
        70FFF0E8E0FF707070FFE0C8B0FF604830FF00FF000000FF000000FF000000FF
        000000FF00004070F0FF00FF000000FF000000FF0000ACACACFFF6F6F6FF7070
        70FFE6E6E6FF707070FFC3C3C3FF434343FF00FF000000FF000000FF000000FF
        000000FF0000919191FF00FF000000FF000000FF0000D0B0A0FFFFFFFFFFFFF8
        F0FFFFF0F0FFF0E8E0FFE0D0C0FF604830FF00FF000000FF000000FF000000FF
        0000AEB7EAFF1048F0FF00FF000000FF000000FF0000AEAEAEFFFFFFFFFFF6F6
        F6FFF1F1F1FFE6E6E6FFCCCCCCFF434343FF00FF000000FF000000FF000000FF
        0000C5C5C5FF747474FF00FF000000FF000000FF0000D0B8A0FFFFFFFFFF8088
        80FFFFF8F0FF707070FFF0D8D0FF604830FF00FF000000FF00006088F0FF7090
        F0FF7090F0FFA8B6EBFF00FF000000FF000000FF0000B3B3B3FFFFFFFFFF8484
        84FFF6F6F6FF707070FFD8D8D8FF434343FF00FF000000FF0000A3A3A3FFA9A9
        A9FFA9A9A9FFC4C4C4FF00FF000000FF000000FF0000D0B0A0FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFF8F0FFFFF0F0FF604830FF00FF000000FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF0000AEAEAEFFFFFFFFFFFFFF
        FFFFFFFFFFFFF6F6F6FFF1F1F1FF434343FF00FF000000FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF0000C0B0A0FFC0B0A0FFC0B0
        A0FFC0B0A0FFC0B0A0FFC0A8A0FFC0A8A0FF00FF000000FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF0000ACACACFFACACACFFACAC
        ACFFACACACFFACACACFFA8A8A8FFA8A8A8FF00FF000000FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF0000}
      OptionsImage.NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnClick = btbtnGerarNFeClick
    end
    object btbtnCancelarNFC: TcxButton
      Tag = 12
      Left = 713
      Top = 0
      Width = 120
      Height = 35
      Hint = 'Cancelar Venda Selecionada'
      Align = alRight
      Caption = 'Cancelar NF'
      Enabled = False
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
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
    end
  end
  inherited IbDtstTabela: TIBDataSet
    AfterCancel = IbDtstTabelaAfterCancel
    AfterScroll = IbDtstTabelaAfterScroll
    OnNewRecord = IbDtstTabelaNewRecord
    SelectSQL.Strings = (
      'Select'
      '    nf.nfc_numero'
      '  , nf.nfc_empresa'
      '  , nf.nfc_tipo'
      '  , nf.nfc_data'
      '  , nf.nfc_hora'
      '  , nf.nfc_emissao'
      '  , nf.nfc_emissor'
      '  , nf.nfc_enviada'
      '  , nf.nfc_texto'
      '  , nf.nfe_serie'
      '  , nf.nfe_numero'
      '  , nf.nfe_modelo'
      '  , nf.serie'
      '  , nf.numero'
      '  , nf.recibo'
      '  , nf.fornecedor'
      '  , nf.cliente'
      '  , nf.nfc_denegada'
      '  , nf.nfc_denegada_motivo'
      '  , nf.nfc_modalidade_frete'
      '  , nf.nfc_transportadora'
      '  , nf.nfc_placa_veiculo'
      '  , nf.nfc_placa_uf'
      '  , nf.nfc_placa_rntc'
      '  , nf.nfc_valor_base_icms'
      '  , nf.nfc_valor_icms'
      '  , nf.nfc_valor_base_icms_subst'
      '  , nf.nfc_valor_icms_subst'
      '  , nf.nfc_valor_total_produto'
      '  , nf.nfc_valor_frete'
      '  , nf.nfc_valor_seguro'
      '  , nf.nfc_valor_desconto'
      '  , nf.nfc_valor_total_ii'
      '  , nf.nfc_valor_total_ipi'
      '  , nf.nfc_valor_pis'
      '  , nf.nfc_valor_cofins'
      '  , nf.nfc_valor_outros'
      '  , nf.nfc_valor_total_nota'
      '  , nf.cancelada'
      '  , nf.cancelada_usuario'
      '  , nf.cancelada_datahora'
      '  , nf.cancelada_motivo'
      
        '  , coalesce(lpad(nf.nfe_numero, 7, '#39'0'#39') || '#39'-'#39' || nf.nfe_serie,' +
        ' '#39#39') as destinatario_nfe'
      '  , coalesce(nf.fornecedor, nf.cliente) as destinatario_codigo'
      '  , coalesce(f.nomeforn, c.nome) as destinatario_razao'
      '  , coalesce(f.cnpj, c.cnpj) as destinatario_cnpj'
      'from TBNFE_COMPLEMENTAR nf'
      '  left join TBFORNECEDOR f on (f.codforn = nf.fornecedor)'
      '  left join TBCLIENTE c on (c.codigo = nf.cliente)')
    GeneratorField.Field = 'NFC_NUMERO'
    GeneratorField.Generator = 'GEN_COMPLEMENTAR'
    GeneratorField.ApplyEvent = gamOnNewRecord
    Left = 456
    Top = 64
    object IbDtstTabelaNFC_NUMERO: TIntegerField
      Alignment = taCenter
      FieldName = 'NFC_NUMERO'
      Origin = '"TBNFE_COMPLEMENTAR"."NFC_NUMERO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      DisplayFormat = '###0000000'
    end
    object IbDtstTabelaNFC_EMPRESA: TIBStringField
      DisplayLabel = 'NF-e: Empresa'
      FieldName = 'NFC_EMPRESA'
      Origin = '"TBNFE_COMPLEMENTAR"."NFC_EMPRESA"'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 18
    end
    object IbDtstTabelaNFC_TIPO: TSmallintField
      FieldName = 'NFC_TIPO'
      Origin = '"TBNFE_COMPLEMENTAR"."NFC_TIPO"'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object IbDtstTabelaNFC_DATA: TDateField
      FieldName = 'NFC_DATA'
      Origin = '"TBNFE_COMPLEMENTAR"."NFC_DATA"'
      ProviderFlags = [pfInUpdate]
      OnGetText = IbDtstTabelaNFC_DATAGetText
    end
    object IbDtstTabelaNFC_HORA: TTimeField
      FieldName = 'NFC_HORA'
      Origin = '"TBNFE_COMPLEMENTAR"."NFC_HORA"'
      ProviderFlags = [pfInUpdate]
    end
    object IbDtstTabelaNFC_EMISSAO: TDateField
      FieldName = 'NFC_EMISSAO'
      Origin = '"TBNFE_COMPLEMENTAR"."NFC_EMISSAO"'
      ProviderFlags = [pfInUpdate]
    end
    object IbDtstTabelaNFC_EMISSOR: TIBStringField
      FieldName = 'NFC_EMISSOR'
      Origin = '"TBNFE_COMPLEMENTAR"."NFC_EMISSOR"'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object IbDtstTabelaNFC_ENVIADA: TSmallintField
      FieldName = 'NFC_ENVIADA'
      Origin = '"TBNFE_COMPLEMENTAR"."NFC_ENVIADA"'
      ProviderFlags = [pfInUpdate]
    end
    object IbDtstTabelaNFC_TEXTO: TWideMemoField
      FieldName = 'NFC_TEXTO'
      Origin = '"TBNFE_COMPLEMENTAR"."NFC_TEXTO"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftWideMemo
      Size = 8
    end
    object IbDtstTabelaNFE_SERIE: TIBStringField
      DisplayLabel = 'NF-e: S'#233'rie'
      FieldName = 'NFE_SERIE'
      Origin = '"TBNFE_COMPLEMENTAR"."NFE_SERIE"'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 3
    end
    object IbDtstTabelaNFE_NUMERO: TIntegerField
      DisplayLabel = 'NF-e: N'#250'mero'
      FieldName = 'NFE_NUMERO'
      Origin = '"TBNFE_COMPLEMENTAR"."NFE_NUMERO"'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object IbDtstTabelaNFE_MODELO: TSmallintField
      DisplayLabel = 'NF-e: Modelo'
      FieldName = 'NFE_MODELO'
      Origin = '"TBNFE_COMPLEMENTAR"."NFE_MODELO"'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object IbDtstTabelaSERIE: TIBStringField
      FieldName = 'SERIE'
      Origin = '"TBNFE_COMPLEMENTAR"."SERIE"'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object IbDtstTabelaNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = '"TBNFE_COMPLEMENTAR"."NUMERO"'
      ProviderFlags = [pfInUpdate]
    end
    object IbDtstTabelaRECIBO: TIBStringField
      FieldName = 'RECIBO'
      Origin = '"TBNFE_COMPLEMENTAR"."RECIBO"'
      ProviderFlags = [pfInUpdate]
      Size = 250
    end
    object IbDtstTabelaFORNECEDOR: TIntegerField
      FieldName = 'FORNECEDOR'
      Origin = '"TBNFE_COMPLEMENTAR"."FORNECEDOR"'
      ProviderFlags = [pfInUpdate]
    end
    object IbDtstTabelaCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
      Origin = '"TBNFE_COMPLEMENTAR"."CLIENTE"'
      ProviderFlags = [pfInUpdate]
    end
    object IbDtstTabelaNFC_DENEGADA: TSmallintField
      FieldName = 'NFC_DENEGADA'
      Origin = '"TBNFE_COMPLEMENTAR"."NFC_DENEGADA"'
      ProviderFlags = [pfInUpdate]
    end
    object IbDtstTabelaNFC_DENEGADA_MOTIVO: TIBStringField
      FieldName = 'NFC_DENEGADA_MOTIVO'
      Origin = '"TBNFE_COMPLEMENTAR"."NFC_DENEGADA_MOTIVO"'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object IbDtstTabelaNFC_MODALIDADE_FRETE: TSmallintField
      FieldName = 'NFC_MODALIDADE_FRETE'
      Origin = '"TBNFE_COMPLEMENTAR"."NFC_MODALIDADE_FRETE"'
      ProviderFlags = [pfInUpdate]
    end
    object IbDtstTabelaNFC_TRANSPORTADORA: TIntegerField
      FieldName = 'NFC_TRANSPORTADORA'
      Origin = '"TBNFE_COMPLEMENTAR"."NFC_TRANSPORTADORA"'
      ProviderFlags = [pfInUpdate]
    end
    object IbDtstTabelaNFC_PLACA_VEICULO: TIBStringField
      FieldName = 'NFC_PLACA_VEICULO'
      Origin = '"TBNFE_COMPLEMENTAR"."NFC_PLACA_VEICULO"'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object IbDtstTabelaNFC_PLACA_UF: TIBStringField
      FieldName = 'NFC_PLACA_UF'
      Origin = '"TBNFE_COMPLEMENTAR"."NFC_PLACA_UF"'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object IbDtstTabelaNFC_PLACA_RNTC: TIBStringField
      FieldName = 'NFC_PLACA_RNTC'
      Origin = '"TBNFE_COMPLEMENTAR"."NFC_PLACA_RNTC"'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object IbDtstTabelaNFC_VALOR_BASE_ICMS: TIBBCDField
      DisplayLabel = 'Base ICMS'
      FieldName = 'NFC_VALOR_BASE_ICMS'
      Origin = '"TBNFE_COMPLEMENTAR"."NFC_VALOR_BASE_ICMS"'
      ProviderFlags = [pfInUpdate]
      Required = True
      DisplayFormat = ',0.00#'
      Precision = 18
      Size = 2
    end
    object IbDtstTabelaNFC_VALOR_ICMS: TIBBCDField
      DisplayLabel = 'Valor ICMS'
      FieldName = 'NFC_VALOR_ICMS'
      Origin = '"TBNFE_COMPLEMENTAR"."NFC_VALOR_ICMS"'
      ProviderFlags = [pfInUpdate]
      Required = True
      DisplayFormat = ',0.00#'
      Precision = 18
      Size = 2
    end
    object IbDtstTabelaNFC_VALOR_BASE_ICMS_SUBST: TIBBCDField
      DisplayLabel = 'Base ICMS ST'
      FieldName = 'NFC_VALOR_BASE_ICMS_SUBST'
      Origin = '"TBNFE_COMPLEMENTAR"."NFC_VALOR_BASE_ICMS_SUBST"'
      ProviderFlags = [pfInUpdate]
      Required = True
      DisplayFormat = ',0.00#'
      Precision = 18
      Size = 2
    end
    object IbDtstTabelaNFC_VALOR_ICMS_SUBST: TIBBCDField
      DisplayLabel = 'Valor ICMS ST'
      FieldName = 'NFC_VALOR_ICMS_SUBST'
      Origin = '"TBNFE_COMPLEMENTAR"."NFC_VALOR_ICMS_SUBST"'
      ProviderFlags = [pfInUpdate]
      Required = True
      DisplayFormat = ',0.00#'
      Precision = 18
      Size = 2
    end
    object IbDtstTabelaNFC_VALOR_TOTAL_PRODUTO: TIBBCDField
      DisplayLabel = 'Total Produto'
      FieldName = 'NFC_VALOR_TOTAL_PRODUTO'
      Origin = '"TBNFE_COMPLEMENTAR"."NFC_VALOR_TOTAL_PRODUTO"'
      ProviderFlags = [pfInUpdate]
      Required = True
      DisplayFormat = ',0.00#'
      Precision = 18
      Size = 2
    end
    object IbDtstTabelaNFC_VALOR_FRETE: TIBBCDField
      DisplayLabel = 'Frete'
      FieldName = 'NFC_VALOR_FRETE'
      Origin = '"TBNFE_COMPLEMENTAR"."NFC_VALOR_FRETE"'
      ProviderFlags = [pfInUpdate]
      Required = True
      DisplayFormat = ',0.00#'
      Precision = 18
      Size = 2
    end
    object IbDtstTabelaNFC_VALOR_SEGURO: TIBBCDField
      DisplayLabel = 'Seguros'
      FieldName = 'NFC_VALOR_SEGURO'
      Origin = '"TBNFE_COMPLEMENTAR"."NFC_VALOR_SEGURO"'
      ProviderFlags = [pfInUpdate]
      Required = True
      DisplayFormat = ',0.00#'
      Precision = 18
      Size = 2
    end
    object IbDtstTabelaNFC_VALOR_DESCONTO: TIBBCDField
      DisplayLabel = 'Descontos'
      FieldName = 'NFC_VALOR_DESCONTO'
      Origin = '"TBNFE_COMPLEMENTAR"."NFC_VALOR_DESCONTO"'
      ProviderFlags = [pfInUpdate]
      Required = True
      DisplayFormat = ',0.00#'
      Precision = 18
      Size = 2
    end
    object IbDtstTabelaNFC_VALOR_TOTAL_II: TIBBCDField
      DisplayLabel = 'Total II'
      FieldName = 'NFC_VALOR_TOTAL_II'
      Origin = '"TBNFE_COMPLEMENTAR"."NFC_VALOR_TOTAL_II"'
      ProviderFlags = [pfInUpdate]
      Required = True
      DisplayFormat = ',0.00#'
      Precision = 18
      Size = 2
    end
    object IbDtstTabelaNFC_VALOR_TOTAL_IPI: TIBBCDField
      DisplayLabel = 'Total IPI'
      FieldName = 'NFC_VALOR_TOTAL_IPI'
      Origin = '"TBNFE_COMPLEMENTAR"."NFC_VALOR_TOTAL_IPI"'
      ProviderFlags = [pfInUpdate]
      Required = True
      DisplayFormat = ',0.00#'
      Precision = 18
      Size = 2
    end
    object IbDtstTabelaNFC_VALOR_PIS: TIBBCDField
      DisplayLabel = 'Total PIS'
      FieldName = 'NFC_VALOR_PIS'
      Origin = '"TBNFE_COMPLEMENTAR"."NFC_VALOR_PIS"'
      ProviderFlags = [pfInUpdate]
      Required = True
      DisplayFormat = ',0.00#'
      Precision = 18
      Size = 2
    end
    object IbDtstTabelaNFC_VALOR_COFINS: TIBBCDField
      DisplayLabel = 'Total COFINS'
      FieldName = 'NFC_VALOR_COFINS'
      Origin = '"TBNFE_COMPLEMENTAR"."NFC_VALOR_COFINS"'
      ProviderFlags = [pfInUpdate]
      Required = True
      DisplayFormat = ',0.00#'
      Precision = 18
      Size = 2
    end
    object IbDtstTabelaNFC_VALOR_OUTROS: TIBBCDField
      DisplayLabel = 'Outros'
      FieldName = 'NFC_VALOR_OUTROS'
      Origin = '"TBNFE_COMPLEMENTAR"."NFC_VALOR_OUTROS"'
      ProviderFlags = [pfInUpdate]
      Required = True
      DisplayFormat = ',0.00#'
      Precision = 18
      Size = 2
    end
    object IbDtstTabelaNFC_VALOR_TOTAL_NOTA: TIBBCDField
      DisplayLabel = 'Total Nota Fiscal (R$)'
      FieldName = 'NFC_VALOR_TOTAL_NOTA'
      Origin = '"TBNFE_COMPLEMENTAR"."NFC_VALOR_TOTAL_NOTA"'
      ProviderFlags = [pfInUpdate]
      Required = True
      DisplayFormat = ',0.00#'
      Precision = 18
      Size = 2
    end
    object IbDtstTabelaCANCELADA: TSmallintField
      FieldName = 'CANCELADA'
      Origin = '"TBNFE_COMPLEMENTAR"."CANCELADA"'
      ProviderFlags = [pfInUpdate]
    end
    object IbDtstTabelaCANCELADA_USUARIO: TIBStringField
      FieldName = 'CANCELADA_USUARIO'
      Origin = '"TBNFE_COMPLEMENTAR"."CANCELADA_USUARIO"'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object IbDtstTabelaCANCELADA_DATAHORA: TDateTimeField
      FieldName = 'CANCELADA_DATAHORA'
      Origin = '"TBNFE_COMPLEMENTAR"."CANCELADA_DATAHORA"'
      ProviderFlags = [pfInUpdate]
    end
    object IbDtstTabelaCANCELADA_MOTIVO: TWideMemoField
      FieldName = 'CANCELADA_MOTIVO'
      Origin = '"TBNFE_COMPLEMENTAR"."CANCELADA_MOTIVO"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftWideMemo
      Size = 8
    end
    object IbDtstTabelaDESTINATARIO_NFE: TIBStringField
      FieldName = 'DESTINATARIO_NFE'
      ProviderFlags = []
      Size = 11
    end
    object IbDtstTabelaDESTINATARIO_CODIGO: TIntegerField
      FieldName = 'DESTINATARIO_CODIGO'
      ProviderFlags = []
    end
    object IbDtstTabelaDESTINATARIO_RAZAO: TIBStringField
      FieldName = 'DESTINATARIO_RAZAO'
      ProviderFlags = []
      Size = 100
    end
    object IbDtstTabelaDESTINATARIO_CNPJ: TIBStringField
      FieldName = 'DESTINATARIO_CNPJ'
      ProviderFlags = []
      OnGetText = IbDtstTabelaDESTINATARIO_CNPJGetText
      Size = 18
    end
  end
  inherited DtSrcTabela: TDataSource
    OnDataChange = DtSrcTabelaDataChange
    Left = 520
  end
  inherited IbUpdTabela: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  NFC_NUMERO,'
      '  NFC_EMPRESA,'
      '  NFC_TIPO,'
      '  NFC_DATA,'
      '  NFC_HORA,'
      '  NFC_EMISSAO,'
      '  NFC_EMISSOR,'
      '  NFC_ENVIADA,'
      '  NFC_TEXTO,'
      '  NFE_SERIE,'
      '  NFE_NUMERO,'
      '  NFE_MODELO,'
      '  SERIE,'
      '  NUMERO,'
      '  RECIBO,'
      '  FORNECEDOR,'
      '  CLIENTE,'
      '  NFC_DENEGADA,'
      '  NFC_DENEGADA_MOTIVO,'
      '  NFC_MODALIDADE_FRETE,'
      '  NFC_TRANSPORTADORA,'
      '  NFC_PLACA_VEICULO,'
      '  NFC_PLACA_UF,'
      '  NFC_PLACA_RNTC,'
      '  NFC_VALOR_BASE_ICMS,'
      '  NFC_VALOR_ICMS,'
      '  NFC_VALOR_BASE_ICMS_SUBST,'
      '  NFC_VALOR_ICMS_SUBST,'
      '  NFC_VALOR_TOTAL_PRODUTO,'
      '  NFC_VALOR_FRETE,'
      '  NFC_VALOR_SEGURO,'
      '  NFC_VALOR_DESCONTO,'
      '  NFC_VALOR_TOTAL_II,'
      '  NFC_VALOR_TOTAL_IPI,'
      '  NFC_VALOR_PIS,'
      '  NFC_VALOR_COFINS,'
      '  NFC_VALOR_OUTROS,'
      '  NFC_VALOR_TOTAL_NOTA,'
      '  CANCELADA,'
      '  CANCELADA_USUARIO,'
      '  CANCELADA_DATAHORA,'
      '  CANCELADA_MOTIVO'
      'from TBNFE_COMPLEMENTAR '
      'where'
      '  NFC_NUMERO = :NFC_NUMERO')
    ModifySQL.Strings = (
      'update TBNFE_COMPLEMENTAR'
      'set'
      '  CANCELADA = :CANCELADA,'
      '  CANCELADA_DATAHORA = :CANCELADA_DATAHORA,'
      '  CANCELADA_MOTIVO = :CANCELADA_MOTIVO,'
      '  CANCELADA_USUARIO = :CANCELADA_USUARIO,'
      '  CLIENTE = :CLIENTE,'
      '  FORNECEDOR = :FORNECEDOR,'
      '  NFC_DATA = :NFC_DATA,'
      '  NFC_DENEGADA = :NFC_DENEGADA,'
      '  NFC_DENEGADA_MOTIVO = :NFC_DENEGADA_MOTIVO,'
      '  NFC_EMISSAO = :NFC_EMISSAO,'
      '  NFC_EMISSOR = :NFC_EMISSOR,'
      '  NFC_EMPRESA = :NFC_EMPRESA,'
      '  NFC_ENVIADA = :NFC_ENVIADA,'
      '  NFC_HORA = :NFC_HORA,'
      '  NFC_MODALIDADE_FRETE = :NFC_MODALIDADE_FRETE,'
      '  NFC_NUMERO = :NFC_NUMERO,'
      '  NFC_PLACA_RNTC = :NFC_PLACA_RNTC,'
      '  NFC_PLACA_UF = :NFC_PLACA_UF,'
      '  NFC_PLACA_VEICULO = :NFC_PLACA_VEICULO,'
      '  NFC_TEXTO = :NFC_TEXTO,'
      '  NFC_TIPO = :NFC_TIPO,'
      '  NFC_TRANSPORTADORA = :NFC_TRANSPORTADORA,'
      '  NFC_VALOR_BASE_ICMS = :NFC_VALOR_BASE_ICMS,'
      '  NFC_VALOR_BASE_ICMS_SUBST = :NFC_VALOR_BASE_ICMS_SUBST,'
      '  NFC_VALOR_COFINS = :NFC_VALOR_COFINS,'
      '  NFC_VALOR_DESCONTO = :NFC_VALOR_DESCONTO,'
      '  NFC_VALOR_FRETE = :NFC_VALOR_FRETE,'
      '  NFC_VALOR_ICMS = :NFC_VALOR_ICMS,'
      '  NFC_VALOR_ICMS_SUBST = :NFC_VALOR_ICMS_SUBST,'
      '  NFC_VALOR_OUTROS = :NFC_VALOR_OUTROS,'
      '  NFC_VALOR_PIS = :NFC_VALOR_PIS,'
      '  NFC_VALOR_SEGURO = :NFC_VALOR_SEGURO,'
      '  NFC_VALOR_TOTAL_II = :NFC_VALOR_TOTAL_II,'
      '  NFC_VALOR_TOTAL_IPI = :NFC_VALOR_TOTAL_IPI,'
      '  NFC_VALOR_TOTAL_NOTA = :NFC_VALOR_TOTAL_NOTA,'
      '  NFC_VALOR_TOTAL_PRODUTO = :NFC_VALOR_TOTAL_PRODUTO,'
      '  NFE_MODELO = :NFE_MODELO,'
      '  NFE_NUMERO = :NFE_NUMERO,'
      '  NFE_SERIE = :NFE_SERIE,'
      '  NUMERO = :NUMERO,'
      '  RECIBO = :RECIBO,'
      '  SERIE = :SERIE'
      'where'
      '  NFC_NUMERO = :OLD_NFC_NUMERO')
    InsertSQL.Strings = (
      'insert into TBNFE_COMPLEMENTAR'
      
        '  (CANCELADA, CANCELADA_DATAHORA, CANCELADA_MOTIVO, CANCELADA_US' +
        'UARIO, '
      
        '   CLIENTE, FORNECEDOR, NFC_DATA, NFC_DENEGADA, NFC_DENEGADA_MOT' +
        'IVO, NFC_EMISSAO, '
      
        '   NFC_EMISSOR, NFC_EMPRESA, NFC_ENVIADA, NFC_HORA, NFC_MODALIDA' +
        'DE_FRETE, '
      
        '   NFC_NUMERO, NFC_PLACA_RNTC, NFC_PLACA_UF, NFC_PLACA_VEICULO, ' +
        'NFC_TEXTO, '
      
        '   NFC_TIPO, NFC_TRANSPORTADORA, NFC_VALOR_BASE_ICMS, NFC_VALOR_' +
        'BASE_ICMS_SUBST, '
      
        '   NFC_VALOR_COFINS, NFC_VALOR_DESCONTO, NFC_VALOR_FRETE, NFC_VA' +
        'LOR_ICMS, '
      
        '   NFC_VALOR_ICMS_SUBST, NFC_VALOR_OUTROS, NFC_VALOR_PIS, NFC_VA' +
        'LOR_SEGURO, '
      
        '   NFC_VALOR_TOTAL_II, NFC_VALOR_TOTAL_IPI, NFC_VALOR_TOTAL_NOTA' +
        ', NFC_VALOR_TOTAL_PRODUTO, '
      '   NFE_MODELO, NFE_NUMERO, NFE_SERIE, NUMERO, RECIBO, SERIE)'
      'values'
      
        '  (:CANCELADA, :CANCELADA_DATAHORA, :CANCELADA_MOTIVO, :CANCELAD' +
        'A_USUARIO, '
      
        '   :CLIENTE, :FORNECEDOR, :NFC_DATA, :NFC_DENEGADA, :NFC_DENEGAD' +
        'A_MOTIVO, '
      
        '   :NFC_EMISSAO, :NFC_EMISSOR, :NFC_EMPRESA, :NFC_ENVIADA, :NFC_' +
        'HORA, :NFC_MODALIDADE_FRETE, '
      
        '   :NFC_NUMERO, :NFC_PLACA_RNTC, :NFC_PLACA_UF, :NFC_PLACA_VEICU' +
        'LO, :NFC_TEXTO, '
      
        '   :NFC_TIPO, :NFC_TRANSPORTADORA, :NFC_VALOR_BASE_ICMS, :NFC_VA' +
        'LOR_BASE_ICMS_SUBST, '
      
        '   :NFC_VALOR_COFINS, :NFC_VALOR_DESCONTO, :NFC_VALOR_FRETE, :NF' +
        'C_VALOR_ICMS, '
      
        '   :NFC_VALOR_ICMS_SUBST, :NFC_VALOR_OUTROS, :NFC_VALOR_PIS, :NF' +
        'C_VALOR_SEGURO, '
      
        '   :NFC_VALOR_TOTAL_II, :NFC_VALOR_TOTAL_IPI, :NFC_VALOR_TOTAL_N' +
        'OTA, :NFC_VALOR_TOTAL_PRODUTO, '
      
        '   :NFE_MODELO, :NFE_NUMERO, :NFE_SERIE, :NUMERO, :RECIBO, :SERI' +
        'E)')
    DeleteSQL.Strings = (
      'delete from TBNFE_COMPLEMENTAR'
      'where'
      '  NFC_NUMERO = :OLD_NFC_NUMERO')
    Left = 488
    Top = 64
  end
  inherited ImgList: TImageList
    Left = 424
    Top = 64
  end
  object dtsEmpresa: TDataSource
    DataSet = tblEmpresa
    Left = 816
    Top = 280
  end
  object tblEmpresa: TIBTable
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'TBEMPRESA'
    UniDirectional = False
    Left = 784
    Top = 280
  end
  object tblFormaPagto: TIBTable
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'COD'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'DESCRI'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ACRESCIMO'
        DataType = ftFloat
      end
      item
        Name = 'CONTA_CORRENTE'
        DataType = ftInteger
      end
      item
        Name = 'DEBITAR_LIMITE_CLIENTE'
        DataType = ftSmallint
      end>
    IndexDefs = <
      item
        Name = 'PK_TBFORMPAGTO'
        Fields = 'COD'
        Options = [ixUnique]
      end
      item
        Name = 'FK_TBFORMPAGTO_CCORRENTE'
        Fields = 'CONTA_CORRENTE'
      end>
    StoreDefs = True
    TableName = 'TBFORMPAGTO'
    UniDirectional = False
    Left = 784
    Top = 312
  end
  object dtsFormaPagto: TDataSource
    DataSet = tblFormaPagto
    Left = 816
    Top = 312
  end
  object tblCondicaoPagto: TIBTable
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'VW_CONDICAOPAGTO'
    TableTypes = [ttView]
    UniDirectional = False
    Left = 784
    Top = 344
  end
  object dtsCondicaoPagto: TDataSource
    DataSet = tblCondicaoPagto
    Left = 816
    Top = 344
  end
  object tblModalidadeFrete: TIBTable
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'VW_MODALIDADE_FRETE'
    TableTypes = [ttView]
    UniDirectional = False
    Left = 784
    Top = 376
  end
  object dtsModalidadeFrete: TDataSource
    DataSet = tblModalidadeFrete
    Left = 816
    Top = 376
  end
  object cdsTabelaItens: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = True
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'Select'
      '    i.nfc_numero'
      '  , i.nfc_item'
      '  , i.mov_ano'
      '  , i.mov_controle'
      '  , i.mov_empresa'
      '  , i.mov_seq'
      '  , i.produto'
      '  , i.quantidade'
      '  , i.valor_diferenca'
      '  , i.valor_total'
      '  , i.aliquota_icms'
      '  , i.bc_icms'
      '  , i.valor_icms'
      '  , i.aliquota_icms_st'
      '  , i.bc_icms_st'
      '  , i.valor_icms_st'
      '  , pd.descri_apresentacao'
      '  , coalesce(vi.qtde, ci.qtde) as mov_quantidade'
      '  , up.unp_descricao           as mov_unidade'
      '  , up.unp_sigla               as mov_unidade_sigla'
      '  , coalesce(vi.punit, ci.precounit) as mov_valor_un'
      '  , coalesce(vi.punit, ci.precounit) +'
      '    coalesce(i.valor_diferenca, 0.0) as mov_valor_un_novo'
      
        '  , coalesce(vi.total_bruto, (ci.qtde * ci.precounit)) as mov_va' +
        'lor_total'
      
        '  , cast(coalesce(i.valor_total, 0.0) + coalesce(vi.total_bruto,' +
        ' (ci.qtde * ci.precounit)) as DMN_MONEY) as mov_total_geral'
      '  , coalesce(vi.cfop_cod, ci.cfop)   as mov_cfop'
      '  , cf.cfop_descricao                as mov_cfop_descricao'
      '  , coalesce(vi.cst, ci.cst)         as mov_cst'
      '  , coalesce(vi.csosn, pd.csosn)     as mov_csosn'
      '  , coalesce(vi.aliquota, ci.aliquota) as mov_aliquota'
      
        '  , coalesce(vi.aliquota_csosn, ci.aliquota_csosn) as mov_aliquo' +
        'ta_csosn'
      '  , 12.0 as mov_aliquota_st'
      '  , 56.93 as mov_aliquota_mva'
      'from TBNFE_COMPLEMENTAR_ITEM i'
      '  inner join TBPRODUTO pd on (pd.cod = i.produto)'
      ''
      
        '  left join TVENDASITENS   vi on (vi.ano = i.mov_ano and vi.codc' +
        'ontrol = i.mov_controle and vi.codemp = i.mov_empresa and vi.seq' +
        ' = i.mov_seq)'
      
        '  left join TBCOMPRASITENS ci on (ci.ano = i.mov_ano and ci.codc' +
        'ontrol = i.mov_controle and ci.codemp = i.mov_empresa and ci.seq' +
        ' = i.mov_seq)'
      
        '  left join TBUNIDADEPROD  up on (up.unp_cod = coalesce(vi.unid_' +
        'cod, ci.unid_cod))'
      
        '  left join TBCFOP         cf on (cf.cfop_cod = coalesce(vi.cfop' +
        '_cod, ci.cfop))')
    ModifySQL.Strings = (
      '')
    ParamCheck = True
    UniDirectional = False
    UpdateObject = IbUpdTabelaItens
    Left = 456
    Top = 96
    object cdsTabelaItensNFC_NUMERO: TIntegerField
      FieldName = 'NFC_NUMERO'
      Origin = '"TBNFE_COMPLEMENTAR_ITEM"."NFC_NUMERO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsTabelaItensNFC_ITEM: TSmallintField
      Alignment = taCenter
      FieldName = 'NFC_ITEM'
      Origin = '"TBNFE_COMPLEMENTAR_ITEM"."NFC_ITEM"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      DisplayFormat = '00'
    end
    object cdsTabelaItensMOV_ANO: TSmallintField
      FieldName = 'MOV_ANO'
      Origin = '"TBNFE_COMPLEMENTAR_ITEM"."MOV_ANO"'
      ProviderFlags = [pfInUpdate]
    end
    object cdsTabelaItensMOV_CONTROLE: TIntegerField
      FieldName = 'MOV_CONTROLE'
      Origin = '"TBNFE_COMPLEMENTAR_ITEM"."MOV_CONTROLE"'
      ProviderFlags = [pfInUpdate]
    end
    object cdsTabelaItensMOV_EMPRESA: TIBStringField
      FieldName = 'MOV_EMPRESA'
      Origin = '"TBNFE_COMPLEMENTAR_ITEM"."MOV_EMPRESA"'
      ProviderFlags = [pfInUpdate]
      Size = 18
    end
    object cdsTabelaItensMOV_SEQ: TSmallintField
      FieldName = 'MOV_SEQ'
      Origin = '"TBNFE_COMPLEMENTAR_ITEM"."MOV_SEQ"'
      ProviderFlags = [pfInUpdate]
    end
    object cdsTabelaItensPRODUTO: TIBStringField
      FieldName = 'PRODUTO'
      Origin = '"TBNFE_COMPLEMENTAR_ITEM"."PRODUTO"'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object cdsTabelaItensQUANTIDADE: TIBBCDField
      FieldName = 'QUANTIDADE'
      Origin = '"TBNFE_COMPLEMENTAR_ITEM"."QUANTIDADE"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.###'
      Precision = 18
      Size = 3
    end
    object cdsTabelaItensVALOR_DIFERENCA: TIBBCDField
      FieldName = 'VALOR_DIFERENCA'
      Origin = '"TBNFE_COMPLEMENTAR_ITEM"."VALOR_DIFERENCA"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00#'
      Precision = 18
      Size = 2
    end
    object cdsTabelaItensVALOR_TOTAL: TIBBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = '"TBNFE_COMPLEMENTAR_ITEM"."VALOR_TOTAL"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00#'
      Precision = 18
      Size = 2
    end
    object cdsTabelaItensALIQUOTA_ICMS: TIBBCDField
      FieldName = 'ALIQUOTA_ICMS'
      Origin = '"TBNFE_COMPLEMENTAR_ITEM"."ALIQUOTA_ICMS"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.##'
      Precision = 18
      Size = 2
    end
    object cdsTabelaItensBC_ICMS: TIBBCDField
      FieldName = 'BC_ICMS'
      Origin = '"TBNFE_COMPLEMENTAR_ITEM"."BC_ICMS"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00#'
      Precision = 18
      Size = 2
    end
    object cdsTabelaItensVALOR_ICMS: TIBBCDField
      FieldName = 'VALOR_ICMS'
      Origin = '"TBNFE_COMPLEMENTAR_ITEM"."VALOR_ICMS"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00#'
      Precision = 18
      Size = 2
    end
    object cdsTabelaItensALIQUOTA_ICMS_ST: TIBBCDField
      FieldName = 'ALIQUOTA_ICMS_ST'
      Origin = '"TBNFE_COMPLEMENTAR_ITEM"."ALIQUOTA_ICMS_ST"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.##'
      Precision = 18
      Size = 2
    end
    object cdsTabelaItensBC_ICMS_ST: TIBBCDField
      FieldName = 'BC_ICMS_ST'
      Origin = '"TBNFE_COMPLEMENTAR_ITEM"."BC_ICMS_ST"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00#'
      Precision = 18
      Size = 2
    end
    object cdsTabelaItensVALOR_ICMS_ST: TIBBCDField
      FieldName = 'VALOR_ICMS_ST'
      Origin = '"TBNFE_COMPLEMENTAR_ITEM"."VALOR_ICMS_ST"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00#'
      Precision = 18
      Size = 2
    end
    object cdsTabelaItensDESCRI_APRESENTACAO: TIBStringField
      FieldName = 'DESCRI_APRESENTACAO'
      Origin = '"TBPRODUTO"."DESCRI_APRESENTACAO"'
      ProviderFlags = []
      Size = 100
    end
    object cdsTabelaItensMOV_QUANTIDADE: TIBBCDField
      FieldName = 'MOV_QUANTIDADE'
      ProviderFlags = []
      DisplayFormat = ',0.###'
      Precision = 18
      Size = 3
    end
    object cdsTabelaItensMOV_UNIDADE: TIBStringField
      FieldName = 'MOV_UNIDADE'
      Origin = '"TBUNIDADEPROD"."UNP_DESCRICAO"'
      ProviderFlags = []
      Size = 50
    end
    object cdsTabelaItensMOV_UNIDADE_SIGLA: TIBStringField
      FieldName = 'MOV_UNIDADE_SIGLA'
      Origin = '"TBUNIDADEPROD"."UNP_SIGLA"'
      ProviderFlags = []
      Size = 5
    end
    object cdsTabelaItensMOV_VALOR_UN: TIBBCDField
      FieldName = 'MOV_VALOR_UN'
      ProviderFlags = []
      DisplayFormat = ',0.00#'
      Precision = 18
      Size = 2
    end
    object cdsTabelaItensMOV_VALOR_UN_NOVO: TIBBCDField
      FieldName = 'MOV_VALOR_UN_NOVO'
      ProviderFlags = []
      DisplayFormat = ',0.00#'
      Precision = 18
      Size = 2
    end
    object cdsTabelaItensMOV_VALOR_TOTAL: TFMTBCDField
      FieldName = 'MOV_VALOR_TOTAL'
      ProviderFlags = []
      DisplayFormat = ',0.00#'
      Precision = 18
      Size = 5
    end
    object cdsTabelaItensMOV_TOTAL_GERAL: TIBBCDField
      FieldName = 'MOV_TOTAL_GERAL'
      ProviderFlags = []
      DisplayFormat = ',0.00#'
      Precision = 18
      Size = 2
    end
    object cdsTabelaItensMOV_CFOP: TIntegerField
      FieldName = 'MOV_CFOP'
      ProviderFlags = []
    end
    object cdsTabelaItensMOV_CFOP_DESCRICAO: TIBStringField
      FieldName = 'MOV_CFOP_DESCRICAO'
      Origin = '"TBCFOP"."CFOP_DESCRICAO"'
      ProviderFlags = []
      Size = 250
    end
    object cdsTabelaItensMOV_CST: TIBStringField
      FieldName = 'MOV_CST'
      ProviderFlags = []
      Size = 3
    end
    object cdsTabelaItensMOV_CSOSN: TIBStringField
      FieldName = 'MOV_CSOSN'
      ProviderFlags = []
      Size = 3
    end
    object cdsTabelaItensMOV_ALIQUOTA: TIBBCDField
      FieldName = 'MOV_ALIQUOTA'
      ProviderFlags = []
      DisplayFormat = ',0.##'
      Precision = 18
      Size = 2
    end
    object cdsTabelaItensMOV_ALIQUOTA_CSOSN: TIBBCDField
      FieldName = 'MOV_ALIQUOTA_CSOSN'
      ProviderFlags = []
      DisplayFormat = ',0.##'
      Precision = 18
      Size = 2
    end
    object cdsTabelaItensMOV_ALIQUOTA_ST: TIBBCDField
      FieldName = 'MOV_ALIQUOTA_ST'
      ProviderFlags = []
      DisplayFormat = ',0.##'
      Precision = 18
      Size = 1
    end
    object cdsTabelaItensMOV_ALIQUOTA_MVA: TIBBCDField
      FieldName = 'MOV_ALIQUOTA_MVA'
      ProviderFlags = []
      DisplayFormat = ',0.##'
      Precision = 18
      Size = 2
    end
  end
  object IbUpdTabelaItens: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  NFC_NUMERO,'
      '  NFC_ITEM,'
      '  MOV_ANO,'
      '  MOV_CONTROLE,'
      '  MOV_EMPRESA,'
      '  MOV_SEQ,'
      '  PRODUTO,'
      '  QUANTIDADE,'
      '  VALOR_DIFERENCA,'
      '  VALOR_TOTAL,'
      '  ALIQUOTA_ICMS,'
      '  BC_ICMS,'
      '  VALOR_ICMS,'
      '  ALIQUOTA_ICMS_ST,'
      '  BC_ICMS_ST,'
      '  VALOR_ICMS_ST'
      'from TBNFE_COMPLEMENTAR_ITEM '
      'where'
      '  NFC_ITEM = :NFC_ITEM and'
      '  NFC_NUMERO = :NFC_NUMERO')
    ModifySQL.Strings = (
      'update TBNFE_COMPLEMENTAR_ITEM'
      'set'
      '  ALIQUOTA_ICMS = :ALIQUOTA_ICMS,'
      '  ALIQUOTA_ICMS_ST = :ALIQUOTA_ICMS_ST,'
      '  BC_ICMS = :BC_ICMS,'
      '  BC_ICMS_ST = :BC_ICMS_ST,'
      '  MOV_ANO = :MOV_ANO,'
      '  MOV_CONTROLE = :MOV_CONTROLE,'
      '  MOV_EMPRESA = :MOV_EMPRESA,'
      '  MOV_SEQ = :MOV_SEQ,'
      '  NFC_ITEM = :NFC_ITEM,'
      '  NFC_NUMERO = :NFC_NUMERO,'
      '  PRODUTO = :PRODUTO,'
      '  QUANTIDADE = :QUANTIDADE,'
      '  VALOR_DIFERENCA = :VALOR_DIFERENCA,'
      '  VALOR_ICMS = :VALOR_ICMS,'
      '  VALOR_ICMS_ST = :VALOR_ICMS_ST,'
      '  VALOR_TOTAL = :VALOR_TOTAL'
      'where'
      '  NFC_ITEM = :OLD_NFC_ITEM and'
      '  NFC_NUMERO = :OLD_NFC_NUMERO')
    InsertSQL.Strings = (
      'insert into TBNFE_COMPLEMENTAR_ITEM'
      
        '  (ALIQUOTA_ICMS, ALIQUOTA_ICMS_ST, BC_ICMS, BC_ICMS_ST, MOV_ANO' +
        ', MOV_CONTROLE, '
      
        '   MOV_EMPRESA, MOV_SEQ, NFC_ITEM, NFC_NUMERO, PRODUTO, QUANTIDA' +
        'DE, VALOR_DIFERENCA, '
      '   VALOR_ICMS, VALOR_ICMS_ST, VALOR_TOTAL)'
      'values'
      
        '  (:ALIQUOTA_ICMS, :ALIQUOTA_ICMS_ST, :BC_ICMS, :BC_ICMS_ST, :MO' +
        'V_ANO, '
      
        '   :MOV_CONTROLE, :MOV_EMPRESA, :MOV_SEQ, :NFC_ITEM, :NFC_NUMERO' +
        ', :PRODUTO, '
      
        '   :QUANTIDADE, :VALOR_DIFERENCA, :VALOR_ICMS, :VALOR_ICMS_ST, :' +
        'VALOR_TOTAL)')
    DeleteSQL.Strings = (
      'delete from TBNFE_COMPLEMENTAR_ITEM'
      'where'
      '  NFC_ITEM = :OLD_NFC_ITEM and'
      '  NFC_NUMERO = :OLD_NFC_NUMERO')
    Left = 487
    Top = 96
  end
  object DtSrcTabelaItens: TDataSource
    AutoEdit = False
    DataSet = cdsTabelaItens
    OnStateChange = DtSrcTabelaItensStateChange
    Left = 519
    Top = 96
  end
  object qryNFE: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = True
    SelectSQL.Strings = (
      'Select'
      '    n.empresa'
      '  , n.serie'
      '  , n.numero'
      '  , n.modelo'
      '  , n.versao'
      '  , n.dataemissao'
      '  , n.horaemissao'
      '  , n.chave'
      '  , n.protocolo'
      '  , n.recibo'
      '  , n.xml_filename'
      '  , n.xml_file'
      '  , n.lote_ano'
      '  , n.lote_num'
      '  , n.anovenda'
      '  , n.numvenda'
      '  , n.anocompra'
      '  , n.numcompra'
      '  , n.nfc_numero'
      'from TBNFE_ENVIADA n'
      'where n.empresa    = :empresa'
      '  and n.nfc_numero = :controle')
    ParamCheck = True
    UniDirectional = False
    UpdateObject = updNFE
    Left = 456
    Top = 128
    object qryNFEEMPRESA: TIBStringField
      FieldName = 'EMPRESA'
      Origin = '"TBNFE_ENVIADA"."EMPRESA"'
      Size = 18
    end
    object qryNFEANOVENDA: TSmallintField
      FieldName = 'ANOVENDA'
      Origin = 'TBNFE_ENVIADA.ANOVENDA'
      Required = True
    end
    object qryNFENUMVENDA: TIntegerField
      FieldName = 'NUMVENDA'
      Origin = 'TBNFE_ENVIADA.NUMVENDA'
    end
    object qryNFEANOCOMPRA: TSmallintField
      FieldName = 'ANOCOMPRA'
      Origin = '"TBNFE_ENVIADA"."ANOCOMPRA"'
    end
    object qryNFENUMCOMPRA: TIntegerField
      FieldName = 'NUMCOMPRA'
      Origin = '"TBNFE_ENVIADA"."NUMCOMPRA"'
    end
    object qryNFENFC_NUMERO: TIntegerField
      FieldName = 'NFC_NUMERO'
      Origin = '"TBNFE_ENVIADA"."NFC_NUMERO"'
      ProviderFlags = [pfInUpdate]
    end
    object qryNFEDATAEMISSAO: TDateField
      FieldName = 'DATAEMISSAO'
      Origin = 'TBNFE_ENVIADA.DATAEMISSAO'
    end
    object qryNFEHORAEMISSAO: TTimeField
      FieldName = 'HORAEMISSAO'
      Origin = 'TBNFE_ENVIADA.HORAEMISSAO'
    end
    object qryNFESERIE: TIBStringField
      FieldName = 'SERIE'
      Origin = 'TBNFE_ENVIADA.SERIE'
      Required = True
      Size = 4
    end
    object qryNFENUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'TBNFE_ENVIADA.NUMERO'
      Required = True
    end
    object qryNFEMODELO: TSmallintField
      FieldName = 'MODELO'
      Origin = '"TBNFE_ENVIADA"."MODELO"'
      ProviderFlags = [pfInUpdate]
    end
    object qryNFEVERSAO: TSmallintField
      FieldName = 'VERSAO'
      Origin = '"TBNFE_ENVIADA"."VERSAO"'
      ProviderFlags = [pfInUpdate]
    end
    object qryNFECHAVE: TIBStringField
      FieldName = 'CHAVE'
      Origin = 'TBNFE_ENVIADA.CHAVE'
      Size = 250
    end
    object qryNFEPROTOCOLO: TIBStringField
      FieldName = 'PROTOCOLO'
      Origin = 'TBNFE_ENVIADA.PROTOCOLO'
      Size = 250
    end
    object qryNFERECIBO: TIBStringField
      FieldName = 'RECIBO'
      Origin = 'TBNFE_ENVIADA.RECIBO'
      Size = 250
    end
    object qryNFEXML_FILENAME: TIBStringField
      FieldName = 'XML_FILENAME'
      Origin = 'TBNFE_ENVIADA.XML_FILENAME'
      Size = 250
    end
    object qryNFEXML_FILE: TMemoField
      FieldName = 'XML_FILE'
      Origin = 'TBNFE_ENVIADA.XML_FILE'
      BlobType = ftMemo
      Size = 8
    end
    object qryNFELOTE_ANO: TSmallintField
      FieldName = 'LOTE_ANO'
      Origin = 'TBNFE_ENVIADA.LOTE_ANO'
    end
    object qryNFELOTE_NUM: TIntegerField
      FieldName = 'LOTE_NUM'
      Origin = 'TBNFE_ENVIADA.LOTE_NUM'
      Required = True
    end
  end
  object updNFE: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  EMPRESA,'
      '  SERIE,'
      '  NUMERO,'
      '  MODELO,'
      '  VERSAO,'
      '  ANOVENDA,'
      '  NUMVENDA,'
      '  ANOCOMPRA,'
      '  NUMCOMPRA,'
      '  NFC_NUMERO,'
      '  DATAEMISSAO,'
      '  HORAEMISSAO,'
      '  CHAVE,'
      '  PROTOCOLO,'
      '  RECIBO,'
      '  XML_FILENAME,'
      '  XML_FILE,'
      '  LOTE_ANO,'
      '  LOTE_NUM,'
      '  CANCELADA'
      'from TBNFE_ENVIADA '
      'where'
      '  EMPRESA = :EMPRESA and'
      '  MODELO = :MODELO and'
      '  NUMERO = :NUMERO and'
      '  SERIE = :SERIE')
    ModifySQL.Strings = (
      'update TBNFE_ENVIADA'
      'set'
      '  ANOCOMPRA = :ANOCOMPRA,'
      '  ANOVENDA = :ANOVENDA,'
      '  CHAVE = :CHAVE,'
      '  DATAEMISSAO = :DATAEMISSAO,'
      '  EMPRESA = :EMPRESA,'
      '  HORAEMISSAO = :HORAEMISSAO,'
      '  LOTE_ANO = :LOTE_ANO,'
      '  LOTE_NUM = :LOTE_NUM,'
      '  MODELO = :MODELO,'
      '  NFC_NUMERO = :NFC_NUMERO,'
      '  NUMCOMPRA = :NUMCOMPRA,'
      '  NUMERO = :NUMERO,'
      '  NUMVENDA = :NUMVENDA,'
      '  PROTOCOLO = :PROTOCOLO,'
      '  RECIBO = :RECIBO,'
      '  SERIE = :SERIE,'
      '  VERSAO = :VERSAO,'
      '  XML_FILE = :XML_FILE,'
      '  XML_FILENAME = :XML_FILENAME'
      'where'
      '  EMPRESA = :OLD_EMPRESA and'
      '  MODELO = :OLD_MODELO and'
      '  NUMERO = :OLD_NUMERO and'
      '  SERIE = :OLD_SERIE')
    InsertSQL.Strings = (
      'insert into TBNFE_ENVIADA'
      
        '  (ANOCOMPRA, ANOVENDA, CHAVE, DATAEMISSAO, EMPRESA, HORAEMISSAO' +
        ', LOTE_ANO, '
      
        '   LOTE_NUM, MODELO, NFC_NUMERO, NUMCOMPRA, NUMERO, NUMVENDA, PR' +
        'OTOCOLO, '
      '   RECIBO, SERIE, VERSAO, XML_FILE, XML_FILENAME)'
      'values'
      
        '  (:ANOCOMPRA, :ANOVENDA, :CHAVE, :DATAEMISSAO, :EMPRESA, :HORAE' +
        'MISSAO, '
      
        '   :LOTE_ANO, :LOTE_NUM, :MODELO, :NFC_NUMERO, :NUMCOMPRA, :NUME' +
        'RO, :NUMVENDA, '
      
        '   :PROTOCOLO, :RECIBO, :SERIE, :VERSAO, :XML_FILE, :XML_FILENAM' +
        'E)')
    DeleteSQL.Strings = (
      'delete from TBNFE_ENVIADA'
      'where'
      '  EMPRESA = :OLD_EMPRESA and'
      '  MODELO = :OLD_MODELO and'
      '  NUMERO = :OLD_NUMERO and'
      '  SERIE = :OLD_SERIE')
    Left = 488
    Top = 128
  end
  object dtsNFE: TDataSource
    DataSet = qryNFE
    Left = 520
    Top = 128
  end
  object qryProdutos: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'Select'
      '    nf.serie'
      '  , nf.numero'
      '  , nf.modelo'
      '  , Case when nf.anocompra is not null then 0 else 1 end tipo'
      '  , coalesce(nf.anovenda, nf.anocompra) as mov_ano'
      '  , coalesce(nf.numvenda, nf.numcompra) as mov_controle'
      '  , nf.empresa as mov_empresa'
      '  , coalesce(vi.seq, ci.seq) as mov_seq'
      '  , coalesce(vi.codprod, ci.codprod) as mov_produto'
      '  , pd.descri_apresentacao           as mov_produto_descricao'
      '  , coalesce(vi.qtde, ci.qtde) as mov_quantidade'
      '  , coalesce(vi.unid_cod, ci.unid_cod) as mov_unidade_cod'
      '  , up.unp_descricao           as mov_unidade'
      '  , up.unp_sigla               as mov_unidade_sigla'
      '  , coalesce(vi.punit, ci.precounit) as mov_valor_un'
      
        '  , coalesce(vi.total_bruto, (ci.qtde * ci.precounit)) as mov_va' +
        'lor_total'
      '  , coalesce(vi.cfop_cod, ci.cfop)   as mov_cfop'
      '  , cf.cfop_descricao                as mov_cfop_descricao'
      '  , coalesce(vi.cst, ci.cst)         as mov_cst'
      '  , coalesce(vi.csosn, pd.csosn)     as mov_csosn'
      '  , coalesce(vi.aliquota, ci.aliquota) as mov_aliquota'
      
        '  , coalesce(vi.aliquota_csosn, ci.aliquota_csosn) as mov_aliquo' +
        'ta_csosn'
      'from TBNFE_ENVIADA nf'
      
        '  left join TVENDASITENS   vi on (vi.ano = nf.anovenda  and vi.c' +
        'odcontrol = nf.numvenda  and vi.codemp = nf.empresa)'
      
        '  left join TBCOMPRASITENS ci on (ci.ano = nf.anocompra and ci.c' +
        'odcontrol = nf.numcompra and ci.codemp = nf.empresa)'
      ''
      
        '  left join TBPRODUTO      pd on (pd.cod      = coalesce(vi.codp' +
        'rod,  ci.codprod))'
      
        '  left join TBUNIDADEPROD  up on (up.unp_cod  = coalesce(vi.unid' +
        '_cod, ci.unid_cod))'
      
        '  left join TBCFOP         cf on (cf.cfop_cod = coalesce(vi.cfop' +
        '_cod, ci.cfop))'
      ''
      'where nf.empresa = :empresa'
      '  and nf.serie   = :serie'
      '  and nf.numero  = :numero'
      '  and nf.modelo  = :modelo')
    ModifySQL.Strings = (
      '')
    ParamCheck = True
    UniDirectional = False
    Left = 784
    Top = 408
  end
  object ppImprimir: TPopupMenu
    Left = 24
    Top = 312
    object nmImprimirEspelho: TMenuItem
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
      Caption = 'Espelho da Nota Complementar'
    end
    object nmImprimirDANFE: TMenuItem
      Bitmap.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        180000000000000300000000000000000000000000000000000000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0080685020
        304020304020304020304020304020304020304020304020304000FF00608090
        506070405060304050203040907060F0E0D0B0A090B0A090B0A090B0A090B0A0
        90B0A090B0A09020304070809020B8F00090D00090D00090D00090D0907860F0
        E8E0F0D8D0E0D0C0E0C8C0D0C0B0D0B8B0D0B8B0B0A09020304070889070C8F0
        10B8F010B0F000A8E00098D0A08070F0F0F0C0B0A0C0B0A0C0A8A0B0A090D0C0
        B0B0A090B0A09020304080889070D0F030C0F010B8F000A8F000A0E0A08880FF
        F8FFF0F0F0F0E8E0F0D8D0E0D0C07058506050405048404040408090A080D8F0
        40C8F030C0F010B8F000A0E0B09080FFFFFFC0B0A0C0B0A0C0A8A0F0E0D08060
        50D0C8C060504000FF008098A090E0F060D8F050C8F030C0F010B0F0B09890FF
        FFFFFFFFFFFFF8FFF0F0F0F0E8E080685080605000FF0000FF008098A0A0E8F0
        80E0F070D8F050D0F010B0F0B0A090B09890B09080A08880A080709078609070
        6000FF0000FF0000FF0090A0A0B0F0FFA0E8FF90E0F070D0F010A0D010A0D010
        A0D01098D00090D00090D00090D030384000FF0000FF0000FF0090A0B0B0F0FF
        A0F0FF6080906070805070805068705068705060704058702070900090D04048
        6000FF0000FF0000FF0090A8B0B0F0FFB0F0FF60889090C8D090E8F080D8E060
        C8E05098B04058602080A00090D050587000FF0000FF0000FF0090A8B0B0F0F0
        B0F0FFA0F0F07098A0A0F0F06D7F8580C8D050708030608060C0F020B8F05060
        7000FF0000FF0000FF0000FF0090A8B090A8B090A8B06090A0A0E8F0A0E8F090
        D8E040687070889080889070889000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0080B0C080B0C080A0B000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00}
      Caption = 'Imprimir &DANFE'
      Enabled = False
    end
    object nmGerarDANFEXML: TMenuItem
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
      Caption = '&Gerar/Salvar XML da NF-e'
      Enabled = False
    end
    object nmEnviarEmailCliente: TMenuItem
      Tag = 15
      Bitmap.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFC0A09060483060483060483060483060483060483060
        4830604830604830604830604830FFFFFFFFFFFFFFFFFFFFFFFFC0A890FFF8F0
        FFF0E0F0E8E0F0E0D0F0D0C0F0C8B0E0C0A0E0B8A0E0B090E0A890604830FFFF
        FFFFFFFFFFFFFFFFFFFFC0A8A0FFFFF0C0A8A0B0A0A0F0E8E0B0A090B09890B0
        9890B09890B09890E0B090604830FFFFFFFFFFFFFFFFFFFFFFFFC0A8A0FFFFF0
        FFFFF0FFF8F0FFF0E0F0E8E0F0E0D0F0D0C0F0C8B0E0C0A0E0B8A0604830FFFF
        FFFFFFFFFFFFFFFFFFFFC0A8A0FFFFF0B0A8A0B0A0A0FFF8F0B0A090B09890B0
        9890B09890B09890E0C0A0604830FFFFFFFFFFFFFFFFFFFFFFFFC0B0A0FFFFF0
        FFFFF0FFFFF0FFFFF0FFF8F0FFF0E0F0E8E0F0E0D0F0D0C0F0C8B0604830FFFF
        FFFFFFFFFFFFFFFFFFFFC0B0A0FFFFF0FFFFF0FFFFF0FFFFF0FFFFF0FFF8F0C0
        C8C0406070F0E0D0F0D0C0604830FFFFFFFFFFFFFFFFFFFFFFFFC0B0A0FFFFFF
        E0E8F0607880E0E0E0FFFFF0C0C8D050607030A8D0203840B0A0A0604830FFFF
        FFFFFFFFA0B39A408050D0B0A0FFFFFF90A8B080D0E0506070B0B8C050607060
        C0E050607030B8F010283010304010283070747D40784050A860D0B8A0FFFFFF
        E0E8F090A8B080E0F050607080D0E050607060D0F040607030B0E02098D02088
        B020507050886050B060D0B8A0D0B8A0D0B8A0C0B0A090A8B080E0F050607080
        E0F040587060D0F050C8F040C0F020B0E020A0D060987050B870FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF90A8B080E0F040587080E0F070D8F060D0F050C8F040C0
        F030B8F070A88060C080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF90A8B080
        E0F080E0F080E0F070D8F060D0F060B0D0808890B0C0A090D0A0FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF90A8B090A0B090A0A08098A08090A08088
        90B9B9BDA0B8A0B0C0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Caption = '&Enviar E-mail para o Destinat'#225'rio'
      Enabled = False
    end
  end
end
