inherited ViewContrato: TViewContrato
  ActiveControl = dbCodigo
  Caption = 'Gest'#227'o de Contratos'
  ClientHeight = 526
  ClientWidth = 805
  ExplicitWidth = 817
  ExplicitHeight = 564
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 522
    Width = 805
    ExplicitTop = 487
    ExplicitWidth = 805
  end
  inherited Bevel3: TBevel
    Top = 483
    Width = 805
    ExplicitTop = 448
    ExplicitWidth = 805
  end
  inherited pgcGuias: TPageControl
    Width = 805
    Height = 483
    ActivePage = tbsCadastro
    OnChange = pgcGuiasChange
    ExplicitWidth = 801
    ExplicitHeight = 482
    inherited tbsTabela: TTabSheet
      ExplicitWidth = 797
      ExplicitHeight = 454
      inherited Bevel4: TBevel
        Top = 380
        Width = 797
        ExplicitTop = 345
        ExplicitWidth = 797
      end
      inherited dbgDados: TDBGrid
        Width = 797
        Height = 380
        Columns = <
          item
            Expanded = False
            FieldName = 'controle'
            Title.Caption = 'Controle'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Title.Caption = 'Fornecedor / Cliente'
            Width = 242
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cnpj'
            Title.Caption = 'CPF / CNPJ'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'itens'
            Title.Caption = 'Itens'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'quantidades'
            Title.Caption = 'Qtde.'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valor_total'
            Title.Caption = 'Valor (R$)'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'saldo_total'
            Title.Caption = 'Saldo (R$)'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'numero'
            Title.Caption = 'N'#250'mero'
            Width = 100
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        Top = 384
        Width = 797
        ExplicitTop = 384
        ExplicitWidth = 797
        inherited grpBxFiltro: TGroupBox
          Left = 182
          Width = 611
          ExplicitLeft = 182
          ExplicitWidth = 611
          inherited lbltFiltrar: TLabel
            AlignWithMargins = True
            Left = 291
            Top = 25
            Width = 80
            Height = 21
            Margins.Left = 10
            Margins.Top = 10
            Margins.Bottom = 14
            Align = alLeft
            Caption = 'Raz'#227'o / CNPJ: '
            Layout = tlCenter
            ExplicitLeft = 291
            ExplicitTop = 25
            ExplicitWidth = 80
          end
          object lblData: TLabel [1]
            AlignWithMargins = True
            Left = 12
            Top = 24
            Width = 49
            Height = 23
            Margins.Left = 10
            Margins.Top = 9
            Margins.Bottom = 13
            Align = alLeft
            Caption = 'Emiss'#227'o:'
            FocusControl = e1Data
            Layout = tlCenter
            ExplicitHeight = 13
          end
          inherited edtFiltrar: TEdit
            Left = 377
            Width = 190
            Align = alClient
            TabOrder = 2
            ExplicitLeft = 377
            ExplicitWidth = 190
          end
          inherited btnFiltrar: TcxButton
            Left = 573
            TabOrder = 3
            ExplicitLeft = 573
          end
          object e1Data: TJvDateEdit
            AlignWithMargins = True
            Left = 67
            Top = 24
            Width = 102
            Height = 23
            Margins.Top = 9
            Margins.Bottom = 13
            Date = 40909.000000000000000000
            Align = alLeft
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
            ExplicitHeight = 21
          end
          object e2Data: TJvDateEdit
            AlignWithMargins = True
            Left = 175
            Top = 24
            Width = 103
            Height = 23
            Margins.Top = 9
            Margins.Bottom = 13
            Date = 40909.000000000000000000
            Align = alLeft
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
            ExplicitHeight = 21
          end
        end
        object pnlStatus: TPanel
          AlignWithMargins = True
          Left = 7
          Top = 6
          Width = 172
          Height = 58
          Margins.Top = 2
          Margins.Bottom = 2
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 1
          object pnlSatusColor: TPanel
            Left = 0
            Top = 0
            Width = 24
            Height = 58
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 0
            object shpOperacaoCancelada: TShape
              AlignWithMargins = True
              Left = 3
              Top = 41
              Width = 18
              Height = 18
              Margins.Top = 1
              Margins.Bottom = 1
              Align = alTop
              Brush.Color = 7303023
              Pen.Style = psClear
              ExplicitTop = 24
              ExplicitWidth = 19
            end
            object shpOperacaoAberta: TShape
              AlignWithMargins = True
              Left = 3
              Top = 1
              Width = 18
              Height = 18
              Margins.Top = 1
              Margins.Bottom = 1
              Align = alTop
              Brush.Color = clBlue
              Pen.Style = psClear
              ExplicitTop = 2
              ExplicitWidth = 19
            end
            object shpOperacaoFinalizada: TShape
              AlignWithMargins = True
              Left = 3
              Top = 21
              Width = 18
              Height = 18
              Margins.Top = 1
              Margins.Bottom = 1
              Align = alTop
              Brush.Color = clRed
              Pen.Style = psClear
              ExplicitLeft = 6
              ExplicitTop = 29
            end
          end
          object pnlStatusText: TPanel
            Left = 24
            Top = 0
            Width = 148
            Height = 58
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object lblOperacaoAberta: TLabel
              AlignWithMargins = True
              Left = 3
              Top = 1
              Width = 142
              Height = 18
              Margins.Top = 1
              Margins.Bottom = 1
              Align = alTop
              AutoSize = False
              Caption = 'Contratos em Edi'#231#227'o'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Layout = tlCenter
              StyleElements = []
              ExplicitTop = 2
              ExplicitWidth = 251
            end
            object lblOperacaoCancelada: TLabel
              AlignWithMargins = True
              Left = 3
              Top = 41
              Width = 142
              Height = 18
              Margins.Top = 1
              Margins.Bottom = 1
              Align = alTop
              AutoSize = False
              Caption = 'Contratos Cancelados'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Layout = tlCenter
              StyleElements = []
              ExplicitTop = 24
              ExplicitWidth = 251
            end
            object lblOperacaoFinalizada: TLabel
              AlignWithMargins = True
              Left = 3
              Top = 21
              Width = 142
              Height = 18
              Margins.Top = 1
              Margins.Bottom = 1
              Align = alTop
              AutoSize = False
              Caption = 'Contratos Encerrados'
              Color = clRed
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              Transparent = True
              Layout = tlCenter
              StyleElements = []
              ExplicitLeft = 6
              ExplicitTop = 29
            end
          end
        end
      end
    end
    inherited tbsCadastro: TTabSheet
      ExplicitWidth = 797
      ExplicitHeight = 454
      inherited Bevel8: TBevel
        Width = 797
        ExplicitWidth = 797
      end
      inherited GrpBxDadosNominais: TGroupBox
        Width = 797
        ExplicitWidth = 793
        inherited lblCodigo: TLabel
          Width = 51
          Caption = 'Controle:'
          ExplicitWidth = 51
        end
        object lblDataCadastro: TLabel [1]
          Left = 87
          Top = 24
          Width = 101
          Height = 13
          Caption = 'Data de Cadastro:'
          FocusControl = dbDataCadastro
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblEmpresa: TLabel [2]
          Left = 193
          Top = 24
          Width = 45
          Height = 13
          Caption = 'Empresa:'
          FocusControl = dbEmpresa
        end
        object lblTipoDestino: TLabel [3]
          Left = 481
          Top = 24
          Width = 85
          Height = 13
          Anchors = [akLeft, akBottom]
          Caption = 'Tipo do Contrato:'
          FocusControl = dbTipoDestino
        end
        object lblSituacao: TLabel [4]
          Left = 659
          Top = 24
          Width = 52
          Height = 13
          Caption = 'Situa'#231#227'o:'
          FocusControl = dbSituacao
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblNome: TLabel [5]
          Left = 16
          Top = 64
          Width = 102
          Height = 13
          Caption = 'Cliente / Fornecedor:'
          FocusControl = dbNome
        end
        object lblNumero: TLabel [6]
          Left = 440
          Top = 64
          Width = 47
          Height = 13
          Caption = 'N'#250'mero:'
          FocusControl = dbNumero
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblDataEmissao: TLabel [7]
          Left = 567
          Top = 64
          Width = 68
          Height = 13
          Caption = 'Data Emiss'#227'o:'
          FocusControl = dbDataEmissao
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblDataValidade: TLabel [8]
          Left = 678
          Top = 64
          Width = 70
          Height = 13
          Caption = 'Data Validade:'
          FocusControl = dbDataValidade
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        inherited dbCodigo: TDBEdit
          Color = clMoneyGreen
          DataField = 'controle'
        end
        object dbDataCadastro: TDBEdit
          Left = 87
          Top = 40
          Width = 101
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'data_cadastro'
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
          Left = 194
          Top = 40
          Width = 281
          Height = 21
          DataField = 'empresa'
          DataSource = DtSrcTabela
          DropDownRows = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'CNPJ'
          ListField = 'RAZAO'
          ListSource = dtsEmpresa
          ParentFont = False
          TabOrder = 2
        end
        object dbTipoDestino: TDBLookupComboBox
          Left = 481
          Top = 40
          Width = 172
          Height = 21
          Anchors = [akLeft, akBottom]
          DataField = 'destino'
          DataSource = DtSrcTabela
          DropDownRows = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'TPE_CODIGO'
          ListField = 'TPE_DESCRICAO'
          ListSource = dtsTipoDestino
          ParentFont = False
          TabOrder = 3
        end
        object dbSituacao: TDBEdit
          Left = 659
          Top = 40
          Width = 124
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'situacao'
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
        object dbNome: TJvDBComboEdit
          Left = 16
          Top = 80
          Width = 418
          Height = 21
          ButtonHint = 'Pesquisar Cliente/Fornecedor (Ctrl+P)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clMoneyGreen
          DataField = 'nome'
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
          TabOrder = 5
          OnButtonClick = dbNomeButtonClick
        end
        object dbNumero: TDBEdit
          Left = 440
          Top = 80
          Width = 121
          Height = 21
          Color = clWhite
          DataField = 'numero'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
        end
        object dbDataEmissao: TJvDBDateEdit
          Left = 567
          Top = 80
          Width = 105
          Height = 21
          DataField = 'data_emissao'
          DataSource = DtSrcTabela
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
          TabOrder = 7
        end
        object dbDataValidade: TJvDBDateEdit
          Left = 678
          Top = 80
          Width = 105
          Height = 21
          DataField = 'data_validade'
          DataSource = DtSrcTabela
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
          TabOrder = 8
        end
      end
      object pgcDetalhes: TPageControl
        Left = 0
        Top = 125
        Width = 797
        Height = 329
        Cursor = crHandPoint
        ActivePage = tbsProdutos
        Align = alClient
        TabOrder = 1
        ExplicitWidth = 793
        ExplicitHeight = 328
        object tbsProdutos: TTabSheet
          Caption = 'Produtos'
          object GrpBxDadosProduto: TGroupBox
            AlignWithMargins = True
            Left = 10
            Top = 3
            Width = 769
            Height = 120
            Margins.Left = 10
            Margins.Right = 10
            Align = alTop
            Caption = 'Dados do produto'
            TabOrder = 0
            ExplicitWidth = 765
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
              Width = 60
              Height = 13
              Caption = 'Quantidade:'
              FocusControl = dbQuantidade
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblValorUnit: TLabel
              Left = 184
              Top = 64
              Width = 92
              Height = 13
              Caption = 'Valor Unit'#225'rio (R$):'
              FocusControl = dbValorUnit
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblUnidade: TLabel
              Left = 592
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
            object lblValorTotal: TLabel
              Left = 303
              Top = 64
              Width = 81
              Height = 13
              Caption = 'Total Bruto (R$):'
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
              Width = 402
              Height = 21
              TabStop = False
              Color = clMoneyGreen
              DataField = 'descri_apresentacao'
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
              Left = 89
              Top = 80
              Width = 89
              Height = 21
              Color = clWhite
              DataField = 'quantidade'
              DataSource = DtSrcTabelaItens
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
              OnExit = ControlEditExit
            end
            object dbValorUnit: TDBEdit
              Left = 184
              Top = 80
              Width = 113
              Height = 21
              Color = clWhite
              DataField = 'valor'
              DataSource = DtSrcTabelaItens
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 5
              OnExit = ControlEditExit
            end
            object dbUnidade: TDBEdit
              Left = 592
              Top = 40
              Width = 80
              Height = 21
              TabStop = False
              Color = clMoneyGreen
              DataField = 'unid'
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
            object dbValorTotal: TDBEdit
              Left = 303
              Top = 80
              Width = 113
              Height = 21
              Color = clMoneyGreen
              DataField = 'total'
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
            object pnlBotoesProduto: TPanel
              AlignWithMargins = True
              Left = 6
              Top = 15
              Width = 70
              Height = 103
              Margins.Left = 4
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
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
              object btnProdutoInserir: TBitBtn
                Left = 0
                Top = 0
                Width = 70
                Height = 25
                Hint = 'Inserir Produto'
                Align = alTop
                Caption = 'Inserir'
                Enabled = False
                Glyph.Data = {
                  36060000424D3606000000000000360000002800000020000000100000000100
                  18000000000000060000000000000000000000000000000000000000FF0000FF
                  0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                  FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
                  00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
                  B0A0906048306048306048306048306048306048306048306048306048306048
                  300000FF0000FF0000FF0000FF0000FF9C9C9C43434343434343434343434343
                  43434343434343434343434343434343430000FF0000FF0000FF0000FF0000FF
                  B0A090FFFFFFB0A090B0A090B0A090B0A090B0A090B0A090B0A090B0A0906048
                  300000FF0000FF0000FF0000FF0000FF9C9C9CFFFFFF9C9C9C9C9C9C9C9C9C9C
                  9C9C9C9C9C9C9C9C9C9C9C9C9C9C4343430000FF0000FF0000FF0000FF0000FF
                  B0A090FFFFFFFFFFFFFFF8FFF0F0F0F0E8E0F0E0D0E0D0D0E0C8C0B0A0906048
                  300000FF0000FF0000FF0000FF0000FF9C9C9CFFFFFFFFFFFFFAFAFAF0F0F0E6
                  E6E6DCDCDCD1D1D1C8C8C89C9C9C4343430000FF0000FF0000FF0000FF0000FF
                  B0A090FFFFFFFFFFFFFFFFFFFFF8F0F0F0F0F0E0E0F0D8D0E0D0C0B0A0906048
                  300000FF0000FF0000FF0000FF0000FF9C9C9CFFFFFFFFFFFFFFFFFFF6F6F6F0
                  F0F0E1E1E1D8D8D8CCCCCC9C9C9C4343430000FF0000FF0000FF0000FF0000FF
                  B0A090FFFFFFFFFFFFFFFFFFFFFFFFFFF0F0F0E8E0F0E0E0E0D8D0B0A0906048
                  300000FF0000FF0000FF0000FF0000FF9C9C9CFFFFFFFFFFFFFFFFFFFFFFFFF1
                  F1F1E6E6E6E1E1E1D6D6D69C9C9C4343430000FF0000FF0000FF0000FF0000FF
                  C0A890FFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0F0E8E0F0D8D0B0A0906048
                  300000FF0000FF0000FF0000FF0000FFA3A3A3FFFFFFFFFFFFFFFFFFFFFFFFF6
                  F6F6F0F0F0E6E6E6D8D8D89C9C9C4343430000FF0000FF0000FF0000FF0000FF
                  C0A8A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0E8E0F0E0E0B0A0906048
                  300000FF0000FF0000FF0000FF0000FFA8A8A8FFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFF6F6F6E6E6E6E1E1E19C9C9C4343430000FF0000FF0000FF0000FF0000FF
                  C0B0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FFF0F0F0F0E8E0B0A0906048
                  300000FF0000FF0000FF0000FF0000FFACACACFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFAFAFAF0F0F0E6E6E69C9C9C4343430000FF0000FF0000FF0000FF0000FF
                  D0B0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0B0A0906048
                  300000FF0000FF0000FF0000FF0000FFAEAEAEFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFF6F6F6F0F0F09C9C9C4343430000FF0000FF0000FF0000FF0000FF
                  D0B8A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0A090B0A0906048
                  300000FF0000FF0000FF0000FF0000FFB3B3B3FFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFF9C9C9C9C9C9C4343430000FF0000FF0000FF0000FF0000FF
                  D0B8B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0A0906048306048306048
                  300000FF0000FF0000FF0000FF0000FFB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFF9C9C9C4343434343434343430000FF0000FF0000FF0000FF0000FF
                  D0C0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A890D0C8C0604830DACA
                  C10000FF0000FF0000FF0000FF0000FFBCBCBCFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFA3A3A3C6C6C6434343C8C8C80000FF0000FF0000FF0000FF0000FF
                  E0C0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A8A0604830DBCAC20000
                  FF0000FF0000FF0000FF0000FF0000FFBEBEBEFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFA8A8A8434343C9C9C90000FF0000FF0000FF0000FF0000FF0000FF
                  E0C0B0E0C0B0E0C0B0E0C0B0E0C0B0D0C0B0D0B8B0D0B0A0DCCAC20000FF0000
                  FF0000FF0000FF0000FF0000FF0000FFBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBC
                  BCBCB8B8B8AEAEAEC9C9C90000FF0000FF0000FF0000FF0000FF0000FF0000FF
                  0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                  FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
                  00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF}
                NumGlyphs = 2
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                OnClick = btnProdutoInserirClick
              end
              object btnProdutoEditar: TBitBtn
                Left = 0
                Top = 25
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
                TabOrder = 1
                OnClick = btnProdutoEditarClick
              end
              object btnProdutoExcluir: TBitBtn
                Left = 0
                Top = 50
                Width = 70
                Height = 25
                Hint = 'Excluir Produto'
                Align = alTop
                Caption = 'Excluir'
                Enabled = False
                Glyph.Data = {
                  36060000424D3606000000000000360000002800000020000000100000000100
                  1800000000000006000000000000000000000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCFC1C52030902030902030802028
                  70C6A797FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFC3C3C34B4B4B4B4B4B4646463C3C3CA5A5A5FF00FFFF00FFFF00FFFF00FF
                  B0A0906048306048306048307058406050601038C02050D01038C01030B01030
                  A0102070C5A392FF00FFFF00FFFF00FF9C9C9C43434343434343434353535356
                  56565C5C5C7171715C5C5C5353534E4E4E363636A1A1A1FF00FFFF00FFFF00FF
                  B0A090FFFFFFD0C8C0D0C8C0D0C8C01040E04068E03058E00038E00038D01030
                  C01030A0202870FF00FFFF00FFFF00FF9C9C9CFFFFFFC6C6C6C6C6C6C6C6C66B
                  6B6B8888887C7C7C6464646060605858584E4E4E3C3C3CFF00FFFF00FFFF00FF
                  B0A090FFFFFFFFFFFFFFF8FFFFF0F03068F0F0F8FFFFF8FFFFF8FFFFF8FFFFF8
                  FFFFF8FF203090FF00FFFF00FFFF00FF9C9C9CFFFFFFFFFFFFFAFAFAF1F1F18B
                  8B8BF9F9F9FAFAFAFAFAFAFAFAFAFAFAFAFAFAFA4B4B4BFF00FFFF00FFFF00FF
                  B0A090FFFFFFFFFFFFFFFFFFFFF8F03068F0FFF8FFFFF8FFFFF8FFFFF8FFFFF8
                  FFFFF8FF203090FF00FFFF00FFFF00FF9C9C9CFFFFFFFFFFFFFFFFFFF6F6F68B
                  8B8BFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA4B4B4BFF00FFFF00FFFF00FF
                  B0A090FFFFFFFFFFFFFFFFFFFFFFFF3060FF80A0F06080F04060E02058E00038
                  D01038C02038A0FF00FFFF00FFFF00FF9C9C9CFFFFFFFFFFFFFFFFFFFFFFFF8A
                  8A8AB4B4B49E9E9E8383837B7B7B6060605C5C5C545454FF00FFFF00FFFF00FF
                  C0A890FFFFFFFFFFFFFFFFFFFFFFFFD0D8F03068F090A8F06080F05078E02048
                  D02038B0C8ACAAFF00FFFF00FFFF00FFA3A3A3FFFFFFFFFFFFFFFFFFFFFFFFDE
                  DEDE8B8B8BBBBBBB9E9E9E9393936C6C6C595959AEAEAEFF00FFFF00FFFF00FF
                  C0A8A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD0D8F03060F03060F03060E02048
                  C0C9B0AFFF00FFFF00FFFF00FFFF00FFA8A8A8FFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFDEDEDE868686868686818181686868B2B2B2FF00FFFF00FFFF00FFFF00FF
                  C0B0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FFF0F0F0F0F0F0D0C8C08068
                  50FF00FFFF00FFFF00FFFF00FFFF00FFACACACFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFAFAFAF0F0F0F0F0F0C6C6C6636363FF00FFFF00FFFF00FFFF00FFFF00FF
                  D0B0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0D0C8C06048
                  30FF00FFFF00FFFF00FFFF00FFFF00FFAEAEAEFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFF6F6F6F0F0F0C6C6C6434343FF00FFFF00FFFF00FFFF00FFFF00FF
                  D0B8A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A8A0C0A8A06048
                  30FF00FFFF00FFFF00FFFF00FFFF00FFB3B3B3FFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFA8A8A8A8A8A8434343FF00FFFF00FFFF00FFFF00FFFF00FF
                  D0B8B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0A0906048306048306048
                  30FF00FFFF00FFFF00FFFF00FFFF00FFB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFF9C9C9C434343434343434343FF00FFFF00FFFF00FFFF00FFFF00FF
                  D0C0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A890D0C8C0604830DFBD
                  A7FF00FFFF00FFFF00FFFF00FFFF00FFBCBCBCFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFA3A3A3C6C6C6434343B9B9B9FF00FFFF00FFFF00FFFF00FFFF00FF
                  E0C0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A8A0604830E0BEAAFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFBEBEBEFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFA8A8A8434343BBBBBBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  E0C0B0E0C0B0E0C0B0E0C0B0E0C0B0D0C0B0D0B8B0D0B0A0E0C0ADFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBC
                  BCBCB8B8B8AEAEAEBDBDBDFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                NumGlyphs = 2
                ParentShowHint = False
                ShowHint = True
                TabOrder = 2
                OnClick = btnProdutoExcluirClick
              end
              object btnProdutoSalvar: TBitBtn
                Left = 0
                Top = 75
                Width = 70
                Height = 25
                Hint = 'Salvar Produto'
                Align = alTop
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
                TabOrder = 3
                OnClick = btnProdutoSalvarClick
              end
            end
            object dbProduto: TJvDBComboEdit
              Left = 88
              Top = 40
              Width = 89
              Height = 21
              ButtonHint = 'Pesquisar Produto (Ctrl+P)'
              CharCase = ecUpperCase
              ClickKey = 16464
              Color = clWhite
              DataField = 'produto'
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
              ShowHint = True
              TabOrder = 1
              OnButtonClick = dbProdutoButtonClick
              OnExit = ControlEditExit
            end
          end
          object dbgProdutos: TDBGrid
            AlignWithMargins = True
            Left = 10
            Top = 129
            Width = 769
            Height = 162
            Margins.Left = 10
            Margins.Right = 10
            Margins.Bottom = 10
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
            TabOrder = 1
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = [fsBold]
            OnDrawColumnCell = dbgDadosDrawColumnCell
            Columns = <
              item
                Expanded = False
                FieldName = 'item'
                Title.Alignment = taCenter
                Title.Caption = '# '
                Width = 30
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'produto'
                Title.Caption = 'C'#243'digo'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'descri_apresentacao'
                Title.Caption = 'Descri'#231#227'o'
                Width = 250
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'quantidade'
                Title.Caption = 'Qtde. '
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'unid'
                Title.Caption = 'Und. '
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'valor'
                Title.Caption = 'Valor Un. (R$) '
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'total'
                Title.Caption = 'Total (R$) '
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'saldo_total'
                Title.Caption = 'Saldo (R$)'
                Width = 100
                Visible = True
              end>
          end
        end
        object tbsObservacoes: TTabSheet
          Caption = 'Observa'#231#245'es'
          ImageIndex = 2
          object dbObservacao: TDBMemo
            AlignWithMargins = True
            Left = 10
            Top = 3
            Width = 769
            Height = 142
            Margins.Left = 10
            Margins.Right = 10
            Align = alTop
            Anchors = [akLeft, akTop, akRight, akBottom]
            BevelEdges = []
            BevelInner = bvNone
            BevelOuter = bvNone
            BorderStyle = bsNone
            DataField = 'observacoes'
            DataSource = DtSrcTabela
            TabOrder = 0
          end
        end
        object tbsNotas: TTabSheet
          Caption = 'Notas Emitidas'
          ImageIndex = 1
          object DBGrid1: TDBGrid
            AlignWithMargins = True
            Left = 10
            Top = 3
            Width = 769
            Height = 288
            Margins.Left = 10
            Margins.Right = 10
            Margins.Bottom = 10
            TabStop = False
            Align = alClient
            DataSource = DtSrcTabelaNotas
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = [fsBold]
            OnDrawColumnCell = dbgDadosDrawColumnCell
            Columns = <
              item
                Expanded = False
                FieldName = 'venda'
                Title.Caption = 'Venda'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'dtvenda'
                Title.Caption = 'D. Venda'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'nota'
                Title.Caption = 'Nota'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'dtemissao'
                Title.Caption = 'Emiss'#227'o'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'nr_itens'
                Title.Alignment = taRightJustify
                Title.Caption = 'Itens'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'qt_itens'
                Title.Alignment = taRightJustify
                Title.Caption = 'Qtde.'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'vl_total_bruto'
                Title.Alignment = taRightJustify
                Title.Caption = 'T. Bruto (R$)'
                Width = 85
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'vl_descontos'
                Title.Alignment = taRightJustify
                Title.Caption = 'Desc. (R$)'
                Width = 85
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'vl_total_liquido'
                Title.Alignment = taRightJustify
                Title.Caption = 'T. Venda (R$)'
                Width = 85
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'vl_total_nota'
                Title.Alignment = taRightJustify
                Title.Caption = 'V. Nota (R$)'
                Width = 85
                Visible = True
              end>
          end
        end
      end
    end
  end
  inherited tlbBotoes: TPanel
    Top = 487
    Width = 805
    ExplicitTop = 486
    ExplicitWidth = 801
    inherited bvlTool3: TBevel
      Left = 722
      ExplicitLeft = 722
    end
    inherited bvlTool4: TBevel
      Left = 801
      ExplicitLeft = 801
    end
    inherited btbtnLista: TcxButton
      Visible = True
    end
    inherited btbtnFechar: TcxButton
      Left = 726
      ExplicitLeft = 722
    end
    inherited btbtnSelecionar: TcxButton
      Left = 602
      ExplicitLeft = 598
    end
    object btnSituacao: TcxButton
      Tag = 11
      Left = 492
      Top = 0
      Width = 110
      Height = 35
      Hint = 'Alterar Situa'#231#227'o do Contrato'
      Align = alRight
      Caption = 'Situa'#231#227'o'
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        424D360800000000000036000000280000002000000010000000010020000000
        000000000000C40E0000C40E00000000000000000000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A090FF604830FF6048
        30FF604830FF604830FF604830FF604830FF604830FF604830FF604830FF6048
        30FF604830FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F9EADFF334357FF3343
        57FF334357FF334357FF334357FF334357FF334357FF334357FF334357FF3343
        57FF334357FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A890FFFFF8F0FFFFF0
        E0FFF0E8E0FFF0E0D0FFF0D0C0FFF0C8B0FFE0C0A0FFE0B8A0FFE0B090FFE0A8
        90FF604830FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF95A3B2FFF4F6F7FFE8EC
        EFFFE1E6EAFFD6DDE3FFC5CED6FFBBC5CFFFAEBAC6FFA9B5C1FF9DABB9FF99A7
        B5FF334357FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A8A0FFFFFFF0FFC0A8
        A0FFB0A0A0FFF0E8E0FFB0A090FFB09890FFB09890FFB09890FFB09890FFE0B0
        90FF604830FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9AA8B6FFF9FAFAFF9AA8
        B6FF92A1B0FFE1E6EAFF8E9DACFF8998A8FF8998A8FF8998A8FF8998A8FF9DAB
        B9FF334357FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A8A0FFFFFFF0FFFFFF
        F0FFFFF8F0FFFFF0E0FFF0E8E0FFF0E0D0FFF0D0C0FFF0C8B0FFE0C0A0FFE0B8
        A0FF604830FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9AA8B6FFF9FAFAFFF9FA
        FAFFF4F6F7FFE8ECEFFFE1E6EAFFD6DDE3FFC5CED6FFBBC5CFFFAEBAC6FFA9B5
        C1FF334357FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A8A0FFFFFFF0FFB0A8
        A0FFB0A0A0FFFFF8F0FFB0A090FFB09890FFB09890FFB09890FFB09890FFE0C0
        A0FF604830FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9AA8B6FFF9FAFAFF98A6
        B4FF92A1B0FFF4F6F7FF8E9DACFF8998A8FF8998A8FF8998A8FF8998A8FFAEBA
        C6FF334357FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0B0A0FFFFFFF0FFFFFF
        F0FFFFFFF0FFFFFFF0FFFFF8F0FFFFF0E0FFF0E8E0FFF0E0D0FFF0D0C0FFF0C8
        B0FF604830FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA0ADBAFFF9FAFAFFF9FA
        FAFFF9FAFAFFF9FAFAFFF4F6F7FFE8ECEFFFE1E6EAFFD6DDE3FFC5CED6FFBBC5
        CFFF334357FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0B0A0FFFFFFF0FFFFFF
        F0FFFFFFF0FFFFFFF0FFFFFFF0FFFFF8F0FFC0C8C0FF406070FFF0E0D0FFF0D0
        C0FF604830FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA0ADBAFFF9FAFAFFF9FA
        FAFFF9FAFAFFF9FAFAFFF9FAFAFFF4F6F7FFB9C4CEFF4F6175FFD6DDE3FFC5CE
        D6FF334357FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0B0A0FFFFFFFFFFE0E8
        F0FF607880FFE0E0E0FFFFFFF0FFC0C8D0FF506070FF30A8D0FF203840FFB0A0
        A0FF604830FFFFFFFFFFFFFFFFFFA0B39AFF408050FFA0ADBAFFFFFFFFFFE4E9
        EDFF66778AFFDAE0E5FFF9FAFAFFBFC9D2FF506276FF98A6B4FF28374AFF92A1
        B0FF334357FFFFFFFFFFFFFFFFFF9BA9B7FF586A7EFFD0B0A0FFFFFFFFFF90A8
        B0FF80D0E0FF506070FFB0B8C0FF506070FF60C0E0FF506070FF30B8F0FF1028
        30FF103040FF102830FF70747DFF407840FF50A860FFA1AEBBFFFFFFFFFF99A7
        B5FFC1CBD4FF506276FFADB9C5FF506276FFB3BEC9FF506276FFADB9C5FF1A27
        38FF233144FF1A2738FF657689FF4E6074FF77889AFFD0B8A0FFFFFFFFFFE0E8
        F0FF90A8B0FF80E0F0FF506070FF80D0E0FF506070FF60D0F0FF406070FF30B0
        E0FF2098D0FF2088B0FF205070FF508860FF50B060FFA6B3C0FFFFFFFFFFE4E9
        EDFF99A7B5FFD2D9E0FF506276FFC1CBD4FF506276FFC3CCD5FF4F6175FFA2AF
        BCFF8C9BABFF77889AFF435468FF647588FF7D8D9EFFD0B8A0FFD0B8A0FFD0B8
        A0FFC0B0A0FF90A8B0FF80E0F0FF506070FF80E0F0FF405870FF60D0F0FF50C8
        F0FF40C0F0FF20B0E0FF20A0D0FF609870FF50B870FFA6B3C0FFA6B3C0FFA6B3
        C0FFA0ADBAFF99A7B5FFD2D9E0FF506276FFD2D9E0FF4B5C70FFC3CCD5FFBCC6
        D0FFB4BFCAFFA0ADBAFF909FAEFF748597FF8696A6FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF90A8B0FF80E0F0FF405870FF80E0F0FF70D8F0FF60D0
        F0FF50C8F0FF40C0F0FF30B8F0FF70A880FF60C080FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF99A7B5FFD2D9E0FF4B5C70FFD2D9E0FFCBD3DBFFC3CC
        D5FFBCC6D0FFB4BFCAFFADB9C5FF8595A5FF92A1B0FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF90A8B0FF80E0F0FF80E0F0FF80E0F0FF70D8
        F0FF60D0F0FF60B0D0FF808890FFB0C0A0FF90D0A0FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF99A7B5FFD2D9E0FFD2D9E0FFD2D9E0FFCBD3
        DBFFC3CCD5FFA3B0BDFF78899BFFA7B4C0FFAEBAC6FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF90A8B0FF90A0B0FF90A0A0FF8098
        A0FF8090A0FF808890FFB9B9BDFFA0B8A0FFB0C0A0FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99A7B5FF93A2B1FF8F9EADFF8797
        A7FF8292A3FF78899BFFAEBAC6FFA1AEBBFFA7B4C0FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      OptionsImage.NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnClick = btnSituacaoClick
      ExplicitLeft = 488
    end
  end
  inherited DtSrcTabela: TDataSource
    Left = 256
    Top = 0
  end
  inherited ImgList: TImageList
    Left = 224
    Top = 0
  end
  object dtsEmpresa: TDataSource
    Left = 712
    Top = 8
  end
  object dtsTipoDestino: TDataSource
    Left = 744
    Top = 8
  end
  object DtSrcTabelaItens: TDataSource
    AutoEdit = False
    OnStateChange = DtSrcTabelaItensStateChange
    Left = 288
  end
  object ppImprimir: TPopupMenu
    Images = ImgList
    Left = 384
    Top = 400
    object nmListaContratos: TMenuItem
      Caption = 'Lista de Contratos'
      ImageIndex = 16
      OnClick = nmListaContratosClick
    end
    object nmEspelhoContrato: TMenuItem
      Caption = 'Espelho do Contrato'
      ImageIndex = 17
      OnClick = nmEspelhoContratoClick
    end
  end
  object DtSrcTabelaNotas: TDataSource
    Left = 320
  end
  object ppSituacao: TPopupMenu
    Images = ImgList
    Left = 488
    Top = 400
    object ppmDisponibilizar: TMenuItem
      Caption = 'Disponibilizar'
      ImageIndex = 14
      OnClick = ppmDisponibilizarClick
    end
    object ppmReabrirContrato: TMenuItem
      Caption = 'Reabrir Contrato'
      ImageIndex = 10
      OnClick = ppmReabrirContratoClick
    end
    object ppmCancelar: TMenuItem
      Caption = 'Cancelar'
      ImageIndex = 4
      OnClick = ppmCancelarClick
    end
  end
end
