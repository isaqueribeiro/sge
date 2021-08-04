inherited frmGeRequisicaoCompra: TfrmGeRequisicaoCompra
  Left = 396
  Top = 223
  Caption = 'Controle de Requisi'#231#245'es de Compra/Servi'#231'o'
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
    OnChange = pgcGuiasChange
    ExplicitWidth = 1116
    ExplicitHeight = 642
    inherited tbsTabela: TTabSheet
      ExplicitLeft = 0
      ExplicitTop = 0
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
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EMISSAO_DATA'
            Title.Caption = 'Emiss'#227'o '
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALIDADE'
            Title.Caption = 'Validade '
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
            FieldName = 'NOMEFORN'
            Title.Caption = 'Fornecedor '
            Width = 330
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
            FieldName = 'EMISSAO_USUARIO'
            Title.Caption = 'Emissor / Solicitante '
            Width = 130
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
        object lblRequisicaoAberta: TLabel [0]
          Left = 2
          Top = 4
          Width = 125
          Height = 13
          Caption = '* Requisi'#231#245'es Abertas'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object lblRequisicaoCancelada: TLabel [1]
          Left = 2
          Top = 24
          Width = 144
          Height = 13
          Caption = '* Requisi'#231#245'es Canceladas'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object lblRequisicaoEmEdicao: TLabel [2]
          Left = 2
          Top = 44
          Width = 136
          Height = 13
          Caption = '* Requisi'#231#245'es Em Edi'#231#227'o'
          Color = clYellow
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = False
        end
        inherited grpBxFiltro: TGroupBox
          Left = 424
          Width = 680
          Height = 62
          TabOrder = 1
          ExplicitLeft = 424
          ExplicitWidth = 680
          ExplicitHeight = 62
          DesignSize = (
            680
            62)
          inherited lbltFiltrar: TLabel
            Left = 294
            Width = 140
            Caption = 'Requisi'#231#227'o / Fornecedor:'
            ExplicitLeft = 294
            ExplicitWidth = 140
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
            Left = 448
            Width = 183
            TabOrder = 2
            ExplicitLeft = 448
            ExplicitWidth = 183
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
        object RdgStatusRequisicao: TRadioGroup
          Left = 198
          Top = 4
          Width = 226
          Height = 62
          Align = alRight
          Caption = '&Status Requisi'#231#227'o'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            '(Todas)'
            'Em Edi'#231#227'o'
            'Aberta'
            'Requisitada'
            'Faturada'
            'Cancelada')
          TabOrder = 0
        end
      end
    end
    inherited tbsCadastro: TTabSheet
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
        object lblFornecedor: TLabel [3]
          Left = 672
          Top = 24
          Width = 59
          Height = 13
          Caption = 'Fornecedor:'
          FocusControl = dbFornecedor
        end
        object lblSituacao: TLabel [4]
          Left = 640
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
        object lblDataEmissao: TLabel [5]
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
        object lblUsuario: TLabel [6]
          Left = 792
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
        object lblAutorizador: TLabel [7]
          Left = 944
          Top = 64
          Width = 97
          Height = 13
          Caption = 'Requisitador por:'
          FocusControl = dbAutorizador
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblNumero: TLabel [8]
          Left = 240
          Top = 64
          Width = 41
          Height = 13
          Caption = 'N'#250'mero:'
          FocusControl = dbNumero
        end
        object lblTipo: TLabel [9]
          Left = 16
          Top = 64
          Width = 24
          Height = 13
          Caption = 'Tipo:'
          FocusControl = dbTipo
        end
        object lblDataValidade: TLabel [10]
          Left = 512
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
        object lblNomeContato: TLabel [11]
          Left = 16
          Top = 104
          Width = 73
          Height = 13
          Caption = 'Nome Contato:'
          FocusControl = dbNomeContato
        end
        object lblCliente: TLabel [12]
          Left = 16
          Top = 144
          Width = 37
          Height = 13
          Caption = 'Cliente:'
          FocusControl = dbCliente
        end
        object lblCentroCusto: TLabel [13]
          Left = 16
          Top = 184
          Width = 162
          Height = 13
          Caption = 'Departamento / Centro de Custo:'
          FocusControl = dbCentroCusto
        end
        inherited dbCodigo: TDBEdit
          Width = 89
          Color = clMoneyGreen
          DataField = 'CODIGO'
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
          Width = 425
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
          Left = 640
          Top = 80
          Width = 145
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
          TabOrder = 7
        end
        object dbUsuario: TDBEdit
          Left = 792
          Top = 80
          Width = 145
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'EMISSAO_USUARIO'
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
        object dbAutorizador: TDBEdit
          Left = 944
          Top = 80
          Width = 145
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'REQUISITADO_USUARIO'
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
        object dbNomeContato: TDBEdit
          Left = 16
          Top = 120
          Width = 361
          Height = 21
          CharCase = ecUpperCase
          DataField = 'NOME_CONTATO'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 11
        end
        object PgcTextoRequisicao: TPageControl
          Left = 384
          Top = 104
          Width = 705
          Height = 122
          ActivePage = TbsRequisicaoMotivo
          Style = tsFlatButtons
          TabOrder = 14
          object TbsRequisicaoMotivo: TTabSheet
            Caption = 'Motivo do pedido de autoriza'#231#227'o'
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
            object dbMotivo: TDBMemo
              Left = 0
              Top = 0
              Width = 697
              Height = 91
              Align = alClient
              DataField = 'MOVITO'
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
          object TbsRequisicaoObservacao: TTabSheet
            Caption = 'Observa'#231#245'es Gerais'
            ImageIndex = 1
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
            object dbObservacao: TDBMemo
              Left = 0
              Top = 0
              Width = 697
              Height = 91
              Align = alClient
              DataField = 'OBSERVACAO'
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
            Caption = 'Motivo do Cancelamento'
            ImageIndex = 2
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
            object dbMovitoCancelamento: TDBMemo
              Left = 0
              Top = 0
              Width = 697
              Height = 91
              TabStop = False
              Align = alClient
              DataField = 'CANCELADO_MOTIVO'
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
        object dbFornecedor: TJvDBComboEdit
          Left = 672
          Top = 40
          Width = 417
          Height = 21
          ButtonHint = 'Pesquisar Fornecedor (Ctrl+P)'
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
          TabOrder = 3
          OnButtonClick = dbFornecedorButtonClick
        end
        object dbCliente: TJvDBComboEdit
          Left = 16
          Top = 160
          Width = 361
          Height = 21
          ButtonHint = 'Pesquisar Cliente (Ctrl+P)'#13#10'Limpar Campo (Ctrl+L)'
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
          TabOrder = 12
          OnButtonClick = dbClienteButtonClick
        end
        object dbCentroCusto: TJvDBComboEdit
          Left = 16
          Top = 200
          Width = 361
          Height = 21
          ButtonHint = 'Pesquisar Centro de Custo (Ctrl+P)'#13#10'Limpar Campo (Ctrl+L)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clMoneyGreen
          DataField = 'DESCRICAO_CENTRO_CUSTO'
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
          TabOrder = 13
          OnButtonClick = dbCentroCustoButtonClick
        end
        object dbDataEmissao: TJvDBDateEdit
          Left = 384
          Top = 80
          Width = 121
          Height = 21
          DataField = 'EMISSAO_DATA'
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
        object dbDataValidade: TJvDBDateEdit
          Left = 512
          Top = 80
          Width = 121
          Height = 21
          DataField = 'VALIDADE'
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
          TabOrder = 10
        end
      end
      object pgcMaisDados: TPageControl
        Left = 0
        Top = 447
        Width = 1108
        Height = 166
        ActivePage = tbsFormaPagto
        Align = alBottom
        TabOrder = 3
        object tbsFormaPagto: TTabSheet
          Caption = 'Forma de Pagamento / Entrega'
          ImageIndex = 1
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object GrpBxPagamento: TGroupBox
            Left = 0
            Top = 0
            Width = 1100
            Height = 73
            Align = alTop
            Caption = 'Pagamento'
            TabOrder = 0
            object lblFormaPagto: TLabel
              Left = 16
              Top = 24
              Width = 34
              Height = 13
              Caption = '&Forma:'
              FocusControl = dbFormaPagto
            end
            object lblCondicaoPagto: TLabel
              Left = 184
              Top = 24
              Width = 48
              Height = 13
              Caption = 'Condi'#231#227'o:'
              FocusControl = dbCondicaoPagto
            end
            object lblTotalDesconto: TLabel
              Left = 848
              Top = 24
              Width = 73
              Height = 13
              Caption = 'Desconto (R$):'
              FocusControl = dbTotalDesconto
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblTotalLiquido: TLabel
              Left = 968
              Top = 24
              Width = 79
              Height = 13
              Caption = 'Valor Total (R$):'
              FocusControl = dbTotalLiquido
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblTotalFrete: TLabel
              Left = 608
              Top = 24
              Width = 54
              Height = 13
              Caption = 'Frete (R$):'
              FocusControl = dbTotalFrete
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblTotalIPI: TLabel
              Left = 728
              Top = 24
              Width = 69
              Height = 13
              Caption = 'Total IPI (R$):'
              FocusControl = dbTotalIPI
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblTotalBruto: TLabel
              Left = 488
              Top = 24
              Width = 81
              Height = 13
              Caption = 'Total Bruto (R$):'
              FocusControl = dbTotalBruto
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object dbFormaPagto: TDBLookupComboBox
              Left = 16
              Top = 40
              Width = 161
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
              TabOrder = 0
            end
            object dbCondicaoPagto: TDBLookupComboBox
              Left = 184
              Top = 40
              Width = 297
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
              TabOrder = 1
            end
            object dbTotalDesconto: TDBEdit
              Left = 848
              Top = 40
              Width = 113
              Height = 21
              Color = clWhite
              DataField = 'VALOR_DESCONTO'
              DataSource = DtSrcTabela
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 5
            end
            object dbTotalLiquido: TDBEdit
              Left = 968
              Top = 40
              Width = 113
              Height = 21
              Color = clMoneyGreen
              DataField = 'VALOR_TOTAL'
              DataSource = DtSrcTabela
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
            object dbTotalFrete: TDBEdit
              Left = 608
              Top = 40
              Width = 113
              Height = 21
              Color = clWhite
              DataField = 'VALOR_TOTAL_FRETE'
              DataSource = DtSrcTabela
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
            end
            object dbTotalIPI: TDBEdit
              Left = 728
              Top = 40
              Width = 113
              Height = 21
              Color = clMoneyGreen
              DataField = 'VALOR_TOTAL_IPI'
              DataSource = DtSrcTabela
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 4
              OnExit = ControlEditExit
            end
            object dbTotalBruto: TDBEdit
              Left = 488
              Top = 40
              Width = 113
              Height = 21
              Color = clMoneyGreen
              DataField = 'VALOR_BRUTO'
              DataSource = DtSrcTabela
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
              OnExit = ControlEditExit
            end
          end
          object pnlRetiradaEntrega: TPanel
            Left = 0
            Top = 73
            Width = 1100
            Height = 65
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object lblEnderecoEntrega: TLabel
              Left = 0
              Top = 4
              Width = 160
              Height = 13
              Align = alTop
              Caption = 'Endere'#231'o de Entrega/Realiza'#231#227'o:'
              FocusControl = dbEnderecoEntrega
            end
            object Bevel5: TBevel
              Left = 0
              Top = 0
              Width = 1100
              Height = 4
              Align = alTop
              Shape = bsSpacer
            end
            object Bevel9: TBevel
              Left = 0
              Top = 17
              Width = 1100
              Height = 4
              Align = alTop
              Shape = bsSpacer
            end
            object dbEnderecoEntrega: TDBMemo
              Left = 0
              Top = 21
              Width = 1100
              Height = 44
              Align = alClient
              DataField = 'ENDERECO_ENTREGA'
              DataSource = DtSrcTabela
              ScrollBars = ssVertical
              TabOrder = 0
            end
          end
        end
        object tbsRetirada: TTabSheet
          Caption = 'Dados de Retirada'
          ImageIndex = 1
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object GrpBxRetirada: TGroupBox
            Left = 0
            Top = 0
            Width = 1100
            Height = 72
            Align = alTop
            Caption = 'Respons'#225'vel pela retirada'
            TabOrder = 0
            object lblRecebedorNome: TLabel
              Left = 488
              Top = 24
              Width = 31
              Height = 13
              Caption = 'Nome:'
              FocusControl = dbRecebedorNome
            end
            object lblRecebedorCPF: TLabel
              Left = 944
              Top = 24
              Width = 41
              Height = 13
              Caption = 'RG/CPF:'
              FocusControl = dbRecebedorCPF
            end
            object lblRecebedorFuncao: TLabel
              Left = 728
              Top = 24
              Width = 78
              Height = 13
              Caption = 'Cargo / Fun'#231#227'o:'
              FocusControl = dbRecebedorFuncao
            end
            object lblTransportador: TLabel
              Left = 16
              Top = 24
              Width = 73
              Height = 13
              Caption = '&Transportador:'
              FocusControl = dbTransportador
            end
            object dbRecebedorNome: TDBEdit
              Left = 488
              Top = 40
              Width = 233
              Height = 21
              CharCase = ecUpperCase
              DataField = 'RECEBEDOR_NOME'
              DataSource = DtSrcTabela
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
            object dbRecebedorCPF: TDBEdit
              Left = 944
              Top = 40
              Width = 137
              Height = 21
              CharCase = ecUpperCase
              DataField = 'RECEBEDOR_CPF'
              DataSource = DtSrcTabela
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
            end
            object dbRecebedorFuncao: TDBEdit
              Left = 728
              Top = 40
              Width = 209
              Height = 21
              CharCase = ecUpperCase
              DataField = 'RECEBEDOR_FUNCAO'
              DataSource = DtSrcTabela
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
            end
            object dbTransportador: TDBLookupComboBox
              Left = 16
              Top = 40
              Width = 465
              Height = 21
              DataField = 'TRANSPORTADOR'
              DataSource = DtSrcTabela
              DropDownRows = 10
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              KeyField = 'CODFORN'
              ListField = 'NOMEFORN'
              ListSource = dtsTransportador
              ParentFont = False
              TabOrder = 0
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
        Caption = 'Dados do produto/servi'#231'o'
        TabOrder = 1
        object lblProduto: TLabel
          Left = 88
          Top = 24
          Width = 81
          Height = 13
          Caption = 'Produto/Servi'#231'o:'
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
        end
        object Bevel7: TBevel
          Left = 2
          Top = 15
          Width = 4
          Height = 99
          Align = alLeft
          Shape = bsSpacer
        end
        object lblValorTotal: TLabel
          Left = 488
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
        object lblValorUn: TLabel
          Left = 184
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
        object lblValorTotalIPI: TLabel
          Left = 368
          Top = 64
          Width = 69
          Height = 13
          Caption = 'Total IPI (R$):'
          FocusControl = dbValorTotalIPI
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblPercentualIPI: TLabel
          Left = 304
          Top = 64
          Width = 32
          Height = 13
          Caption = '% IPI:'
          FocusControl = dbPercentualIPI
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
          DataField = 'QUANTIDADE'
          DataSource = DtSrcTabelaItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
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
        object dbValorTotal: TDBEdit
          Left = 488
          Top = 80
          Width = 113
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
          TabOrder = 8
          OnExit = ControlEditExit
        end
        object dbValorUn: TDBEdit
          Left = 184
          Top = 80
          Width = 113
          Height = 21
          Color = clWhite
          DataField = 'VALOR_UNITARIO'
          DataSource = DtSrcTabelaItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
        object dbValorTotalIPI: TDBEdit
          Left = 368
          Top = 80
          Width = 113
          Height = 21
          Color = clMoneyGreen
          DataField = 'IPI_VALOR_TOTAL'
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
        object dbPercentualIPI: TDBEdit
          Left = 304
          Top = 80
          Width = 57
          Height = 21
          Color = clWhite
          DataField = 'IPI_PERCENTUAL'
          DataSource = DtSrcTabelaItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
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
            FieldName = 'SEQ'
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
            Title.Caption = 'Descri'#231#227'o + Apresenta'#231#227'o '
            Width = 450
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QUANTIDADE'
            Title.Caption = 'Quantidade '
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
            FieldName = 'VALOR_UNITARIO'
            Title.Caption = 'Valor Un. (R$) '
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IPI_VALOR_TOTAL'
            Title.Caption = 'Total IPI (R$) '
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_TOTAL'
            Title.Caption = 'Valor Total (R$) '
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
    object btnFinalizarRequisicao: TcxButton
      Tag = 11
      Left = 553
      Top = 0
      Width = 120
      Height = 35
      Hint = 'Finalizar Requisi'#231#227'o'
      Align = alRight
      Caption = 'Finalizar'
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
      TabOrder = 7
      OnClick = btnFinalizarRequisicaoClick
    end
    object btnRequisitarReabrir: TcxButton
      Tag = 12
      Left = 673
      Top = 0
      Width = 120
      Height = 35
      Hint = 'Requisitar Compra/Servi'#231'o'
      Align = alRight
      Caption = 'Requisitar/Reabrir'
      DropDownMenu = ppRequisicao
      Kind = cxbkDropDown
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
      TabOrder = 6
    end
    object btnCancelarRequisicao: TcxButton
      Tag = 13
      Left = 793
      Top = 0
      Width = 120
      Height = 35
      Hint = 'Cancelar Requisi'#231#227'o Selecionada'
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
  end
  inherited IbDtstTabela: TIBDataSet
    SelectSQL.Strings = ()
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
      '  CODIGO,'
      '  EMPRESA,'
      '  NUMERO,'
      '  FORNECEDOR,'
      '  NOME_CONTATO,'
      '  TIPO,'
      '  INSERCAO_DATA,'
      '  EMISSAO_DATA,'
      '  EMISSAO_USUARIO,'
      '  VALIDADE,'
      '  COMPETENCIA,'
      '  DATA_FATURA,'
      '  MOVITO,'
      '  OBSERVACAO,'
      '  CLIENTE,'
      '  CENTRO_CUSTO,'
      '  ENDERECO_ENTREGA,'
      '  STATUS,'
      '  REQUISITADO_DATA,'
      '  REQUISITADO_USUARIO,'
      '  CANCELADO_DATA,'
      '  CANCELADO_USUARIO,'
      '  CANCELADO_MOTIVO,'
      '  RECEBEDOR_NOME,'
      '  RECEBEDOR_CPF,'
      '  RECEBEDOR_FUNCAO,'
      '  FORMA_PAGTO,'
      '  CONDICAO_PAGTO,'
      '  TRANSPORTADOR,'
      '  VALOR_BRUTO,'
      '  VALOR_DESCONTO,'
      '  VALOR_TOTAL_FRETE,'
      '  VALOR_TOTAL_IPI,'
      '  VALOR_TOTAL'
      'from TBREQUISITA_COMPRA '
      'where'
      '  ANO = :ANO and'
      '  CODIGO = :CODIGO and'
      '  EMPRESA = :EMPRESA')
    ModifySQL.Strings = (
      'update TBREQUISITA_COMPRA'
      'set'
      '  ANO = :ANO,'
      '  CANCELADO_DATA = :CANCELADO_DATA,'
      '  CANCELADO_MOTIVO = :CANCELADO_MOTIVO,'
      '  CANCELADO_USUARIO = :CANCELADO_USUARIO,'
      '  CENTRO_CUSTO = :CENTRO_CUSTO,'
      '  CLIENTE = :CLIENTE,'
      '  CODIGO = :CODIGO,'
      '  COMPETENCIA = :COMPETENCIA,'
      '  CONDICAO_PAGTO = :CONDICAO_PAGTO,'
      '  DATA_FATURA = :DATA_FATURA,'
      '  EMISSAO_DATA = :EMISSAO_DATA,'
      '  EMISSAO_USUARIO = :EMISSAO_USUARIO,'
      '  EMPRESA = :EMPRESA,'
      '  ENDERECO_ENTREGA = :ENDERECO_ENTREGA,'
      '  FORMA_PAGTO = :FORMA_PAGTO,'
      '  FORNECEDOR = :FORNECEDOR,'
      '  INSERCAO_DATA = :INSERCAO_DATA,'
      '  MOVITO = :MOVITO,'
      '  NOME_CONTATO = :NOME_CONTATO,'
      '  NUMERO = :NUMERO,'
      '  OBSERVACAO = :OBSERVACAO,'
      '  RECEBEDOR_CPF = :RECEBEDOR_CPF,'
      '  RECEBEDOR_FUNCAO = :RECEBEDOR_FUNCAO,'
      '  RECEBEDOR_NOME = :RECEBEDOR_NOME,'
      '  REQUISITADO_DATA = :REQUISITADO_DATA,'
      '  REQUISITADO_USUARIO = :REQUISITADO_USUARIO,'
      '  STATUS = :STATUS,'
      '  TIPO = :TIPO,'
      '  TRANSPORTADOR = :TRANSPORTADOR,'
      '  VALIDADE = :VALIDADE,'
      '  VALOR_BRUTO = :VALOR_BRUTO,'
      '  VALOR_DESCONTO = :VALOR_DESCONTO,'
      '  VALOR_TOTAL = :VALOR_TOTAL,'
      '  VALOR_TOTAL_FRETE = :VALOR_TOTAL_FRETE,'
      '  VALOR_TOTAL_IPI = :VALOR_TOTAL_IPI'
      'where'
      '  ANO = :OLD_ANO and'
      '  CODIGO = :OLD_CODIGO and'
      '  EMPRESA = :OLD_EMPRESA')
    InsertSQL.Strings = (
      'insert into TBREQUISITA_COMPRA'
      
        '  (ANO, CANCELADO_DATA, CANCELADO_MOTIVO, CANCELADO_USUARIO, CEN' +
        'TRO_CUSTO, '
      
        '   CLIENTE, CODIGO, COMPETENCIA, CONDICAO_PAGTO, DATA_FATURA, EM' +
        'ISSAO_DATA, '
      
        '   EMISSAO_USUARIO, EMPRESA, ENDERECO_ENTREGA, FORMA_PAGTO, FORN' +
        'ECEDOR, '
      
        '   INSERCAO_DATA, MOVITO, NOME_CONTATO, NUMERO, OBSERVACAO, RECE' +
        'BEDOR_CPF, '
      
        '   RECEBEDOR_FUNCAO, RECEBEDOR_NOME, REQUISITADO_DATA, REQUISITA' +
        'DO_USUARIO, '
      
        '   STATUS, TIPO, TRANSPORTADOR, VALIDADE, VALOR_BRUTO, VALOR_DES' +
        'CONTO, '
      '   VALOR_TOTAL, VALOR_TOTAL_FRETE, VALOR_TOTAL_IPI)'
      'values'
      
        '  (:ANO, :CANCELADO_DATA, :CANCELADO_MOTIVO, :CANCELADO_USUARIO,' +
        ' :CENTRO_CUSTO, '
      
        '   :CLIENTE, :CODIGO, :COMPETENCIA, :CONDICAO_PAGTO, :DATA_FATUR' +
        'A, :EMISSAO_DATA, '
      
        '   :EMISSAO_USUARIO, :EMPRESA, :ENDERECO_ENTREGA, :FORMA_PAGTO, ' +
        ':FORNECEDOR, '
      
        '   :INSERCAO_DATA, :MOVITO, :NOME_CONTATO, :NUMERO, :OBSERVACAO,' +
        ' :RECEBEDOR_CPF, '
      
        '   :RECEBEDOR_FUNCAO, :RECEBEDOR_NOME, :REQUISITADO_DATA, :REQUI' +
        'SITADO_USUARIO, '
      
        '   :STATUS, :TIPO, :TRANSPORTADOR, :VALIDADE, :VALOR_BRUTO, :VAL' +
        'OR_DESCONTO, '
      '   :VALOR_TOTAL, :VALOR_TOTAL_FRETE, :VALOR_TOTAL_IPI)')
    DeleteSQL.Strings = (
      'delete from TBREQUISITA_COMPRA'
      'where'
      '  ANO = :OLD_ANO and'
      '  CODIGO = :OLD_CODIGO and'
      '  EMPRESA = :OLD_EMPRESA')
    Top = 8
  end
  inherited ImgList: TImageList
    Left = 912
    Top = 272
  end
  inherited fdQryTabela: TFDQuery
    BeforePost = fdQryTabelaBeforePost
    AfterCancel = fdQryTabelaAfterCancel
    AfterScroll = fdQryTabelaAfterScroll
    UpdateOptions.AssignedValues = [uvFetchGeneratorsPoint, uvGeneratorName]
    UpdateOptions.FetchGeneratorsPoint = gpImmediate
    UpdateOptions.GeneratorName = 'GEN_REQUISICAO_2013'
    UpdateOptions.UpdateTableName = 'TBREQUISITA_COMPRA'
    UpdateOptions.KeyFields = 'ANO;CODIGO;EMPRESA'
    UpdateOptions.AutoIncFields = 'CODIGO'
    SQL.Strings = (
      'Select'
      '    r.ano'
      '  , r.codigo'
      '  , r.empresa'
      '  , r.numero'
      '  , r.fornecedor'
      '  , r.nome_contato'
      '  , r.tipo'
      '  , r.insercao_data'
      '  , r.emissao_data'
      '  , r.emissao_usuario'
      '  , r.validade'
      '  , r.competencia'
      '  , r.movito'
      '  , r.observacao'
      '  , r.cliente'
      '  , r.centro_custo'
      '  , r.endereco_entrega'
      '  , r.status'
      '  , r.recebedor_nome'
      '  , r.recebedor_cpf'
      '  , r.recebedor_funcao'
      '  , r.forma_pagto'
      '  , r.condicao_pagto'
      '  , r.transportador'
      '  , r.valor_bruto'
      '  , r.valor_desconto'
      '  , r.valor_total_frete'
      '  , r.valor_total_ipi'
      '  , r.valor_total'
      '  , r.requisitado_data'
      '  , r.data_fatura'
      '  , r.requisitado_usuario'
      '  , r.cancelado_data'
      '  , r.cancelado_usuario'
      '  , r.cancelado_motivo'
      
        '  , (Select count(x.seq) from TBREQUISITA_COMPRAITEM x where x.a' +
        'no = r.ano and x.codigo = r.codigo and x.empresa = r.empresa) as' +
        ' itens'
      
        '  , (Select count(y.autorizacao_ano) from TBAUTORIZA_REQUISITA y' +
        ' where y.requisicao_ano = r.ano and y.requisicao_cod = r.codigo ' +
        'and y.requisicao_emp = r.empresa) as autorizacoes'
      '  , f.nomeforn'
      '  , f.cnpj'
      '  , f.pessoa_fisica'
      '  , f.faturamento_minimo'
      '  , t.nomeforn as transportador_nome'
      '  , t.cnpj     as transportador_cpf_cnpj'
      '  , c.nome     as nomecliente'
      '  , u.descricao as descricao_centro_custo'
      'from TBREQUISITA_COMPRA r'
      '  left join TBFORNECEDOR f on (f.codforn = r.fornecedor)'
      '  left join TBFORNECEDOR t on (t.codforn = r.transportador)'
      '  left join TBCLIENTE c on (c.codigo = r.cliente)'
      '  left join TBCENTRO_CUSTO u on (u.codigo = r.centro_custo)')
    Top = 48
    object fdQryTabelaANO: TSmallintField
      FieldName = 'ANO'
      Origin = 'ANO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object fdQryTabelaCODIGO: TFDAutoIncField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      IdentityInsert = True
    end
    object fdQryTabelaEMPRESA: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      Origin = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 18
    end
    object fdQryTabelaNUMERO: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Required = True
    end
    object fdQryTabelaFORNECEDOR: TIntegerField
      DisplayLabel = 'Fornecedor'
      FieldName = 'FORNECEDOR'
      Origin = 'FORNECEDOR'
      Required = True
    end
    object fdQryTabelaNOME_CONTATO: TStringField
      FieldName = 'NOME_CONTATO'
      Origin = 'NOME_CONTATO'
      Size = 100
    end
    object fdQryTabelaTIPO: TSmallintField
      Alignment = taLeftJustify
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Required = True
      OnGetText = fdQryTabelaTIPOGetText
    end
    object fdQryTabelaINSERCAO_DATA: TSQLTimeStampField
      FieldName = 'INSERCAO_DATA'
      Origin = 'INSERCAO_DATA'
      OnGetText = fdQryTabelaINSERCAO_DATAGetText
    end
    object fdQryTabelaEMISSAO_DATA: TDateField
      DisplayLabel = 'Data Emiss'#227'o'
      FieldName = 'EMISSAO_DATA'
      Origin = 'EMISSAO_DATA'
      Required = True
      DisplayFormat = 'dd/mm/yyyy'
    end
    object fdQryTabelaEMISSAO_USUARIO: TStringField
      FieldName = 'EMISSAO_USUARIO'
      Origin = 'EMISSAO_USUARIO'
      Size = 12
    end
    object fdQryTabelaVALIDADE: TDateField
      DisplayLabel = 'Validade'
      FieldName = 'VALIDADE'
      Origin = 'VALIDADE'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object fdQryTabelaCOMPETENCIA: TIntegerField
      FieldName = 'COMPETENCIA'
      Origin = 'COMPETENCIA'
    end
    object fdQryTabelaMOVITO: TMemoField
      FieldName = 'MOVITO'
      Origin = 'MOVITO'
      BlobType = ftMemo
    end
    object fdQryTabelaOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      Origin = 'OBSERVACAO'
      BlobType = ftMemo
    end
    object fdQryTabelaCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
      Origin = 'CLIENTE'
    end
    object fdQryTabelaCENTRO_CUSTO: TIntegerField
      DisplayLabel = 'Departamento / Centro de Custo'
      FieldName = 'CENTRO_CUSTO'
      Origin = 'CENTRO_CUSTO'
    end
    object fdQryTabelaENDERECO_ENTREGA: TMemoField
      FieldName = 'ENDERECO_ENTREGA'
      Origin = 'ENDERECO_ENTREGA'
      BlobType = ftMemo
    end
    object fdQryTabelaSTATUS: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'STATUS'
      Origin = 'STATUS'
      OnGetText = fdQryTabelaSTATUSGetText
    end
    object fdQryTabelaRECEBEDOR_NOME: TStringField
      FieldName = 'RECEBEDOR_NOME'
      Origin = 'RECEBEDOR_NOME'
      Size = 100
    end
    object fdQryTabelaRECEBEDOR_CPF: TStringField
      FieldName = 'RECEBEDOR_CPF'
      Origin = 'RECEBEDOR_CPF'
      Size = 18
    end
    object fdQryTabelaRECEBEDOR_FUNCAO: TStringField
      FieldName = 'RECEBEDOR_FUNCAO'
      Origin = 'RECEBEDOR_FUNCAO'
      Size = 50
    end
    object fdQryTabelaFORMA_PAGTO: TSmallintField
      DisplayLabel = 'Forma de Pagamento'
      FieldName = 'FORMA_PAGTO'
      Origin = 'FORMA_PAGTO'
      Required = True
    end
    object fdQryTabelaCONDICAO_PAGTO: TSmallintField
      DisplayLabel = 'Condi'#231#227'o de Pagamento'
      FieldName = 'CONDICAO_PAGTO'
      Origin = 'CONDICAO_PAGTO'
      Required = True
    end
    object fdQryTabelaTRANSPORTADOR: TIntegerField
      FieldName = 'TRANSPORTADOR'
      Origin = 'TRANSPORTADOR'
    end
    object fdQryTabelaREQUISITADO_DATA: TDateField
      DisplayLabel = 'Data Requisi'#231#227'o'
      FieldName = 'REQUISITADO_DATA'
      Origin = 'REQUISITADO_DATA'
    end
    object fdQryTabelaDATA_FATURA: TDateField
      FieldName = 'DATA_FATURA'
      Origin = 'DATA_FATURA'
    end
    object fdQryTabelaREQUISITADO_USUARIO: TStringField
      FieldName = 'REQUISITADO_USUARIO'
      Origin = 'REQUISITADO_USUARIO'
      Size = 12
    end
    object fdQryTabelaCANCELADO_DATA: TDateField
      FieldName = 'CANCELADO_DATA'
      Origin = 'CANCELADO_DATA'
    end
    object fdQryTabelaCANCELADO_USUARIO: TStringField
      FieldName = 'CANCELADO_USUARIO'
      Origin = 'CANCELADO_USUARIO'
      Size = 12
    end
    object fdQryTabelaCANCELADO_MOTIVO: TMemoField
      FieldName = 'CANCELADO_MOTIVO'
      Origin = 'CANCELADO_MOTIVO'
      BlobType = ftMemo
    end
    object fdQryTabelaITENS: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ITENS'
      Origin = 'ITENS'
      ProviderFlags = []
    end
    object fdQryTabelaAUTORIZACOES: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'AUTORIZACOES'
      Origin = 'AUTORIZACOES'
      ProviderFlags = []
    end
    object fdQryTabelaNOMEFORN: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOMEFORN'
      Origin = 'NOMEFORN'
      ProviderFlags = []
      Size = 100
    end
    object fdQryTabelaCNPJ: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      ProviderFlags = []
      Size = 18
    end
    object fdQryTabelaPESSOA_FISICA: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'PESSOA_FISICA'
      Origin = 'PESSOA_FISICA'
      ProviderFlags = []
    end
    object fdQryTabelaTRANSPORTADOR_NOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TRANSPORTADOR_NOME'
      Origin = 'NOMEFORN'
      ProviderFlags = []
      Size = 100
    end
    object fdQryTabelaTRANSPORTADOR_CPF_CNPJ: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TRANSPORTADOR_CPF_CNPJ'
      Origin = 'CNPJ'
      ProviderFlags = []
      Size = 18
    end
    object fdQryTabelaNOMECLIENTE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOMECLIENTE'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object fdQryTabelaDESCRICAO_CENTRO_CUSTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO_CENTRO_CUSTO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      Size = 100
    end
    object fdQryTabelaVALOR_BRUTO: TFMTBCDField
      FieldName = 'VALOR_BRUTO'
      Origin = 'VALOR_BRUTO'
      Precision = 18
      Size = 2
    end
    object fdQryTabelaVALOR_DESCONTO: TFMTBCDField
      FieldName = 'VALOR_DESCONTO'
      Origin = 'VALOR_DESCONTO'
      Precision = 18
      Size = 2
    end
    object fdQryTabelaVALOR_TOTAL_FRETE: TFMTBCDField
      FieldName = 'VALOR_TOTAL_FRETE'
      Origin = 'VALOR_TOTAL_FRETE'
      Precision = 18
      Size = 2
    end
    object fdQryTabelaVALOR_TOTAL_IPI: TFMTBCDField
      FieldName = 'VALOR_TOTAL_IPI'
      Origin = 'VALOR_TOTAL_IPI'
      Precision = 18
      Size = 2
    end
    object fdQryTabelaVALOR_TOTAL: TFMTBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      Precision = 18
      Size = 2
    end
    object fdQryTabelaFATURAMENTO_MINIMO: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'FATURAMENTO_MINIMO'
      Origin = 'FATURAMENTO_MINIMO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
  end
  inherited fdUpdTabela: TFDUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO TBREQUISITA_COMPRA'
      '(ANO, CODIGO, EMPRESA, NUMERO, FORNECEDOR, '
      '  NOME_CONTATO, TIPO, INSERCAO_DATA, EMISSAO_DATA, '
      '  EMISSAO_USUARIO, VALIDADE, COMPETENCIA, DATA_FATURA, '
      '  MOVITO, OBSERVACAO, CLIENTE, CENTRO_CUSTO, '
      '  ENDERECO_ENTREGA, STATUS, REQUISITADO_DATA, '
      '  REQUISITADO_USUARIO, CANCELADO_DATA, CANCELADO_USUARIO, '
      '  CANCELADO_MOTIVO, RECEBEDOR_NOME, RECEBEDOR_CPF, '
      '  RECEBEDOR_FUNCAO, FORMA_PAGTO, CONDICAO_PAGTO, '
      '  TRANSPORTADOR, VALOR_BRUTO, VALOR_DESCONTO, '
      '  VALOR_TOTAL_FRETE, VALOR_TOTAL_IPI, VALOR_TOTAL)'
      
        'VALUES (:NEW_ANO, :NEW_CODIGO, :NEW_EMPRESA, :NEW_NUMERO, :NEW_F' +
        'ORNECEDOR, '
      
        '  :NEW_NOME_CONTATO, :NEW_TIPO, :NEW_INSERCAO_DATA, :NEW_EMISSAO' +
        '_DATA, '
      
        '  :NEW_EMISSAO_USUARIO, :NEW_VALIDADE, :NEW_COMPETENCIA, :NEW_DA' +
        'TA_FATURA, '
      
        '  :NEW_MOVITO, :NEW_OBSERVACAO, :NEW_CLIENTE, :NEW_CENTRO_CUSTO,' +
        ' '
      '  :NEW_ENDERECO_ENTREGA, :NEW_STATUS, :NEW_REQUISITADO_DATA, '
      
        '  :NEW_REQUISITADO_USUARIO, :NEW_CANCELADO_DATA, :NEW_CANCELADO_' +
        'USUARIO, '
      
        '  :NEW_CANCELADO_MOTIVO, :NEW_RECEBEDOR_NOME, :NEW_RECEBEDOR_CPF' +
        ', '
      '  :NEW_RECEBEDOR_FUNCAO, :NEW_FORMA_PAGTO, :NEW_CONDICAO_PAGTO, '
      '  :NEW_TRANSPORTADOR, :NEW_VALOR_BRUTO, :NEW_VALOR_DESCONTO, '
      
        '  :NEW_VALOR_TOTAL_FRETE, :NEW_VALOR_TOTAL_IPI, :NEW_VALOR_TOTAL' +
        ')')
    ModifySQL.Strings = (
      'UPDATE TBREQUISITA_COMPRA'
      
        'SET ANO = :NEW_ANO, CODIGO = :NEW_CODIGO, EMPRESA = :NEW_EMPRESA' +
        ', '
      
        '  NUMERO = :NEW_NUMERO, FORNECEDOR = :NEW_FORNECEDOR, NOME_CONTA' +
        'TO = :NEW_NOME_CONTATO, '
      
        '  TIPO = :NEW_TIPO, INSERCAO_DATA = :NEW_INSERCAO_DATA, EMISSAO_' +
        'DATA = :NEW_EMISSAO_DATA, '
      
        '  EMISSAO_USUARIO = :NEW_EMISSAO_USUARIO, VALIDADE = :NEW_VALIDA' +
        'DE, '
      
        '  COMPETENCIA = :NEW_COMPETENCIA, DATA_FATURA = :NEW_DATA_FATURA' +
        ', '
      
        '  MOVITO = :NEW_MOVITO, OBSERVACAO = :NEW_OBSERVACAO, CLIENTE = ' +
        ':NEW_CLIENTE, '
      
        '  CENTRO_CUSTO = :NEW_CENTRO_CUSTO, ENDERECO_ENTREGA = :NEW_ENDE' +
        'RECO_ENTREGA, '
      
        '  STATUS = :NEW_STATUS, REQUISITADO_DATA = :NEW_REQUISITADO_DATA' +
        ', '
      
        '  REQUISITADO_USUARIO = :NEW_REQUISITADO_USUARIO, CANCELADO_DATA' +
        ' = :NEW_CANCELADO_DATA, '
      
        '  CANCELADO_USUARIO = :NEW_CANCELADO_USUARIO, CANCELADO_MOTIVO =' +
        ' :NEW_CANCELADO_MOTIVO, '
      
        '  RECEBEDOR_NOME = :NEW_RECEBEDOR_NOME, RECEBEDOR_CPF = :NEW_REC' +
        'EBEDOR_CPF, '
      
        '  RECEBEDOR_FUNCAO = :NEW_RECEBEDOR_FUNCAO, FORMA_PAGTO = :NEW_F' +
        'ORMA_PAGTO, '
      
        '  CONDICAO_PAGTO = :NEW_CONDICAO_PAGTO, TRANSPORTADOR = :NEW_TRA' +
        'NSPORTADOR, '
      
        '  VALOR_BRUTO = :NEW_VALOR_BRUTO, VALOR_DESCONTO = :NEW_VALOR_DE' +
        'SCONTO, '
      
        '  VALOR_TOTAL_FRETE = :NEW_VALOR_TOTAL_FRETE, VALOR_TOTAL_IPI = ' +
        ':NEW_VALOR_TOTAL_IPI, '
      '  VALOR_TOTAL = :NEW_VALOR_TOTAL'
      
        'WHERE ANO = :OLD_ANO AND CODIGO = :OLD_CODIGO AND EMPRESA = :OLD' +
        '_EMPRESA')
    DeleteSQL.Strings = (
      'DELETE FROM TBREQUISITA_COMPRA'
      
        'WHERE ANO = :OLD_ANO AND CODIGO = :OLD_CODIGO AND EMPRESA = :OLD' +
        '_EMPRESA')
    FetchRowSQL.Strings = (
      'Select'
      '    r.ano'
      '  , r.codigo'
      '  , r.empresa'
      '  , r.numero'
      '  , r.fornecedor'
      '  , r.nome_contato'
      '  , r.tipo'
      '  , r.insercao_data'
      '  , r.emissao_data'
      '  , r.emissao_usuario'
      '  , r.validade'
      '  , r.competencia'
      '  , r.movito'
      '  , r.observacao'
      '  , r.cliente'
      '  , r.centro_custo'
      '  , r.endereco_entrega'
      '  , r.status'
      '  , r.recebedor_nome'
      '  , r.recebedor_cpf'
      '  , r.recebedor_funcao'
      '  , r.forma_pagto'
      '  , r.condicao_pagto'
      '  , r.transportador'
      '  , r.valor_bruto'
      '  , r.valor_desconto'
      '  , r.valor_total_frete'
      '  , r.valor_total_ipi'
      '  , r.valor_total'
      '  , r.requisitado_data'
      '  , r.data_fatura'
      '  , r.requisitado_usuario'
      '  , r.cancelado_data'
      '  , r.cancelado_usuario'
      '  , r.cancelado_motivo'
      
        '  , (Select count(x.seq) from TBREQUISITA_COMPRAITEM x where x.a' +
        'no = r.ano and x.codigo = r.codigo and x.empresa = r.empresa) as' +
        ' itens'
      
        '  , (Select count(y.autorizacao_ano) from TBAUTORIZA_REQUISITA y' +
        ' where y.requisicao_ano = r.ano and y.requisicao_cod = r.codigo ' +
        'and y.requisicao_emp = r.empresa) as autorizacoes'
      '  , f.nomeforn'
      '  , f.cnpj'
      '  , f.pessoa_fisica'
      '  , f.faturamento_minimo'
      '  , t.nomeforn as transportador_nome'
      '  , t.cnpj     as transportador_cpf_cnpj'
      '  , c.nome     as nomecliente'
      '  , u.descricao as descricao_centro_custo'
      'from TBREQUISITA_COMPRA r'
      '  left join TBFORNECEDOR f on (f.codforn = r.fornecedor)'
      '  left join TBFORNECEDOR t on (t.codforn = r.transportador)'
      '  left join TBCLIENTE c on (c.codigo = r.cliente)'
      '  left join TBCENTRO_CUSTO u on (u.codigo = r.centro_custo)'
      ''
      
        'WHERE r.ANO = :ANO AND r.CODIGO = :CODIGO AND r.EMPRESA = :EMPRE' +
        'SA')
    Top = 48
  end
  object dtsEmpresa: TDataSource
    DataSet = fdQryEmpresa
    Left = 976
    Top = 272
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
    Left = 352
    Top = 376
    object nmImprimirRequisicao: TMenuItem
      Caption = 'Requisi'#231#227'o de Compra/Servi'#231'o'
      ImageIndex = 16
      OnClick = nmImprimirRequisicaoClick
    end
  end
  object dtsTipoRequisicao: TDataSource
    DataSet = fdQryTipoRequisicao
    Left = 976
    Top = 304
  end
  object dtsFormaPagto: TDataSource
    DataSet = fdQryFormaPagto
    Left = 976
    Top = 336
  end
  object dtsCondicaoPagto: TDataSource
    DataSet = fdQryCondicaoPagto
    Left = 976
    Top = 368
  end
  object dtsTransportador: TDataSource
    DataSet = cdsTransportador
    Left = 976
    Top = 400
  end
  object ppRequisicao: TPopupMenu
    Left = 712
    Top = 601
    object ppmRequisitarCompra: TMenuItem
      Tag = 12
      Bitmap.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCDA187E5BC9EFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFAA7457904820B47657F0CEB3FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA55839D07850D07040B06030CB
        9173FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        A05030D07850F09060E19C75D08860B96F42D3A486FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFA56039E08050F09060F3AF8EFFFFFFF2AA86D0
        8860B46739EBC9AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1B698
        F0A890F2AC82FFFFFFFFFFFFFFFFFFE6AA86D08860AA6841F2C7B4FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFDE0CDF7CEB6FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFE19C75D07850B47D56F2CCB3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE19C74C07040C38C74F1CA
        B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFE29F79C07040D29B82EBC3A8FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1AF91C070
        50E4B99BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFF1C1A7D29172FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Caption = 'Requisitar Compra/Servi'#231'o'
      OnClick = ppmRequisitarCompraClick
    end
    object ppmReabrirRequisicao: TMenuItem
      Tag = 14
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
      Caption = 'Reabrir Requisi'#231#227'o'
      OnClick = ppmReabrirRequisicaoClick
    end
  end
  object cdsTabelaItens: TFDQuery
    OnNewRecord = cdsTabelaItensNewRecord
    CachedUpdates = True
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    UpdateObject = updTabelaItens
    SQL.Strings = (
      'Select'
      '    i.ano'
      '  , i.codigo'
      '  , i.empresa'
      '  , i.seq'
      '  , i.fornecedor'
      '  , i.produto'
      '  , i.quantidade'
      '  , i.unidade'
      '  , i.valor_unitario'
      '  , i.ipi_percentual'
      '  , i.ipi_valor_total'
      '  , i.valor_total'
      '  , i.confirmado_recebimento'
      '  , i.usuario'
      '  , p.descri_apresentacao'
      '  , u.unp_descricao'
      '  , u.unp_sigla'
      'from TBREQUISITA_COMPRAITEM i'
      '  left join TBPRODUTO p on (p.cod = i.produto)'
      '  left join TBUNIDADEPROD u on (u.unp_cod = i.unidade)')
    Left = 640
    Top = 80
    object cdsTabelaItensANO: TSmallintField
      FieldName = 'ANO'
      Origin = 'ANO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsTabelaItensCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTabelaItensEMPRESA: TStringField
      FieldName = 'EMPRESA'
      Origin = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 18
    end
    object cdsTabelaItensSEQ: TSmallintField
      Alignment = taCenter
      FieldName = 'SEQ'
      Origin = 'SEQ'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      DisplayFormat = '00'
    end
    object cdsTabelaItensFORNECEDOR: TIntegerField
      FieldName = 'FORNECEDOR'
      Origin = 'FORNECEDOR'
    end
    object cdsTabelaItensPRODUTO: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'PRODUTO'
      Origin = 'PRODUTO'
      Required = True
      Size = 10
    end
    object cdsTabelaItensUNIDADE: TSmallintField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
    end
    object cdsTabelaItensCONFIRMADO_RECEBIMENTO: TSmallintField
      FieldName = 'CONFIRMADO_RECEBIMENTO'
      Origin = 'CONFIRMADO_RECEBIMENTO'
    end
    object cdsTabelaItensUSUARIO: TStringField
      FieldName = 'USUARIO'
      Origin = 'USUARIO'
      Size = 12
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
    object cdsTabelaItensQUANTIDADE: TFMTBCDField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
      Required = True
      Precision = 18
      Size = 3
    end
    object cdsTabelaItensVALOR_UNITARIO: TFMTBCDField
      FieldName = 'VALOR_UNITARIO'
      Origin = 'VALOR_UNITARIO'
      Precision = 18
      Size = 2
    end
    object cdsTabelaItensIPI_PERCENTUAL: TFMTBCDField
      FieldName = 'IPI_PERCENTUAL'
      Origin = 'IPI_PERCENTUAL'
      Precision = 18
      Size = 2
    end
    object cdsTabelaItensIPI_VALOR_TOTAL: TFMTBCDField
      FieldName = 'IPI_VALOR_TOTAL'
      Origin = 'IPI_VALOR_TOTAL'
      Precision = 18
      Size = 2
    end
    object cdsTabelaItensVALOR_TOTAL: TFMTBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      Precision = 18
      Size = 2
    end
  end
  object updTabelaItens: TFDUpdateSQL
    Connection = DMBusiness.fdConexao
    InsertSQL.Strings = (
      'INSERT INTO TBREQUISITA_COMPRAITEM'
      '(ANO, CODIGO, EMPRESA, SEQ, FORNECEDOR, '
      '  PRODUTO, QUANTIDADE, UNIDADE, VALOR_UNITARIO, '
      '  IPI_PERCENTUAL, IPI_VALOR_TOTAL, VALOR_TOTAL, '
      '  CONFIRMADO_RECEBIMENTO, USUARIO)'
      
        'VALUES (:NEW_ANO, :NEW_CODIGO, :NEW_EMPRESA, :NEW_SEQ, :NEW_FORN' +
        'ECEDOR, '
      
        '  :NEW_PRODUTO, :NEW_QUANTIDADE, :NEW_UNIDADE, :NEW_VALOR_UNITAR' +
        'IO, '
      '  :NEW_IPI_PERCENTUAL, :NEW_IPI_VALOR_TOTAL, :NEW_VALOR_TOTAL, '
      '  :NEW_CONFIRMADO_RECEBIMENTO, :NEW_USUARIO)')
    ModifySQL.Strings = (
      'UPDATE TBREQUISITA_COMPRAITEM'
      
        'SET ANO = :NEW_ANO, CODIGO = :NEW_CODIGO, EMPRESA = :NEW_EMPRESA' +
        ', '
      
        '  SEQ = :NEW_SEQ, FORNECEDOR = :NEW_FORNECEDOR, PRODUTO = :NEW_P' +
        'RODUTO, '
      
        '  QUANTIDADE = :NEW_QUANTIDADE, UNIDADE = :NEW_UNIDADE, VALOR_UN' +
        'ITARIO = :NEW_VALOR_UNITARIO, '
      
        '  IPI_PERCENTUAL = :NEW_IPI_PERCENTUAL, IPI_VALOR_TOTAL = :NEW_I' +
        'PI_VALOR_TOTAL, '
      
        '  VALOR_TOTAL = :NEW_VALOR_TOTAL, CONFIRMADO_RECEBIMENTO = :NEW_' +
        'CONFIRMADO_RECEBIMENTO, '
      '  USUARIO = :NEW_USUARIO'
      
        'WHERE ANO = :OLD_ANO AND CODIGO = :OLD_CODIGO AND EMPRESA = :OLD' +
        '_EMPRESA AND '
      '  SEQ = :OLD_SEQ')
    DeleteSQL.Strings = (
      'DELETE FROM TBREQUISITA_COMPRAITEM'
      
        'WHERE ANO = :OLD_ANO AND CODIGO = :OLD_CODIGO AND EMPRESA = :OLD' +
        '_EMPRESA AND '
      '  SEQ = :OLD_SEQ')
    FetchRowSQL.Strings = (
      
        'SELECT ANO, CODIGO, EMPRESA, SEQ, FORNECEDOR, PRODUTO, QUANTIDAD' +
        'E, '
      '  UNIDADE, VALOR_UNITARIO, IPI_PERCENTUAL, IPI_VALOR_TOTAL, '
      '  VALOR_TOTAL, CONFIRMADO_RECEBIMENTO, USUARIO'
      'FROM TBREQUISITA_COMPRAITEM'
      
        'WHERE ANO = :ANO AND CODIGO = :CODIGO AND EMPRESA = :EMPRESA AND' +
        ' SEQ = :SEQ')
    Left = 672
    Top = 80
  end
  object qryProduto: TFDQuery
    Connection = DMBusiness.fdConexao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    p.cod'
      '  , p.descri'
      '  , p.descri_apresentacao'
      '  , p.codunidade'
      '  , u.unp_descricao'
      '  , u.unp_sigla'
      'from TBPRODUTO p'
      '  left join TBUNIDADEPROD u on (u.unp_cod = p.codunidade)'
      'where p.codigo = :produto')
    Left = 1008
    Top = 272
    ParamData = <
      item
        Name = 'PRODUTO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object cdsTransportador: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    f.codforn'
      '  , f.nomeforn'
      '  , f.cnpj'
      'from TBFORNECEDOR f'
      'where f.transportadora = 1'
      'order by'
      '    f.nomeforn')
    Left = 944
    Top = 400
  end
  object fdQryCondicaoPagto: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select * from VW_CONDICAOPAGTO')
    Left = 944
    Top = 368
  end
  object fdQryFormaPagto: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select * from TBFORMPAGTO')
    Left = 944
    Top = 336
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
    Top = 272
  end
  object fdQryTipoRequisicao: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select * from VW_TIPO_REQUISICAO')
    Left = 944
    Top = 304
  end
end
