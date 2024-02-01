inherited frmGeCaixa: TfrmGeCaixa
  Left = 402
  Top = 222
  Caption = 'Gerenciar Caixas'
  ClientHeight = 503
  ClientWidth = 950
  OldCreateOrder = True
  ExplicitWidth = 966
  ExplicitHeight = 542
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 499
    Width = 950
    ExplicitTop = 500
    ExplicitWidth = 950
  end
  inherited Bevel3: TBevel
    Top = 460
    Width = 950
    ExplicitTop = 461
    ExplicitWidth = 950
  end
  inherited pgcGuias: TPageControl
    Width = 950
    Height = 460
    OnChange = pgcGuiasChange
    ExplicitWidth = 950
    ExplicitHeight = 460
    inherited tbsTabela: TTabSheet
      ExplicitWidth = 942
      ExplicitHeight = 431
      inherited Bevel4: TBevel
        Top = 365
        Width = 942
        ExplicitTop = 366
        ExplicitWidth = 942
      end
      inherited dbgDados: TDBGrid
        Width = 942
        Height = 365
        Columns = <
          item
            Expanded = False
            FieldName = 'NUMERO'
            Title.Caption = 'N'#250'mero '
            Width = 80
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DATA_ABERTURA'
            Title.Alignment = taCenter
            Title.Caption = 'Data '
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SITUACAO'
            Title.Caption = 'Situa'#231#227'o '
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'USUARIO'
            Title.Caption = 'Operador '
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Title.Caption = 'Conta Corrente '
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO'
            Title.Caption = 'Tipo '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_TOTAL_CREDITO'
            Title.Caption = 'Entrada (R$) '
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_TOTAL_DEBITO'
            Title.Caption = 'Sa'#237'da (R$) '
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EMPRESA_RAZAO'
            Title.Caption = 'Empresa '
            Width = 250
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        Top = 369
        Width = 942
        ExplicitTop = 369
        ExplicitWidth = 942
        object lblCaixaAberto: TLabel [0]
          Left = 2
          Top = 4
          Width = 95
          Height = 13
          Caption = '* Caixas Abertos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblCaixaCancelado: TLabel [1]
          Left = 2
          Top = 24
          Width = 114
          Height = 13
          Caption = '* Caixas Cancelados'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
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
          Left = 384
          Width = 554
          ExplicitLeft = 384
          ExplicitWidth = 554
          DesignSize = (
            554
            54)
          inherited lbltFiltrar: TLabel
            Left = 286
            Width = 73
            Caption = 'Operador(a):'
            ExplicitLeft = 286
            ExplicitWidth = 73
          end
          object lblData: TLabel [1]
            Left = 14
            Top = 25
            Width = 46
            Height = 13
            Caption = 'Per'#237'odo:'
          end
          inherited edtFiltrar: TEdit
            Left = 368
            Width = 137
            TabOrder = 2
            ExplicitLeft = 368
            ExplicitWidth = 137
          end
          inherited btnFiltrar: TcxButton
            Left = 509
            TabOrder = 3
            ExplicitLeft = 509
          end
          object e1Data: TJvDateEdit
            Left = 64
            Top = 21
            Width = 101
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
      ExplicitWidth = 942
      ExplicitHeight = 431
      inherited Bevel8: TBevel
        Top = 193
        Width = 942
        ExplicitTop = 193
        ExplicitWidth = 942
      end
      object Bevel5: TBevel [1]
        Left = 0
        Top = 81
        Width = 942
        Height = 4
        Align = alTop
        Shape = bsSpacer
      end
      inherited GrpBxDadosNominais: TGroupBox
        Width = 942
        Height = 81
        ExplicitWidth = 942
        ExplicitHeight = 81
        inherited lblCodigo: TLabel
          Width = 47
          Caption = 'N'#250'mero:'
          ExplicitWidth = 47
        end
        object lblOperador: TLabel [1]
          Left = 208
          Top = 24
          Width = 64
          Height = 13
          Caption = 'Operador(a):'
          FocusControl = dbOperador
        end
        object lblContaCorrente: TLabel [2]
          Left = 496
          Top = 24
          Width = 79
          Height = 13
          Caption = 'Conta Corrente:'
          FocusControl = dbContaCorrente
        end
        object lblDataAbertura: TLabel [3]
          Left = 96
          Top = 24
          Width = 27
          Height = 13
          Caption = 'Data:'
          FocusControl = dbDataAbertura
        end
        object lblSituacao: TLabel [4]
          Left = 800
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
        inherited dbCodigo: TDBEdit
          Width = 73
          Color = clMoneyGreen
          DataField = 'NUMERO'
          ExplicitWidth = 73
        end
        object dbOperador: TDBLookupComboBox
          Left = 208
          Top = 40
          Width = 281
          Height = 21
          DataField = 'USUARIO'
          DataSource = DtSrcTabela
          DropDownRows = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'NOME'
          ListField = 'NOMECOMPLETO'
          ListSource = dtsOperador
          ParentFont = False
          TabOrder = 2
        end
        object dbContaCorrente: TDBLookupComboBox
          Left = 496
          Top = 40
          Width = 297
          Height = 21
          DataField = 'CONTA_CORRENTE'
          DataSource = DtSrcTabela
          DropDownRows = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'CODIGO'
          ListField = 'DESCRICAO'
          ListSource = dtsContaCorrente
          ParentFont = False
          TabOrder = 3
        end
        object dbSituacao: TDBEdit
          Left = 800
          Top = 40
          Width = 121
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'SITUACAO'
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
        object dbDataAbertura: TJvDBDateEdit
          Left = 96
          Top = 40
          Width = 105
          Height = 21
          DataField = 'DATA_ABERTURA'
          DataSource = DtSrcTabela
          DialogTitle = 'Selecionar Data de Abertura'
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
          StartOfWeek = Sun
          TabOrder = 1
        end
      end
      object GrpBxDadosEncerramento: TGroupBox
        Left = 0
        Top = 85
        Width = 942
        Height = 108
        Align = alTop
        Caption = 'Dados de Encerramento'
        TabOrder = 1
        DesignSize = (
          942
          108)
        object lblDataFech: TLabel
          Left = 16
          Top = 16
          Width = 89
          Height = 13
          Caption = 'Data Fechamento:'
          FocusControl = dbDataFech
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblEntrada: TLabel
          Left = 128
          Top = 16
          Width = 120
          Height = 13
          Caption = 'Valor Total Entrada (R$):'
          FocusControl = dbEntrada
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblSaida: TLabel
          Left = 280
          Top = 16
          Width = 108
          Height = 13
          Caption = 'Valor Total Sa'#237'da (R$):'
          FocusControl = dbSaida
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblDataCancel: TLabel
          Left = 16
          Top = 56
          Width = 86
          Height = 13
          Caption = 'D. Cancelamento:'
          FocusControl = dbDataCancel
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblUsuarioCancel: TLabel
          Left = 128
          Top = 56
          Width = 126
          Height = 13
          Caption = 'Usu'#225'rio de Cancelamento:'
          FocusControl = dbUsuarioCancel
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblMotivoCancel: TLabel
          Left = 432
          Top = 56
          Width = 122
          Height = 13
          Caption = 'Motivo do Cancelamento:'
          FocusControl = dbMotivoCancel
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label2: TLabel
          Left = 509
          Top = 9
          Width = 428
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = 
            'Obs.: 1 - Apenas caixas que possuem movimenta'#231#227'o podem ser encer' +
            'rados.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object dbEntrada: TDBEdit
          Left = 128
          Top = 32
          Width = 145
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'VALOR_TOTAL_CREDITO'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object dbSaida: TDBEdit
          Left = 280
          Top = 32
          Width = 145
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'VALOR_TOTAL_DEBITO'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object dbUsuarioCancel: TDBEdit
          Left = 128
          Top = 72
          Width = 297
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'USUARIO_CANCEL'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
        end
        object dbMotivoCancel: TDBEdit
          Left = 432
          Top = 72
          Width = 489
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'MOTIVO_CANCEL'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
        end
        object dbDataFech: TJvDBDateEdit
          Left = 16
          Top = 32
          Width = 105
          Height = 21
          TabStop = False
          DataField = 'DATA_FECH'
          DataSource = DtSrcTabela
          ReadOnly = True
          Color = clMoneyGreen
          DialogTitle = 'Selecionar Data de Abertura'
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
          StartOfWeek = Sun
          TabOrder = 0
        end
        object dbDataCancel: TJvDBDateEdit
          Left = 16
          Top = 72
          Width = 105
          Height = 21
          TabStop = False
          DataField = 'DATA_CANCEL'
          DataSource = DtSrcTabela
          ReadOnly = True
          Color = clMoneyGreen
          DialogTitle = 'Selecionar Data de Abertura'
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
          StartOfWeek = Sun
          TabOrder = 4
        end
        object dbEmpresaRazao: TDBEdit
          Left = 431
          Top = 32
          Width = 489
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'EMPRESA_RAZAO'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
      end
      object pgcMaisDados: TPageControl
        Left = 0
        Top = 197
        Width = 942
        Height = 234
        ActivePage = tbsConsolidado
        Align = alClient
        TabOrder = 2
        TabStop = False
        object tbsConsolidado: TTabSheet
          Caption = 'Consolidado'
          object dbgConsolidado: TDBGrid
            Left = 0
            Top = 0
            Width = 934
            Height = 206
            TabStop = False
            Align = alClient
            DataSource = DtSrcConsolidado
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
                FieldName = 'SEQ'
                Title.Alignment = taCenter
                Title.Caption = '#'
                Width = 30
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESCRICAO'
                Title.Caption = 'Descri'#231#227'o / Forma de Pagamento'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TOTAL_CREDITO'
                Title.Caption = 'Total Entrada (R$)'
                Width = 120
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TOTAL_DEBITO'
                Title.Caption = 'Total Sa'#237'da (R$)'
                Width = 120
                Visible = True
              end>
          end
        end
        object tbsMovimento: TTabSheet
          Caption = 'Movimento'
          ImageIndex = 1
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object dbgMovimento: TDBGrid
            Left = 0
            Top = 0
            Width = 934
            Height = 206
            TabStop = False
            Align = alClient
            DataSource = dtsMovimento
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
                FieldName = 'ControleMov'
                Title.Caption = 'Movimento Cx.'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DATAHORA'
                Title.Caption = 'Data/Hora'
                Width = 110
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'HISTORICO'
                Title.Caption = 'Hist'#243'rico'
                Width = 390
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TIPO'
                Title.Alignment = taCenter
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'VALOR'
                Title.Caption = 'Valor (R$)'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ControleVenda'
                Title.Caption = 'No. Venda'
                Width = 90
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ControleCompra'
                Title.Caption = 'No. Compra'
                Width = 90
                Visible = True
              end>
          end
        end
      end
    end
  end
  inherited tlbBotoes: TPanel
    Top = 464
    Width = 950
    ExplicitTop = 464
    ExplicitWidth = 950
    inherited bvlTool3: TBevel
      Left = 867
      ExplicitLeft = 867
    end
    inherited bvlTool4: TBevel
      Left = 946
      ExplicitLeft = 946
    end
    object Bevel6: TBevel [5]
      Left = 797
      Top = 2
      Width = 4
      Height = 31
      Shape = bsSpacer
    end
    object Bevel7: TBevel [6]
      Left = 921
      Top = 2
      Width = 4
      Height = 31
      Shape = bsSpacer
      Visible = False
    end
    inherited btbtnLista: TcxButton
      PopupMenu = ppImprimir
      Visible = True
    end
    inherited btbtnFechar: TcxButton
      Left = 871
      TabOrder = 9
      ExplicitLeft = 871
    end
    inherited btbtnSelecionar: TcxButton
      Left = 747
      TabOrder = 8
      ExplicitLeft = 747
    end
    object btbtnEncerrar: TcxButton
      Tag = 11
      Left = 507
      Top = 0
      Width = 120
      Height = 35
      Hint = 'Encerrar Caixa'
      Align = alRight
      Caption = 'Encerrar Caixa'
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        424D360800000000000036000000280000002000000010000000010020000000
        000000000000C40E0000C40E0000000000000000000000FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF00008595A5FF8595A5FF8595
        A5FF8595A5FF8595A5FF8595A5FF8595A5FF8595A5FF8595A5FF8595A5FF8595
        A5FF8595A5FF8595A5FF8595A5FF8595A5FF8595A5FF00FF000064615FFF4746
        45FF262424FF363433FF393736FF464646FF00FF000000FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF00008595A5FF4E6074FF3545
        59FF182435FF243346FF273649FF36465AFF8595A5FF8595A5FF8595A5FF8595
        A5FF8595A5FF8595A5FF8595A5FF8595A5FF8595A5FF797978FF636161FFE7CC
        BEFFF9CAB0FFD4AE99FF3C3A39FF3A3838FF00FF000000FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF000067788BFF4F6175FFC0CA
        D3FFBDC7D1FF9EACBAFF2A394CFF29384BFF8595A5FF8595A5FF8595A5FF8595
        A5FF8595A5FF8595A5FF8595A5FF8595A5FF8595A5FF7F7C79FFD1CBC7FFFFF3
        ECFFFEE4D5FFFCD0B9FFC4A491FF2F2F2EFF59775CFF506853FF475A49FF4051
        42FF38473AFF303D31FF29342AFF222C23FF1C251DFF6A7B8EFFC0CAD3FFEFF2
        F4FFDCE2E7FFC5CED6FF92A1B0FF202E40FF596B7FFF4C5E72FF415266FF394A
        5EFF314155FF28374AFF212F41FF1B2839FF152131FF9F9C9AFFFBF9F7FFFFFA
        F7FF262423FF262220FFF7C7ACFF232121FF60A362FF559355FF4A8149FF457A
        48FF417341FF3C6C3CFF376538FF376139FF1C251DFF8C9BABFFF6F8F9FFF7F9
        FAFF172334FF152131FFB9C4CEFF152131FF768799FF68798CFF57697DFF5365
        79FF4C5E72FF47586CFF415266FF3F5064FF152131FF989797FFF3F3F1FFFFFD
        FBFF3D3B3AFFFFF5EFFFC5B9ADFF595553FF68AA6BFF65A869FF61A264FF5A96
        5EFF558C58FF4D824FFF49784BFF39633BFF222C23FF8797A7FFEFF2F4FFFBFC
        FCFF2B3A4DFFF1F4F6FFAAB6C2FF435468FF7F8FA0FF7D8D9EFF77889AFF6D7E
        91FF657689FF5A6C80FF536579FF415266FF1B2839FF746E6BFF929191FFF1F0
        F0FFF2EEEBFFDDD6D2FF5B5E5AFF7FAE82FF70B374FF71B776FF6EB272FF67A8
        6AFF619E64FF59925BFF4E8451FF3D6C3DFF29342AFF5B6D81FF8191A2FFEDF0
        F2FFE9EDF0FFCDD5DCFF4B5C70FF8C9BABFF8998A8FF8C9BABFF8797A7FF7E8E
        9FFF748597FF6A7B8EFF5C6E82FF47586CFF212F41FF00FF000075706DFF9797
        97FF8B8A8AFF7F7E7DFF709A75FF95CF9BFF7CBF81FF78BB7BFF74BA7AFF6FB4
        75FF69AD6FFF62A165FF578E58FF427342FF303D31FF8595A5FF5D6F83FF8797
        A7FF7A8A9CFF6C7D90FF7A8A9CFFACB8C4FF96A4B3FF91A0AFFF8F9EADFF8A99
        A9FF8292A3FF768799FF66778AFF4C5E72FF28374AFF00FF000000FF000000FF
        0000595D59FF00FF000075AB7CFF9BD2A0FF85C78AFF7EC385FF7BBF81FF76BD
        7CFF73B777FF6AAE6EFF5E9A60FF467C46FF38473AFF8595A5FF8595A5FF8595
        A5FF4A5B6FFF8595A5FF8696A6FFB0BCC7FFA0ADBAFF9AA8B6FF96A4B3FF92A1
        B0FF8D9CACFF8393A4FF708193FF536579FF314155FF00FF000000FF000000FF
        0000787978FF787878FF699E73FFA3D5A9FF8ECA94FF85C88CFF80C586FF7DC0
        82FF76BC7DFF70B574FF65A568FF4D854CFF405142FF8595A5FF8595A5FF8595
        A5FF67788BFF67788BFF7B8B9CFFB7C2CCFFA6B3C0FFA1AEBBFF9CAAB8FF97A5
        B4FF92A1B0FF8A99A9FF7B8B9CFF5B6D81FF394A5EFF00FF000000FF000000FF
        00001C201CFF00FF000071A77CFFABDAB0FF619465FF5F9462FF5F9863FF629E
        68FF67A36CFF6AA76EFF6BAA70FF4F8E52FF475A49FF8595A5FF8595A5FF8595
        A5FF131E2EFF8595A5FF8393A4FFBEC8D1FF6F8092FF6E7F91FF708193FF7687
        99FF7B8B9CFF7F8FA0FF8191A2FF637487FF415266FF00FF000000FF000000FF
        0000787978FF808080FF79AF85FFB3DDB8FF5B8A5EFF7FB684FF88BE8EFF94C7
        9AFFA1CFA5FFA6D5ABFF67A56DFF579557FF4E6250FF8595A5FF8595A5FF8595
        A5FF67788BFF6F8092FF8D9CACFFC4CDD6FF66778AFF91A0AFFF9BA9B7FFA6B3
        C0FFB2BDC8FFB8C3CDFF7D8D9EFF6A7B8EFF495A6EFF00FF000000FF000000FF
        0000202520FF00FF00007FB68DFFB9E1BFFF59865CFF73A877FF79AE7DFF85B9
        88FF8FC493FF99CA9FFF65A168FF5A9B59FF546956FF8595A5FF8595A5FF8595
        A5FF162232FF8595A5FF95A3B2FFCAD2DAFF637487FF8393A4FF8A99A9FF96A4
        B3FFA2AFBCFFABB7C3FF78899BFF6E7F91FF4E6074FF00FF000000FF000000FF
        0000717271FF808080FF85BC93FFBFE3C5FF5E8961FF57855AFF58865BFF5B8D
        5EFF5E9361FF619864FF639F67FF5EA461FF586E5AFF8595A5FF8595A5FF8595
        A5FF607184FF6F8092FF9BA9B7FFCDD5DCFF67788BFF617285FF627386FF6879
        8CFF6D7E91FF718294FF768799FF768799FF536579FF00FF000000FF000000FF
        0000202520FF00FF000089C198FFC1E5C6FFC0E4C6FFBBE2C0FFB7DFBCFFAEDA
        B3FFA1D3A6FF8FC794FF7FBD84FF7DB980FF586E5AFF8595A5FF8595A5FF8595
        A5FF162232FF8595A5FFA1AEBBFFCFD7DEFFCED6DDFFCBD3DBFFC6CFD7FFBFC9
        D2FFB4BFCAFFA4B1BEFF96A4B3FF92A1B0FF536579FF00FF000000FF000000FF
        0000101510FF808080FF89C198FF88BF96FF86BD92FF83BA8EFF81B78AFF7EB4
        85FF7BB080FF78AD7BFF76AA77FF73A773FF71A56FFF8595A5FF8595A5FF8595
        A5FF0A121EFF6F8092FFA1AEBBFF9EACBAFF9BA9B7FF98A6B4FF95A3B2FF909F
        AEFF8C9BABFF8998A8FF8494A5FF8191A2FF7E8E9FFF}
      OptionsImage.NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = btbtnEncerrarClick
    end
    object btbtnCancelarCaixa: TcxButton
      Tag = 12
      Left = 627
      Top = 0
      Width = 120
      Height = 35
      Hint = 'Cancelar Caixa'
      Align = alRight
      Caption = 'Cancelar Caixa'
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        424D360800000000000036000000280000002000000010000000010020000000
        000000000000C40E0000C40E0000000000000000000000FF000000FF000000FF
        000000FF000000FF000000FF0000707070FF505850FF000000FF00FF000000FF
        000000FF000000FF000000FF000000FF000000FF00008595A5FF8595A5FF8595
        A5FF8595A5FF8595A5FF8595A5FF5F7084FF435468FF000000FF8595A5FF8595
        A5FF8595A5FF8595A5FF8595A5FF8595A5FF8595A5FF00FF000000FF000000FF
        0000B0A090FF755E4AFF998377FFA0A0A0FFFFFFFFFF5090B0FF101010FF8980
        77FF755E4AFF604830FF604830FF00FF000000FF00008595A5FF8595A5FF8595
        A5FF8E9DACFF495A6EFF708193FF91A0AFFFFFFFFFFF8292A3FF09101BFF6D7E
        91FF495A6EFF334357FF334357FF8595A5FF8595A5FF00FF000000FF000000FF
        0000C8AEA4FFFFFFFFFFF0E8E0FFA0A0A0FF90B8C0FF70D0E0FF5098B0FF1010
        10FFA09890FFB0A090FF604830FF00FF000000FF00008595A5FF8595A5FF8595
        A5FFA0ADBAFFFFFFFFFFE1E6EAFF91A0AFFFA9B5C1FFBFC9D2FF8696A6FF0910
        1BFF8696A6FF8E9DACFF334357FF8595A5FF8595A5FF00FF0000A1A0D2FF0D2A
        DEFFACA1BAFFFFFFFFFFFFFFFFFFE0E0E0FF50A0B0FF60A8E0FF60C0D0FF5098
        B0FF101010FF909090FF77604CFF00FF000000FF00008595A5FFA2AFBCFF4B5C
        70FF9BA9B7FFFFFFFFFFFFFFFFFFDAE0E5FF8C9BABFFA3B0BDFFADB9C5FF8696
        A6FF09101BFF8090A1FF4B5C70FF8595A5FF8595A5FF00FF00000028FFFF0020
        F0FF4050D0FFFFFFFFFFFFFFFFFFFFFFFFFF4050E0FF0010B0FF90E0F0FF60C0
        D0FF5098B0FF101010FF868181FF00FF000000FF00008595A5FF516377FF495A
        6EFF637487FFFFFFFFFFFFFFFFFFFFFFFFFF68798CFF2E3E52FFD4DBE1FFADB9
        C5FF8696A6FF09101BFF708193FF8595A5FF8595A5FF00FF00002B50FCFF1038
        FFFF0028FFFFF0F8FFFFFFFFFFFF9098F0FF0018C0FF6078E0FF60A8B0FF90E0
        F0FF60C0D0FF5098B0FF101010FFC4C2C3FF00FF00008595A5FF6E7F91FF5C6E
        82FF516377FFF7F9FAFFFFFFFFFFA4B1BEFF36475BFF8494A5FF93A2B1FFD4DB
        E1FFADB9C5FF8696A6FF09101BFFB7C2CCFF8595A5FF00FF0000D8D2E2FF3050
        FFFF2040FFFF90A0F0FFC0C8F0FF0028F0FF4058F0FFFFF8F0FFD0D8E0FF70B0
        C0FF90E0F0FF70C8E0FF808880FF303890FFB1ACC2FF8595A5FFCFD7DEFF6F80
        92FF647588FFAAB6C2FFCBD3DBFF4D5F73FF718294FFF4F6F7FFD2D9E0FFA0AD
        BAFFD4DBE1FFBBC5CFFF738496FF405165FFA6B3C0FF00FF000000FF0000CECC
        E6FF4060FFFF3050FFFF2040FFFF3050FFFFFFF8FFFFFFFFFFFFFFF8F0FFD0D8
        E0FF80B0C0FFD0B8B0FF7088D0FF6070B0FF303890FF8595A5FF8595A5FFCCD4
        DBFF7B8B9CFF6F8092FF647588FF6F8092FFF9FAFAFFFFFFFFFFF4F6F7FFD2D9
        E0FFA2AFBCFFACB8C4FF8B9AAAFF708193FF405165FF00FF000000FF000000FF
        0000B2B3D6FF4068FFFF4060FFFFD0D8FFFFFFFFFFFFFFFFFFFFFFF8FFFFF0F0
        F0FFD0D8D0FF6070B0FF7090E0FF6078D0FF6070B0FF8595A5FF8595A5FF8595
        A5FFB2BDC8FF8090A1FF7B8B9CFFDCE2E7FFFFFFFFFFFFFFFFFFF9FAFAFFEDF0
        F2FFCCD4DBFF708193FF96A4B3FF7F8FA0FF708193FF00FF000000FF0000BCC2
        ECFF6078FFFF6078FFFF6080FFFF5070FFFFF0F0FFFFFFFFFFFFFFFFFFFFFFF8
        F0FFF0F0F0FFB0A0A0FF6070B0FF6070B0FF00FF00008595A5FF8595A5FFC4CD
        D6FF8E9DACFF8E9DACFF93A2B1FF8797A7FFF1F4F6FFFFFFFFFFFFFFFFFFF4F6
        F7FFEDF0F2FF92A1B0FF708193FF708193FF8595A5FF00FF0000A9B5F0FF5078
        FFFF5078FFFFC0D0FFFFFFFFFFFF7088FFFF6078FFFFD0E0FFFFFFFFFFFFFFFF
        FFFFB0A090FFB0A090FF958273FF00FF000000FF00008595A5FFBBC5CFFF8C9B
        ABFF8C9BABFFD5DCE2FFFFFFFFFF9AA8B6FF8E9DACFFE2E7EBFFFFFFFFFFFFFF
        FFFF8E9DACFF8E9DACFF6E7F91FF8595A5FF8595A5FF819AF7FF5078FFFF5078
        FFFFC3BFDAFFFFFFFFFFFFFFFFFFFFFFFFFFB0C8FFFF8098FFFFFFFFFFFFB0A0
        90FF806850FF806050FF604830FF00FF000000FF0000A5B2BFFF8C9BABFF8C9B
        ABFFBDC7D1FFFFFFFFFFFFFFFFFFFFFFFFFFCDD5DCFFA7B4C0FFFFFFFFFF8E9D
        ACFF516377FF4C5E72FF334357FF8595A5FF8595A5FF829BF8FF6385FCFFD3D4
        EDFFD6C7BAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A8
        90FFD0C8C0FF806850FF00FF000000FF000000FF0000A6B3C0FF96A4B3FFD4DB
        E1FFB9C4CEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF95A3
        B2FFBCC6D0FF516377FF8595A5FF8595A5FF8595A5FF00FF000000FF000000FF
        0000D0C0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A8
        A0FF807060FF00FF000000FF000000FF000000FF00008595A5FF8595A5FF8595
        A5FFB2BDC8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9AA8
        B6FF5B6D81FF8595A5FF8595A5FF8595A5FF8595A5FF00FF000000FF000000FF
        0000E0C0B0FFE0C0B0FFE0C0B0FFE0C0B0FFE0C0B0FFD0C0B0FFD0B8B0FFD0B0
        A0FF00FF000000FF000000FF000000FF000000FF00008595A5FF8595A5FF8595
        A5FFB3BEC9FFB3BEC9FFB3BEC9FFB3BEC9FFB3BEC9FFB2BDC8FFACB8C4FFA1AE
        BBFF8595A5FF8595A5FF8595A5FF8595A5FF8595A5FF00FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF00008595A5FF8595A5FF8595
        A5FF8595A5FF8595A5FF8595A5FF8595A5FF8595A5FF8595A5FF8595A5FF8595
        A5FF8595A5FF8595A5FF8595A5FF8595A5FF8595A5FF}
      OptionsImage.NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      Visible = False
      OnClick = btbtnCancelarCaixaClick
    end
  end
  inherited IbDtstTabela: TIBDataSet
    SelectSQL.Strings = (
      'Select'
      '    c.Ano'
      '  , c.Numero'
      '  , c.Data_abertura'
      '  , c.Data_fech'
      '  , c.Data_cancel'
      '  , c.Usuario'
      '  , c.Usuario_cancel'
      '  , c.Situacao'
      '  , c.Conta_corrente'
      '  , c.Valor_total_credito'
      '  , c.Valor_total_debito'
      '  , c.Motivo_cancel'
      '  , cc.Descricao'
      '  , Case'
      '      when cc.Tipo = 1 then '#39'Caixa'#39
      '      when cc.Tipo = 2 then '#39'Banco'#39
      '      else '#39'* Indefinido'#39
      '    end as Tipo'
      '  , cc.empresa'
      '  , e.razao    as empresa_razao'
      '  , e.fantasia as empresa_fantasia'
      'from TBCAIXA c'
      
        '  left join TBCONTA_CORRENTE cc on (cc.Codigo = c.Conta_corrente' +
        ')'
      
        '  left join TBBANCO_BOLETO bb on (bb.bco_codigo = cc.bco_codigo_' +
        'cc)'
      
        '  left join VW_EMPRESA e on (e.cnpj = coalesce(cc.empresa, bb.em' +
        'presa))')
    GeneratorField.Field = 'NUMERO'
    GeneratorField.Generator = 'GEN_CAIXA_2012'
  end
  inherited DtSrcTabela: TDataSource
    DataSet = fdQryTabela
    Left = 704
    Top = 0
  end
  inherited IbUpdTabela: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  ANO,'
      '  NUMERO,'
      '  DATA_ABERTURA,'
      '  DATA_FECH,'
      '  DATA_CANCEL,'
      '  USUARIO,'
      '  USUARIO_CANCEL,'
      '  SITUACAO,'
      '  CONTA_CORRENTE,'
      '  VALOR_TOTAL_CREDITO,'
      '  VALOR_TOTAL_DEBITO,'
      '  MOTIVO_CANCEL'
      'from TBCAIXA '
      'where'
      '  ANO = :ANO and'
      '  NUMERO = :NUMERO')
    ModifySQL.Strings = (
      'update TBCAIXA'
      'set'
      '  ANO = :ANO,'
      '  NUMERO = :NUMERO,'
      '  DATA_ABERTURA = :DATA_ABERTURA,'
      '  DATA_FECH = :DATA_FECH,'
      '  DATA_CANCEL = :DATA_CANCEL,'
      '  USUARIO = :USUARIO,'
      '  USUARIO_CANCEL = :USUARIO_CANCEL,'
      '  SITUACAO = :SITUACAO,'
      '  CONTA_CORRENTE = :CONTA_CORRENTE,'
      '  VALOR_TOTAL_CREDITO = :VALOR_TOTAL_CREDITO,'
      '  VALOR_TOTAL_DEBITO = :VALOR_TOTAL_DEBITO,'
      '  MOTIVO_CANCEL = :MOTIVO_CANCEL'
      'where'
      '  ANO = :OLD_ANO and'
      '  NUMERO = :OLD_NUMERO')
    InsertSQL.Strings = (
      'insert into TBCAIXA'
      
        '  (ANO, NUMERO, DATA_ABERTURA, DATA_FECH, DATA_CANCEL, USUARIO, ' +
        'USUARIO_CANCEL, '
      
        '   SITUACAO, CONTA_CORRENTE, VALOR_TOTAL_CREDITO, VALOR_TOTAL_DE' +
        'BITO, MOTIVO_CANCEL)'
      'values'
      
        '  (:ANO, :NUMERO, :DATA_ABERTURA, :DATA_FECH, :DATA_CANCEL, :USU' +
        'ARIO, :USUARIO_CANCEL, '
      
        '   :SITUACAO, :CONTA_CORRENTE, :VALOR_TOTAL_CREDITO, :VALOR_TOTA' +
        'L_DEBITO, '
      '   :MOTIVO_CANCEL)')
    DeleteSQL.Strings = (
      'delete from TBCAIXA'
      'where'
      '  ANO = :OLD_ANO and'
      '  NUMERO = :OLD_NUMERO')
  end
  inherited fdQryTabela: TFDQuery
    BeforePost = fdQryTabelaBeforePost
    AfterCancel = fdQryTabelaAfterCancel
    UpdateOptions.AssignedValues = [uvFetchGeneratorsPoint, uvGeneratorName]
    UpdateOptions.FetchGeneratorsPoint = gpImmediate
    UpdateOptions.GeneratorName = 'GEN_CAIXA_2012'
    UpdateOptions.KeyFields = 'ANO;NUMERO'
    UpdateOptions.AutoIncFields = 'NUMERO'
    SQL.Strings = (
      'Select'
      '    c.Ano'
      '  , c.Numero'
      '  , c.Data_abertura'
      '  , c.Data_fech'
      '  , c.Data_cancel'
      '  , c.Usuario'
      '  , c.Usuario_cancel'
      '  , c.Situacao'
      '  , c.Conta_corrente'
      '  , c.Valor_total_credito'
      '  , c.Valor_total_debito'
      '  , c.Motivo_cancel'
      '  , cc.Descricao'
      '  , Case'
      '      when cc.Tipo = 1 then '#39'Caixa'#39
      '      when cc.Tipo = 2 then '#39'Banco'#39
      '      else '#39'* Indefinido'#39
      '    end as Tipo'
      '  , cc.empresa'
      '  , e.razao    as empresa_razao'
      '  , e.fantasia as empresa_fantasia'
      'from TBCAIXA c'
      
        '  left join TBCONTA_CORRENTE cc on (cc.Codigo = c.Conta_corrente' +
        ')'
      
        '  left join TBBANCO_BOLETO bb on (bb.bco_codigo = cc.bco_codigo_' +
        'cc)'
      
        '  left join VW_EMPRESA e on (e.cnpj = coalesce(cc.empresa, bb.em' +
        'presa))')
    object fdQryTabelaANO: TSmallintField
      DisplayLabel = 'Ano'
      FieldName = 'ANO'
      Origin = 'ANO'
      Required = True
    end
    object fdQryTabelaNUMERO: TIntegerField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object fdQryTabelaDATA_ABERTURA: TDateField
      DisplayLabel = 'Data Abertura'
      FieldName = 'DATA_ABERTURA'
      Origin = 'DATA_ABERTURA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object fdQryTabelaDATA_FECH: TDateField
      DisplayLabel = 'Data Fech.'
      FieldName = 'DATA_FECH'
      Origin = 'DATA_FECH'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object fdQryTabelaDATA_CANCEL: TDateField
      DisplayLabel = 'Data Cancel.'
      FieldName = 'DATA_CANCEL'
      Origin = 'DATA_CANCEL'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object fdQryTabelaUSUARIO: TStringField
      DisplayLabel = 'Operador'
      FieldName = 'USUARIO'
      Origin = 'USUARIO'
      Size = 12
    end
    object fdQryTabelaUSUARIO_CANCEL: TStringField
      DisplayLabel = 'Usu'#225'rio Cancel.'
      FieldName = 'USUARIO_CANCEL'
      Origin = 'USUARIO_CANCEL'
      Size = 12
    end
    object fdQryTabelaSITUACAO: TSmallintField
      Alignment = taLeftJustify
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      OnGetText = fdQryTabelaSITUACAOGetText
    end
    object fdQryTabelaCONTA_CORRENTE: TIntegerField
      DisplayLabel = 'Conta Corrente'
      FieldName = 'CONTA_CORRENTE'
      Origin = 'CONTA_CORRENTE'
    end
    object fdQryTabelaMOTIVO_CANCEL: TStringField
      DisplayLabel = 'Motivo do cancelamento'
      FieldName = 'MOTIVO_CANCEL'
      Origin = 'MOTIVO_CANCEL'
      Size = 250
    end
    object fdQryTabelaDESCRICAO: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Conta Corrente'
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      Size = 50
    end
    object fdQryTabelaTIPO: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Origin = 'TIPO'
      ProviderFlags = []
      FixedChar = True
      Size = 12
    end
    object fdQryTabelaEMPRESA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'EMPRESA'
      Origin = 'EMPRESA'
      ProviderFlags = []
      Size = 18
    end
    object fdQryTabelaEMPRESA_RAZAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'EMPRESA_RAZAO'
      Origin = 'RAZAO'
      ProviderFlags = []
      Size = 60
    end
    object fdQryTabelaEMPRESA_FANTASIA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'EMPRESA_FANTASIA'
      Origin = 'FANTASIA'
      ProviderFlags = []
      Size = 60
    end
    object fdQryTabelaVALOR_TOTAL_CREDITO: TFMTBCDField
      FieldName = 'VALOR_TOTAL_CREDITO'
      Origin = 'VALOR_TOTAL_CREDITO'
      Precision = 18
      Size = 2
    end
    object fdQryTabelaVALOR_TOTAL_DEBITO: TFMTBCDField
      FieldName = 'VALOR_TOTAL_DEBITO'
      Origin = 'VALOR_TOTAL_DEBITO'
      Precision = 18
      Size = 2
    end
  end
  inherited fdUpdTabela: TFDUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO TBCAIXA'
      '(ANO, NUMERO, DATA_ABERTURA, DATA_FECH, DATA_CANCEL, '
      '  USUARIO, USUARIO_CANCEL, SITUACAO, CONTA_CORRENTE, '
      '  VALOR_TOTAL_CREDITO, VALOR_TOTAL_DEBITO, MOTIVO_CANCEL)'
      
        'VALUES (:NEW_ANO, :NEW_NUMERO, :NEW_DATA_ABERTURA, :NEW_DATA_FEC' +
        'H, :NEW_DATA_CANCEL, '
      
        '  :NEW_USUARIO, :NEW_USUARIO_CANCEL, :NEW_SITUACAO, :NEW_CONTA_C' +
        'ORRENTE, '
      
        '  :NEW_VALOR_TOTAL_CREDITO, :NEW_VALOR_TOTAL_DEBITO, :NEW_MOTIVO' +
        '_CANCEL)')
    ModifySQL.Strings = (
      'UPDATE TBCAIXA'
      
        'SET ANO = :NEW_ANO, NUMERO = :NEW_NUMERO, DATA_ABERTURA = :NEW_D' +
        'ATA_ABERTURA, '
      '  DATA_FECH = :NEW_DATA_FECH, DATA_CANCEL = :NEW_DATA_CANCEL, '
      '  USUARIO = :NEW_USUARIO, USUARIO_CANCEL = :NEW_USUARIO_CANCEL, '
      
        '  SITUACAO = :NEW_SITUACAO, CONTA_CORRENTE = :NEW_CONTA_CORRENTE' +
        ', '
      
        '  VALOR_TOTAL_CREDITO = :NEW_VALOR_TOTAL_CREDITO, VALOR_TOTAL_DE' +
        'BITO = :NEW_VALOR_TOTAL_DEBITO, '
      '  MOTIVO_CANCEL = :NEW_MOTIVO_CANCEL'
      'WHERE ANO = :OLD_ANO AND NUMERO = :OLD_NUMERO')
    DeleteSQL.Strings = (
      'DELETE FROM TBCAIXA'
      'WHERE ANO = :OLD_ANO AND NUMERO = :OLD_NUMERO')
    FetchRowSQL.Strings = (
      'Select'
      '    c.Ano'
      '  , c.Numero'
      '  , c.Data_abertura'
      '  , c.Data_fech'
      '  , c.Data_cancel'
      '  , c.Usuario'
      '  , c.Usuario_cancel'
      '  , c.Situacao'
      '  , c.Conta_corrente'
      '  , c.Valor_total_credito'
      '  , c.Valor_total_debito'
      '  , c.Motivo_cancel'
      '  , cc.Descricao'
      '  , Case'
      '      when cc.Tipo = 1 then '#39'Caixa'#39
      '      when cc.Tipo = 2 then '#39'Banco'#39
      '      else '#39'* Indefinido'#39
      '    end as Tipo'
      '  , cc.empresa'
      '  , e.razao    as empresa_razao'
      '  , e.fantasia as empresa_fantasia'
      'from TBCAIXA c'
      
        '  left join TBCONTA_CORRENTE cc on (cc.Codigo = c.Conta_corrente' +
        ')'
      
        '  left join TBBANCO_BOLETO bb on (bb.bco_codigo = cc.bco_codigo_' +
        'cc)'
      
        '  left join VW_EMPRESA e on (e.cnpj = coalesce(cc.empresa, bb.em' +
        'presa))'
      ''
      'WHERE c.ANO = :ANO AND c.NUMERO = :NUMERO')
  end
  object dtsOperador: TDataSource
    DataSet = fdQryOperador
    Left = 488
    Top = 328
  end
  object dtsContaCorrente: TDataSource
    DataSet = fdQryContaCorrente
    Left = 488
    Top = 376
  end
  object DtSrcConsolidado: TDataSource
    AutoEdit = False
    DataSet = cdsCosolidado
    Left = 704
    Top = 64
  end
  object dtsMovimento: TDataSource
    AutoEdit = False
    DataSet = qryMovimento
    Left = 704
    Top = 96
  end
  object ppImprimir: TPopupMenu
    Left = 336
    Top = 408
    object nmImprimirCaixaEncerrado: TMenuItem
      Bitmap.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        180000000000000300000000000000000000000000000000000000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0064615F47464526242436343339373646464600
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00797978636161
        E7CCBEF9CAB0D4AE993C3A393A383800FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF007F7C79D1CBC7FFF3ECFEE4D5FCD0B9C4A4912F2F2E59
        775C506853475A4940514238473A303D3129342A222C231C251D9F9C9AFBF9F7
        FFFAF7262423262220F7C7AC23212160A3625593554A8149457A484173413C6C
        3C3765383761391C251D989797F3F3F1FFFDFB3D3B3AFFF5EFC5B9AD59555368
        AA6B65A86961A2645A965E558C584D824F49784B39633B222C23746E6B929191
        F1F0F0F2EEEBDDD6D25B5E5A7FAE8270B37471B7766EB27267A86A619E645992
        5B4E84513D6C3D29342A00FF0075706D9797978B8A8A7F7E7D709A7595CF9B7C
        BF8178BB7B74BA7A6FB47569AD6F62A165578E58427342303D3100FF0000FF00
        00FF00595D5900FF0075AB7C9BD2A085C78A7EC3857BBF8176BD7C73B7776AAE
        6E5E9A60467C4638473A00FF0000FF0000FF00787978787878699E73A3D5A98E
        CA9485C88C80C5867DC08276BC7D70B57465A5684D854C40514200FF0000FF00
        00FF001C201C00FF0071A77CABDAB06194655F94625F9863629E6867A36C6AA7
        6E6BAA704F8E52475A4900FF0000FF0000FF0078797880808079AF85B3DDB85B
        8A5E7FB68488BE8E94C79AA1CFA5A6D5AB67A56D5795574E625000FF0000FF00
        00FF0020252000FF007FB68DB9E1BF59865C73A87779AE7D85B9888FC49399CA
        9F65A1685A9B5954695600FF0000FF0000FF0071727180808085BC93BFE3C55E
        896157855A58865B5B8D5E5E9361619864639F675EA461586E5A00FF0000FF00
        00FF0020252000FF0089C198C1E5C6C0E4C6BBE2C0B7DFBCAEDAB3A1D3A68FC7
        947FBD847DB980586E5A00FF0000FF0000FF0010151080808089C19888BF9686
        BD9283BA8E81B78A7EB4857BB08078AD7B76AA7773A77371A56F}
      Caption = 'Encerramento de Caixa'
      Visible = False
    end
    object N1: TMenuItem
      Caption = '-'
      Visible = False
    end
    object nmImprimirCaixaSintetico: TMenuItem
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
      Caption = 'Caixa Sint'#233'tico'
      OnClick = nmImprimirCaixaSinteticoClick
    end
    object nmImprimirCaixaAnalitico: TMenuItem
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
      Caption = 'Caixa Anal'#237'tico'
      OnClick = nmImprimirCaixaAnaliticoClick
    end
  end
  object frdCaixaSintetico: TfrxDBDataset
    UserName = 'frdCaixaSintetico'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ANO=ANO'
      'NUMERO=NUMERO'
      'DATA_ABERTURA=DATA_ABERTURA'
      'DATA_FECH=DATA_FECH'
      'DATA_CANCEL=DATA_CANCEL'
      'USUARIO=USUARIO'
      'NOMECOMPLETO=NOMECOMPLETO'
      'USUARIO_CANCEL=USUARIO_CANCEL'
      'SITUACAO=SITUACAO'
      'SITUACAO_DESC=SITUACAO_DESC'
      'CONTA_CORRENTE=CONTA_CORRENTE'
      'VALOR_TOTAL_CREDITO=VALOR_TOTAL_CREDITO'
      'VALOR_TOTAL_DEBITO=VALOR_TOTAL_DEBITO'
      'MOTIVO_CANCEL=MOTIVO_CANCEL'
      'CONTA_CORRENTE_DESC=CONTA_CORRENTE_DESC'
      'TIPO=TIPO'
      'SEQ=SEQ'
      'FORMA_PAGTO=FORMA_PAGTO'
      'CONSOLIDACAO_DESC=CONSOLIDACAO_DESC'
      'TOTAL_CREDITO=TOTAL_CREDITO'
      'TOTAL_DEBITO=TOTAL_DEBITO'
      'QTDE_CREDITO=QTDE_CREDITO'
      'QTDE_DEBITO=QTDE_DEBITO')
    DataSet = qryCaixaSintetico
    BCDToCurrency = False
    DataSetOptions = []
    Left = 848
    Top = 8
  end
  object frrCaixaSintetico: TfrxReport
    Version = '2022.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40928.407150601900000000
    ReportOptions.LastChange = 40928.416853240700000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 880
    Top = 8
    Datasets = <
      item
        DataSet = frdCaixaSintetico
        DataSetName = 'frdCaixaSintetico'
      end
      item
        DataSet = DMNFe.frdEmpresa
        DataSetName = 'frdEmpresa'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Lucida Console'
      Font.Style = []
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object bndReportTitle: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 86.929190000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object frdEmpresaRZSOC: TfrxMemoView
          AllowVectorExport = True
          Width = 559.370440000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frdEmpresa."RZSOC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdEmpresaNMFANT: TfrxMemoView
          AllowVectorExport = True
          Top = 18.897650000000000000
          Width = 559.370440000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              'CNPJ.: [FormatMaskText('#39'##.###.###/####-##;0;'#39',<frdEmpresa."CNPJ' +
              '">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frdVendaCODCONTROL: TfrxMemoView
          AllowVectorExport = True
          Left = 559.370440000000000000
          Top = 18.897650000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.UTF8W = (
            
              '[frdCaixaSintetico."ANO"]/[FormatFloat('#39'0000000'#39',<frdCaixaSintet' +
              'ico."NUMERO">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 559.370440000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8W = (
            'N '#250' m e r o   C a i x a :')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 559.370440000000000000
          Top = 37.795300000000000000
          Width = 158.740260000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frdCaixaSintetico."SITUACAO_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Top = 37.795300000000000000
          Width = 559.370440000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
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
        object Line1: TfrxLineView
          AllowVectorExport = True
          Top = 56.692950000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo29: TfrxMemoView
          AllowVectorExport = True
          Top = 60.472480000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'EXTRATO CAIXA - SINT'#201'TICO')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Line4: TfrxLineView
          AllowVectorExport = True
          Top = 83.149660000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object bndMasterData: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 234.330860000000000000
        Width = 718.110700000000000000
        DataSet = frdCaixaSintetico
        DataSetName = 'frdCaixaSintetico'
        RowCount = 0
        object frdItensSEQ: TfrxMemoView
          AllowVectorExport = True
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Line#].')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdItensDESCRI: TfrxMemoView
          AllowVectorExport = True
          Left = 26.456710000000000000
          Width = 442.205010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            ' [frdCaixaSintetico."CONSOLIDACAO_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 468.661720000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39'###,###,##0'#39',(<frdCaixaSintetico."QTDE_CREDITO">+<' +
              'frdCaixaSintetico."QTDE_DEBITO">))] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 529.134200000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FormatFloat('#39',0.00'#39',<frdCaixaSintetico."TOTAL_CREDITO">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 623.622450000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FormatFloat('#39',0.00'#39',<frdCaixaSintetico."TOTAL_DEBITO">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndPageFooter: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 714.331170000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 566.929500000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'P '#225' g i n a :  [Page#]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndReportSummary: TfrxReportSummary
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 377.953000000000000000
        Top = 313.700990000000000000
        Width = 718.110700000000000000
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 415.748300000000000000
          Top = 7.559060000000000000
          Width = 302.362400000000000000
          Height = 90.708720000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 14211288
          Memo.UTF8W = (
            ''
            ' T O T A L    G E R A L :')
          ParentFont = False
        end
        object Line3: TfrxLineView
          AllowVectorExport = True
          Top = 113.385900000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo30: TfrxMemoView
          AllowVectorExport = True
          Top = 128.504020000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              ' [IIF(<frdCaixaSintetico."DATA_FECH">>0,<frdCaixaSintetico."DATA' +
              '_FECH">,'#39#39')]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          AllowVectorExport = True
          Top = 117.165430000000000000
          Width = 139.842610000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            ' Data de Encerramento:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          AllowVectorExport = True
          Top = 226.771800000000000000
          Width = 718.110700000000000000
          Height = 45.354360000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          AllowVectorExport = True
          Top = 211.653680000000000000
          Width = 718.110700000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Memo.UTF8W = (
            ' Observa'#231#227'o:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          AllowVectorExport = True
          Left = 37.795300000000000000
          Top = 347.716760000000000000
          Width = 260.787570000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frdCaixaSintetico."NOMECOMPLETO"]'
            'Operador(a)')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 400.630180000000000000
          Top = 347.716760000000000000
          Width = 260.787570000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frdEmpresa."NMFANT"]'
            '[FormatMaskText('#39'##.###.###/####-##;0;'#39',<frdEmpresa."CNPJ">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 423.307360000000000000
          Top = 34.015770000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            ' (+) Total Cr'#233'dito:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 423.307360000000000000
          Top = 52.913420000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            ' (-) Total D'#233'bito:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 423.307360000000000000
          Top = 75.590600000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          Memo.UTF8W = (
            ' (=) Saldo:')
          ParentFont = False
          VAlign = vaCenter
        end
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Left = 559.370440000000000000
          Top = 34.015770000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39', SUM(<frdCaixaSintetico."TOTAL_CREDITO">,bn' +
              'dMasterData,2))]')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo2: TfrxSysMemoView
          AllowVectorExport = True
          Left = 559.370440000000000000
          Top = 52.913420000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39', SUM(<frdCaixaSintetico."TOTAL_DEBITO">,bnd' +
              'MasterData,2))]')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo3: TfrxSysMemoView
          AllowVectorExport = True
          Left = 559.370440000000000000
          Top = 75.590600000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39', SUM(<frdCaixaSintetico."TOTAL_CREDITO">-<f' +
              'rdCaixaSintetico."TOTAL_DEBITO">,bndMasterData,2))]')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 139.842610000000000000
          Top = 117.165430000000000000
          Width = 139.842610000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            ' Data de Cancelamento:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 139.842610000000000000
          Top = 128.504020000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              ' [IIF(<frdCaixaSintetico."DATA_CANCEL">>0,<frdCaixaSintetico."DA' +
              'TA_CANCEL">,'#39#39')]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 279.685220000000000000
          Top = 117.165430000000000000
          Width = 196.535560000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            ' Usu'#225'rio do Cancelamento:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 279.685220000000000000
          Top = 128.504020000000000000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              ' [IIF(<frdCaixaSintetico."USUARIO_CANCEL"><>'#39#39',<frdCaixaSintetic' +
              'o."USUARIO_CANCEL">,'#39#39')]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          AllowVectorExport = True
          Left = 139.842610000000000000
          Top = 147.401670000000000000
          Width = 336.378170000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            ' Motivo do Cancelamento:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          AllowVectorExport = True
          Left = 139.842610000000000000
          Top = 158.740260000000000000
          Width = 578.268090000000000000
          Height = 45.354360000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            ' [frdCaixaSintetico."MOTIVO_CANCEL"]')
          ParentFont = False
          WordWrap = False
        end
      end
      object bndGrpHeaderCaixa: TfrxGroupHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 45.354360000000000000
        Top = 166.299320000000000000
        Width = 718.110700000000000000
        Condition = 'frdCaixaSintetico."NUMERO"'
        object frdVendaNOME: TfrxMemoView
          AllowVectorExport = True
          Top = 11.338590000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              ' [FormatDateTime('#39'dd/mm/yyyy'#39',<frdCaixaSintetico."DATA_ABERTURA"' +
              '>)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Width = 109.606370000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            ' Data Abertura:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 109.606370000000000000
          Width = 306.141930000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            ' Operador(a):')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 109.606370000000000000
          Top = 11.338590000000000000
          Width = 306.141930000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            ' [frdCaixaSintetico."USUARIO"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 415.748300000000000000
          Width = 226.771800000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            ' Conta Corrente:')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 415.748300000000000000
          Top = 11.338590000000000000
          Width = 226.771800000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            ' [frdCaixaSintetico."CONTA_CORRENTE_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Top = 30.236240000000000000
          Width = 26.456710000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 14211288
          HAlign = haCenter
          Memo.UTF8W = (
            '#')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo44: TfrxMemoView
          AllowVectorExport = True
          Left = 642.520100000000000000
          Width = 75.590600000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            ' Tipo:')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo45: TfrxMemoView
          AllowVectorExport = True
          Left = 642.520100000000000000
          Top = 11.338590000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            ' [frdCaixaSintetico."TIPO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Left = 26.456710000000000000
          Top = 30.236240000000000000
          Width = 442.204834250000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 14211288
          Memo.UTF8W = (
            ' D e s c r i '#231' '#227' o ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 468.661720000000000000
          Top = 30.236240000000000000
          Width = 60.472443390000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 14211288
          HAlign = haRight
          Memo.UTF8W = (
            'Q t d e . ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 529.134200000000000000
          Top = 30.236240000000000000
          Width = 94.488213390000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 14211288
          HAlign = haRight
          Memo.UTF8W = (
            'C r '#233' d i t o s ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 623.622450000000000000
          Top = 30.236240000000000000
          Width = 94.488213390000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 14211288
          HAlign = haRight
          Memo.UTF8W = (
            'D '#233' b i t o s ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
    end
  end
  object frrCaixaAnalitico: TfrxReport
    Version = '2022.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40928.407150601900000000
    ReportOptions.LastChange = 40928.416853240700000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 880
    Top = 48
    Datasets = <
      item
        DataSet = frdCaixaAnalitico
        DataSetName = 'frdCaixaAnalitico'
      end
      item
        DataSet = frdCaixaSintetico
        DataSetName = 'frdCaixaSintetico'
      end
      item
        DataSet = DMNFe.frdEmpresa
        DataSetName = 'frdEmpresa'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Lucida Console'
      Font.Style = []
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object bndReportTitle: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 86.929190000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object frdEmpresaRZSOC: TfrxMemoView
          AllowVectorExport = True
          Width = 559.370440000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frdEmpresa."RZSOC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdEmpresaNMFANT: TfrxMemoView
          AllowVectorExport = True
          Top = 18.897650000000000000
          Width = 559.370440000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              'CNPJ.: [FormatMaskText('#39'##.###.###/####-##;0;'#39',<frdEmpresa."CNPJ' +
              '">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frdVendaCODCONTROL: TfrxMemoView
          AllowVectorExport = True
          Left = 559.370440000000000000
          Top = 18.897650000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.UTF8W = (
            
              '[frdCaixaSintetico."ANO"]/[FormatFloat('#39'0000000'#39',<frdCaixaSintet' +
              'ico."NUMERO">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 559.370440000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8W = (
            'N '#250' m e r o   C a i x a :')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 559.370440000000000000
          Top = 37.795300000000000000
          Width = 158.740260000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frdCaixaSintetico."SITUACAO_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Top = 37.795300000000000000
          Width = 559.370440000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
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
        object Line1: TfrxLineView
          AllowVectorExport = True
          Top = 56.692950000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo50: TfrxMemoView
          AllowVectorExport = True
          Top = 60.472480000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'EXTRATO CAIXA - ANAL'#205'TICO')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Line4: TfrxLineView
          AllowVectorExport = True
          Top = 83.149660000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object bndMasterData: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 234.330860000000000000
        Width = 718.110700000000000000
        DataSet = frdCaixaSintetico
        DataSetName = 'frdCaixaSintetico'
        RowCount = 0
        object frdItensSEQ: TfrxMemoView
          AllowVectorExport = True
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Line#].')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdItensDESCRI: TfrxMemoView
          AllowVectorExport = True
          Left = 26.456710000000000000
          Width = 442.205010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            ' [frdCaixaSintetico."CONSOLIDACAO_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 468.661720000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39'###,###,##0'#39',(<frdCaixaSintetico."QTDE_CREDITO">+<' +
              'frdCaixaSintetico."QTDE_DEBITO">))] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 529.134200000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FormatFloat('#39',0.00'#39',<frdCaixaSintetico."TOTAL_CREDITO">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 623.622450000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FormatFloat('#39',0.00'#39',<frdCaixaSintetico."TOTAL_DEBITO">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndPageFooter: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 797.480830000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 566.929500000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'P '#225' g i n a :  [Page#]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo51: TfrxMemoView
          AllowVectorExport = True
          Width = 566.929500000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '* Movimenta'#231#245'es/Vendas Canceladas')
          ParentFont = False
        end
      end
      object bndReportSummary: TfrxReportSummary
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 377.953000000000000000
        Top = 396.850650000000000000
        Width = 718.110700000000000000
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 415.748300000000000000
          Top = 7.559060000000000000
          Width = 302.362400000000000000
          Height = 90.708720000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 14211288
          Memo.UTF8W = (
            ''
            ' T O T A L    G E R A L :')
          ParentFont = False
        end
        object Line3: TfrxLineView
          AllowVectorExport = True
          Top = 113.385900000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo30: TfrxMemoView
          AllowVectorExport = True
          Top = 128.504020000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              ' [IIF(<frdCaixaSintetico."DATA_FECH">>0,<frdCaixaSintetico."DATA' +
              '_FECH">,'#39#39')]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          AllowVectorExport = True
          Top = 117.165430000000000000
          Width = 139.842610000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            ' Data de Encerramento:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          AllowVectorExport = True
          Top = 226.771800000000000000
          Width = 718.110700000000000000
          Height = 45.354360000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          AllowVectorExport = True
          Top = 211.653680000000000000
          Width = 718.110700000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Memo.UTF8W = (
            ' Observa'#231#227'o:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          AllowVectorExport = True
          Left = 37.795300000000000000
          Top = 347.716760000000000000
          Width = 260.787570000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frdCaixaSintetico."NOMECOMPLETO"]'
            'Operador(a)')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 400.630180000000000000
          Top = 347.716760000000000000
          Width = 260.787570000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frdEmpresa."NMFANT"]'
            '[FormatMaskText('#39'##.###.###/####-##;0;'#39',<frdEmpresa."CNPJ">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 423.307360000000000000
          Top = 34.015770000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            ' (+) Total Cr'#233'dito:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 423.307360000000000000
          Top = 52.913420000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            ' (-) Total D'#233'bito:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 423.307360000000000000
          Top = 75.590600000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          Memo.UTF8W = (
            ' (=) Saldo:')
          ParentFont = False
          VAlign = vaCenter
        end
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Left = 559.370440000000000000
          Top = 34.015770000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39', SUM(IIF(<frdCaixaAnalitico."SITUACAOMOV">=' +
              '0,0,<frdCaixaAnalitico."VALOR_CREDITO">),bndMasterDataMov,2))]')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo2: TfrxSysMemoView
          AllowVectorExport = True
          Left = 559.370440000000000000
          Top = 52.913420000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39', SUM(IIF(<frdCaixaAnalitico."SITUACAOMOV">=' +
              '0,0,<frdCaixaAnalitico."VALOR_DEBITO">),bndMasterDataMov,2))]')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo3: TfrxSysMemoView
          AllowVectorExport = True
          Left = 559.370440000000000000
          Top = 75.590600000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39', SUM(IIF(<frdCaixaAnalitico."SITUACAOMOV">=' +
              '0,0,<frdCaixaAnalitico."VALOR_CREDITO">)-IIF(<frdCaixaAnalitico.' +
              '"SITUACAOMOV">=0,0,<frdCaixaAnalitico."VALOR_DEBITO">),bndMaster' +
              'DataMov,2))]')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 139.842610000000000000
          Top = 117.165430000000000000
          Width = 139.842610000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            ' Data de Cancelamento:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 139.842610000000000000
          Top = 128.504020000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              ' [IIF(<frdCaixaSintetico."DATA_CANCEL">>0,<frdCaixaSintetico."DA' +
              'TA_CANCEL">,'#39#39')]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 279.685220000000000000
          Top = 117.165430000000000000
          Width = 196.535560000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            ' Usu'#225'rio do Cancelamento:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 279.685220000000000000
          Top = 128.504020000000000000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              ' [IIF(<frdCaixaSintetico."USUARIO_CANCEL"><>'#39#39',<frdCaixaSintetic' +
              'o."USUARIO_CANCEL">,'#39#39')]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          AllowVectorExport = True
          Left = 139.842610000000000000
          Top = 147.401670000000000000
          Width = 336.378170000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            ' Motivo do Cancelamento:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          AllowVectorExport = True
          Left = 139.842610000000000000
          Top = 158.740260000000000000
          Width = 578.268090000000000000
          Height = 45.354360000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            ' [frdCaixaSintetico."MOTIVO_CANCEL"]')
          ParentFont = False
          WordWrap = False
        end
      end
      object bndGrpHeaderCaixa: TfrxGroupHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 45.354360000000000000
        Top = 166.299320000000000000
        Width = 718.110700000000000000
        Condition = 'frdCaixaSintetico."NUMERO"'
        object frdVendaNOME: TfrxMemoView
          AllowVectorExport = True
          Top = 11.338590000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              ' [FormatDateTime('#39'dd/mm/yyyy'#39',<frdCaixaSintetico."DATA_ABERTURA"' +
              '>)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Width = 109.606370000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            ' Data Abertura:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 109.606370000000000000
          Width = 306.141930000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            ' Operador(a):')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 109.606370000000000000
          Top = 11.338590000000000000
          Width = 306.141930000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            ' [frdCaixaSintetico."USUARIO"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 415.748300000000000000
          Width = 226.771800000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            ' Conta Corrente:')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 415.748300000000000000
          Top = 11.338590000000000000
          Width = 226.771800000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            ' [frdCaixaSintetico."CONTA_CORRENTE_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Top = 30.236240000000000000
          Width = 26.456710000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 14211288
          HAlign = haCenter
          Memo.UTF8W = (
            '#')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo44: TfrxMemoView
          AllowVectorExport = True
          Left = 642.520100000000000000
          Width = 75.590600000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            ' Tipo:')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo45: TfrxMemoView
          AllowVectorExport = True
          Left = 642.520100000000000000
          Top = 11.338590000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            ' [frdCaixaSintetico."TIPO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Left = 26.456710000000000000
          Top = 30.236240000000000000
          Width = 442.204834250000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 14211288
          Memo.UTF8W = (
            ' D e s c r i '#231' '#227' o ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 468.661720000000000000
          Top = 30.236240000000000000
          Width = 60.472443390000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 14211288
          HAlign = haRight
          Memo.UTF8W = (
            'Q t d e . ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 529.134200000000000000
          Top = 30.236240000000000000
          Width = 94.488213390000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 14211288
          HAlign = haRight
          Memo.UTF8W = (
            'C r '#233' d i t o s ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 623.622450000000000000
          Top = 30.236240000000000000
          Width = 94.488213390000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 14211288
          HAlign = haRight
          Memo.UTF8W = (
            'D '#233' b i t o s ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndHeaderMov: TfrxHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 275.905690000000000000
        Width = 718.110700000000000000
        ReprintOnNewPage = True
        object Memo33: TfrxMemoView
          AllowVectorExport = True
          Top = 3.779530000000000000
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Fill.BackColor = 14211288
          HAlign = haCenter
          Memo.UTF8W = (
            'Lan'#231'amento')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          AllowVectorExport = True
          Left = 75.590600000000000000
          Top = 3.779530000000000000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Fill.BackColor = 14211288
          HAlign = haCenter
          Memo.UTF8W = (
            'Data')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          AllowVectorExport = True
          Left = 128.504020000000000000
          Top = 3.779530000000000000
          Width = 321.260050000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Fill.BackColor = 14211288
          Memo.UTF8W = (
            ' Hist'#243'rico')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          AllowVectorExport = True
          Left = 449.764070000000000000
          Top = 3.779530000000000000
          Width = 30.236240000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Fill.BackColor = 14211288
          Memo.UTF8W = (
            'Tipo')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          AllowVectorExport = True
          Left = 574.488560000000000000
          Top = 3.779530000000000000
          Width = 71.811033390000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Fill.BackColor = 14211288
          HAlign = haRight
          Memo.UTF8W = (
            'Cr'#233'dito ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          AllowVectorExport = True
          Left = 646.299630000000000000
          Top = 3.779530000000000000
          Width = 71.811033390000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Fill.BackColor = 14211288
          HAlign = haRight
          Memo.UTF8W = (
            'D'#233'bito ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo48: TfrxMemoView
          AllowVectorExport = True
          Left = 480.000310000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Fill.BackColor = 14211288
          Memo.UTF8W = (
            ' Forma Pagto.')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndMasterDataMov: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 317.480520000000000000
        Width = 718.110700000000000000
        DataSet = frdCaixaAnalitico
        DataSetName = 'frdCaixaAnalitico'
        RowCount = 0
        object Memo29: TfrxMemoView
          AllowVectorExport = True
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Lucida Console'
          Highlight.Font.Style = []
          Highlight.Condition = '<frdCaixaAnalitico."SITUACAOMOV">=0'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            '[frdCaixaAnalitico."MOVIMENTO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          AllowVectorExport = True
          Left = 128.504020000000000000
          Width = 321.260050000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Lucida Console'
          Highlight.Font.Style = []
          Highlight.Condition = '<frdCaixaAnalitico."SITUACAOMOV">=0'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [frdCaixaAnalitico."HISTORICO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          AllowVectorExport = True
          Left = 75.590600000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Lucida Console'
          Highlight.Font.Style = []
          Highlight.Condition = '<frdCaixaAnalitico."SITUACAOMOV">=0'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              '[IIF(<frdCaixaAnalitico."DATAHORA">=0,'#39#39',FormatDateTime('#39'dd/mm/y' +
              'y'#39',<frdCaixaAnalitico."DATAHORA">))]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          AllowVectorExport = True
          Left = 449.764070000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Lucida Console'
          Highlight.Font.Style = []
          Highlight.Condition = '<frdCaixaAnalitico."SITUACAOMOV">=0'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              '[frdCaixaAnalitico."TIPOMOV"][IIF(<frdCaixaAnalitico."SITUACAOMO' +
              'V">=0,'#39'*'#39','#39#39')]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo46: TfrxMemoView
          AllowVectorExport = True
          Left = 574.488560000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Lucida Console'
          Highlight.Font.Style = []
          Highlight.Condition = '<frdCaixaAnalitico."SITUACAOMOV">=0'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            '[FormatFloat('#39',0.00'#39',<frdCaixaAnalitico."VALOR_CREDITO">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo47: TfrxMemoView
          AllowVectorExport = True
          Left = 646.299630000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Lucida Console'
          Highlight.Font.Style = []
          Highlight.Condition = '<frdCaixaAnalitico."SITUACAOMOV">=0'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            '[FormatFloat('#39',0.00'#39',<frdCaixaAnalitico."VALOR_DEBITO">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo49: TfrxMemoView
          AllowVectorExport = True
          Left = 480.000310000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Lucida Console'
          Highlight.Font.Style = []
          Highlight.Condition = '<frdCaixaAnalitico."SITUACAOMOV">=0'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [frdCaixaAnalitico."FORMA_PAGTO_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
    end
  end
  object frdCaixaAnalitico: TfrxDBDataset
    UserName = 'frdCaixaAnalitico'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ANO=ANO'
      'NUMERO=NUMERO'
      'DATA_ABERTURA=DATA_ABERTURA'
      'DATA_FECH=DATA_FECH'
      'DATA_CANCEL=DATA_CANCEL'
      'USUARIO=USUARIO'
      'NOMECOMPLETO=NOMECOMPLETO'
      'USUARIO_CANCEL=USUARIO_CANCEL'
      'SITUACAO=SITUACAO'
      'SITUACAO_DESC=SITUACAO_DESC'
      'CONTA_CORRENTE=CONTA_CORRENTE'
      'VALOR_TOTAL_CREDITO=VALOR_TOTAL_CREDITO'
      'VALOR_TOTAL_DEBITO=VALOR_TOTAL_DEBITO'
      'MOTIVO_CANCEL=MOTIVO_CANCEL'
      'CONTA_CORRENTE_DESC=CONTA_CORRENTE_DESC'
      'TIPO=TIPO'
      'ANOMOV=ANOMOV'
      'NUMMOV=NUMMOV'
      'MOVIMENTO=MOVIMENTO'
      'FORMA_PAGTO=FORMA_PAGTO'
      'FORMA_PAGTO_DESC=FORMA_PAGTO_DESC'
      'DATAHORA=DATAHORA'
      'HISTORICO=HISTORICO'
      'SITUACAOMOV=SITUACAOMOV'
      'TIPOMOV=TIPOMOV'
      'VALOR=VALOR'
      'VALOR_CREDITO=VALOR_CREDITO'
      'VALOR_DEBITO=VALOR_DEBITO')
    DataSet = qryCaixaAnalitico
    BCDToCurrency = False
    DataSetOptions = []
    Left = 848
    Top = 48
  end
  object fdQryOperador: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    u.nome'
      '  , trim(u.nomecompleto) as nomecompleto'
      'from TBUSERS u'
      'order by'
      '  trim(u.nomecompleto)')
    Left = 458
    Top = 328
  end
  object fdQryContaCorrente: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    c.codigo'
      '  , c.descricao'
      '  , c.tipo'
      'from TBCONTA_CORRENTE c'
      'where ((c.empresa in ('
      '    Select'
      '      e.cnpj'
      '    from VW_EMPRESA e'
      '  )) or (c.tipo = 2)'
      '  and ('
      '    c.bco_codigo_cc in ('
      '      Select'
      '        bb.bco_codigo'
      '      from TBBANCO_BOLETO bb'
      '        inner join VW_EMPRESA e on (e.cnpj = bb.empresa) '
      '    ) '
      '  ))  '
      '  and (c.empresa = :empresa)'
      ''
      'order by'
      '  c.descricao')
    Left = 458
    Top = 376
    ParamData = <
      item
        Name = 'EMPRESA'
        DataType = ftString
        ParamType = ptInput
        Size = 18
        Value = Null
      end>
  end
  object fdStrPrcCaixaConsolidar: TFDStoredProc
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    StoredProcName = 'SET_CAIXA_CONSOLIDAR'
    Left = 640
    Top = 270
    ParamData = <
      item
        Position = 1
        Name = 'ANO_CAIXA'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'NUM_CAIXA'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object qryCaixaSintetico: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    c.Ano'
      '  , c.Numero'
      '  , c.Data_abertura'
      '  , c.Data_fech'
      '  , c.Data_cancel'
      '  , c.Usuario'
      '  , u.Nomecompleto'
      '  , c.Usuario_cancel'
      '  , c.Situacao'
      '  , Case'
      '      when c.Situacao = 0 then '#39'Aberto'#39
      '      when c.Situacao = 1 then '#39'Fechado'#39
      '      when c.Situacao = 2 then '#39'Cancelado'#39
      '      else '#39'* Indefinido'#39
      '    end as Situacao_Desc'
      '  , c.Conta_corrente'
      '  , c.Valor_total_credito'
      '  , c.Valor_total_debito'
      '  , c.Motivo_cancel'
      '  , cc.Descricao as Conta_corrente_Desc'
      '  , Case'
      '      when cc.Tipo = 1 then '#39'Caixa'#39
      '      when cc.Tipo = 2 then '#39'Banco'#39
      '      else '#39'* Indefinido'#39
      '    end as Tipo'
      '  , cf.Seq'
      '  , cf.Forma_pagto'
      '  , cf.Descricao as Consolidacao_Desc'
      '  , cf.Total_credito'
      '  , cf.Total_debito'
      '  , ('
      '    Select'
      '      Count(cm.Caixa_ano)'
      '    from TBCAIXA_MOVIMENTO cm'
      '    where cm.Caixa_ano = c.Ano'
      '      and cm.Caixa_num = c.Numero'
      '      and cm.Forma_pagto = cf.Forma_pagto'
      '      and cm.Situacao    = 1'
      '      and cm.Tipo        = '#39'C'#39
      '    ) as Qtde_Credito'
      '  , ('
      '    Select'
      '      Count(cm.Caixa_ano)'
      '    from TBCAIXA_MOVIMENTO cm'
      '    where cm.Caixa_ano = c.Ano'
      '      and cm.Caixa_num = c.Numero'
      '      and cm.Forma_pagto = cf.Forma_pagto'
      '      and cm.Situacao    = 1'
      '      and cm.Tipo        = '#39'D'#39
      '    ) as Qtde_Debito'
      'from TBCAIXA c'
      
        '  left join TBCONTA_CORRENTE cc on (cc.Codigo = c.Conta_corrente' +
        ')'
      
        '  left join TBCAIXA_CONSOLIDACAO cf on (cf.Ano = c.Ano and cf.Nu' +
        'mero = c.Numero)'
      '  left join TBUSERS u on (u.Nome = c.Usuario)')
    Left = 816
    Top = 6
  end
  object qryCaixaAnalitico: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    c.Ano'
      '  , c.Numero'
      '  , c.Data_abertura'
      '  , c.Data_fech'
      '  , c.Data_cancel'
      '  , c.Usuario'
      '  , u.Nomecompleto'
      '  , c.Usuario_cancel'
      '  , c.Situacao'
      '  , Case'
      '      when c.Situacao = 0 then '#39'Aberto'#39
      '      when c.Situacao = 1 then '#39'Fechado'#39
      '      when c.Situacao = 2 then '#39'Cancelado'#39
      '      else '#39'* Indefinido'#39
      '    end as Situacao_Desc'
      '  , c.Conta_corrente'
      '  , c.Valor_total_credito'
      '  , c.Valor_total_debito'
      '  , c.Motivo_cancel'
      '  , cc.Descricao as Conta_corrente_Desc'
      '  , Case'
      '      when cc.Tipo = 1 then '#39'Caixa'#39
      '      when cc.Tipo = 2 then '#39'Banco'#39
      '      else '#39'* Indefinido'#39
      '    end as Tipo'
      '  , cm.Ano as AnoMov'
      '  , cm.Numero as NumMov'
      '  , cm.Ano || right('#39'0000000'#39' || cm.Numero, 7) as Movimento'
      '  , cm.Forma_pagto'
      '  , f.Descri as Forma_pagto_Desc'
      '  , cm.Datahora'
      '  , cm.Historico'
      '  , cm.Situacao as SituacaoMov'
      '  , cm.Tipo as TipoMov'
      '  , cm.Valor'
      
        '  , Case when upper(cm.Tipo) = '#39'C'#39' then cm.Valor else 0 end as V' +
        'alor_Credito'
      
        '  , Case when upper(cm.Tipo) = '#39'D'#39' then cm.Valor else 0 end as V' +
        'alor_Debito'
      'from TBCAIXA c'
      
        '  left join TBCONTA_CORRENTE cc on (cc.Codigo = c.Conta_corrente' +
        ')'
      
        '  left join TBCAIXA_MOVIMENTO cm on (cm.Caixa_ano = c.Ano and cm' +
        '.Caixa_num = c.Numero)'
      '  left join TBFORMPAGTO f on (f.Cod = cm.Forma_pagto)'
      '  left join TBUSERS u on (u.Nome = c.Usuario)')
    Left = 816
    Top = 46
  end
  object qryMovimento: TFDQuery
    OnCalcFields = qryMovimentoCalcFields
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    cm.Ano'
      '  , cm.Numero'
      '  , cm.Forma_pagto'
      '  , fp.Descri as Forma_pagto_desc'
      '  , cm.Datahora'
      '  , cm.Tipo'
      '  , cm.Historico'
      '  , cm.Valor'
      '  , cm.Situacao'
      '  , cm.Venda_ano'
      '  , cm.Venda_num'
      '  , cm.Cliente'
      '  , cm.Compra_ano'
      '  , cm.Compra_num'
      '  , cm.Fornecedor'
      'from TBCAIXA_MOVIMENTO cm'
      '  left join TBFORMPAGTO fp on (fp.Cod = cm.Forma_pagto)'
      ''
      'where cm.Caixa_ano = :Caixa_ano'
      '  and cm.Caixa_num = :Caixa_num'
      ''
      'union'
      ''
      'Select'
      '    null'
      '  , null'
      '  , vf.formapagto_cod'
      '  , fp.descri'
      '  , cast(vd.dtvenda as timestamp)'
      '  , '#39'C'#39
      
        '  , substring('#39'VENDA EM '#39' || fp.descri || '#39' No. '#39' || vd.ano || '#39 +
        '/'#39' || vd.codcontrol || '#39' - '#39' || vc.nome from 1 for 250)'
      '  , vf.valor_fpagto'
      '  , Case when vd.status = 5 then 0 else 1 end'
      '  , vd.ano'
      '  , vd.codcontrol'
      '  , vd.codcli'
      '  , null'
      '  , null'
      '  , null'
      'from TBVENDAS vd'
      
        '  inner join TBVENDAS_FORMAPAGTO vf on (vf.ano_venda = vd.ano an' +
        'd vf.controle_venda = vd.codcontrol)'
      '  inner join TBFORMPAGTO fp on (fp.Cod = vf.formapagto_cod)'
      
        '  inner join TBCONDICAOPAGTO cp on (cp.cond_cod = vf.condicaopag' +
        'to_cod and cp.cond_prazo = 1)'
      '  inner join TBCLIENTE vc on (vc.codigo = vd.codcliente)'
      ''
      'where vd.caixa_pdv = 1'
      '  and vd.caixa_ano = :Caixa_ano'
      '  and vd.caixa_num = :Caixa_num'
      ''
      'Order by'
      '    1'
      '  , 2')
    Left = 640
    Top = 94
    ParamData = <
      item
        Name = 'CAIXA_ANO'
        DataType = ftSmallint
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CAIXA_NUM'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qryMovimentoANO: TSmallintField
      FieldName = 'ANO'
      Origin = 'ANO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryMovimentoNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryMovimentoFORMA_PAGTO: TSmallintField
      FieldName = 'FORMA_PAGTO'
      Origin = 'FORMA_PAGTO'
    end
    object qryMovimentoFORMA_PAGTO_DESC: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'FORMA_PAGTO_DESC'
      Origin = 'DESCRI'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object qryMovimentoDATAHORA: TSQLTimeStampField
      FieldName = 'DATAHORA'
      Origin = 'DATAHORA'
      DisplayFormat = 'dd/mm/yyyy hh:mm'
    end
    object qryMovimentoTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Size = 1
    end
    object qryMovimentoHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Origin = 'HISTORICO'
      Size = 250
    end
    object qryMovimentoVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Precision = 18
      Size = 2
    end
    object qryMovimentoSITUACAO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryMovimentoVENDA_ANO: TSmallintField
      FieldName = 'VENDA_ANO'
      Origin = 'VENDA_ANO'
    end
    object qryMovimentoVENDA_NUM: TIntegerField
      FieldName = 'VENDA_NUM'
      Origin = 'VENDA_NUM'
    end
    object qryMovimentoCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Origin = 'CLIENTE'
      Size = 18
    end
    object qryMovimentoCOMPRA_ANO: TSmallintField
      FieldName = 'COMPRA_ANO'
      Origin = 'COMPRA_ANO'
    end
    object qryMovimentoCOMPRA_NUM: TIntegerField
      FieldName = 'COMPRA_NUM'
      Origin = 'COMPRA_NUM'
    end
    object qryMovimentoFORNECEDOR: TIntegerField
      FieldName = 'FORNECEDOR'
      Origin = 'FORNECEDOR'
    end
    object qryMovimentoControleMov: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'ControleMov'
    end
    object qryMovimentoControleVenda: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'ControleVenda'
    end
    object qryMovimentoControleCompra: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'ControleCompra'
    end
  end
  object cdsCosolidado: TFDQuery
    CachedUpdates = True
    OnUpdateError = fdQryTabelaUpdateError
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    UpdateObject = updConsolidado
    SQL.Strings = (
      'Select'
      '    cs.Ano'
      '  , cs.Numero'
      '  , cs.Seq'
      '  , cs.Forma_pagto'
      '  , cs.Descricao'
      '  , cs.Total_credito'
      '  , cs.Total_debito'
      'from TBCAIXA_CONSOLIDACAO cs')
    Left = 640
    Top = 64
    object cdsCosolidadoANO: TSmallintField
      FieldName = 'ANO'
      Origin = 'ANO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCosolidadoNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCosolidadoSEQ: TSmallintField
      FieldName = 'SEQ'
      Origin = 'SEQ'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCosolidadoFORMA_PAGTO: TSmallintField
      FieldName = 'FORMA_PAGTO'
      Origin = 'FORMA_PAGTO'
    end
    object cdsCosolidadoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 50
    end
    object cdsCosolidadoTOTAL_CREDITO: TFMTBCDField
      FieldName = 'TOTAL_CREDITO'
      Origin = 'TOTAL_CREDITO'
      Precision = 18
      Size = 2
    end
    object cdsCosolidadoTOTAL_DEBITO: TFMTBCDField
      FieldName = 'TOTAL_DEBITO'
      Origin = 'TOTAL_DEBITO'
      Precision = 18
      Size = 2
    end
  end
  object updConsolidado: TFDUpdateSQL
    Connection = DMBusiness.fdConexao
    InsertSQL.Strings = (
      'INSERT INTO TBCAIXA_CONSOLIDACAO'
      '(ANO, NUMERO, SEQ, FORMA_PAGTO, DESCRICAO, '
      '  TOTAL_CREDITO, TOTAL_DEBITO)'
      
        'VALUES (:NEW_ANO, :NEW_NUMERO, :NEW_SEQ, :NEW_FORMA_PAGTO, :NEW_' +
        'DESCRICAO, '
      '  :NEW_TOTAL_CREDITO, :NEW_TOTAL_DEBITO)'
      'RETURNING TOTAL_CREDITO_ESTORNO, TOTAL_DEBITO_ESTORNO')
    ModifySQL.Strings = (
      'UPDATE TBCAIXA_CONSOLIDACAO'
      
        'SET ANO = :NEW_ANO, NUMERO = :NEW_NUMERO, SEQ = :NEW_SEQ, FORMA_' +
        'PAGTO = :NEW_FORMA_PAGTO, '
      
        '  DESCRICAO = :NEW_DESCRICAO, TOTAL_CREDITO = :NEW_TOTAL_CREDITO' +
        ', '
      '  TOTAL_DEBITO = :NEW_TOTAL_DEBITO'
      'WHERE ANO = :OLD_ANO AND NUMERO = :OLD_NUMERO AND SEQ = :OLD_SEQ'
      'RETURNING TOTAL_CREDITO_ESTORNO, TOTAL_DEBITO_ESTORNO')
    DeleteSQL.Strings = (
      'DELETE FROM TBCAIXA_CONSOLIDACAO'
      'WHERE ANO = :OLD_ANO AND NUMERO = :OLD_NUMERO AND SEQ = :OLD_SEQ')
    FetchRowSQL.Strings = (
      
        'SELECT ANO, NUMERO, SEQ, FORMA_PAGTO, DESCRICAO, TOTAL_CREDITO, ' +
        'TOTAL_DEBITO, '
      '  TOTAL_CREDITO_ESTORNO, TOTAL_DEBITO_ESTORNO'
      'FROM TBCAIXA_CONSOLIDACAO'
      'WHERE ANO = :ANO AND NUMERO = :NUMERO AND SEQ = :SEQ')
    Left = 672
    Top = 64
  end
end
