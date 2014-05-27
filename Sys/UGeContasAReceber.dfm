inherited frmGeContasAReceber: TfrmGeContasAReceber
  Left = 400
  Top = 104
  Width = 950
  Height = 600
  ActiveControl = dbCodigo
  Caption = 'Controle de Contas A Receber'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 558
    Width = 934
  end
  inherited Bevel3: TBevel
    Top = 519
    Width = 934
  end
  inherited tlbBotoes: TToolBar
    Top = 523
    Width = 934
    object btbtnEfetuarPagto: TBitBtn
      Left = 726
      Top = 2
      Width = 120
      Height = 31
      Hint = 'Efetuar Pagamento'
      Caption = 'Efetuar &Pagto.'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnClick = btbtnEfetuarPagtoClick
      Glyph.Data = {
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
      NumGlyphs = 2
    end
    object Bevel7: TBevel
      Left = 846
      Top = 2
      Width = 4
      Height = 31
      Shape = bsSpacer
    end
  end
  inherited pgcGuias: TPageControl
    Width = 934
    Height = 519
    ActivePage = tbsCadastro
    OnChange = pgcGuiasChange
    inherited tbsTabela: TTabSheet
      inherited Bevel4: TBevel
        Top = 424
        Width = 926
      end
      inherited dbgDados: TDBGrid
        Width = 926
        Height = 424
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
            FieldName = 'NOMECLIENTE'
            Title.Caption = 'Ciente'
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CNPJ'
            Title.Caption = 'CPF / CNPJ'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALORREC'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            Title.Caption = 'A Receber (R$)'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clBlue
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 110
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
            FieldName = 'PAGO_'
            Title.Caption = 'Pago?'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTREC'
            Title.Alignment = taCenter
            Width = 80
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        Top = 428
        Width = 926
        inherited grpBxFiltro: TGroupBox
          Left = 328
          Width = 594
          DesignSize = (
            594
            54)
          inherited lbltFiltrar: TLabel
            Left = 310
            Width = 73
            Caption = 'Lan'#231'amento:'
          end
          inherited btnFiltrar: TSpeedButton
            Left = 549
          end
          object lblData: TLabel [2]
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
          end
          object e1Data: TDateEdit
            Left = 88
            Top = 21
            Width = 104
            Height = 21
            GlyphKind = gkCustom
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
            NumGlyphs = 2
            TabOrder = 0
            Text = '01/01/2012'
          end
          object e2Data: TDateEdit
            Left = 200
            Top = 21
            Width = 104
            Height = 21
            NumGlyphs = 2
            TabOrder = 1
            Text = '01/01/2012'
          end
        end
      end
    end
    inherited tbsCadastro: TTabSheet
      inherited Bevel8: TBevel
        Top = 241
        Width = 926
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
        Top = 364
        Width = 926
        Height = 4
        Align = alBottom
        Shape = bsSpacer
      end
      object Bevel9: TBevel [3]
        Left = 0
        Top = 161
        Width = 926
        Height = 4
        Align = alTop
        Shape = bsSpacer
      end
      inherited GrpBxDadosNominais: TGroupBox
        Width = 926
        Height = 81
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
        object dbCliente: TRxDBComboEdit
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
      end
      object GrpBxDadosValores: TGroupBox
        Left = 0
        Top = 85
        Width = 926
        Height = 76
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
        object lblEmissao: TLabel
          Left = 72
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
          Left = 168
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
        object lblValorAReceber: TLabel
          Left = 264
          Top = 24
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
          Left = 368
          Top = 24
          Width = 124
          Height = 13
          Caption = '&Forma de Pagamento:'
          FocusControl = dbFormaPagto
        end
        object lblValorMulta: TLabel
          Left = 600
          Top = 24
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
          Left = 768
          Top = 24
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
          Left = 704
          Top = 24
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
        object dbEmissao: TDBEdit
          Left = 72
          Top = 40
          Width = 89
          Height = 21
          DataField = 'DTEMISS'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
        object dbVencimento: TDBEdit
          Left = 168
          Top = 40
          Width = 89
          Height = 21
          DataField = 'DTVENC'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
        object dbValorAReceber: TDBEdit
          Left = 264
          Top = 40
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
          TabOrder = 3
          OnExit = ControlEditExit
        end
        object dbFormaPagto: TDBLookupComboBox
          Left = 368
          Top = 40
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
          TabOrder = 4
          OnClick = dbFormaPagtoClick
        end
        object dbValorMulta: TDBEdit
          Left = 600
          Top = 40
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
          TabOrder = 5
          OnExit = ControlEditExit
        end
        object dbTotalAReceber: TDBEdit
          Left = 768
          Top = 40
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
          TabOrder = 7
          OnExit = ControlEditExit
        end
        object dbPercDesconto: TDBEdit
          Left = 704
          Top = 40
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
          TabOrder = 6
        end
      end
      object pgcMaisDados: TPageControl
        Left = 0
        Top = 368
        Width = 926
        Height = 122
        ActivePage = tbsHistorico
        Align = alBottom
        TabOrder = 4
        object tbsHistorico: TTabSheet
          Caption = 'Hist'#243'rico'
          object dbObservacao: TDBMemo
            Left = 0
            Top = 0
            Width = 918
            Height = 94
            Align = alClient
            DataField = 'HISTORIC'
            DataSource = DtSrcTabela
            TabOrder = 0
          end
        end
      end
      object dbgPagamentos: TDBGrid
        Left = 0
        Top = 245
        Width = 926
        Height = 119
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
      object GrpBxDadosBoleto: TGroupBox
        Left = 0
        Top = 165
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
          ListField = 'BCO_NOME'
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
          Top = 40
          Width = 105
          Height = 17
          Caption = 'Boleto Enviado'
          DataField = 'ENVIADO'
          DataSource = DtSrcTabela
          ReadOnly = True
          TabOrder = 6
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
      end
    end
  end
  inherited IbDtstTabela: TIBDataSet
    BeforePost = IbDtstTabelaBeforePost
    OnNewRecord = IbDtstTabelaNewRecord
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
      '  , r.Situacao'
      '  , c.Nome as NomeCliente'
      '  , Case when r.Baixado = 1 then '#39'X'#39' else '#39'.'#39' end as Pago_'
      '  , vn.Serie'
      '  , vn.Nfe'
      
        '  , right('#39'0000000'#39' || vn.Nfe, 7) || '#39'/'#39' || trim(vn.Serie) as NF' +
        'E_VENDA'
      'from TBCONTREC r'
      '  left join TBCLIENTE c on (c.Codigo = r.Cliente)'
      
        '  left join TBVENDAS vn on (vn.Ano = r.Anovenda and vn.Codcontro' +
        'l = r.Numvenda)')
    GeneratorField.Field = 'NUMLANC'
    GeneratorField.Generator = 'GEN_CONTAREC_NUM_2011'
    Left = 768
    object IbDtstTabelaANOLANC: TSmallintField
      FieldName = 'ANOLANC'
      Origin = 'TBCONTREC.ANOLANC'
      Required = True
    end
    object IbDtstTabelaNUMLANC: TIntegerField
      DisplayLabel = 'No. Lanc.'
      FieldName = 'NUMLANC'
      Origin = 'TBCONTREC.NUMLANC'
      Required = True
    end
    object IbDtstTabelaPARCELA: TSmallintField
      Alignment = taCenter
      DisplayLabel = 'Parcela'
      FieldName = 'PARCELA'
      Origin = 'TBCONTREC.PARCELA'
    end
    object IbDtstTabelaEMPRESA: TIBStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      Origin = '"TBCONTREC"."EMPRESA"'
      ProviderFlags = [pfInUpdate]
      Size = 18
    end
    object IbDtstTabelaCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
      Origin = '"TBCONTREC"."CLIENTE"'
      Required = True
    end
    object IbDtstTabelaCNPJ: TIBStringField
      DisplayLabel = 'Cliente'
      FieldName = 'CNPJ'
      Origin = 'TBCONTREC.CNPJ'
      Size = 18
    end
    object IbDtstTabelaFORMA_PAGTO: TSmallintField
      DisplayLabel = 'Forma de Pagamento'
      FieldName = 'FORMA_PAGTO'
      Origin = 'TBCONTREC.FORMA_PAGTO'
    end
    object IbDtstTabelaTIPPAG: TIBStringField
      FieldName = 'TIPPAG'
      Origin = 'TBCONTREC.TIPPAG'
      Size = 35
    end
    object IbDtstTabelaHISTORIC: TMemoField
      DisplayLabel = 'Hist'#243'rico'
      FieldName = 'HISTORIC'
      Origin = 'TBCONTREC.HISTORIC'
      BlobType = ftMemo
      Size = 8
    end
    object IbDtstTabelaNUMREC: TIBStringField
      DisplayLabel = 'No. Recebimento'
      FieldName = 'NUMREC'
      Origin = 'TBCONTREC.NUMREC'
      Size = 15
    end
    object IbDtstTabelaDTEMISS: TDateField
      DisplayLabel = 'Emiss'#227'o'
      FieldName = 'DTEMISS'
      Origin = 'TBCONTREC.DTEMISS'
      Required = True
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/0000;1; '
    end
    object IbDtstTabelaDTVENC: TDateField
      DisplayLabel = 'Vencimento'
      FieldName = 'DTVENC'
      Origin = 'TBCONTREC.DTVENC'
      Required = True
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/0000;1; '
    end
    object IbDtstTabelaDTREC: TDateField
      DisplayLabel = 'Recebimento'
      FieldName = 'DTREC'
      Origin = 'TBCONTREC.DTREC'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object IbDtstTabelaDOCBAIX: TIBStringField
      DisplayLabel = 'Doc. Baixa'
      FieldName = 'DOCBAIX'
      Origin = 'TBCONTREC.DOCBAIX'
      Size = 15
    end
    object IbDtstTabelaVALORREC: TIBBCDField
      DisplayLabel = 'Valor A Receber (R$)'
      FieldName = 'VALORREC'
      Origin = 'TBCONTREC.VALORREC'
      Required = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object IbDtstTabelaVALORMULTA: TIBBCDField
      DisplayLabel = 'Valor Multa'
      FieldName = 'VALORMULTA'
      Origin = 'TBCONTREC.VALORMULTA'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object IbDtstTabelaVALORRECTOT: TIBBCDField
      DisplayLabel = 'Valor Total Recebido'
      FieldName = 'VALORRECTOT'
      Origin = 'TBCONTREC.VALORRECTOT'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object IbDtstTabelaNUMCONTRATO: TIBStringField
      DisplayLabel = 'No. Contrato'
      FieldName = 'NUMCONTRATO'
      Origin = 'TBCONTREC.NUMCONTRATO'
      Size = 15
    end
    object IbDtstTabelaCODBANCO: TIntegerField
      DisplayLabel = 'Banco'
      FieldName = 'CODBANCO'
      Origin = 'TBCONTREC.CODBANCO'
    end
    object IbDtstTabelaNOSSONUMERO: TIBStringField
      DisplayLabel = 'Nosso N'#250'mero'
      FieldName = 'NOSSONUMERO'
      Origin = 'TBCONTREC.NOSSONUMERO'
    end
    object IbDtstTabelaREMESSA: TIntegerField
      FieldName = 'REMESSA'
      Origin = 'TBCONTREC.REMESSA'
    end
    object IbDtstTabelaVALORSALDO: TIBBCDField
      DisplayLabel = 'Valor Saldo'
      FieldName = 'VALORSALDO'
      Origin = 'TBCONTREC.VALORSALDO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object IbDtstTabelaPERCENTJUROS: TIBBCDField
      DisplayLabel = '% Juros'
      FieldName = 'PERCENTJUROS'
      Origin = 'TBCONTREC.PERCENTJUROS'
      DisplayFormat = ',0.00#'
      Precision = 9
      Size = 2
    end
    object IbDtstTabelaPERCENTMULTA: TIBBCDField
      DisplayLabel = '% Multa'
      FieldName = 'PERCENTMULTA'
      Origin = 'TBCONTREC.PERCENTMULTA'
      DisplayFormat = ',0.00#'
      Precision = 9
      Size = 2
    end
    object IbDtstTabelaPERCENTDESCONTO: TIBBCDField
      DisplayLabel = '% Desconto'
      FieldName = 'PERCENTDESCONTO'
      Origin = 'TBCONTREC.PERCENTDESCONTO'
      DisplayFormat = ',0.00#'
      Precision = 9
      Size = 2
    end
    object IbDtstTabelaDATAPROCESSOBOLETO: TDateField
      DisplayLabel = 'Proc. Boleto'
      FieldName = 'DATAPROCESSOBOLETO'
      Origin = 'TBCONTREC.DATAPROCESSOBOLETO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object IbDtstTabelaBAIXADO: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'BAIXADO'
      Origin = 'TBCONTREC.BAIXADO'
      OnGetText = IbDtstTabelaBAIXADOGetText
    end
    object IbDtstTabelaENVIADO: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'ENVIADO'
      Origin = 'TBCONTREC.ENVIADO'
    end
    object IbDtstTabelaANOVENDA: TSmallintField
      Alignment = taCenter
      FieldName = 'ANOVENDA'
      Origin = 'TBCONTREC.ANOVENDA'
      DisplayFormat = '0000'
    end
    object IbDtstTabelaNUMVENDA: TIntegerField
      Alignment = taCenter
      FieldName = 'NUMVENDA'
      Origin = 'TBCONTREC.NUMVENDA'
      DisplayFormat = '0000000'
    end
    object IbDtstTabelaPAGO_: TIBStringField
      Alignment = taCenter
      DisplayLabel = 'Baixado?'
      FieldName = 'PAGO_'
      FixedChar = True
      Size = 1
    end
    object IbDtstTabelaNOMECLIENTE: TIBStringField
      DisplayLabel = 'Cliente'
      FieldName = 'NOMECLIENTE'
      Origin = 'TBCLIENTE.NOME'
      Size = 60
    end
    object IbDtstTabelaSITUACAO: TSmallintField
      FieldName = 'SITUACAO'
      Origin = 'TBCONTREC.SITUACAO'
    end
    object IbDtstTabelaSERIE: TIBStringField
      FieldName = 'SERIE'
      Origin = 'TBVENDAS.SERIE'
      Size = 4
    end
    object IbDtstTabelaNFE: TLargeintField
      FieldName = 'NFE'
      Origin = 'TBVENDAS.NFE'
    end
    object IbDtstTabelaNFE_VENDA: TIBStringField
      DisplayLabel = 'NF-e'
      FieldName = 'NFE_VENDA'
      Size = 33
    end
  end
  inherited DtSrcTabela: TDataSource
    Left = 832
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
      '  NUMCONTRATO,'
      '  PARCELA,'
      '  STATUS,'
      '  CODBANCO,'
      '  NOSSONUMERO,'
      '  REMESSA,'
      '  VALORSALDO,'
      '  PERCENTJUROS,'
      '  PERCENTMULTA,'
      '  PERCENTDESCONTO,'
      '  DATAPROCESSOBOLETO,'
      '  BAIXADO,'
      '  ENVIADO,'
      '  ANOVENDA,'
      '  NUMVENDA,'
      '  SITUACAO'
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
      
        '  (ANOLANC, ANOVENDA, BAIXADO, CLIENTE, CNPJ, CODBANCO, DATAPROC' +
        'ESSOBOLETO, '
      
        '   DOCBAIX, DTEMISS, DTREC, DTVENC, EMPRESA, ENVIADO, FORMA_PAGT' +
        'O, HISTORIC, '
      
        '   NOSSONUMERO, NUMCONTRATO, NUMLANC, NUMREC, NUMVENDA, PARCELA,' +
        ' PERCENTDESCONTO, '
      
        '   PERCENTJUROS, PERCENTMULTA, REMESSA, SITUACAO, TIPPAG, VALORM' +
        'ULTA, VALORREC, '
      '   VALORRECTOT, VALORSALDO)'
      'values'
      
        '  (:ANOLANC, :ANOVENDA, :BAIXADO, :CLIENTE, :CNPJ, :CODBANCO, :D' +
        'ATAPROCESSOBOLETO, '
      
        '   :DOCBAIX, :DTEMISS, :DTREC, :DTVENC, :EMPRESA, :ENVIADO, :FOR' +
        'MA_PAGTO, '
      
        '   :HISTORIC, :NOSSONUMERO, :NUMCONTRATO, :NUMLANC, :NUMREC, :NU' +
        'MVENDA, '
      
        '   :PARCELA, :PERCENTDESCONTO, :PERCENTJUROS, :PERCENTMULTA, :RE' +
        'MESSA, '
      
        '   :SITUACAO, :TIPPAG, :VALORMULTA, :VALORREC, :VALORRECTOT, :VA' +
        'LORSALDO)')
    DeleteSQL.Strings = (
      'delete from TBCONTREC'
      'where'
      '  ANOLANC = :OLD_ANOLANC and'
      '  NUMLANC = :OLD_NUMLANC')
    Left = 800
  end
  inherited ImgList: TImageList
    Left = 736
  end
  object tblEmpresa: TIBTable
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    TableName = 'TBEMPRESA'
    Left = 864
    Top = 8
  end
  object dtsEmpresa: TDataSource
    DataSet = tblEmpresa
    Left = 896
    Top = 8
  end
  object tblFormaPagto: TIBTable
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    TableName = 'TBFORMPAGTO'
    Left = 864
    Top = 40
  end
  object dtsFormaPagto: TDataSource
    DataSet = tblFormaPagto
    Left = 896
    Top = 40
  end
  object tblCondicaoPagto: TIBTable
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    TableName = 'VW_CONDICAOPAGTO'
    TableTypes = [ttView]
    Left = 864
    Top = 72
  end
  object dtsCondicaoPagto: TDataSource
    DataSet = tblCondicaoPagto
    Left = 896
    Top = 72
  end
  object cdsPagamentos: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
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
      'from TBCONTREC_BAIXA p'
      '  left join TBFORMPAGTO f on (f.Cod = p.Forma_pagto)'
      '  left join TBBANCO_BOLETO b on (b.Bco_cod = p.Banco)')
    ModifySQL.Strings = (
      '')
    Left = 768
    Top = 40
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
    Left = 832
    Top = 40
  end
  object tblBanco: TIBTable
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    TableName = 'TBBANCO_BOLETO'
    TableTypes = [ttView]
    Left = 864
    Top = 104
  end
  object dtsBanco: TDataSource
    DataSet = tblBanco
    Left = 896
    Top = 104
  end
end
