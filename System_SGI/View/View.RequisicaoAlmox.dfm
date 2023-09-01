inherited ViewRequisicaoAlmox: TViewRequisicaoAlmox
  Left = 392
  Top = 212
  ActiveControl = dbCodigo
  Caption = 'Controle de Requisi'#231#245'es de Materiais'
  ClientHeight = 694
  ClientWidth = 1107
  ExplicitWidth = 1123
  ExplicitHeight = 733
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 690
    Width = 1107
    ExplicitTop = 682
    ExplicitWidth = 1116
  end
  inherited Bevel3: TBevel
    Top = 651
    Width = 1107
    ExplicitTop = 643
    ExplicitWidth = 1116
  end
  inherited pgcGuias: TPageControl
    Width = 1107
    Height = 651
    ActivePage = tbsCadastro
    OnChange = pgcGuiasChange
    ExplicitWidth = 1107
    ExplicitHeight = 651
    inherited tbsTabela: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 1099
      ExplicitHeight = 622
      inherited Bevel4: TBevel
        Top = 548
        Width = 1099
        ExplicitTop = 540
        ExplicitWidth = 1108
      end
      inherited dbgDados: TDBGrid
        Width = 1099
        Height = 548
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
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATA_EMISSAO'
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
            FieldName = 'CC_ORIGEM_DESC'
            Title.Caption = 'Centro de Custo Requisitante '
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
            FieldName = 'REQUISITANTE'
            Title.Caption = 'Respons'#225'vel '
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ATENDIMENTO_USUARIO'
            Title.Caption = 'Atendente '
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CC_DESTINO_DESC'
            Title.Caption = 'Centro de Custo destino '
            Width = 330
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        Top = 552
        Width = 1099
        ExplicitTop = 552
        ExplicitWidth = 1099
        inherited grpBxFiltro: TGroupBox
          Left = 496
          Width = 599
          TabOrder = 1
          ExplicitLeft = 496
          ExplicitWidth = 599
          inherited lbltFiltrar: TLabel
            AlignWithMargins = True
            Left = 300
            Top = 24
            Width = 93
            Height = 23
            Margins.Top = 9
            Margins.Bottom = 13
            Align = alRight
            Alignment = taRightJustify
            Caption = 'Centro de Custo:'
            Layout = tlCenter
            ExplicitLeft = 300
            ExplicitTop = 24
            ExplicitWidth = 93
          end
          object lblData: TLabel [1]
            AlignWithMargins = True
            Left = 30
            Top = 24
            Width = 49
            Height = 23
            Margins.Top = 9
            Margins.Bottom = 13
            Align = alRight
            Alignment = taRightJustify
            Caption = 'Emiss'#227'o:'
            FocusControl = e1Data
            Layout = tlCenter
            ExplicitHeight = 13
          end
          inherited edtFiltrar: TEdit
            Left = 399
            Width = 156
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 2
            ExplicitLeft = 399
            ExplicitWidth = 156
          end
          inherited btnFiltrar: TcxButton
            Left = 561
            TabOrder = 3
            ExplicitLeft = 561
          end
          object e1Data: TJvDateEdit
            AlignWithMargins = True
            Left = 85
            Top = 24
            Width = 100
            Height = 23
            Margins.Top = 9
            Margins.Bottom = 13
            Date = 40909.000000000000000000
            Align = alRight
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
            Left = 191
            Top = 24
            Width = 103
            Height = 23
            Margins.Top = 9
            Margins.Bottom = 13
            Date = 40909.000000000000000000
            Align = alRight
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
        object RdgStatusRequisicao: TRadioGroup
          AlignWithMargins = True
          Left = 256
          Top = 4
          Width = 237
          Height = 62
          Margins.Left = 0
          Margins.Top = 0
          Margins.Bottom = 0
          Align = alRight
          Caption = '&Status Requisi'#231#227'o'
          Columns = 3
          ItemIndex = 0
          Items.Strings = (
            '(Todas)'
            'Em edi'#231#227'o'
            'Aberta'
            'Enviada'
            'Recebida'
            'Atendida'
            'Cancelada')
          TabOrder = 0
        end
        object pnlStatus: TPanel
          AlignWithMargins = True
          Left = 7
          Top = 6
          Width = 246
          Height = 58
          Margins.Top = 2
          Margins.Bottom = 2
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 2
          object pnlSatusColor: TPanel
            Left = 0
            Top = 0
            Width = 24
            Height = 58
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 0
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
          end
          object pnlStatusText: TPanel
            Left = 24
            Top = 0
            Width = 222
            Height = 58
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object lblOperacaoAberta: TLabel
              AlignWithMargins = True
              Left = 3
              Top = 1
              Width = 216
              Height = 18
              Margins.Top = 1
              Margins.Bottom = 1
              Align = alTop
              AutoSize = False
              Caption = '* Requisi'#231#245'es Abertas'
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
              Width = 216
              Height = 18
              Margins.Top = 1
              Margins.Bottom = 1
              Align = alTop
              AutoSize = False
              Caption = '* Requisi'#231#245'es Canceladas'
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
              Width = 216
              Height = 18
              Margins.Top = 1
              Margins.Bottom = 1
              Align = alTop
              AutoSize = False
              Caption = '* Autoriza'#231#245'es Em Edi'#231#227'o'
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
      ExplicitWidth = 1099
      ExplicitHeight = 622
      inherited Bevel8: TBevel
        Top = 373
        Width = 1099
        ExplicitTop = 373
        ExplicitWidth = 1108
      end
      object Bevel6: TBevel [1]
        Left = 0
        Top = 492
        Width = 1099
        Height = 4
        Align = alBottom
        Shape = bsSpacer
        ExplicitTop = 484
        ExplicitWidth = 1108
      end
      inherited GrpBxDadosNominais: TGroupBox
        Width = 1099
        Height = 257
        ExplicitWidth = 1099
        ExplicitHeight = 257
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
          Left = 240
          Top = 104
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
        object lblDataEmissao: TLabel [4]
          Left = 384
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
        object lblUsuarioCadastro: TLabel [5]
          Left = 384
          Top = 104
          Width = 90
          Height = 13
          Caption = 'Cadastrada por:'
          FocusControl = dbUsuarioCadastro
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
        object lblCentroCustoRequisitante: TLabel [7]
          Left = 704
          Top = 24
          Width = 288
          Height = 13
          Caption = 'Departamento Requisitante / Centro de Custo Requisitante:'
          FocusControl = dbCentroCustoRequisitante
        end
        object lblUsuarioRequisitante: TLabel [8]
          Left = 512
          Top = 64
          Width = 139
          Height = 13
          Caption = 'Respons'#225'vel pela requisi'#231#227'o:'
          FocusControl = dbUsuarioRequisitante
        end
        object lblTipo: TLabel [9]
          Left = 16
          Top = 64
          Width = 24
          Height = 13
          Caption = 'Tipo:'
          FocusControl = dbTipo
        end
        object lblCentroCustoAtendente: TLabel [10]
          Left = 704
          Top = 64
          Width = 270
          Height = 13
          Caption = 'Departamento Atendente / Centro de Custo Atendente:'
          FocusControl = dbCentroCustoAtendente
        end
        object lblUsuarioAtendente: TLabel [11]
          Left = 616
          Top = 104
          Width = 76
          Height = 13
          Caption = 'Atendida por:'
          FocusControl = dbUsuarioAtendente
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblUsuarioCancelamento: TLabel [12]
          Left = 856
          Top = 104
          Width = 83
          Height = 13
          Caption = 'Cancelada por:'
          FocusControl = dbUsuarioCancelamento
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
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
          Left = 240
          Top = 120
          Width = 137
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
        object dbUsuarioCadastro: TDBEdit
          Left = 384
          Top = 120
          Width = 225
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'INSERCAO_USUARIO'
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
          Width = 137
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
        object PgcTextoRequisicao: TPageControl
          Left = 16
          Top = 152
          Width = 1073
          Height = 97
          ActivePage = TbsRequisicaoMotivo
          Style = tsFlatButtons
          TabOrder = 13
          object TbsRequisicaoMotivo: TTabSheet
            Caption = 'Motivo da requisi'#231#227'o'
            object dbMotivo: TDBMemo
              Left = 0
              Top = 0
              Width = 1065
              Height = 66
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
          object TbsRequisicaoCancelado: TTabSheet
            Caption = 'Motivo do cancelamento'
            ImageIndex = 2
            object dbMovitoCancelamento: TDBMemo
              Left = 0
              Top = 0
              Width = 1065
              Height = 66
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
          ListSource = dtsTipoRequisicao
          ParentFont = False
          TabOrder = 4
        end
        object dbUsuarioAtendente: TDBEdit
          Left = 616
          Top = 120
          Width = 233
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'ATENDIMENTO_USUARIO'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 11
        end
        object dbUsuarioCancelamento: TDBEdit
          Left = 856
          Top = 120
          Width = 233
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'CANCEL_USUARIO'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 12
        end
        object dbCentroCustoRequisitante: TJvDBComboEdit
          Left = 704
          Top = 40
          Width = 385
          Height = 21
          ButtonHint = 'Pesquisar Centro de Custo (Ctrl+P)'#13#10'Limpar Campo (Ctrl+L)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clMoneyGreen
          DataField = 'CC_ORIGEM_DESC'
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
          OnButtonClick = dbCentroCustoSelecionar
        end
        object dbCentroCustoAtendente: TJvDBComboEdit
          Left = 704
          Top = 80
          Width = 385
          Height = 21
          ButtonHint = 'Pesquisar Centro de Custo (Ctrl+P)'#13#10'Limpar Campo (Ctrl+L)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clMoneyGreen
          DataField = 'CC_DESTINO_DESC'
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
          OnButtonClick = dbCentroCustoSelecionar
        end
        object dbUsuarioRequisitante: TJvDBComboEdit
          Left = 512
          Top = 80
          Width = 185
          Height = 21
          ButtonHint = 'Pesquisar Usu'#225'rio (Ctrl+P)'#13#10'Limpar Campo (Ctrl+L)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clMoneyGreen
          DataField = 'USUARIO_REQUISITANTE'
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
          OnButtonClick = dbUsuarioRequisitanteButtonClick
        end
        object dbDataEmissao: TJvDBDateEdit
          Left = 384
          Top = 80
          Width = 121
          Height = 21
          DataField = 'DATA_EMISSAO'
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
        Top = 496
        Width = 1099
        Height = 126
        ActivePage = tbsObservacoes
        Align = alBottom
        TabOrder = 3
        object tbsObservacoes: TTabSheet
          Caption = 'Observa'#231#245'es'
          ImageIndex = 1
          object PnlObservacoes: TPanel
            Left = 0
            Top = 0
            Width = 1091
            Height = 98
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object dbObservacao: TDBMemo
              Left = 0
              Top = 0
              Width = 1091
              Height = 48
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
              Top = 48
              Width = 1091
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
                Transparent = True
              end
              object lblValorTotalCusto: TLabel
                Left = 160
                Top = 8
                Width = 95
                Height = 13
                Caption = 'Custo Total (R$):'
                FocusControl = dbValorTotalCusto
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = True
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
              object dbValorTotalCusto: TDBEdit
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
        Top = 257
        Width = 1099
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
        object lblQtde: TLabel
          Left = 88
          Top = 64
          Width = 60
          Height = 13
          Caption = 'Quantidade:'
          FocusControl = dbQtde
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
          Left = 424
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
          Left = 304
          Top = 64
          Width = 76
          Height = 13
          Caption = 'Custo Un. (R$):'
          FocusControl = dbCustoUn
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object LblAjuda: TLabel
          Left = 881
          Top = 16
          Width = 208
          Height = 78
          Alignment = taRightJustify
          Caption = 
            'IMPORTANTE:'#13#10#13#10'Apenas os produtos pertencentes ao'#13#10'Centro de Cus' +
            'to de atendimento que'#13#10'possuem estoque ser'#227'o exibidos na'#13#10'pesqui' +
            'sa.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object lblQtdeDisponivel: TLabel
          Left = 720
          Top = 24
          Width = 83
          Height = 13
          Caption = 'Qtde. Dispon'#237'vel:'
          FocusControl = dbQtdeDisponivel
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblQtdeAtendida: TLabel
          Left = 184
          Top = 64
          Width = 78
          Height = 13
          Caption = 'Qtde. Atendida:'
          FocusControl = dbQtdeAtendida
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblSituacaoProduto: TLabel
          Left = 656
          Top = 64
          Width = 52
          Height = 13
          Caption = 'Situa'#231#227'o:'
          FocusControl = dbSituacaoProduto
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
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
        object dbQtde: TDBEdit
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
            Top = 1
            Width = 70
            Height = 25
            Hint = 'Inserir Produto'
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
            Top = 73
            Width = 70
            Height = 25
            Hint = 'Salvar Produto'
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
          Left = 424
          Top = 80
          Width = 113
          Height = 21
          Color = clMoneyGreen
          DataField = 'TOTAL'
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
          Left = 304
          Top = 80
          Width = 113
          Height = 21
          Color = clMoneyGreen
          DataField = 'CUSTO'
          DataSource = DtSrcTabelaItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 7
          OnExit = ControlEditExit
        end
        object dbQtdeDisponivel: TDBEdit
          Left = 720
          Top = 40
          Width = 97
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'DISPONIVEL_TMP'
          DataSource = DtSrcTabelaItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
        object dbQtdeAtendida: TDBEdit
          Left = 184
          Top = 80
          Width = 113
          Height = 21
          Color = clMoneyGreen
          DataField = 'QTDE_ATENDIDA'
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
        object dbSituacaoProduto: TDBEdit
          Left = 656
          Top = 80
          Width = 161
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'STATUS'
          DataSource = DtSrcTabelaItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 9
        end
        object btnProdutoAtender: TBitBtn
          Left = 1014
          Top = 15
          Width = 75
          Height = 25
          Caption = '&1. Atender  '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 10
          Visible = False
          OnClick = btnProdutoAtenderClick
        end
        object btnProdutoAtenderTodos: TBitBtn
          Left = 1014
          Top = 39
          Width = 75
          Height = 25
          Caption = '&2. Atend. T.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 11
          Visible = False
          OnClick = btnProdutoAtenderTodosClick
        end
        object btnProdutoAguarda: TBitBtn
          Left = 1014
          Top = 63
          Width = 75
          Height = 25
          Caption = '&3. Aguardar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 12
          Visible = False
          OnClick = btnProdutoAguardaClick
        end
        object btnProdutoCancelar: TBitBtn
          Left = 1014
          Top = 87
          Width = 75
          Height = 25
          Caption = '&4. Cancelar '
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 13
          Visible = False
          OnClick = btnProdutoCancelarClick
        end
        object dbProduto: TJvDBComboEdit
          Left = 88
          Top = 40
          Width = 89
          Height = 21
          ButtonHint = 'Pesquisar Produto no Estoque (Ctrl+P)'
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
      end
      object dbgProdutos: TDBGrid
        Left = 0
        Top = 377
        Width = 1099
        Height = 115
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
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRI_APRESENTACAO'
            Title.Caption = 'Nome Amigo ou Descri'#231#227'o + Apresenta'#231#227'o '
            Width = 380
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTDE'
            Title.Caption = 'Solicitado '
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTDE_ATENDIDA'
            Title.Caption = 'Atendido '
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ESTOQUE'
            Font.Charset = ANSI_CHARSET
            Font.Color = clGreen
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            Title.Caption = 'Estoque '
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clGreen
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RESERVA'
            Font.Charset = ANSI_CHARSET
            Font.Color = clPurple
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            Title.Caption = 'Reservado '
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clPurple
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DISPONIVEL'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            Title.Caption = 'Dispon'#237'vel '
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clBlue
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UNP_SIGLA'
            Title.Caption = 'Und. '
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CUSTO'
            Title.Caption = 'Custo Un. (R$) '
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOTAL'
            Title.Caption = 'Custo Total (R$) '
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'STATUS'
            Title.Caption = 'Situa'#231#227'o '
            Width = 90
            Visible = True
          end>
      end
    end
  end
  inherited tlbBotoes: TPanel
    Top = 655
    Width = 1107
    ExplicitTop = 655
    ExplicitWidth = 1107
    inherited bvlTool3: TBevel
      Left = 1024
      ExplicitLeft = 1033
    end
    inherited bvlTool4: TBevel
      Left = 1103
      ExplicitLeft = 1112
    end
    object Bevel12: TBevel [5]
      Left = 1206
      Top = 2
      Width = 4
      Height = 31
      Shape = bsSpacer
    end
    inherited btbtnLista: TcxButton
      DropDownMenu = ppImprimir
      Kind = cxbkDropDown
      Visible = True
    end
    inherited btbtnFechar: TcxButton
      Left = 1028
      TabOrder = 11
      ExplicitLeft = 1028
    end
    inherited btbtnSelecionar: TcxButton
      Left = 914
      Width = 110
      TabOrder = 10
      ExplicitLeft = 914
      ExplicitWidth = 110
    end
    object btnFinalizarLancamento: TcxButton
      Tag = 11
      Left = 474
      Top = 0
      Width = 110
      Height = 35
      Hint = 'Finalizar Requisi'#231#227'o e Enviar'
      Align = alRight
      Caption = 'Finalizar Req.'
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
    object btnEnviarRequisicao: TcxButton
      Tag = 12
      Left = 584
      Top = 0
      Width = 110
      Height = 35
      Hint = 'Enviar Requisi'#231#227'o'
      Align = alRight
      Caption = 'Enviar Req.'
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
      Visible = False
      OnClick = btnEnviarRequisicaoClick
    end
    object btnCancelarRequisicao: TcxButton
      Tag = 13
      Left = 694
      Top = 0
      Width = 110
      Height = 35
      Hint = 'Cancelar Apropria'#231#227'o selecionada'
      Align = alRight
      Caption = 'Cancelar Req.'
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
      OnClick = btnCancelarRequisicaoClick
    end
    object btnConfirmarAtendimento: TcxButton
      Left = 804
      Top = 0
      Width = 110
      Height = 35
      Hint = 'Confirmar Atendimento da requisi'#231#227'o de materiais'
      Align = alRight
      Caption = 'Confirmar'
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
      TabOrder = 9
      Visible = False
      OnClick = btnConfirmarAtendimentoClick
    end
  end
  inherited DtSrcTabela: TDataSource
    Left = 392
    Top = 0
  end
  inherited ImgList: TImageList
    Left = 360
    Top = 0
  end
  object dtsEmpresa: TDataSource
    Left = 456
  end
  object DtSrcTabelaItens: TDataSource
    AutoEdit = False
    OnStateChange = DtSrcTabelaItensStateChange
    OnDataChange = DtSrcTabelaItensDataChange
    Left = 424
  end
  object ppImprimir: TPopupMenu
    Images = ImgList
    Left = 32
    Top = 440
    object nmImprimirRequisicaoAlmox: TMenuItem
      Caption = 'Requisi'#231#227'o ao Estoque (Almoxarifado)'
      ImageIndex = 16
      OnClick = nmImprimirRequisicaoAlmoxClick
    end
    object nmImprimirManifesto: TMenuItem
      Caption = 'Manifesto'
      OnClick = nmImprimirManifestoClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object nmImprimirOrdemEntregaA4: TMenuItem
      Caption = 'Ordem de Entrega - Formato A4 (Normal)'
      OnClick = nmImprimirOrdemEntregaA4Click
    end
    object nmImprimirOrdemEntregaA5: TMenuItem
      Tag = 1
      Caption = 'Ordem de Entrega - Formato A5 (Pequeno)'
      OnClick = nmImprimirOrdemEntregaA4Click
    end
  end
  object dtsTipoRequisicao: TDataSource
    Left = 488
  end
end
