inherited frmGeApropriacaoEstoque: TfrmGeApropriacaoEstoque
  Left = 446
  Top = 196
  ActiveControl = dbgDados
  Caption = 'Controle de Apropria'#231#245'es de Estoque'
  ClientHeight = 685
  ClientWidth = 1116
  ExplicitWidth = 1132
  ExplicitHeight = 724
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 681
    Width = 1116
    ExplicitTop = 682
    ExplicitWidth = 1116
  end
  inherited Bevel3: TBevel
    Top = 642
    Width = 1116
    ExplicitTop = 643
    ExplicitWidth = 1116
  end
  inherited pgcGuias: TPageControl
    Width = 1116
    Height = 642
    ActivePage = tbsTabela
    OnChange = pgcGuiasChange
    ExplicitWidth = 1116
    ExplicitHeight = 642
    inherited tbsTabela: TTabSheet
      ExplicitWidth = 1108
      ExplicitHeight = 613
      inherited Bevel4: TBevel
        Top = 539
        Width = 1108
        ExplicitTop = 540
        ExplicitWidth = 1108
      end
      inherited dbgDados: TDBGrid
        Width = 1108
        Height = 539
        Columns = <
          item
            Expanded = False
            FieldName = 'NUMERO'
            Title.Caption = 'N'#250'mero '
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO'
            Title.Caption = 'Tipo '
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATA_APROPRIACAO'
            Title.Caption = 'Data '
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'STATUS'
            Title.Caption = 'Situa'#231#227'o '
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CC_DESCRICAO'
            Title.Caption = 'Centro de Custo '
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ITENS'
            Title.Caption = 'Itens '
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_TOTAL'
            Title.Caption = 'Valor Total (R$) '
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ENTRADA'
            Title.Caption = 'Entrada '
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'AUTORIZACAO'
            Title.Caption = 'Autoriza'#231#227'o '
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'USUARIO'
            Title.Caption = 'Respons'#225'vel '
            Width = 100
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        Top = 543
        Width = 1108
        Height = 70
        ExplicitTop = 543
        ExplicitWidth = 1108
        ExplicitHeight = 70
        inherited grpBxFiltro: TGroupBox
          Left = 424
          Width = 680
          Height = 62
          TabOrder = 2
          ExplicitLeft = 424
          ExplicitWidth = 680
          ExplicitHeight = 62
          DesignSize = (
            680
            62)
          inherited lbltFiltrar: TLabel
            Left = 294
            Width = 93
            Caption = 'Centro de Custo:'
            ExplicitLeft = 294
            ExplicitWidth = 93
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
            Left = 392
            Width = 239
            TabOrder = 2
            ExplicitLeft = 392
            ExplicitWidth = 239
          end
          inherited btnFiltrar: TcxButton
            Left = 635
            Height = 35
            TabOrder = 3
            ExplicitLeft = 635
            ExplicitHeight = 35
          end
          object e1Data: TJvDateEdit
            Left = 72
            Top = 23
            Width = 100
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
            Left = 184
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
        object RdgStatusApropriacao: TRadioGroup
          Left = 198
          Top = 4
          Width = 226
          Height = 62
          Align = alRight
          Caption = '&Status da Apropria'#231#227'o'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            '(Todas)'
            'Em Edi'#231#227'o'
            'Aberta'
            'Encerrada'
            'Cancelada')
          TabOrder = 1
        end
        object pnlStatus: TPanel
          AlignWithMargins = True
          Left = 7
          Top = 6
          Width = 188
          Height = 58
          Margins.Top = 2
          Margins.Bottom = 2
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          ExplicitLeft = 69
          ExplicitTop = 0
          ExplicitWidth = 193
          ExplicitHeight = 70
          object pnlSatusColor: TPanel
            Left = 0
            Top = 0
            Width = 24
            Height = 58
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 0
            ExplicitHeight = 56
            object shpOperacaoEditando: TShape
              AlignWithMargins = True
              Left = 3
              Top = 41
              Width = 18
              Height = 18
              Margins.Top = 1
              Margins.Bottom = 1
              Align = alTop
              Brush.Color = clYellow
              Pen.Style = psClear
              ExplicitTop = 46
              ExplicitWidth = 19
            end
            object shpOperacaoCancelada: TShape
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
          end
          object pnlStatusText: TPanel
            Left = 24
            Top = 0
            Width = 164
            Height = 58
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            ExplicitHeight = 56
            object lblOperacaoAberta: TLabel
              AlignWithMargins = True
              Left = 3
              Top = 1
              Width = 158
              Height = 18
              Margins.Top = 1
              Margins.Bottom = 1
              Align = alTop
              AutoSize = False
              Caption = '* Apropria'#231#245'es Abertas'
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
              Top = 21
              Width = 158
              Height = 18
              Margins.Top = 1
              Margins.Bottom = 1
              Align = alTop
              AutoSize = False
              Caption = '* Apropria'#231#245'es Canceladas'
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
            object lblOperacaoEditando: TLabel
              AlignWithMargins = True
              Left = 3
              Top = 41
              Width = 158
              Height = 18
              Margins.Top = 1
              Margins.Bottom = 1
              Align = alTop
              AutoSize = False
              Caption = '* Apropria'#231#245'es Em Edi'#231#227'o'
              Color = clYellow
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
              ExplicitLeft = 0
              ExplicitTop = 36
              ExplicitWidth = 256
            end
          end
        end
      end
    end
    inherited tbsCadastro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 1108
      ExplicitHeight = 613
      inherited Bevel8: TBevel
        Top = 349
        Width = 1108
        ExplicitTop = 349
        ExplicitWidth = 1108
      end
      object Bevel6: TBevel [1]
        Left = 0
        Top = 443
        Width = 1108
        Height = 4
        Align = alBottom
        Shape = bsSpacer
        ExplicitTop = 444
      end
      inherited GrpBxDadosNominais: TGroupBox
        Width = 1108
        Height = 233
        ExplicitWidth = 1108
        ExplicitHeight = 233
        inherited lblCodigo: TLabel
          Width = 71
          Caption = 'No. Controle:'
          ExplicitWidth = 71
        end
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
          Left = 240
          Top = 24
          Width = 45
          Height = 13
          Caption = 'Empresa:'
          FocusControl = dbEmpresa
        end
        object lblSituacao: TLabel [3]
          Left = 792
          Top = 64
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
        object lblDataApropriacao: TLabel [4]
          Left = 360
          Top = 64
          Width = 88
          Height = 13
          Caption = 'Data Apropria'#231#227'o:'
          FocusControl = dbDataApropriacao
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblUsuario: TLabel [5]
          Left = 920
          Top = 64
          Width = 46
          Height = 13
          Caption = 'Usu'#225'rio:'
          FocusControl = dbUsuario
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblNumero: TLabel [6]
          Left = 240
          Top = 64
          Width = 41
          Height = 13
          Caption = 'N'#250'mero:'
          FocusControl = dbNumero
        end
        object lblCentroCusto: TLabel [7]
          Left = 704
          Top = 24
          Width = 162
          Height = 13
          Caption = 'Departamento / Centro de Custo:'
          FocusControl = dbCentroCusto
        end
        object lblEntrada: TLabel [8]
          Left = 488
          Top = 64
          Width = 42
          Height = 13
          Caption = 'Entrada:'
          FocusControl = dbEntrada
        end
        object lblTipo: TLabel [9]
          Left = 16
          Top = 64
          Width = 24
          Height = 13
          Caption = 'Tipo:'
          FocusControl = dbTipo
        end
        object lblAutorizacao: TLabel [10]
          Left = 640
          Top = 64
          Width = 61
          Height = 13
          Caption = 'Autoriza'#231#227'o:'
          FocusControl = dbAutorizacao
        end
        inherited dbCodigo: TDBEdit
          Width = 89
          Color = clMoneyGreen
          DataField = 'CONTROLE'
          ExplicitWidth = 89
        end
        object dbDataHora: TDBEdit
          Left = 112
          Top = 40
          Width = 121
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'INSERCAO_DATA'
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
          Left = 240
          Top = 40
          Width = 457
          Height = 21
          DataField = 'EMPRESA'
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
        object dbSituacao: TDBEdit
          Left = 792
          Top = 80
          Width = 121
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'STATUS'
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
        object dbUsuario: TDBEdit
          Left = 920
          Top = 80
          Width = 169
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'USUARIO'
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
        object dbNumero: TDBEdit
          Left = 240
          Top = 80
          Width = 113
          Height = 21
          CharCase = ecUpperCase
          DataField = 'NUMERO'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
        object PgcTextoApropriacao: TPageControl
          Left = 16
          Top = 112
          Width = 1073
          Height = 114
          ActivePage = TbsApropriacaoMotivo
          Style = tsFlatButtons
          TabOrder = 11
          object TbsApropriacaoMotivo: TTabSheet
            Caption = 'Motivo da apropria'#231#227'o'
            object dbMotivo: TDBMemo
              Left = 0
              Top = 0
              Width = 1065
              Height = 83
              Align = alClient
              DataField = 'MOTIVO'
              DataSource = DtSrcTabela
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ScrollBars = ssVertical
              TabOrder = 0
            end
          end
          object TbsApropriacaoCancelado: TTabSheet
            Caption = 'Motivo do cancelamento'
            ImageIndex = 2
            object dbMovitoCancelamento: TDBMemo
              Left = 0
              Top = 0
              Width = 1065
              Height = 83
              TabStop = False
              Align = alClient
              DataField = 'CANCEL_MOTIVO'
              DataSource = DtSrcTabela
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              ScrollBars = ssVertical
              TabOrder = 0
            end
          end
        end
        object dbTipo: TDBLookupComboBox
          Left = 16
          Top = 80
          Width = 217
          Height = 21
          DataField = 'TIPO'
          DataSource = DtSrcTabela
          DropDownRows = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'CODIGO'
          ListField = 'DESCRICAO'
          ListSource = dtsTipoApropriacao
          ParentFont = False
          TabOrder = 4
        end
        object dbCentroCusto: TJvDBComboEdit
          Left = 704
          Top = 40
          Width = 385
          Height = 21
          ButtonHint = 'Pesquisar Centro de Custo (Ctrl+P)'#13#10'Limpar Campo (Ctrl+L)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clMoneyGreen
          DataField = 'CC_DESCRICAO'
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
          TabOrder = 3
          OnButtonClick = dbCentroCustoButtonClick
        end
        object dbEntrada: TJvDBComboEdit
          Left = 488
          Top = 80
          Width = 145
          Height = 21
          ButtonHint = 'Pesquisar Movimento de Entrada (Ctrl+P)'#13#10'Limpar Campo (Ctrl+L)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clMoneyGreen
          DataField = 'ENTRADA'
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
          TabOrder = 7
          OnButtonClick = dbEntradaButtonClick
        end
        object dbAutorizacao: TJvDBComboEdit
          Left = 640
          Top = 80
          Width = 145
          Height = 21
          ButtonHint = 
            'Pesquisar Autoriza'#231#227'o de Compras (Ctrl+P)'#13#10'Limpar Campo (Ctrl+L)' +
            #13#10#13#10'Observa'#231#245'es: '#13#10#13#10'1. Apenas as Autoriza'#231#245'es de Compras que ai' +
            'nda n'#227'o foram '#13#10'faturadas podem ser utilizadas neste processo.'#13#10 +
            #13#10'2. Para as Autoriza'#231#245'es j'#225' faturadas, utilizar o tipo "Apropri' +
            'a'#231#227'o por Entrada"'#13#10'e fazer uso da Entrada de Nota correspondente' +
            ' a autoriza'#231#227'o desejada.'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clMoneyGreen
          DataField = 'AUTORIZACAO'
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
          TabOrder = 8
          OnButtonClick = dbAutorizacaoButtonClick
        end
        object dbDataApropriacao: TJvDBDateEdit
          Left = 360
          Top = 80
          Width = 121
          Height = 21
          DataField = 'DATA_APROPRIACAO'
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
          TabOrder = 6
          OnExit = ControlEditExit
        end
      end
      object pgcMaisDados: TPageControl
        Left = 0
        Top = 447
        Width = 1108
        Height = 166
        ActivePage = tbsObservacoes
        Align = alBottom
        TabOrder = 3
        object tbsObservacoes: TTabSheet
          Caption = 'Observa'#231#245'es'
          ImageIndex = 1
          object PnlObservacoes: TPanel
            Left = 0
            Top = 0
            Width = 1100
            Height = 138
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object dbObservacao: TDBMemo
              Left = 0
              Top = 0
              Width = 1100
              Height = 88
              Align = alClient
              DataField = 'OBS'
              DataSource = DtSrcTabela
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ScrollBars = ssVertical
              TabOrder = 0
            end
            object PnlValores: TPanel
              Left = 0
              Top = 88
              Width = 1100
              Height = 50
              Align = alBottom
              BevelOuter = bvNone
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              object lblCompetencia: TLabel
                Left = 8
                Top = 8
                Width = 77
                Height = 13
                Caption = 'Compet'#234'ncia:'
                FocusControl = dbCompetencia
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lblValorTotalAprop: TLabel
                Left = 160
                Top = 8
                Width = 92
                Height = 13
                Caption = 'Valor Total (R$):'
                FocusControl = dbValorTotalAprop
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object dbCompetencia: TDBEdit
                Left = 8
                Top = 24
                Width = 145
                Height = 21
                TabStop = False
                Color = clMoneyGreen
                DataField = 'COMPETENCIA'
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
              object dbValorTotalAprop: TDBEdit
                Left = 160
                Top = 24
                Width = 145
                Height = 21
                TabStop = False
                Color = clMoneyGreen
                DataField = 'VALOR_TOTAL'
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
            end
          end
        end
      end
      object GrpBxDadosProduto: TGroupBox
        Left = 0
        Top = 233
        Width = 1108
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
        object lblUnidade: TLabel
          Left = 656
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
          Visible = False
        end
        object Bevel7: TBevel
          Left = 2
          Top = 15
          Width = 4
          Height = 99
          Align = alLeft
          Shape = bsSpacer
        end
        object lblCustoTotal: TLabel
          Left = 401
          Top = 64
          Width = 83
          Height = 13
          Caption = 'Custo Total (R$):'
          FocusControl = dbCustoTotal
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblCustoUn: TLabel
          Left = 259
          Top = 64
          Width = 119
          Height = 13
          Caption = 'Custo Un. [Inteiro] (R$):'
          FocusControl = dbCustoUn
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object LblAjuda: TLabel
          Left = 852
          Top = 16
          Width = 237
          Height = 65
          Alignment = taRightJustify
          Caption = 
            'IMPORTANTE:'#13#10#13#10'Apenas nas Apropria'#231#245'es Gerais se tem a liberdade' +
            ' de inserir manualmente'#13#10'os produtos desejados.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object lblUnidadeProduto: TLabel
          Left = 656
          Top = 24
          Width = 43
          Height = 13
          Caption = 'Unidade:'
          FocusControl = dbUnidadeProduto
        end
        object lblFracionador: TLabel
          Left = 183
          Top = 64
          Width = 61
          Height = 13
          Caption = 'Fracionador:'
          FocusControl = dbFracionador
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
          Width = 465
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
          Width = 89
          Height = 21
          Color = clWhite
          DataField = 'QTDE'
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
          Left = 656
          Top = 40
          Width = 57
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'UNP_SIGLA'
          DataSource = DtSrcTabelaItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
          Visible = False
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
            Top = 49
            Width = 70
            Height = 25
            Hint = 'Excluir Produto'
            Align = alBottom
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
            TabOrder = 3
            OnClick = btnProdutoSalvarClick
          end
        end
        object dbCustoTotal: TDBEdit
          Left = 401
          Top = 80
          Width = 136
          Height = 21
          Color = clMoneyGreen
          DataField = 'CUSTO_TOTAL'
          DataSource = DtSrcTabelaItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 8
          OnExit = ControlEditExit
        end
        object dbCustoUn: TDBEdit
          Left = 259
          Top = 80
          Width = 136
          Height = 21
          Color = clWhite
          DataField = 'CUSTO_UNITARIO'
          DataSource = DtSrcTabelaItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          OnExit = ControlEditExit
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
          ShowHint = True
          TabOrder = 1
          OnButtonClick = dbProdutoButtonClick
          OnExit = ControlEditExit
        end
        object dbUnidadeProduto: TDBLookupComboBox
          Left = 656
          Top = 40
          Width = 186
          Height = 21
          DataField = 'QTDE_TIPO_LANCAMENTO'
          DataSource = DtSrcTabelaItens
          DropDownRows = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'INDICE'
          ListField = 'UNP_DESCRICAO'
          ListSource = dtsUnidadeProduto
          ParentFont = False
          TabOrder = 4
          OnExit = ControlEditExit
        end
        object dbFracionador: TDBEdit
          Left = 183
          Top = 80
          Width = 70
          Height = 21
          Color = clMoneyGreen
          DataField = 'FRACIONADOR'
          DataSource = DtSrcTabelaItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
          OnExit = ControlEditExit
        end
      end
      object dbgProdutos: TDBGrid
        Left = 0
        Top = 353
        Width = 1108
        Height = 90
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
        TabOrder = 2
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = [fsBold]
        OnDrawColumnCell = dbgDadosDrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'ITEM'
            Title.Alignment = taCenter
            Title.Caption = '# '
            Width = 25
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRODUTO'
            Title.Caption = 'Codigo '
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRI_APRESENTACAO'
            Title.Caption = 'Descri'#231#227'o + Apresenta'#231#227'o '
            Width = 400
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTDE'
            Title.Caption = 'Qtde '
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UNP_DESCRICAO'
            Title.Caption = 'Unidade '
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CUSTO_UNITARIO'
            Title.Caption = 'Custo Un. (R$) '
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CUSTO_TOTAL'
            Title.Caption = 'Custo Total (R$) '
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FRACIONADOR'
            Title.Caption = 'Fracionador '
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTDE_FRACIONADA'
            Title.Caption = 'Qtde. Frac. '
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UNIDADE_FRACIONADA'
            Title.Caption = 'Und. Fracionada '
            Width = 100
            Visible = True
          end>
      end
    end
  end
  inherited tlbBotoes: TPanel
    Top = 646
    Width = 1116
    ExplicitTop = 646
    ExplicitWidth = 1116
    inherited bvlTool3: TBevel
      Left = 1033
      ExplicitLeft = 1033
    end
    inherited bvlTool4: TBevel
      Left = 1112
      ExplicitLeft = 1112
    end
    object Bevel12: TBevel [5]
      Left = 1086
      Top = 2
      Width = 4
      Height = 31
      Shape = bsSpacer
    end
    inherited btbtnCancelar: TcxButton
      TabOrder = 3
    end
    inherited btbtnSalvar: TcxButton
      TabOrder = 4
    end
    inherited btbtnLista: TcxButton
      Visible = True
    end
    inherited btbtnFechar: TcxButton
      Left = 1037
      TabOrder = 10
      ExplicitLeft = 1037
    end
    inherited btbtnSelecionar: TcxButton
      Left = 913
      TabOrder = 9
      ExplicitLeft = 913
    end
    object btnFinalizarLancamento: TcxButton
      Tag = 11
      Left = 553
      Top = 0
      Width = 120
      Height = 35
      Hint = 'Finalizar Lan'#231'amento da Apropria'#231#227'o'
      Align = alRight
      Caption = 'Finalizar Lanc.'
      Enabled = False
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        424D360800000000000036000000280000002000000010000000010020000000
        000000000000C40E0000C40E0000000000000000000000FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF0000C0A090FF604830FF6048
        30FF604830FF604830FF604830FF604830FF604830FF604830FF604830FF6048
        30FF604830FF00FF000000FF000000FF000000FF00009E9E9EFF434343FF4343
        43FF434343FF434343FF434343FF434343FF434343FF434343FF434343FF4343
        43FF434343FF00FF000000FF000000FF000000FF0000C0A890FFFFF8F0FFFFF0
        E0FFF0E8E0FFF0E0D0FFF0D0C0FFF0C8B0FFE0C0A0FFE0B8A0FFE0B090FFE0A8
        90FF604830FF00FF000000FF000000FF000000FF0000A3A3A3FFF6F6F6FFECEC
        ECFFE6E6E6FFDCDCDCFFCECECEFFC4C4C4FFB9B9B9FFB4B4B4FFABABABFFA6A6
        A6FF434343FF00FF000000FF000000FF000000FF0000C0A8A0FFFFFFF0FFC0A8
        A0FFB0A0A0FFF0E8E0FFB0A090FFB09890FFB09890FFB09890FFB09890FFE0B0
        90FF604830FF00FF000000FF000000FF000000FF0000A8A8A8FFFAFAFAFFA8A8
        A8FFA1A1A1FFE6E6E6FF9C9C9CFF989898FF989898FF989898FF989898FFABAB
        ABFF434343FF00FF000000FF000000FF000000FF0000C0A8A0FFFFFFF0FFFFFF
        F0FFFFF8F0FFFFF0E0FFF0E8E0FFF0E0D0FFF0D0C0FFF0C8B0FFE0C0A0FFE0B8
        A0FF604830FF00FF000000FF000000FF000000FF0000A8A8A8FFFAFAFAFFFAFA
        FAFFF6F6F6FFECECECFFE6E6E6FFDCDCDCFFCECECEFFC4C4C4FFB9B9B9FFB4B4
        B4FF434343FF00FF000000FF000000FF000000FF0000C0A8A0FFFFFFF0FFB0A8
        A0FFB0A0A0FFFFF8F0FFB0A090FFB09890FFB09890FFB09890FFB09890FFE0C0
        A0FF604830FF00FF000000FF000000FF000000FF0000A8A8A8FFFAFAFAFFA6A6
        A6FFA1A1A1FFF6F6F6FF9C9C9CFF989898FF989898FF989898FF989898FFB9B9
        B9FF434343FF00FF000000FF000000FF000000FF0000C0B0A0FFFFFFF0FFFFFF
        F0FFFFFFF0FFFFFFF0FFFFF8F0FFFFF0E0FFF0E8E0FFF0E0D0FFF0D0C0FFF0C8
        B0FF604830FF00FF000000FF000000FF000000FF0000ACACACFFFAFAFAFFFAFA
        FAFFFAFAFAFFFAFAFAFFF6F6F6FFECECECFFE6E6E6FFDCDCDCFFCECECEFFC4C4
        C4FF434343FF00FF000000FF000000FF000000FF0000C0B0A0FFFFFFF0FFFFFF
        F0FFFFFFF0FFFFFFF0FFFFFFF0FFFFF8F0FFC0C8C0FF406070FFF0E0D0FFF0D0
        C0FF604830FF00FF000000FF000000FF000000FF0000ACACACFFFAFAFAFFFAFA
        FAFFFAFAFAFFFAFAFAFFFAFAFAFFF6F6F6FFC4C4C4FF616161FFDCDCDCFFCECE
        CEFF434343FF00FF000000FF000000FF000000FF0000C0B0A0FFFFFFFFFFE0E8
        F0FF607880FFE0E0E0FFFFFFF0FFC0C8D0FF506070FF30A8D0FF203840FFB0A0
        A0FF604830FF00FF000000FF0000A0B39AFF408050FFACACACFFFFFFFFFFE9E9
        E9FF787878FFE0E0E0FFFAFAFAFFC9C9C9FF636363FFA8A8A8FF383838FFA1A1
        A1FF434343FF00FF000000FF0000A9A9A9FF6B6B6BFFD0B0A0FFFFFFFFFF90A8
        B0FF80D0E0FF506070FFB0B8C0FF506070FF60C0E0FF506070FF30B8F0FF1028
        30FF103040FF102830FF70747DFF407840FF50A860FFAEAEAEFFFFFFFFFFA8A8
        A8FFCCCCCCFF636363FFB9B9B9FF636363FFC0C0C0FF636363FFBBBBBBFF2828
        28FF313131FF282828FF767676FF616161FF898989FFD0B8A0FFFFFFFFFFE0E8
        F0FF90A8B0FF80E0F0FF506070FF80D0E0FF506070FF60D0F0FF406070FF30B0
        E0FF2098D0FF2088B0FF205070FF508860FF50B060FFB3B3B3FFFFFFFFFFE9E9
        E9FFA8A8A8FFDBDBDBFF636363FFCCCCCCFF636363FFCECECEFF616161FFB1B1
        B1FF9C9C9CFF898989FF545454FF767676FF8E8E8EFFD0B8A0FFD0B8A0FFD0B8
        A0FFC0B0A0FF90A8B0FF80E0F0FF506070FF80E0F0FF405870FF60D0F0FF50C8
        F0FF40C0F0FF20B0E0FF20A0D0FF609870FF50B870FFB3B3B3FFB3B3B3FFB3B3
        B3FFACACACFFA8A8A8FFDBDBDBFF636363FFDBDBDBFF5C5C5CFFCECECEFFC8C8
        C8FFC1C1C1FFB0B0B0FFA1A1A1FF868686FF989898FF00FF000000FF000000FF
        000000FF000000FF000090A8B0FF80E0F0FF405870FF80E0F0FF70D8F0FF60D0
        F0FF50C8F0FF40C0F0FF30B8F0FF70A880FF60C080FF00FF000000FF000000FF
        000000FF000000FF0000A8A8A8FFDBDBDBFF5C5C5CFFDBDBDBFFD4D4D4FFCECE
        CEFFC8C8C8FFC1C1C1FFBBBBBBFF969696FFA3A3A3FF00FF000000FF000000FF
        000000FF000000FF000000FF000090A8B0FF80E0F0FF80E0F0FF80E0F0FF70D8
        F0FF60D0F0FF60B0D0FF808890FFB0C0A0FF90D0A0FF00FF000000FF000000FF
        000000FF000000FF000000FF0000A8A8A8FFDBDBDBFFDBDBDBFFDBDBDBFFD4D4
        D4FFCECECEFFB1B1B1FF898989FFB4B4B4FFBBBBBBFF00FF000000FF000000FF
        000000FF000000FF000000FF000000FF000090A8B0FF90A0B0FF90A0A0FF8098
        A0FF8090A0FF808890FFB9B9BDFFA0B8A0FFB0C0A0FF00FF000000FF000000FF
        000000FF000000FF000000FF000000FF0000A8A8A8FFA3A3A3FF9E9E9EFF9898
        98FF939393FF898989FFBABABAFFAEAEAEFFB4B4B4FF00FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF0000}
      OptionsImage.NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = btnFinalizarLancamentoClick
    end
    object btnEncerrarApropriacao: TcxButton
      Tag = 12
      Left = 673
      Top = 0
      Width = 120
      Height = 35
      Hint = 'Encerrar Apropria'#231#227'o de Estoque'
      Align = alRight
      Caption = 'Encerrar'
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
      OnClick = btnEncerrarApropriacaoClick
    end
    object btnCancelarApropriacao: TcxButton
      Tag = 13
      Left = 793
      Top = 0
      Width = 120
      Height = 35
      Hint = 'Cancelar Apropria'#231#227'o selecionada'
      Align = alRight
      Caption = 'Cancelar Aprop.'
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
      TabOrder = 8
      OnClick = btnCancelarApropriacaoClick
    end
  end
  inherited IbDtstTabela: TIBDataSet
    SelectSQL.Strings = (
      'Select'
      '    a.ano'
      '  , a.controle'
      '  , a.numero'
      '  , a.empresa'
      '  , a.centro_custo'
      '  , a.tipo'
      '  , a.compra_ano'
      '  , a.compra_num'
      '  , a.compra_emp'
      '  , a.autorizacao_ano'
      '  , a.autorizacao_num'
      '  , a.autorizacao_emp'
      '  , a.insercao_data'
      '  , a.data_apropriacao'
      '  , a.competencia'
      '  , a.usuario'
      '  , a.status'
      '  , a.motivo'
      '  , a.obs'
      '  , a.valor_total'
      '  , a.cancel_usuario'
      '  , a.cancel_datahora'
      '  , a.cancel_motivo'
      ''
      
        '  , (Select count(ai.item) from TBAPROPRIACAO_ALMOX_ITEM ai WHER' +
        'E ai.ano = a.ano and ai.controle = a.controle) as Itens'
      ''
      '  , e.rzsoc     as empresa_nome'
      '  , c.descricao as cc_descricao'
      '  , c.codcliente as cc_cliente_codigo'
      '  , ci.nome     as cc_cliente_nome'
      '  , ci.cnpj     as cc_cliente_cnpj'
      '  , ci.pessoa_fisica as cc_cliente_tipo'
      ''
      '  , a.compra_ano || '#39'/'#39' || lpad(a.compra_num, 7, '#39'0'#39') as entrada'
      
        '  , a.autorizacao_ano || '#39'/'#39' || lpad(a.autorizacao_num, 7, '#39'0'#39') ' +
        'as autorizacao'
      'from TBAPROPRIACAO_ALMOX a'
      '  left join TBEMPRESA e on (e.cnpj = a.empresa)'
      '  left join TBCENTRO_CUSTO c on (c.codigo = a.centro_custo)'
      '  left join TBCLIENTE ci on (ci.codigo = c.codcliente)')
    GeneratorField.Field = 'NUMERO'
    GeneratorField.Generator = 'GEN_REQUISICAO_2013'
    Top = 8
  end
  inherited DtSrcTabela: TDataSource
    DataSet = fdQryTabela
    OnDataChange = DtSrcTabelaDataChange
    Left = 704
    Top = 48
  end
  inherited IbUpdTabela: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  ANO,'
      '  CONTROLE,'
      '  NUMERO,'
      '  EMPRESA,'
      '  CENTRO_CUSTO,'
      '  TIPO,'
      '  COMPRA_ANO,'
      '  COMPRA_NUM,'
      '  COMPRA_EMP,'
      '  AUTORIZACAO_ANO,'
      '  AUTORIZACAO_NUM,'
      '  AUTORIZACAO_EMP,'
      '  INSERCAO_DATA,'
      '  DATA_APROPRIACAO,'
      '  COMPETENCIA,'
      '  USUARIO,'
      '  STATUS,'
      '  MOTIVO,'
      '  OBS,'
      '  VALOR_TOTAL,'
      '  CANCEL_USUARIO,'
      '  CANCEL_DATAHORA,'
      '  CANCEL_MOTIVO'
      'from TBAPROPRIACAO_ALMOX '
      'where'
      '  ANO = :ANO and'
      '  CONTROLE = :CONTROLE')
    ModifySQL.Strings = (
      'update TBAPROPRIACAO_ALMOX'
      'set'
      '  ANO = :ANO,'
      '  AUTORIZACAO_ANO = :AUTORIZACAO_ANO,'
      '  AUTORIZACAO_EMP = :AUTORIZACAO_EMP,'
      '  AUTORIZACAO_NUM = :AUTORIZACAO_NUM,'
      '  CANCEL_DATAHORA = :CANCEL_DATAHORA,'
      '  CANCEL_MOTIVO = :CANCEL_MOTIVO,'
      '  CANCEL_USUARIO = :CANCEL_USUARIO,'
      '  CENTRO_CUSTO = :CENTRO_CUSTO,'
      '  COMPETENCIA = :COMPETENCIA,'
      '  COMPRA_ANO = :COMPRA_ANO,'
      '  COMPRA_EMP = :COMPRA_EMP,'
      '  COMPRA_NUM = :COMPRA_NUM,'
      '  CONTROLE = :CONTROLE,'
      '  DATA_APROPRIACAO = :DATA_APROPRIACAO,'
      '  EMPRESA = :EMPRESA,'
      '  INSERCAO_DATA = :INSERCAO_DATA,'
      '  MOTIVO = :MOTIVO,'
      '  NUMERO = :NUMERO,'
      '  OBS = :OBS,'
      '  STATUS = :STATUS,'
      '  TIPO = :TIPO,'
      '  USUARIO = :USUARIO,'
      '  VALOR_TOTAL = :VALOR_TOTAL'
      'where'
      '  ANO = :OLD_ANO and'
      '  CONTROLE = :OLD_CONTROLE')
    InsertSQL.Strings = (
      'insert into TBAPROPRIACAO_ALMOX'
      
        '  (ANO, AUTORIZACAO_ANO, AUTORIZACAO_EMP, AUTORIZACAO_NUM, CANCE' +
        'L_DATAHORA, '
      
        '   CANCEL_MOTIVO, CANCEL_USUARIO, CENTRO_CUSTO, COMPETENCIA, COM' +
        'PRA_ANO, '
      
        '   COMPRA_EMP, COMPRA_NUM, CONTROLE, DATA_APROPRIACAO, EMPRESA, ' +
        'INSERCAO_DATA, '
      '   MOTIVO, NUMERO, OBS, STATUS, TIPO, USUARIO, VALOR_TOTAL)'
      'values'
      
        '  (:ANO, :AUTORIZACAO_ANO, :AUTORIZACAO_EMP, :AUTORIZACAO_NUM, :' +
        'CANCEL_DATAHORA, '
      
        '   :CANCEL_MOTIVO, :CANCEL_USUARIO, :CENTRO_CUSTO, :COMPETENCIA,' +
        ' :COMPRA_ANO, '
      
        '   :COMPRA_EMP, :COMPRA_NUM, :CONTROLE, :DATA_APROPRIACAO, :EMPR' +
        'ESA, :INSERCAO_DATA, '
      
        '   :MOTIVO, :NUMERO, :OBS, :STATUS, :TIPO, :USUARIO, :VALOR_TOTA' +
        'L)')
    DeleteSQL.Strings = (
      'delete from TBAPROPRIACAO_ALMOX'
      'where'
      '  ANO = :OLD_ANO and'
      '  CONTROLE = :OLD_CONTROLE')
    Top = 8
  end
  inherited ImgList: TImageList
    Left = 912
    Top = 176
  end
  inherited fdQryTabela: TFDQuery
    AfterCancel = fdQryTabelaAfterCancel
    AfterScroll = fdQryTabelaAfterScroll
    UpdateOptions.AssignedValues = [uvFetchGeneratorsPoint, uvGeneratorName]
    UpdateOptions.FetchGeneratorsPoint = gpImmediate
    UpdateOptions.GeneratorName = 'GEN_APROPRIACAO_ALMOX_2020'
    UpdateOptions.KeyFields = 'ANO;CONTROLE'
    UpdateOptions.AutoIncFields = 'CONTROLE'
    SQL.Strings = (
      'Select'
      '    a.ano'
      '  , a.controle'
      '  , a.numero'
      '  , a.empresa'
      '  , a.centro_custo'
      '  , a.tipo'
      '  , a.compra_ano'
      '  , a.compra_num'
      '  , a.compra_emp'
      '  , a.autorizacao_ano'
      '  , a.autorizacao_num'
      '  , a.autorizacao_emp'
      '  , a.insercao_data'
      '  , a.data_apropriacao'
      '  , a.competencia'
      '  , a.usuario'
      '  , a.status'
      '  , a.motivo'
      '  , a.obs'
      '  , a.valor_total'
      '  , a.cancel_usuario'
      '  , a.cancel_datahora'
      '  , a.cancel_motivo'
      ''
      '  , cast(coalesce(('
      '      Select'
      '        count(ai.item) from'
      '      TBAPROPRIACAO_ALMOX_ITEM ai'
      '      where ai.ano = a.ano and ai.controle = a.controle'
      '    ), 0) as Integer) as Itens'
      ''
      '  , e.rzsoc     as empresa_nome'
      '  , c.descricao as cc_descricao'
      '  , c.codcliente as cc_cliente_codigo'
      '  , ci.nome     as cc_cliente_nome'
      '  , ci.cnpj     as cc_cliente_cnpj'
      '  , ci.pessoa_fisica as cc_cliente_tipo'
      ''
      '  , a.compra_ano || '#39'/'#39' || lpad(a.compra_num, 7, '#39'0'#39') as entrada'
      
        '  , a.autorizacao_ano || '#39'/'#39' || lpad(a.autorizacao_num, 7, '#39'0'#39') ' +
        'as autorizacao'
      'from TBAPROPRIACAO_ALMOX a'
      '  left join TBEMPRESA e on (e.cnpj = a.empresa)'
      '  left join TBCENTRO_CUSTO c on (c.codigo = a.centro_custo)'
      '  left join TBCLIENTE ci on (ci.codigo = c.codcliente)')
    Top = 48
    object fdQryTabelaANO: TSmallintField
      DisplayLabel = 'Ano'
      FieldName = 'ANO'
      Origin = 'ANO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object fdQryTabelaCONTROLE: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Controle'
      FieldName = 'CONTROLE'
      Origin = 'CONTROLE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      DisplayFormat = '###0000000'
    end
    object fdQryTabelaNUMERO: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
    end
    object fdQryTabelaEMPRESA: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      Origin = 'EMPRESA'
      Size = 18
    end
    object fdQryTabelaCENTRO_CUSTO: TIntegerField
      DisplayLabel = 'Centro de Custo / Departamento'
      FieldName = 'CENTRO_CUSTO'
      Origin = 'CENTRO_CUSTO'
    end
    object fdQryTabelaTIPO: TSmallintField
      Alignment = taLeftJustify
      DisplayLabel = 'Tipo Apropria'#231#227'o'
      FieldName = 'TIPO'
      Origin = 'TIPO'
      OnGetText = fdQryTabelaTIPOGetText
    end
    object fdQryTabelaCOMPRA_ANO: TSmallintField
      DisplayLabel = 'Entrada - Ano'
      FieldName = 'COMPRA_ANO'
      Origin = 'COMPRA_ANO'
    end
    object fdQryTabelaCOMPRA_NUM: TIntegerField
      DisplayLabel = 'Entrada - N'#250'mero'
      FieldName = 'COMPRA_NUM'
      Origin = 'COMPRA_NUM'
    end
    object fdQryTabelaCOMPRA_EMP: TStringField
      DisplayLabel = 'Entrada - Empresa'
      FieldName = 'COMPRA_EMP'
      Origin = 'COMPRA_EMP'
      Size = 18
    end
    object fdQryTabelaAUTORIZACAO_ANO: TSmallintField
      FieldName = 'AUTORIZACAO_ANO'
      Origin = 'AUTORIZACAO_ANO'
    end
    object fdQryTabelaAUTORIZACAO_NUM: TIntegerField
      FieldName = 'AUTORIZACAO_NUM'
      Origin = 'AUTORIZACAO_NUM'
    end
    object fdQryTabelaAUTORIZACAO_EMP: TStringField
      FieldName = 'AUTORIZACAO_EMP'
      Origin = 'AUTORIZACAO_EMP'
      Size = 18
    end
    object fdQryTabelaINSERCAO_DATA: TSQLTimeStampField
      FieldName = 'INSERCAO_DATA'
      Origin = 'INSERCAO_DATA'
      OnGetText = fdQryTabelaINSERCAO_DATAGetText
    end
    object fdQryTabelaDATA_APROPRIACAO: TDateField
      DisplayLabel = 'Data da Apropria'#231#227'o'
      FieldName = 'DATA_APROPRIACAO'
      Origin = 'DATA_APROPRIACAO'
      Required = True
    end
    object fdQryTabelaCOMPETENCIA: TIntegerField
      FieldName = 'COMPETENCIA'
      Origin = 'COMPETENCIA'
    end
    object fdQryTabelaUSUARIO: TStringField
      FieldName = 'USUARIO'
      Origin = 'USUARIO'
      Size = 12
    end
    object fdQryTabelaSTATUS: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'STATUS'
      Origin = 'STATUS'
      OnGetText = fdQryTabelaSTATUSGetText
    end
    object fdQryTabelaMOTIVO: TMemoField
      DisplayLabel = 'Motivo'
      FieldName = 'MOTIVO'
      Origin = 'MOTIVO'
      BlobType = ftMemo
    end
    object fdQryTabelaITENS: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ITENS'
      Origin = 'ITENS'
      ProviderFlags = []
      ReadOnly = True
    end
    object fdQryTabelaOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      Origin = 'OBS'
      BlobType = ftMemo
    end
    object fdQryTabelaCANCEL_USUARIO: TStringField
      FieldName = 'CANCEL_USUARIO'
      Origin = 'CANCEL_USUARIO'
      Size = 12
    end
    object fdQryTabelaCANCEL_DATAHORA: TSQLTimeStampField
      FieldName = 'CANCEL_DATAHORA'
      Origin = 'CANCEL_DATAHORA'
    end
    object fdQryTabelaCANCEL_MOTIVO: TMemoField
      FieldName = 'CANCEL_MOTIVO'
      Origin = 'CANCEL_MOTIVO'
      BlobType = ftMemo
    end
    object fdQryTabelaEMPRESA_NOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'EMPRESA_NOME'
      Origin = 'RZSOC'
      ProviderFlags = []
      Size = 60
    end
    object fdQryTabelaCC_DESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CC_DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      Size = 100
    end
    object fdQryTabelaCC_CLIENTE_CODIGO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CC_CLIENTE_CODIGO'
      Origin = 'CODCLIENTE'
      ProviderFlags = []
    end
    object fdQryTabelaCC_CLIENTE_NOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CC_CLIENTE_NOME'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object fdQryTabelaCC_CLIENTE_CNPJ: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CC_CLIENTE_CNPJ'
      Origin = 'CNPJ'
      ProviderFlags = []
      Size = 18
    end
    object fdQryTabelaCC_CLIENTE_TIPO: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'CC_CLIENTE_TIPO'
      Origin = 'PESSOA_FISICA'
      ProviderFlags = []
    end
    object fdQryTabelaENTRADA: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
      Origin = 'ENTRADA'
      ProviderFlags = []
      Size = 14
    end
    object fdQryTabelaAUTORIZACAO: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Autoriza'#231#227'o'
      FieldName = 'AUTORIZACAO'
      Origin = 'AUTORIZACAO'
      ProviderFlags = []
      Size = 14
    end
    object fdQryTabelaVALOR_TOTAL: TFMTBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      Precision = 18
      Size = 2
    end
  end
  inherited fdUpdTabela: TFDUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO TBAPROPRIACAO_ALMOX'
      '(ANO, CONTROLE, NUMERO, EMPRESA, CENTRO_CUSTO, '
      '  TIPO, COMPRA_ANO, COMPRA_NUM, COMPRA_EMP, '
      '  AUTORIZACAO_ANO, AUTORIZACAO_NUM, AUTORIZACAO_EMP, '
      '  INSERCAO_DATA, DATA_APROPRIACAO, COMPETENCIA, '
      '  USUARIO, STATUS, MOTIVO, OBS, VALOR_TOTAL, '
      '  CANCEL_USUARIO, CANCEL_DATAHORA, CANCEL_MOTIVO)'
      
        'VALUES (:NEW_ANO, :NEW_CONTROLE, :NEW_NUMERO, :NEW_EMPRESA, :NEW' +
        '_CENTRO_CUSTO, '
      '  :NEW_TIPO, :NEW_COMPRA_ANO, :NEW_COMPRA_NUM, :NEW_COMPRA_EMP, '
      
        '  :NEW_AUTORIZACAO_ANO, :NEW_AUTORIZACAO_NUM, :NEW_AUTORIZACAO_E' +
        'MP, '
      '  :NEW_INSERCAO_DATA, :NEW_DATA_APROPRIACAO, :NEW_COMPETENCIA, '
      
        '  :NEW_USUARIO, :NEW_STATUS, :NEW_MOTIVO, :NEW_OBS, :NEW_VALOR_T' +
        'OTAL, '
      '  :NEW_CANCEL_USUARIO, :NEW_CANCEL_DATAHORA, :NEW_CANCEL_MOTIVO)')
    ModifySQL.Strings = (
      'UPDATE TBAPROPRIACAO_ALMOX'
      
        'SET ANO = :NEW_ANO, CONTROLE = :NEW_CONTROLE, NUMERO = :NEW_NUME' +
        'RO, '
      '  EMPRESA = :NEW_EMPRESA, CENTRO_CUSTO = :NEW_CENTRO_CUSTO, '
      
        '  TIPO = :NEW_TIPO, COMPRA_ANO = :NEW_COMPRA_ANO, COMPRA_NUM = :' +
        'NEW_COMPRA_NUM, '
      
        '  COMPRA_EMP = :NEW_COMPRA_EMP, AUTORIZACAO_ANO = :NEW_AUTORIZAC' +
        'AO_ANO, '
      
        '  AUTORIZACAO_NUM = :NEW_AUTORIZACAO_NUM, AUTORIZACAO_EMP = :NEW' +
        '_AUTORIZACAO_EMP, '
      
        '  INSERCAO_DATA = :NEW_INSERCAO_DATA, DATA_APROPRIACAO = :NEW_DA' +
        'TA_APROPRIACAO, '
      '  COMPETENCIA = :NEW_COMPETENCIA, USUARIO = :NEW_USUARIO, '
      '  STATUS = :NEW_STATUS, MOTIVO = :NEW_MOTIVO, OBS = :NEW_OBS, '
      
        '  VALOR_TOTAL = :NEW_VALOR_TOTAL, CANCEL_USUARIO = :NEW_CANCEL_U' +
        'SUARIO, '
      
        '  CANCEL_DATAHORA = :NEW_CANCEL_DATAHORA, CANCEL_MOTIVO = :NEW_C' +
        'ANCEL_MOTIVO'
      'WHERE ANO = :OLD_ANO AND CONTROLE = :OLD_CONTROLE')
    DeleteSQL.Strings = (
      'DELETE FROM TBAPROPRIACAO_ALMOX'
      'WHERE ANO = :OLD_ANO AND CONTROLE = :OLD_CONTROLE')
    FetchRowSQL.Strings = (
      'Select'
      '    a.ano'
      '  , a.controle'
      '  , a.numero'
      '  , a.empresa'
      '  , a.centro_custo'
      '  , a.tipo'
      '  , a.compra_ano'
      '  , a.compra_num'
      '  , a.compra_emp'
      '  , a.autorizacao_ano'
      '  , a.autorizacao_num'
      '  , a.autorizacao_emp'
      '  , a.insercao_data'
      '  , a.data_apropriacao'
      '  , a.competencia'
      '  , a.usuario'
      '  , a.status'
      '  , a.motivo'
      '  , a.obs'
      '  , a.valor_total'
      '  , a.cancel_usuario'
      '  , a.cancel_datahora'
      '  , a.cancel_motivo'
      ''
      '  , coalesce(('
      '      Select'
      '        count(ai.item) from'
      '      TBAPROPRIACAO_ALMOX_ITEM ai'
      '      WHERE ai.ano = a.ano and ai.controle = a.controle'
      '    ), 0) as Itens'
      ''
      '  , e.rzsoc     as empresa_nome'
      '  , c.descricao as cc_descricao'
      '  , c.codcliente as cc_cliente_codigo'
      '  , ci.nome     as cc_cliente_nome'
      '  , ci.cnpj     as cc_cliente_cnpj'
      '  , ci.pessoa_fisica as cc_cliente_tipo'
      ''
      '  , a.compra_ano || '#39'/'#39' || lpad(a.compra_num, 7, '#39'0'#39') as entrada'
      
        '  , a.autorizacao_ano || '#39'/'#39' || lpad(a.autorizacao_num, 7, '#39'0'#39') ' +
        'as autorizacao'
      'from TBAPROPRIACAO_ALMOX a'
      '  left join TBEMPRESA e on (e.cnpj = a.empresa)'
      '  left join TBCENTRO_CUSTO c on (c.codigo = a.centro_custo)'
      '  left join TBCLIENTE ci on (ci.codigo = c.codcliente)'
      ''
      'WHERE a.ANO = :ANO AND a.CONTROLE = :CONTROLE')
    Top = 48
  end
  object dtsEmpresa: TDataSource
    DataSet = fdQryEmpresa
    Left = 976
    Top = 176
  end
  object DtSrcTabelaItens: TDataSource
    AutoEdit = False
    DataSet = cdsTabelaItens
    OnStateChange = DtSrcTabelaItensStateChange
    OnDataChange = DtSrcTabelaItensDataChange
    Left = 704
    Top = 80
  end
  object ppImprimir: TPopupMenu
    Images = ImgList
    Left = 16
    Top = 512
    object nmImprimirApropriacao: TMenuItem
      Caption = 'Apropria'#231#227'o de Estoque (Almoxarifado)'
      ImageIndex = 16
      OnClick = nmImprimirApropriacaoClick
    end
  end
  object dtsTipoApropriacao: TDataSource
    DataSet = fdQryTipoApropriacao
    Left = 976
    Top = 208
  end
  object dtsUnidadeProduto: TDataSource
    DataSet = fdQryUnidadeProduto
    Left = 976
    Top = 240
  end
  object cdsTabelaItens: TFDQuery
    AfterScroll = cdsTabelaItensAfterScroll
    OnNewRecord = cdsTabelaItensNewRecord
    CachedUpdates = True
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    UpdateObject = updTabelaItens
    SQL.Strings = (
      'Select'
      '    i.ano'
      '  , i.controle'
      '  , i.item'
      '  , i.produto'
      '  , i.qtde_tipo_lancamento'
      '  , i.qtde'
      '  , i.qtde_fracionada'
      '  , i.fracionador'
      '  , i.unidade'
      '  , i.unidade_fracao'
      '  , i.custo_unitario'
      '  , i.custo_total'
      ''
      '  , p.descri'
      '  , p.apresentacao'
      '  , p.descri_apresentacao'
      '  , uc.unp_descricao'
      '  , uc.unp_sigla'
      
        '  , substring(coalesce(nullif(trim(uc.unp_sigla), '#39#39'), uc.unp_de' +
        'scricao) from 1 for 3) unidade_sigla'
      '  , coalesce(p.qtde, 0.0) as estoque'
      '  , coalesce(p.reserva, 0.0) as reserva'
      '  , p.movimenta_estoque'
      '  , uf.unp_descricao as unidade_fracionada'
      'from TBAPROPRIACAO_ALMOX_ITEM i'
      '  left join TBPRODUTO p on (p.cod = i.produto)'
      '  left join TBUNIDADEPROD uc on (uc.unp_cod = i.unidade)'
      '  left join TBUNIDADEPROD uf on (uf.unp_cod = i.unidade_fracao)')
    Left = 640
    Top = 80
    object cdsTabelaItensANO: TSmallintField
      DisplayLabel = 'Ano'
      FieldName = 'ANO'
      Origin = 'ANO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsTabelaItensCONTROLE: TIntegerField
      DisplayLabel = 'Controle'
      FieldName = 'CONTROLE'
      Origin = 'CONTROLE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsTabelaItensITEM: TSmallintField
      Alignment = taCenter
      DisplayLabel = 'Item'
      FieldName = 'ITEM'
      Origin = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      DisplayFormat = '000'
    end
    object cdsTabelaItensPRODUTO: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'PRODUTO'
      Origin = 'PRODUTO'
      Size = 10
    end
    object cdsTabelaItensQTDE_TIPO_LANCAMENTO: TSmallintField
      FieldName = 'QTDE_TIPO_LANCAMENTO'
      Origin = 'QTDE_TIPO_LANCAMENTO'
    end
    object cdsTabelaItensUNIDADE: TSmallintField
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
    end
    object cdsTabelaItensUNIDADE_FRACAO: TSmallintField
      FieldName = 'UNIDADE_FRACAO'
      Origin = 'UNIDADE_FRACAO'
    end
    object cdsTabelaItensDESCRI: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRI'
      Origin = 'DESCRI'
      ProviderFlags = []
      Size = 50
    end
    object cdsTabelaItensAPRESENTACAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'APRESENTACAO'
      Origin = 'APRESENTACAO'
      ProviderFlags = []
      Size = 50
    end
    object cdsTabelaItensDESCRI_APRESENTACAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRI_APRESENTACAO'
      Origin = 'DESCRI_APRESENTACAO'
      ProviderFlags = []
      Size = 100
    end
    object cdsTabelaItensUNP_DESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'UNP_DESCRICAO'
      Origin = 'UNP_DESCRICAO'
      ProviderFlags = []
      Size = 50
    end
    object cdsTabelaItensUNP_SIGLA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'UNP_SIGLA'
      Origin = 'UNP_SIGLA'
      ProviderFlags = []
      Size = 5
    end
    object cdsTabelaItensUNIDADE_SIGLA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'UNIDADE_SIGLA'
      Origin = 'UNIDADE_SIGLA'
      ProviderFlags = []
      Size = 50
    end
    object cdsTabelaItensMOVIMENTA_ESTOQUE: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'MOVIMENTA_ESTOQUE'
      Origin = 'MOVIMENTA_ESTOQUE'
      ProviderFlags = []
    end
    object cdsTabelaItensUNIDADE_FRACIONADA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'UNIDADE_FRACIONADA'
      Origin = 'UNP_DESCRICAO'
      ProviderFlags = []
      Size = 50
    end
    object cdsTabelaItensQTDE: TFMTBCDField
      FieldName = 'QTDE'
      Origin = 'QTDE'
      Required = True
      Precision = 18
      Size = 3
    end
    object cdsTabelaItensQTDE_FRACIONADA: TFMTBCDField
      FieldName = 'QTDE_FRACIONADA'
      Origin = 'QTDE_FRACIONADA'
      Required = True
      Precision = 18
      Size = 3
    end
    object cdsTabelaItensFRACIONADOR: TFMTBCDField
      FieldName = 'FRACIONADOR'
      Origin = 'FRACIONADOR'
      Precision = 18
      Size = 3
    end
    object cdsTabelaItensCUSTO_UNITARIO: TFMTBCDField
      FieldName = 'CUSTO_UNITARIO'
      Origin = 'CUSTO_UNITARIO'
      Precision = 18
      Size = 3
    end
    object cdsTabelaItensCUSTO_TOTAL: TFMTBCDField
      FieldName = 'CUSTO_TOTAL'
      Origin = 'CUSTO_TOTAL'
      Precision = 18
      Size = 2
    end
    object cdsTabelaItensESTOQUE: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'ESTOQUE'
      Origin = 'ESTOQUE'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 3
    end
    object cdsTabelaItensRESERVA: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'RESERVA'
      Origin = 'RESERVA'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 3
    end
  end
  object updTabelaItens: TFDUpdateSQL
    Connection = DMBusiness.fdConexao
    InsertSQL.Strings = (
      'INSERT INTO TBAPROPRIACAO_ALMOX_ITEM'
      '(ANO, CONTROLE, ITEM, PRODUTO, QTDE_TIPO_LANCAMENTO, '
      '  QTDE, QTDE_FRACIONADA, FRACIONADOR, UNIDADE, '
      '  UNIDADE_FRACAO, CUSTO_UNITARIO, CUSTO_TOTAL)'
      
        'VALUES (:NEW_ANO, :NEW_CONTROLE, :NEW_ITEM, :NEW_PRODUTO, :NEW_Q' +
        'TDE_TIPO_LANCAMENTO, '
      
        '  :NEW_QTDE, :NEW_QTDE_FRACIONADA, :NEW_FRACIONADOR, :NEW_UNIDAD' +
        'E, '
      '  :NEW_UNIDADE_FRACAO, :NEW_CUSTO_UNITARIO, :NEW_CUSTO_TOTAL)')
    ModifySQL.Strings = (
      'UPDATE TBAPROPRIACAO_ALMOX_ITEM'
      'SET ANO = :NEW_ANO, CONTROLE = :NEW_CONTROLE, ITEM = :NEW_ITEM, '
      
        '  PRODUTO = :NEW_PRODUTO, QTDE_TIPO_LANCAMENTO = :NEW_QTDE_TIPO_' +
        'LANCAMENTO, '
      '  QTDE = :NEW_QTDE, QTDE_FRACIONADA = :NEW_QTDE_FRACIONADA, '
      '  FRACIONADOR = :NEW_FRACIONADOR, UNIDADE = :NEW_UNIDADE, '
      
        '  UNIDADE_FRACAO = :NEW_UNIDADE_FRACAO, CUSTO_UNITARIO = :NEW_CU' +
        'STO_UNITARIO, '
      '  CUSTO_TOTAL = :NEW_CUSTO_TOTAL'
      
        'WHERE ANO = :OLD_ANO AND CONTROLE = :OLD_CONTROLE AND ITEM = :OL' +
        'D_ITEM')
    DeleteSQL.Strings = (
      'DELETE FROM TBAPROPRIACAO_ALMOX_ITEM'
      
        'WHERE ANO = :OLD_ANO AND CONTROLE = :OLD_CONTROLE AND ITEM = :OL' +
        'D_ITEM')
    FetchRowSQL.Strings = (
      
        'SELECT ANO, CONTROLE, ITEM, PRODUTO, QTDE_TIPO_LANCAMENTO, QTDE,' +
        ' QTDE_FRACIONADA, '
      
        '  FRACIONADOR, UNIDADE, UNIDADE_FRACAO, CUSTO_UNITARIO, CUSTO_TO' +
        'TAL'
      'FROM TBAPROPRIACAO_ALMOX_ITEM'
      'WHERE ANO = :ANO AND CONTROLE = :CONTROLE AND ITEM = :ITEM')
    Left = 672
    Top = 80
  end
  object spAjusteEstoqueVenda: TFDStoredProc
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    StoredProcName = 'SET_AJUSTE_ESTOQUE_VENDA'
    Left = 640
    Top = 112
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
        Name = 'PRODUTO'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 3
        Name = 'QTDE_ATUAL'
        DataType = ftFMTBcd
        Precision = 18
        NumericScale = 3
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'QTDE_NOVA'
        DataType = ftFMTBcd
        Precision = 18
        NumericScale = 3
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'MOTIVO'
        DataType = ftString
        ParamType = ptInput
        Size = 250
      end
      item
        Position = 6
        Name = 'DATA_HORA'
        DataType = ftTimeStamp
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'USUARIO'
        DataType = ftString
        ParamType = ptInput
        Size = 12
      end
      item
        Position = 8
        Name = 'DOCUMENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end>
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
    Left = 944
    Top = 176
  end
  object fdQryTipoApropriacao: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    *'
      'from VW_TIPO_APROPRIACAO')
    Left = 944
    Top = 208
  end
  object fdQryUnidadeProduto: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    x.indice'
      '  , x.unidade'
      '  , u.unp_descricao'
      '  , u.unp_sigla'
      'from ('
      '    Select'
      '        0 as indice'
      '      , p.codunidade  as unidade'
      '    from TBPRODUTO p'
      '    where p.cod = :produto'
      '    '
      '    union'
      '    '
      '    Select'
      '        1 as indice'
      '      , p.codunidade_fracionada  as unidade'
      '    from TBPRODUTO p'
      '    where p.cod = :produto'
      '      and p.codunidade <> p.codunidade_fracionada'
      ') x'
      '  left join TBUNIDADEPROD u on (u.unp_cod = x.unidade)'
      ''
      'order by'
      '    x.indice')
    Left = 944
    Top = 240
    ParamData = <
      item
        Name = 'PRODUTO'
        DataType = ftString
        ParamType = ptInput
        Size = 10
        Value = Null
      end>
  end
  object fdQryProduto: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    p.cod'
      '  , p.descri'
      '  , p.descri_apresentacao'
      '  , p.codunidade'
      '  , p.codunidade_fracionada'
      '  , uc.unp_descricao'
      '  , uc.unp_sigla'
      '  , uf.unp_descricao as unidade_fracionada'
      '  , coalesce(p.fracionador, 1.0) as fracionador'
      '  , p.movimenta_estoque'
      'from TBPRODUTO p'
      '  left join TBUNIDADEPROD uc on (uc.unp_cod = p.codunidade)'
      
        '  left join TBUNIDADEPROD uf on (uf.unp_cod = p.codunidade_fraci' +
        'onada)'
      'where p.codigo = :produto')
    Left = 784
    Top = 176
    ParamData = <
      item
        Name = 'PRODUTO'
        DataType = ftString
        ParamType = ptInput
        Size = 10
        Value = Null
      end>
  end
  object fdQryEntradaProduto: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    i.codprod    as produto'
      '  , i.unid_cod   as unidade'
      '  , p.codunidade_fracionada as unidade_fracao'
      '  , p.customedio as custo_medio'
      '  , i.customedio as valor_unitario'
      '  , p.descri'
      '  , p.apresentacao'
      '  , p.descri_apresentacao'
      '  , u.unp_descricao'
      '  , u.unp_sigla'
      
        '  , substring(coalesce(nullif(trim(u.unp_sigla), '#39#39'), u.unp_desc' +
        'ricao) from 1 for 3) unidade_sigla'
      '  , uf.unp_descricao as unidade_fracionada'
      '  , coalesce(p.qtde, 0.0) as estoque'
      '  , coalesce(p.reserva, 0.0) as reserva'
      '  , coalesce(p.fracionador, 1.0) as fracionador'
      '  , p.movimenta_estoque'
      ''
      '  , sum(i.qtde) - sum(coalesce(ai.qtde, 0.0)) as quantidade'
      ''
      'from TBCOMPRAS c'
      
        '  inner join TBCOMPRASITENS i on (i.ano = c.ano and i.codcontrol' +
        ' = c.codcontrol and i.codemp = c.codemp)'
      '  inner join TBPRODUTO p on (p.cod = i.codprod)'
      
        '  left join TBAPROPRIACAO_ALMOX a on (a.compra_ano = c.ano and a' +
        '.compra_num = c.codcontrol and a.compra_emp = c.codemp and a.sta' +
        'tus <> 3)'
      
        '  left join TBAPROPRIACAO_ALMOX_ITEM ai on (ai.ano = a.ano and a' +
        'i.controle = a.controle and ai.produto = i.codprod)'
      '  left join TBUNIDADEPROD u on (u.unp_cod = ai.unidade)'
      
        '  left join TBUNIDADEPROD uf on (uf.unp_cod = p.codunidade_fraci' +
        'onada)'
      ''
      'where c.ano        = :ano'
      '  and c.codcontrol = :cod'
      '  and c.codemp     = :emp'
      ''
      'group by'
      '    i.codprod'
      '  , i.unid_cod'
      '  , p.codunidade_fracionada'
      '  , p.customedio'
      '  , i.customedio'
      '  , p.descri'
      '  , p.apresentacao'
      '  , p.descri_apresentacao'
      '  , u.unp_descricao'
      '  , u.unp_sigla'
      
        '  , substring(coalesce(nullif(trim(u.unp_sigla), '#39#39'), u.unp_desc' +
        'ricao) from 1 for 3)'
      '  , uf.unp_descricao'
      '  , coalesce(p.qtde, 0.0)'
      '  , coalesce(p.reserva, 0.0)'
      '  , coalesce(p.fracionador, 1.0)'
      '  , p.movimenta_estoque')
    Left = 784
    Top = 216
    ParamData = <
      item
        Name = 'ANO'
        DataType = ftSmallint
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'COD'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'EMP'
        DataType = ftString
        ParamType = ptInput
        Size = 18
      end>
  end
  object fdQryAutorizacaoProduto: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    i.produto'
      '  , i.unidade'
      '  , p.codunidade_fracionada as unidade_fracao'
      
        '  , coalesce(nullif(p.customedio, 0), i.valor_unitario) as custo' +
        '_medio'
      '  , i.valor_unitario'
      '  , p.descri'
      '  , p.apresentacao'
      '  , p.descri_apresentacao'
      '  , u.unp_descricao'
      '  , u.unp_sigla'
      
        '  , substring(coalesce(nullif(trim(u.unp_sigla), '#39#39'), u.unp_desc' +
        'ricao) from 1 for 3) unidade_sigla'
      '  , uf.unp_descricao as unidade_fracionada'
      '  , coalesce(p.qtde, 0.0) as estoque'
      '  , coalesce(p.reserva, 0.0) as reserva'
      '  , coalesce(p.fracionador, 1.0) as fracionador'
      '  , p.movimenta_estoque'
      ''
      
        '  , sum(i.quantidade) - sum(coalesce(ai.qtde, 0.0)) as quantidad' +
        'e'
      ''
      'from TBAUTORIZA_COMPRA c'
      
        '  inner join TBAUTORIZA_COMPRAITEM i on (i.ano = c.ano and i.cod' +
        'igo = c.codigo and i.empresa = c.empresa)'
      
        '  inner join TBPRODUTO p on (p.cod = i.produto and p.aliquota_ti' +
        'po = 0)'
      
        '  left join TBAPROPRIACAO_ALMOX a on (a.autorizacao_ano = c.ano ' +
        'and a.autorizacao_num = c.codigo and a.autorizacao_emp = c.empre' +
        'sa and a.status <> 3)'
      
        '  left join TBAPROPRIACAO_ALMOX_ITEM ai on (ai.ano = a.ano and a' +
        'i.controle = a.controle and ai.produto = i.produto)'
      '  left join TBUNIDADEPROD u on (u.unp_cod = i.unidade)'
      
        '  left join TBUNIDADEPROD uf on (uf.unp_cod = p.codunidade_fraci' +
        'onada)'
      ''
      'where c.ano     = :ano'
      '  and c.codigo  = :cod'
      '  and c.empresa = :emp'
      ''
      'group by'
      '    i.produto'
      '  , i.unidade'
      '  , p.codunidade_fracionada'
      '  , ai.unidade'
      '  , coalesce(nullif(p.customedio, 0), i.valor_unitario)'
      '  , i.valor_unitario'
      '  , p.descri'
      '  , p.apresentacao'
      '  , p.descri_apresentacao'
      '  , u.unp_descricao'
      '  , u.unp_sigla'
      
        '  , substring(coalesce(nullif(trim(u.unp_sigla), '#39#39'), u.unp_desc' +
        'ricao) from 1 for 3)'
      '  , uf.unp_descricao'
      '  , coalesce(p.qtde, 0.0)'
      '  , coalesce(p.reserva, 0.0)'
      '  , coalesce(p.fracionador, 1.0)'
      '  , p.movimenta_estoque'
      '')
    Left = 784
    Top = 256
    ParamData = <
      item
        Name = 'ANO'
        DataType = ftSmallint
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'COD'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'EMP'
        DataType = ftString
        ParamType = ptInput
        Size = 18
      end>
  end
end
