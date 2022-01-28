inherited frmGeControleCheque: TfrmGeControleCheque
  Top = 218
  Caption = 'Controle de Cheques'
  ClientHeight = 561
  ClientWidth = 941
  OldCreateOrder = True
  ExplicitWidth = 957
  ExplicitHeight = 600
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 557
    Width = 941
    ExplicitTop = 558
    ExplicitWidth = 934
  end
  inherited Bevel3: TBevel
    Top = 518
    Width = 941
    ExplicitTop = 519
    ExplicitWidth = 934
  end
  inherited pgcGuias: TPageControl
    Width = 941
    Height = 518
    OnChange = pgcGuiasChange
    ExplicitWidth = 941
    ExplicitHeight = 518
    inherited tbsTabela: TTabSheet
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 933
      ExplicitHeight = 489
      inherited Bevel4: TBevel
        Top = 423
        Width = 933
        ExplicitTop = 424
        ExplicitWidth = 926
      end
      inherited dbgDados: TDBGrid
        Width = 933
        Height = 423
        Columns = <
          item
            Expanded = False
            FieldName = 'CONTROLE'
            Title.Caption = 'Controle '
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO'
            Title.Alignment = taCenter
            Title.Caption = 'TO '
            Width = 25
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EMISSOR_NOME'
            Title.Caption = 'Emissor '
            Width = 220
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EMISSOR_CNPJ'
            Title.Caption = 'CPF / CNPJ '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NUMERO'
            Title.Caption = 'N'#250'mero  '
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BANCO'
            Title.Alignment = taCenter
            Title.Caption = 'Banco '
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            Title.Caption = 'Valor (R$) '
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clBlue
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATA_EMISSAO'
            Title.Alignment = taCenter
            Title.Caption = 'Emiss'#227'o '
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATA_APRESENTACAO'
            Title.Alignment = taCenter
            Title.Caption = 'Apresent. '
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'STATUS'
            Title.Caption = 'Situa'#231#227'o '
            Width = 100
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        Top = 427
        Width = 933
        ExplicitTop = 427
        ExplicitWidth = 933
        inherited grpBxFiltro: TGroupBox
          Left = 304
          Width = 625
          TabOrder = 1
          ExplicitLeft = 304
          ExplicitWidth = 625
          DesignSize = (
            625
            54)
          inherited lbltFiltrar: TLabel
            Left = 323
            Width = 45
            Caption = 'Cheque:'
            ExplicitLeft = 323
            ExplicitWidth = 45
          end
          object lblData: TLabel [1]
            Left = 14
            Top = 25
            Width = 82
            Height = 13
            Caption = 'Apresenta'#231#227'o:'
            FocusControl = e1Data
          end
          inherited edtFiltrar: TEdit
            Left = 374
            Width = 202
            TabOrder = 2
            ExplicitLeft = 374
            ExplicitWidth = 202
          end
          inherited btnFiltrar: TcxButton
            Left = 580
            TabOrder = 3
            ExplicitLeft = 580
          end
          object e1Data: TJvDateEdit
            Left = 102
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
            Left = 214
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
        object pnlStatus: TPanel
          AlignWithMargins = True
          Left = 7
          Top = 6
          Width = 294
          Height = 50
          Margins.Top = 2
          Margins.Bottom = 2
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object pnlSatusColor: TPanel
            Left = 0
            Top = 0
            Width = 24
            Height = 50
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 0
            object shpOperacaoCancelado: TShape
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
              Visible = False
              ExplicitTop = 46
              ExplicitWidth = 19
            end
            object shpOperacaoACompensar: TShape
              AlignWithMargins = True
              Left = 3
              Top = 21
              Width = 18
              Height = 18
              Margins.Top = 1
              Margins.Bottom = 1
              Align = alTop
              Brush.Color = clYellow
              Pen.Style = psClear
              ExplicitTop = 24
              ExplicitWidth = 19
            end
            object shpOperacaoPedente: TShape
              AlignWithMargins = True
              Left = 3
              Top = 1
              Width = 18
              Height = 18
              Margins.Top = 1
              Margins.Bottom = 1
              Align = alTop
              Brush.Color = clRed
              Pen.Style = psClear
              ExplicitTop = 2
              ExplicitWidth = 19
            end
          end
          object pnlStatusText: TPanel
            Left = 24
            Top = 0
            Width = 270
            Height = 50
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object lblOperacaoPendente: TLabel
              AlignWithMargins = True
              Left = 3
              Top = 1
              Width = 264
              Height = 18
              Margins.Top = 1
              Margins.Bottom = 1
              Align = alTop
              AutoSize = False
              Caption = '* Cheques Pendentes'
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
            object lblOperacaoACompensar: TLabel
              AlignWithMargins = True
              Left = 3
              Top = 21
              Width = 264
              Height = 18
              Margins.Top = 1
              Margins.Bottom = 1
              Align = alTop
              AutoSize = False
              Caption = '* Cheques A Compensar'
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
            object lblOperacaoCancelado: TLabel
              AlignWithMargins = True
              Left = 3
              Top = 41
              Width = 264
              Height = 18
              Margins.Top = 1
              Margins.Bottom = 1
              Align = alTop
              AutoSize = False
              Caption = '* Cheques cancelados'
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
              Visible = False
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
      ExplicitWidth = 933
      ExplicitHeight = 489
      inherited Bevel8: TBevel
        Top = 241
        Width = 933
        ExplicitTop = 241
        ExplicitWidth = 926
      end
      object Bevel5: TBevel [1]
        Left = 0
        Top = 81
        Width = 933
        Height = 4
        Align = alTop
        Shape = bsSpacer
        ExplicitWidth = 926
      end
      object bvlBaixas: TBevel [2]
        Left = 0
        Top = 337
        Width = 933
        Height = 4
        Align = alTop
        Shape = bsSpacer
        Visible = False
        ExplicitTop = 364
        ExplicitWidth = 926
      end
      inherited GrpBxDadosNominais: TGroupBox
        Width = 933
        Height = 81
        ExplicitWidth = 933
        ExplicitHeight = 81
        object lblStatus: TLabel [1]
          Left = 767
          Top = 24
          Width = 52
          Height = 13
          Caption = 'Situa'#231#227'o:'
          FocusControl = dbStatus
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblEmpresa: TLabel [2]
          Left = 87
          Top = 24
          Width = 45
          Height = 13
          Caption = 'Empresa:'
          FocusControl = dbEmpresa
        end
        object lblTipo: TLabel [3]
          Left = 455
          Top = 24
          Width = 76
          Height = 13
          Caption = 'Tipo de Origem:'
          FocusControl = dbTipo
        end
        object lblDataCadastro: TLabel [4]
          Left = 664
          Top = 24
          Width = 89
          Height = 13
          Caption = 'Cadastrado em:'
          FocusControl = dbDataCadastro
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        inherited dbCodigo: TDBEdit
          Color = clMoneyGreen
          DataField = 'CONTROLE'
        end
        object dbStatus: TDBEdit
          Left = 767
          Top = 40
          Width = 150
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'STATUS'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
        object dbEmpresa: TDBLookupComboBox
          Left = 87
          Top = 40
          Width = 362
          Height = 21
          Color = clMoneyGreen
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
          ReadOnly = True
          TabOrder = 1
        end
        object dbTipo: TDBLookupComboBox
          Left = 455
          Top = 40
          Width = 203
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
          ListSource = dtsTipoCheque
          ParentFont = False
          TabOrder = 2
        end
        object dbDataCadastro: TDBEdit
          Left = 664
          Top = 40
          Width = 97
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'DATA_CADASTRO'
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
      end
      object GrpBxDadosValores: TGroupBox
        Left = 0
        Top = 85
        Width = 933
        Height = 156
        Align = alTop
        Caption = 'Emissor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object lblNumero: TLabel
          Left = 16
          Top = 67
          Width = 96
          Height = 13
          Caption = 'N'#250'mero do Cheque:'
          FocusControl = dbNumero
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblValor: TLabel
          Left = 812
          Top = 67
          Width = 52
          Height = 13
          Caption = 'Valor (R$):'
          FocusControl = dbValor
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblBanco: TLabel
          Left = 193
          Top = 67
          Width = 33
          Height = 13
          Caption = 'Banco:'
          FocusControl = dbBanco
        end
        object lblAgencia: TLabel
          Left = 590
          Top = 67
          Width = 42
          Height = 13
          Caption = 'Ag'#234'ncia:'
          FocusControl = dbAgencia
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblEmissorCnpj: TLabel
          Left = 455
          Top = 24
          Width = 52
          Height = 13
          Caption = 'CPF/CNPJ:'
          FocusControl = dbEmissorCnpj
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblEmissao: TLabel
          Left = 590
          Top = 24
          Width = 42
          Height = 13
          Caption = 'Emiss'#227'o:'
          FocusControl = dbEmissao
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblApresentacao: TLabel
          Left = 701
          Top = 24
          Width = 71
          Height = 13
          Caption = 'Apresenta'#231#227'o:'
          FocusControl = dbApresentacao
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblEmissorNome: TLabel
          Left = 16
          Top = 24
          Width = 40
          Height = 13
          Caption = 'Emissor:'
          FocusControl = dbEmissorNome
        end
        object lblCompensacao: TLabel
          Left = 812
          Top = 24
          Width = 71
          Height = 13
          Caption = 'Compensa'#231#227'o:'
          FocusControl = dbCompensacao
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblConta: TLabel
          Left = 701
          Top = 67
          Width = 33
          Height = 13
          Caption = 'Conta:'
          FocusControl = dbConta
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblNominalA: TLabel
          Left = 590
          Top = 109
          Width = 46
          Height = 13
          Caption = 'Nominal a'
          FocusControl = dbNominalA
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object dbNumero: TDBEdit
          Left = 16
          Top = 83
          Width = 171
          Height = 21
          CharCase = ecUpperCase
          DataField = 'NUMERO'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
        object dbValor: TDBEdit
          Left = 812
          Top = 83
          Width = 105
          Height = 21
          DataField = 'VALOR'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
          OnExit = ControlEditExit
        end
        object dbBanco: TDBLookupComboBox
          Left = 193
          Top = 82
          Width = 391
          Height = 21
          DataField = 'BANCO'
          DataSource = DtSrcTabela
          DropDownRows = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'CODIGO'
          ListField = 'CODIGO_NOME'
          ListSource = dtsBanco
          ParentFont = False
          TabOrder = 6
        end
        object dbAgencia: TDBEdit
          Left = 590
          Top = 83
          Width = 105
          Height = 21
          CharCase = ecUpperCase
          DataField = 'AGENCIA'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          OnExit = ControlEditExit
        end
        object dbEmissorCnpj: TDBEdit
          Left = 455
          Top = 40
          Width = 129
          Height = 21
          Color = clMoneyGreen
          DataField = 'EMISSOR_CNPJ'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          OnExit = ControlEditExit
        end
        object dbEmissao: TJvDBDateEdit
          Left = 590
          Top = 40
          Width = 105
          Height = 21
          DataField = 'DATA_EMISSAO'
          DataSource = DtSrcTabela
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
          TabOrder = 2
        end
        object dbApresentacao: TJvDBDateEdit
          Left = 701
          Top = 40
          Width = 105
          Height = 21
          DataField = 'DATA_APRESENTACAO'
          DataSource = DtSrcTabela
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
          TabOrder = 3
        end
        object dbEmissorNome: TJvDBComboEdit
          Left = 16
          Top = 40
          Width = 433
          Height = 21
          ButtonHint = 'Pesquisar Cliente (Ctrl+P)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clMoneyGreen
          DataField = 'EMISSOR_NOME'
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
          TabOrder = 0
          OnButtonClick = dbEmissorNomeButtonClick
        end
        object dbCompensacao: TJvDBDateEdit
          Left = 812
          Top = 40
          Width = 105
          Height = 21
          DataField = 'DATA_COMPENSACAO'
          DataSource = DtSrcTabela
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
          TabOrder = 4
        end
        object dbConta: TDBEdit
          Left = 701
          Top = 83
          Width = 105
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CONTA'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
          OnExit = ControlEditExit
        end
        object dbNominalA: TDBEdit
          Left = 590
          Top = 125
          Width = 327
          Height = 21
          CharCase = ecUpperCase
          DataField = 'NOMINAL_A'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
        end
      end
      object pgcMaisDados: TPageControl
        Left = 0
        Top = 341
        Width = 933
        Height = 148
        ActivePage = tbsObservacao
        Align = alClient
        TabOrder = 3
        object tbsObservacao: TTabSheet
          Caption = 'Observa'#231#245'es'
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object dbObservacao: TDBMemo
            Left = 0
            Top = 0
            Width = 925
            Height = 120
            Align = alClient
            DataField = 'OBS'
            DataSource = DtSrcTabela
            TabOrder = 0
          end
        end
      end
      object dbgBaixas: TDBGrid
        Tag = 12
        Left = 0
        Top = 245
        Width = 933
        Height = 92
        Hint = 
          'Para a exclus'#227'o de baixas basta pressionar CTRL + DELETE'#13#10#13#10'Obse' +
          'rva'#231#227'o:'#13#10'======================='#13#10'Apenas usu'#225'rios nas fun'#231#245'es Di' +
          'retoria, Gerente Financeiro, Gerente ADM'#13#10'e/ou Masterdados podem' +
          ' excluir registros de pagamentos.'
        TabStop = False
        Align = alTop
        DataSource = dtsBaixas
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
        TabOrder = 2
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = [fsBold]
        Visible = False
        OnDrawColumnCell = dbgDadosDrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'TIPO'
            Title.Alignment = taCenter
            Title.Caption = 'Tipo '
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LANCAMENTO'
            Title.Caption = 'Lan'#231'amento '
            Width = 100
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'SEQ'
            Title.Alignment = taCenter
            Title.Caption = '# '
            Width = 25
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATA_PAGTO'
            Title.Caption = 'Pagamento '
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_BAIXA'
            Title.Caption = 'Valor (R$) '
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Title.Caption = 'Fornecedor / Cliente '
            Width = 270
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_CNPJ'
            Title.Caption = 'Cpf / Cnpj '
            Width = 150
            Visible = True
          end>
      end
    end
  end
  inherited tlbBotoes: TPanel
    Top = 522
    Width = 941
    ExplicitTop = 522
    ExplicitWidth = 941
    inherited bvlTool1: TBevel
      ExplicitLeft = 313
    end
    inherited bvlTool2: TBevel
      ExplicitLeft = 467
    end
    inherited bvlTool3: TBevel
      Left = 858
      ExplicitLeft = 851
    end
    inherited bvlTool4: TBevel
      Left = 937
      ExplicitLeft = 930
    end
    object Bevel7: TBevel [5]
      Left = 846
      Top = 2
      Width = 4
      Height = 31
      Shape = bsSpacer
    end
    inherited btbtnLista: TcxButton
      Visible = True
    end
    inherited btbtnFechar: TcxButton
      Left = 862
      TabOrder = 8
      ExplicitLeft = 862
    end
    inherited btbtnSelecionar: TcxButton
      Left = 738
      TabOrder = 7
      ExplicitLeft = 738
    end
    object btbtnAlterarSituacao: TcxButton
      Tag = 99
      Left = 618
      Top = 0
      Width = 120
      Height = 35
      Hint = 'Alterar Situa'#231#227'o do Cheque selecionado'
      Align = alRight
      Caption = 'Alterar Situa'#231#227'o'
      DropDownMenu = popMudarSituacao
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
  end
  inherited IbDtstTabela: TIBDataSet
    SelectSQL.Strings = ()
    GeneratorField.Field = 'CONTROLE'
    GeneratorField.Generator = 'GEN_CONTROLE_CHEQUE'
    GeneratorField.ApplyEvent = gamOnNewRecord
  end
  inherited DtSrcTabela: TDataSource
    DataSet = fdQryTabela
    Left = 704
    Top = 0
  end
  inherited IbUpdTabela: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  CONTROLE,'
      '  EMPRESA,'
      '  TIPO,'
      '  BANCO,'
      '  AGENCIA,'
      '  CONTA,'
      '  NUMERO,'
      '  FORNECEDOR,'
      '  CLIENTE,'
      '  DATA_EMISSAO,'
      '  DATA_APRESENTACAO,'
      '  DATA_DEVOLUCAO,'
      '  DATA_COMPENSACAO,'
      '  VALOR,'
      '  NOMINAL_A,'
      '  DATA_CADASTRO,'
      '  USUARIO_CADASTRO,'
      '  STATUS,'
      '  OBS'
      'from TBCHEQUE '
      'where'
      '  CONTROLE = :CONTROLE')
    ModifySQL.Strings = (
      'update TBCHEQUE'
      'set'
      '  AGENCIA = :AGENCIA,'
      '  BANCO = :BANCO,'
      '  CLIENTE = :CLIENTE,'
      '  CONTA = :CONTA,'
      '  CONTROLE = :CONTROLE,'
      '  DATA_APRESENTACAO = :DATA_APRESENTACAO,'
      '  DATA_CADASTRO = :DATA_CADASTRO,'
      '  DATA_COMPENSACAO = :DATA_COMPENSACAO,'
      '  DATA_DEVOLUCAO = :DATA_DEVOLUCAO,'
      '  DATA_EMISSAO = :DATA_EMISSAO,'
      '  EMPRESA = :EMPRESA,'
      '  FORNECEDOR = :FORNECEDOR,'
      '  NOMINAL_A = :NOMINAL_A,'
      '  NUMERO = :NUMERO,'
      '  OBS = :OBS,'
      '  STATUS = :STATUS,'
      '  TIPO = :TIPO,'
      '  USUARIO_CADASTRO = :USUARIO_CADASTRO,'
      '  VALOR = :VALOR'
      'where'
      '  CONTROLE = :OLD_CONTROLE')
    InsertSQL.Strings = (
      'insert into TBCHEQUE'
      
        '  (AGENCIA, BANCO, CLIENTE, CONTA, CONTROLE, DATA_APRESENTACAO, ' +
        'DATA_CADASTRO, '
      
        '   DATA_COMPENSACAO, DATA_DEVOLUCAO, DATA_EMISSAO, EMPRESA, FORN' +
        'ECEDOR, '
      
        '   NOMINAL_A, NUMERO, OBS, STATUS, TIPO, USUARIO_CADASTRO, VALOR' +
        ')'
      'values'
      
        '  (:AGENCIA, :BANCO, :CLIENTE, :CONTA, :CONTROLE, :DATA_APRESENT' +
        'ACAO, :DATA_CADASTRO, '
      
        '   :DATA_COMPENSACAO, :DATA_DEVOLUCAO, :DATA_EMISSAO, :EMPRESA, ' +
        ':FORNECEDOR, '
      
        '   :NOMINAL_A, :NUMERO, :OBS, :STATUS, :TIPO, :USUARIO_CADASTRO,' +
        ' :VALOR)')
    DeleteSQL.Strings = (
      'delete from TBCHEQUE'
      'where'
      '  CONTROLE = :OLD_CONTROLE')
  end
  inherited ImgList: TImageList
    Left = 608
    Top = 0
  end
  inherited fdQryTabela: TFDQuery
    UpdateOptions.AssignedValues = [uvFetchGeneratorsPoint, uvGeneratorName]
    UpdateOptions.FetchGeneratorsPoint = gpImmediate
    UpdateOptions.GeneratorName = 'GEN_CONTROLE_CHEQUE'
    UpdateOptions.KeyFields = 'CONTROLE'
    UpdateOptions.AutoIncFields = 'CONTROLE'
    SQL.Strings = (
      'Select'
      '    c.controle'
      '  , c.empresa'
      '  , c.tipo'
      '  , c.banco'
      '  , c.agencia'
      '  , c.conta'
      '  , c.numero'
      '  , c.fornecedor'
      '  , c.cliente'
      '  , c.data_emissao'
      '  , c.data_apresentacao'
      '  , c.data_devolucao'
      '  , c.data_compensacao'
      '  , c.valor'
      '  , c.nominal_a'
      '  , c.data_cadastro'
      '  , c.usuario_cadastro'
      '  , c.status'
      '  , c.obs'
      ''
      '  , sc.descricao     as status_descricao'
      '  , bc.nome          as banco_nome'
      ''
      '  , coalesce(cc.nome, fc.nomeforn)               as emissor_nome'
      '  , coalesce(cc.cnpj, fc.cnpj)                   as emissor_cnpj'
      '  , coalesce(cc.pessoa_fisica, fc.pessoa_fisica) as emissor_pf'
      ''
      '  , cc.nome          as cliente_nome'
      '  , cc.cnpj          as cliente_cnpj'
      '  , cc.pessoa_fisica as cliente_pf'
      ''
      '  , fc.nomeforn      as fornecedor_nome'
      '  , fc.cnpj          as fornecedor_cnpj'
      '  , fc.pessoa_fisica as fornecedor_pf'
      'from TBCHEQUE c'
      '  left join VW_STATUS_CHEQUE sc on (sc.codigo = c.status)'
      '  left join TBCLIENTE cc on (cc.codigo = c.cliente)'
      '  left join TBFORNECEDOR fc on (fc.codforn = c.fornecedor)'
      '  left join TBBANCO bc on (bc.cod = c.banco)')
    object fdQryTabelaCONTROLE: TIntegerField
      Alignment = taCenter
      AutoGenerateValue = arAutoInc
      DisplayLabel = 'Controle'
      FieldName = 'CONTROLE'
      Origin = 'CONTROLE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '0000000'
    end
    object fdQryTabelaEMPRESA: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      Origin = 'EMPRESA'
      Required = True
      Size = 18
    end
    object fdQryTabelaTIPO: TSmallintField
      Alignment = taCenter
      DisplayLabel = 'Tipo de Origem'
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Required = True
    end
    object fdQryTabelaEMISSOR_NOME: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Emissor'
      FieldName = 'EMISSOR_NOME'
      Origin = 'EMISSOR_NOME'
      ProviderFlags = []
      Required = True
      Size = 100
    end
    object fdQryTabelaEMISSOR_CNPJ: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Emissor (CNPJ)'
      FieldName = 'EMISSOR_CNPJ'
      Origin = 'EMISSOR_CNPJ'
      ProviderFlags = []
      OnGetText = fdQryTabelaEMISSOR_CNPJGetText
      Size = 18
    end
    object fdQryTabelaEMISSOR_PF: TSmallintField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Emissor (CPF)'
      FieldName = 'EMISSOR_PF'
      Origin = 'EMISSOR_PF'
      ProviderFlags = []
    end
    object fdQryTabelaDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      Origin = 'DATA_CADASTRO'
      Required = True
    end
    object fdQryTabelaDATA_EMISSAO: TDateField
      DisplayLabel = 'Data de Emiss'#227'o'
      FieldName = 'DATA_EMISSAO'
      Origin = 'DATA_EMISSAO'
      Required = True
    end
    object fdQryTabelaDATA_APRESENTACAO: TDateField
      DisplayLabel = 'Data de Apresenta'#231#227'o'
      FieldName = 'DATA_APRESENTACAO'
      Origin = 'DATA_APRESENTACAO'
      Required = True
    end
    object fdQryTabelaDATA_DEVOLUCAO: TDateField
      FieldName = 'DATA_DEVOLUCAO'
      Origin = 'DATA_DEVOLUCAO'
    end
    object fdQryTabelaDATA_COMPENSACAO: TDateField
      DisplayLabel = 'Data de Compensa'#231#227'o'
      FieldName = 'DATA_COMPENSACAO'
      Origin = 'DATA_COMPENSACAO'
    end
    object fdQryTabelaNUMERO: TStringField
      DisplayLabel = 'N'#250'mero do Cheque'
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Required = True
      Size = 30
    end
    object fdQryTabelaBANCO: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
      Origin = 'BANCO'
      Required = True
      Size = 10
    end
    object fdQryTabelaAGENCIA: TStringField
      DisplayLabel = 'Ag'#234'ncia'
      FieldName = 'AGENCIA'
      Origin = 'AGENCIA'
      Required = True
    end
    object fdQryTabelaCONTA: TStringField
      DisplayLabel = 'Conta'
      FieldName = 'CONTA'
      Origin = 'CONTA'
      Required = True
    end
    object fdQryTabelaVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Precision = 18
      Size = 2
    end
    object fdQryTabelaFORNECEDOR: TIntegerField
      DisplayLabel = 'Fornecedor'
      FieldName = 'FORNECEDOR'
      Origin = 'FORNECEDOR'
    end
    object fdQryTabelaCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
      Origin = 'CLIENTE'
    end
    object fdQryTabelaNOMINAL_A: TStringField
      DisplayLabel = 'Nominal a'
      FieldName = 'NOMINAL_A'
      Origin = 'NOMINAL_A'
      Size = 50
    end
    object fdQryTabelaUSUARIO_CADASTRO: TStringField
      FieldName = 'USUARIO_CADASTRO'
      Origin = 'USUARIO_CADASTRO'
      Size = 12
    end
    object fdQryTabelaSTATUS: TSmallintField
      Alignment = taLeftJustify
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
      OnGetText = fdQryTabelaSTATUSGetText
    end
    object fdQryTabelaOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      Origin = 'OBS'
      BlobType = ftMemo
    end
    object fdQryTabelaSTATUS_DESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'STATUS_DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      FixedChar = True
      Size = 11
    end
    object fdQryTabelaBANCO_NOME: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Banco'
      FieldName = 'BANCO_NOME'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object fdQryTabelaCLIENTE_NOME: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Emissor'
      FieldName = 'CLIENTE_NOME'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object fdQryTabelaCLIENTE_CNPJ: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'CPF/CNPJ'
      FieldName = 'CLIENTE_CNPJ'
      Origin = 'CNPJ'
      ProviderFlags = []
      Size = 18
    end
    object fdQryTabelaCLIENTE_PF: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'CLIENTE_PF'
      Origin = 'PESSOA_FISICA'
      ProviderFlags = []
    end
    object fdQryTabelaFORNECEDOR_NOME: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Emissor'
      FieldName = 'FORNECEDOR_NOME'
      Origin = 'NOMEFORN'
      ProviderFlags = []
      Size = 100
    end
    object fdQryTabelaFORNECEDOR_CNPJ: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'CPF/CNPJ'
      FieldName = 'FORNECEDOR_CNPJ'
      Origin = 'CNPJ'
      ProviderFlags = []
      Size = 18
    end
    object fdQryTabelaFORNECEDOR_PF: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'FORNECEDOR_PF'
      Origin = 'PESSOA_FISICA'
      ProviderFlags = []
    end
  end
  inherited fdUpdTabela: TFDUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO TBCHEQUE'
      '(CONTROLE, EMPRESA, TIPO, BANCO, AGENCIA, '
      '  CONTA, NUMERO, FORNECEDOR, CLIENTE, '
      '  DATA_EMISSAO, DATA_APRESENTACAO, DATA_DEVOLUCAO, '
      '  DATA_COMPENSACAO, VALOR, NOMINAL_A, DATA_CADASTRO, '
      '  USUARIO_CADASTRO, STATUS, OBS)'
      
        'VALUES (:NEW_CONTROLE, :NEW_EMPRESA, :NEW_TIPO, :NEW_BANCO, :NEW' +
        '_AGENCIA, '
      '  :NEW_CONTA, :NEW_NUMERO, :NEW_FORNECEDOR, :NEW_CLIENTE, '
      
        '  :NEW_DATA_EMISSAO, :NEW_DATA_APRESENTACAO, :NEW_DATA_DEVOLUCAO' +
        ', '
      
        '  :NEW_DATA_COMPENSACAO, :NEW_VALOR, :NEW_NOMINAL_A, :NEW_DATA_C' +
        'ADASTRO, '
      '  :NEW_USUARIO_CADASTRO, :NEW_STATUS, :NEW_OBS)')
    ModifySQL.Strings = (
      'UPDATE TBCHEQUE'
      
        'SET CONTROLE = :NEW_CONTROLE, EMPRESA = :NEW_EMPRESA, TIPO = :NE' +
        'W_TIPO, '
      
        '  BANCO = :NEW_BANCO, AGENCIA = :NEW_AGENCIA, CONTA = :NEW_CONTA' +
        ', '
      
        '  NUMERO = :NEW_NUMERO, FORNECEDOR = :NEW_FORNECEDOR, CLIENTE = ' +
        ':NEW_CLIENTE, '
      
        '  DATA_EMISSAO = :NEW_DATA_EMISSAO, DATA_APRESENTACAO = :NEW_DAT' +
        'A_APRESENTACAO, '
      
        '  DATA_DEVOLUCAO = :NEW_DATA_DEVOLUCAO, DATA_COMPENSACAO = :NEW_' +
        'DATA_COMPENSACAO, '
      
        '  VALOR = :NEW_VALOR, NOMINAL_A = :NEW_NOMINAL_A, DATA_CADASTRO ' +
        '= :NEW_DATA_CADASTRO, '
      
        '  USUARIO_CADASTRO = :NEW_USUARIO_CADASTRO, STATUS = :NEW_STATUS' +
        ', '
      '  OBS = :NEW_OBS'
      'WHERE CONTROLE = :OLD_CONTROLE')
    DeleteSQL.Strings = (
      'DELETE FROM TBCHEQUE'
      'WHERE CONTROLE = :OLD_CONTROLE')
    FetchRowSQL.Strings = (
      'Select'
      '    c.controle'
      '  , c.empresa'
      '  , c.tipo'
      '  , c.banco'
      '  , c.agencia'
      '  , c.conta'
      '  , c.numero'
      '  , c.fornecedor'
      '  , c.cliente'
      '  , c.data_emissao'
      '  , c.data_apresentacao'
      '  , c.data_devolucao'
      '  , c.data_compensacao'
      '  , c.valor'
      '  , c.nominal_a'
      '  , c.data_cadastro'
      '  , c.usuario_cadastro'
      '  , c.status'
      '  , c.obs'
      ''
      '  , sc.descricao     as status_descricao'
      '  , bc.nome          as banco_nome'
      ''
      '  , coalesce(cc.nome, fc.nomeforn)               as emissor_nome'
      '  , coalesce(cc.cnpj, fc.cnpj)                   as emissor_cnpj'
      '  , coalesce(cc.pessoa_fisica, fc.pessoa_fisica) as emissor_pf'
      ''
      '  , cc.nome          as cliente_nome'
      '  , cc.cnpj          as cliente_cnpj'
      '  , cc.pessoa_fisica as cliente_pf'
      ''
      '  , fc.nomeforn      as fornecedor_nome'
      '  , fc.cnpj          as fornecedor_cnpj'
      '  , fc.pessoa_fisica as fornecedor_pf'
      'from TBCHEQUE c'
      '  left join VW_STATUS_CHEQUE sc on (sc.codigo = c.status)'
      '  left join TBCLIENTE cc on (cc.codigo = c.cliente)'
      '  left join TBFORNECEDOR fc on (fc.codforn = c.fornecedor)'
      '  left join TBBANCO bc on (bc.cod = c.banco)'
      'WHERE c.CONTROLE = :CONTROLE')
  end
  object dtsEmpresa: TDataSource
    DataSet = fdQryEmpresa
    Left = 360
    Top = 296
  end
  object dtsBaixas: TDataSource
    AutoEdit = False
    DataSet = qryBaixas
    Left = 824
    Top = 312
  end
  object dtsBanco: TDataSource
    DataSet = fdQryBanco
    Left = 360
    Top = 360
  end
  object FrChequeA5: TfrxReport
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
    Left = 64
    Top = 352
    Datasets = <
      item
        DataSet = DMNFe.frdEmpresa
        DataSetName = 'frdEmpresa'
      end
      item
        DataSet = FrdCheque
        DataSetName = 'FrdCheque'
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
          Font.Height = -13
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
        Child = FrChequeA5.BndChildAssinatura
        DataSet = FrdCheque
        DataSetName = 'FrdCheque'
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
            315C716A5C66305C66733230205265636562656D6F732064652F6461205C6220
            5B46726452656369626F2E224E4F4D455F434C49454E5445225D5C6230202061
            20696D706F72745C2765326E636961206465205C62205B46726452656369626F
            2E2256414C4F525F42414958415F455854454E534F225D5C6230202072656665
            72656E7465205C276530205C62205B46726452656369626F2E22484953544F52
            49434F225D202D20284C616E5C276537616D656E746F205B4672645265636962
            6F2E22414E4F4C414E43225D2F5B466F726D6174466C6F617428273030303030
            272C3C46726452656369626F2E224E554D4C414E43223E295D2E505B466F726D
            6174466C6F617428273030272C3C46726452656369626F2E2250415243454C41
            223E295D295C6230202E5C7061720D0A7D0D0A00}
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
  object FrdCheque: TfrxDBDataset
    UserName = 'FrdCheque'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CONTROLE=CONTROLE'
      'EMPRESA=EMPRESA'
      'TIPO=TIPO'
      'BANCO=BANCO'
      'BANCO_LOGO=BANCO_LOGO'
      'AGENCIA=AGENCIA'
      'CONTA=CONTA'
      'NUMERO=NUMERO'
      'FORNECEDOR=FORNECEDOR'
      'CLIENTE=CLIENTE'
      'DATA_EMISSAO=DATA_EMISSAO'
      'DATA_APRESENTACAO=DATA_APRESENTACAO'
      'DATA_COMPENSACAO=DATA_COMPENSACAO'
      'VALOR=VALOR'
      'VALOR_EXTENSO=VALOR_EXTENSO'
      'NOMINAL_A=NOMINAL_A'
      'DATA_CADASTRO=DATA_CADASTRO'
      'USUARIO_CADASTRO=USUARIO_CADASTRO'
      'STATUS=STATUS'
      'OBS=OBS'
      'STATUS_DESCRICAO=STATUS_DESCRICAO'
      'BANCO_NOME=BANCO_NOME'
      'EMISSOR_NOME=EMISSOR_NOME'
      'EMISSOR_CNPJ=EMISSOR_CNPJ'
      'EMISSOR_PF=EMISSOR_PF')
    DataSet = CdsCheque
    BCDToCurrency = True
    Left = 92
    Top = 353
  end
  object ACBrExtenso: TACBrExtenso
    StrMoeda = 'Real'
    StrMoedas = 'Reais'
    StrCentavo = 'Centavo'
    StrCentavos = 'Centavos'
    Left = 124
    Top = 353
  end
  object DspCheque: TDataSetProvider
    DataSet = QryCheque
    Left = 96
    Top = 400
  end
  object CdsCheque: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'CHEQUE'
        ParamType = ptInput
      end>
    ProviderName = 'DspCheque'
    OnCalcFields = CdsChequeCalcFields
    Left = 128
    Top = 400
    object CdsChequeCONTROLE: TIntegerField
      FieldName = 'CONTROLE'
      Required = True
    end
    object CdsChequeEMPRESA: TStringField
      FieldName = 'EMPRESA'
      Size = 18
    end
    object CdsChequeTIPO: TSmallintField
      FieldName = 'TIPO'
    end
    object CdsChequeBANCO: TStringField
      FieldName = 'BANCO'
      Required = True
      Size = 10
    end
    object CdsChequeBANCO_LOGO: TBlobField
      FieldName = 'BANCO_LOGO'
      ProviderFlags = []
    end
    object CdsChequeAGENCIA: TStringField
      FieldName = 'AGENCIA'
      Required = True
    end
    object CdsChequeCONTA: TStringField
      FieldName = 'CONTA'
      Required = True
    end
    object CdsChequeNUMERO: TStringField
      FieldName = 'NUMERO'
      Required = True
      Size = 30
    end
    object CdsChequeFORNECEDOR: TIntegerField
      FieldName = 'FORNECEDOR'
    end
    object CdsChequeCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
    end
    object CdsChequeDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object CdsChequeDATA_APRESENTACAO: TDateField
      FieldName = 'DATA_APRESENTACAO'
    end
    object CdsChequeDATA_COMPENSACAO: TDateField
      FieldName = 'DATA_COMPENSACAO'
    end
    object CdsChequeVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 18
      Size = 2
    end
    object CdsChequeVALOR_EXTENSO: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'VALOR_EXTENSO'
      Size = 250
    end
    object CdsChequeNOMINAL_A: TStringField
      FieldName = 'NOMINAL_A'
      ReadOnly = True
      Size = 140
    end
    object CdsChequeDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      Required = True
    end
    object CdsChequeUSUARIO_CADASTRO: TStringField
      FieldName = 'USUARIO_CADASTRO'
      Size = 12
    end
    object CdsChequeSTATUS: TSmallintField
      FieldName = 'STATUS'
      Required = True
    end
    object CdsChequeOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
    end
    object CdsChequeSTATUS_DESCRICAO: TStringField
      FieldName = 'STATUS_DESCRICAO'
      ReadOnly = True
      FixedChar = True
      Size = 11
    end
    object CdsChequeBANCO_NOME: TStringField
      FieldName = 'BANCO_NOME'
      ReadOnly = True
      Size = 100
    end
    object CdsChequeEMISSOR_NOME: TStringField
      FieldName = 'EMISSOR_NOME'
      ReadOnly = True
      Size = 100
    end
    object CdsChequeEMISSOR_CNPJ: TStringField
      FieldName = 'EMISSOR_CNPJ'
      ReadOnly = True
      Size = 18
    end
    object CdsChequeEMISSOR_PF: TSmallintField
      FieldName = 'EMISSOR_PF'
      ReadOnly = True
    end
  end
  object popImprimir: TPopupMenu
    Images = ImgList
    Left = 24
    Top = 318
    object popGerarEspelhoChequeA4: TMenuItem
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
      Caption = 'Espelho Cheque (Formato A&4)'
      OnClick = popGerarReciboClick
    end
    object popGerarEspelhoChequeA5: TMenuItem
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
      Caption = 'Espelho Cheque (Formato A&5)'
      Visible = False
      OnClick = popGerarReciboClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object popRelacaoCheques: TMenuItem
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
      Caption = 'Rela'#231#227'o de Cheques (%s)'
      OnClick = popRelacaoChequesClick
    end
  end
  object dtsTipoCheque: TDataSource
    DataSet = fdQryTipoCheque
    Left = 360
    Top = 328
  end
  object FrChequeA4: TfrxReport
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
    ReportOptions.LastChange = 42215.926201203700000000
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
    Left = 64
    Top = 320
    Datasets = <
      item
        DataSet = DMNFe.frdEmpresa
        DataSetName = 'frdEmpresa'
      end
      item
        DataSet = FrdCheque
        DataSetName = 'FrdCheque'
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
      end
      item
        Name = 'sComplementoValor'
        Value = 
          #39' . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . ' +
          '. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . ' +
          '. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . ' +
          '. . . . . . . . . . . . . . . . . . . . . . . . . . . . . .'#39
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
          Font.Height = -13
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
            'N'#250'mero Controle ')
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
            '[FormatFloat('#39'###0000000'#39', <FrdCheque."CONTROLE">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndPageFooter: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 30.236240000000000000
        Top = 510.236550000000000000
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
          Top = 15.118119999999920000
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
        Height = 272.126160000000000000
        Top = 177.637910000000000000
        Width = 718.110700000000000000
        DataSet = FrdCheque
        DataSetName = 'FrdCheque'
        RowCount = 0
        Stretched = True
        object FrdChequeSTATUS: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 3.779529999999994000
          Width = 702.992580000000000000
          Height = 268.346630000000000000
          CharSpacing = 4.000000000000000000
          DataSet = FrdCheque
          DataSetName = 'FrdCheque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 14211288
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[FrdCheque."STATUS_DESCRICAO"]')
          ParentFont = False
          Rotation = 45
          WordWrap = False
          VAlign = vaCenter
          Formats = <
            item
            end
            item
            end>
        end
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 3.779529999999994000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' Comp.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 41.574830000000000000
          Top = 3.779529999999994000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' Banco')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 94.488250000000000000
          Top = 3.779529999999994000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' Ag'#234'ncia')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 173.858380000000000000
          Top = 3.779529999999994000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' C1')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 200.315090000000000000
          Top = 3.779529999999994000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' N'#250'mero da Conta')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 317.480520000000000000
          Top = 3.779529999999994000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' C2')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 343.937230000000000000
          Top = 3.779529999999994000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' N'#250'mero do Cheque')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 487.559370000000000000
          Top = 3.779529999999994000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' C3')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 514.016080000000000000
          Top = 3.779529999999994000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' R$')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 22.677179999999990000
          Width = 34.015770000000000000
          Height = 22.677150710000000000
          DataSet = FrdCheque
          DataSetName = 'FrdCheque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft]
          Frame.Width = 0.100000000000000000
          ParentFont = False
        end
        object FrdChequeBANCO: TfrxMemoView
          AllowVectorExport = True
          Left = 41.574830000000000000
          Top = 22.677179999999990000
          Width = 52.913420000000000000
          Height = 22.677180000000000000
          DataSet = FrdCheque
          DataSetName = 'FrdCheque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' [FrdCheque."BANCO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object FrdChequeAGENCIA: TfrxMemoView
          AllowVectorExport = True
          Left = 94.488250000000000000
          Top = 22.677179999999990000
          Width = 79.370130000000000000
          Height = 22.677180000000000000
          DataSet = FrdCheque
          DataSetName = 'FrdCheque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' [FrdCheque."AGENCIA"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 173.858380000000000000
          Top = 22.677179999999990000
          Width = 26.456710000000000000
          Height = 22.677150710000000000
          DataSet = FrdCheque
          DataSetName = 'FrdCheque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft]
          Frame.Width = 0.100000000000000000
          ParentFont = False
        end
        object FrdChequeCONTA: TfrxMemoView
          AllowVectorExport = True
          Left = 200.315090000000000000
          Top = 22.677179999999990000
          Width = 117.165430000000000000
          Height = 22.677180000000000000
          DataSet = FrdCheque
          DataSetName = 'FrdCheque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' [FrdCheque."CONTA"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 317.480520000000000000
          Top = 22.677179999999990000
          Width = 26.456710000000000000
          Height = 22.677150710000000000
          DataSet = FrdCheque
          DataSetName = 'FrdCheque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft]
          Frame.Width = 0.100000000000000000
          ParentFont = False
        end
        object FrdChequeNUMERO: TfrxMemoView
          AllowVectorExport = True
          Left = 343.937230000000000000
          Top = 22.677179999999990000
          Width = 143.622140000000000000
          Height = 22.677180000000000000
          DataSet = FrdCheque
          DataSetName = 'FrdCheque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' [FrdCheque."NUMERO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 487.559370000000000000
          Top = 22.677179999999990000
          Width = 26.456710000000000000
          Height = 22.677150710000000000
          DataSet = FrdCheque
          DataSetName = 'FrdCheque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft]
          Frame.Width = 0.100000000000000000
          ParentFont = False
        end
        object FrdChequeVALOR: TfrxMemoView
          AllowVectorExport = True
          Left = 514.016080000000000000
          Top = 22.677179999999990000
          Width = 196.535560000000000000
          Height = 22.677180000000000000
          DataSet = FrdCheque
          DataSetName = 'FrdCheque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[FormatFloat('#39'"# R$ " ,0.00 "#"'#39', <FrdCheque."VALOR">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 332.598640000000000000
          Top = 253.228510000000000000
          Width = 377.953000000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            
              '[IIF(<FrdCheque."EMISSOR_PF">=1,'#39'CPF: '#39', '#39'CNPJ: '#39')] [IIF(<FrdChe' +
              'que."EMISSOR_PF">=1,FormatMaskText('#39'###.###.###-##;0;'#39',<FrdChequ' +
              'e."EMISSOR_CNPJ">),FormatMaskText('#39'##.###.###/####-##;0;'#39',<FrdCh' +
              'eque."EMISSOR_CNPJ">))]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 332.598640000000000000
          Top = 230.551330000000000000
          Width = 377.953000000000000000
          Height = 22.677180000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            '[FrdCheque."EMISSOR_NOME"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Rich1: TfrxRichView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 71.811070000000000000
          Width = 702.992580000000000000
          Height = 136.063080000000000000
          Frame.Typ = []
          GapX = 2.000000000000000000
          GapY = 1.000000000000000000
          RichEdit = {
            7B5C727466315C616E73695C616E7369637067313235325C64656666305C6E6F
            7569636F6D7061745C6465666C616E67313034367B5C666F6E7474626C7B5C66
            305C666E696C5C666368617273657430205461686F6D613B7D7D0D0A7B5C2A5C
            67656E657261746F722052696368656432302031302E302E31393034317D5C76
            6965776B696E64345C756331200D0A5C706172645C6669313338305C716A5C75
            6C5C66305C66733230205B4672644368657175652E2256414C4F525F45585445
            4E534F225D205B436F7079283C73436F6D706C656D656E746F56616C6F723E2C
            20312C2028313530202D204C656E677468283C4672644368657175652E225641
            4C4F525F455854454E534F223E2929295D5C756C6E6F6E655C66733136202061
            63696D615C7061720D0A0D0A5C706172645C716A5C7061720D0A61205C756C5C
            66733230205B4672644368657175652E224E4F4D494E414C5F41225D5C756C6E
            6F6E655C6673313620206F75205C27653020737561206F7264656D2E5C706172
            0D0A5C7061720D0A0D0A5C706172645C71725C66733230205B4369646164655D
            2F5B55465D2C205B466F726D61744461746554696D6528276464202220646520
            22206D6D6D6D202220646520222079797979272C203C4672644368657175652E
            22444154415F454D495353414F223E295D2E5C7061720D0A0D0A5C706172645C
            716A5C7061720D0A7D0D0A00}
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 64.252010000000010000
          Width = 90.708720000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            'Pague por este'
            'cheque a quantia de ')
          ParentFont = False
          VAlign = vaCenter
        end
        object imgLogoBanco: TfrxPictureView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 170.078850000000000000
          Width = 149.000000000000000000
          Height = 38.000000000000000000
          DataField = 'BANCO_LOGO'
          DataSet = FrdCheque
          DataSetName = 'FrdCheque'
          Frame.Typ = []
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
      end
    end
  end
  object popMudarSituacao: TPopupMenu
    Images = ImgList
    Left = 584
    Top = 446
    object ppmApresentar: TMenuItem
      Tag = 1
      Caption = 'Apresentar Cheque'
      ImageIndex = 20
      OnClick = ppmApresentarClick
    end
    object ppmDevolvido: TMenuItem
      Tag = 2
      Caption = 'Cheque Devolvido'
      ImageIndex = 18
      OnClick = ppmDevolvidoClick
    end
    object ppmCompensado: TMenuItem
      Tag = 8
      Caption = 'Cheque Compensado'
      ImageIndex = 14
      OnClick = ppmCompensadoClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object ppmCancelar: TMenuItem
      Tag = 9
      Caption = 'Cancelar Cheque'
      ImageIndex = 4
      OnClick = ppmCancelarClick
    end
  end
  object DspRelacaoCheque: TDataSetProvider
    DataSet = QryRelacaoCheque
    Left = 96
    Top = 448
  end
  object CdsRelacaoCheque: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
        Size = 18
      end
      item
        DataType = ftDate
        Name = 'DATA_INICIAL'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA_FINAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspRelacaoCheque'
    OnCalcFields = CdsChequeCalcFields
    Left = 128
    Top = 448
  end
  object frdsRelacaoCheque: TfrxDBDataset
    UserName = 'frdsRelacaoCheque'
    CloseDataSource = False
    FieldAliases.Strings = (
      'EMPRESA=EMPRESA'
      'CONTROLE=CONTROLE'
      'TIPO=TIPO'
      'TIPO_DESCRICAO=TIPO_DESCRICAO'
      'STATUS=STATUS'
      'STATUS_DESCRICAO=STATUS_DESCRICAO'
      'BANCO=BANCO'
      'BANCO_NOME=BANCO_NOME'
      'AGENCIA=AGENCIA'
      'CONTA=CONTA'
      'NUMERO=NUMERO'
      'DATA_EMISSAO=DATA_EMISSAO'
      'DATA_APRESENTACAO=DATA_APRESENTACAO'
      'DATA_DEVOLUCAO=DATA_DEVOLUCAO'
      'DATA_COMPENSACAO=DATA_COMPENSACAO'
      'VALOR=VALOR'
      'EMISSOR_NOME=EMISSOR_NOME'
      'EMISSOR_CPF_CNPJ=EMISSOR_CPF_CNPJ'
      'EMISSOR_PF=EMISSOR_PF')
    DataSet = CdsRelacaoCheque
    BCDToCurrency = True
    Left = 160
    Top = 448
  end
  object frRelacaoCheque: TfrxReport
    Version = '6.3.7'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PreviewOptions.ZoomMode = zmPageWidth
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41557.397184305600000000
    ReportOptions.Name = 'Teste!'
    ReportOptions.LastChange = 42478.674753634300000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = FrReciboGetValue
    Left = 192
    Top = 448
    Datasets = <
      item
        DataSet = DMNFe.frdEmpresa
        DataSetName = 'frdEmpresa'
      end
      item
        DataSet = frdsRelacaoCheque
        DataSetName = 'frdsRelacaoCheque'
      end>
    Variables = <
      item
        Name = ' Local'
        Value = Null
      end
      item
        Name = 'Titulo'
        Value = #39'TESTE'#39
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
        Name = 'Periodo'
        Value = #39#39
      end
      item
        Name = 'SubTitulo'
        Value = #39#39
      end
      item
        Name = ' Valores'
        Value = Null
      end
      item
        Name = 'ValorApresentado'
        Value = 
          'IIF(<frdsRelacaoCheque."STATUS">=1,<frdsRelacaoCheque."VALOR">,0' +
          '.0)'
      end
      item
        Name = 'ValorDevolvido'
        Value = 
          'IIF(<frdsRelacaoCheque."STATUS">=2,<frdsRelacaoCheque."VALOR">,0' +
          '.0)'
      end
      item
        Name = 'ValorCompensado'
        Value = 
          'IIF(<frdsRelacaoCheque."STATUS">=8,<frdsRelacaoCheque."VALOR">,0' +
          '.0)'
      end
      item
        Name = 'ValorCancelado'
        Value = 
          'IIF(<frdsRelacaoCheque."STATUS">=9,<frdsRelacaoCheque."VALOR">,0' +
          '.0)'
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
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
        Height = 139.842610000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        Stretched = True
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 94.488250000000000000
          Width = 933.543910000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[Titulo]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Picture1: TfrxPictureView
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
          Width = 665.197280000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
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
          Left = 113.385900000000000000
          Top = 26.456710000000000000
          Width = 665.196850393700800000
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
        object frdFone: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 41.574830000000000000
          Width = 665.196850393700800000
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
        object Memo11: TfrxMemoView
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
        object Line1: TfrxLineView
          AllowVectorExport = True
          Top = 94.488250000000000000
          Width = 1046.929810000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 120.944960000000000000
          Width = 933.543910000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[Periodo]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo44: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 71.811070000000000000
          Width = 665.196850393700800000
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
        end
      end
      object BndPageFooter: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 30.236240000000000000
        Top = 555.590910000000000000
        Width = 1046.929810000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Width = 910.866730000000000000
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
          Width = 910.866730000000000000
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
          Left = 910.866730000000000000
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
      object BndGrpHeaderStatus: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 56.692950000000010000
        Top = 219.212740000000000000
        Width = 1046.929810000000000000
        Condition = 'frdsRelacaoCheque."STATUS"'
        ReprintOnNewPage = True
        object frdEmpresaPESSOA_FISICA: TfrxMemoView
          AllowVectorExport = True
          Left = 128.504020000000000000
          Width = 918.425790000000000000
          Height = 18.897650000000000000
          CharSpacing = 2.000000000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' [frdsRelacaoCheque."STATUS_DESCRICAO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          CharSpacing = 2.000000000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          Memo.UTF8W = (
            ' Status')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 45.354360000000000000
          Top = 18.897650000000000000
          Width = 83.149660000000000000
          Height = 37.795300000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haCenter
          Memo.UTF8W = (
            'Apresenta'#231#227'o')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 302.362400000000000000
          Top = 18.897650000000000000
          Width = 744.567410000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haCenter
          Memo.UTF8W = (
            'Dados do Cheque')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 944.882500000000000000
          Top = 37.795299999999940000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            'Valor (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 128.504020000000000000
          Top = 18.897650000000000000
          Width = 173.858316540000000000
          Height = 37.795300000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haCenter
          Memo.UTF8W = (
            'Emissor')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 302.362400000000000000
          Top = 37.795299999999940000
          Width = 173.858306770000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          Memo.UTF8W = (
            ' Banco')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 476.220780000000000000
          Top = 37.795299999999940000
          Width = 52.913346770000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          Memo.UTF8W = (
            ' Ag'#234'ncia')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Left = 529.134199999999900000
          Top = 37.795299999999940000
          Width = 79.370056770000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          Memo.UTF8W = (
            ' Conta')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          AllowVectorExport = True
          Left = 608.504330000000000000
          Top = 37.795299999999940000
          Width = 86.929116769999990000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          Memo.UTF8W = (
            ' N'#250'mero')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          AllowVectorExport = True
          Left = 695.433520000000000000
          Top = 37.795299999999940000
          Width = 83.149586770000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          Memo.UTF8W = (
            ' Emiss'#227'o')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          AllowVectorExport = True
          Left = 778.583180000000000000
          Top = 37.795299999999940000
          Width = 83.149586770000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          Memo.UTF8W = (
            ' Devolu'#231#227'o')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          AllowVectorExport = True
          Left = 861.732840000000000000
          Top = 37.795299999999940000
          Width = 83.149586770000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          Memo.UTF8W = (
            ' Compensa'#231#227'o')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          AllowVectorExport = True
          Top = 18.897650000000000000
          Width = 45.354360000000000000
          Height = 37.795300000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haCenter
          Memo.UTF8W = (
            '#')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object BndMasterData: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 298.582870000000000000
        Width = 1046.929810000000000000
        DataSet = frdsRelacaoCheque
        DataSetName = 'frdsRelacaoCheque'
        RowCount = 0
        Stretched = True
        object Memo28: TfrxMemoView
          AllowVectorExport = True
          Left = 128.504020000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<frdsRelacaoCheque."STATUS">=2'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 944.882500000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<frdsRelacaoCheque."STATUS">=2'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            '[FormatFloat('#39',0.00'#39',<frdsRelacaoCheque."VALOR">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 45.354360000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<frdsRelacaoCheque."STATUS">=2'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              ' [IIF(<frdsRelacaoCheque."DATA_APRESENTACAO">=0, '#39#39', FormatDateT' +
              'ime('#39'dd/mm/yyyy'#39', <frdsRelacaoCheque."DATA_APRESENTACAO">))]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 132.283550000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<frdsRelacaoCheque."STATUS">=2'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            '[frdsRelacaoCheque."EMISSOR_NOME"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          AllowVectorExport = True
          Left = 302.362400000000000000
          Width = 173.858316540000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<frdsRelacaoCheque."STATUS">=2'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [frdsRelacaoCheque."BANCO"] - [frdsRelacaoCheque."BANCO_NOME"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 476.220780000000000000
          Width = 52.913356540000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<frdsRelacaoCheque."STATUS">=2'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [frdsRelacaoCheque."AGENCIA"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          AllowVectorExport = True
          Left = 529.134199999999900000
          Width = 79.370066540000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<frdsRelacaoCheque."STATUS">=2'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [frdsRelacaoCheque."CONTA"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          AllowVectorExport = True
          Left = 608.504330000000000000
          Width = 86.929126540000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<frdsRelacaoCheque."STATUS">=2'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [frdsRelacaoCheque."NUMERO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          AllowVectorExport = True
          Left = 695.433520000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<frdsRelacaoCheque."STATUS">=2'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              ' [FormatDateTime('#39'dd/mm/yyyy'#39', <frdsRelacaoCheque."DATA_EMISSAO"' +
              '>)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          AllowVectorExport = True
          Left = 778.583180000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<frdsRelacaoCheque."STATUS">=2'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              ' [IIF(<frdsRelacaoCheque."DATA_DEVOLUCAO">=0,'#39#39',FormatDateTime('#39 +
              'dd/mm/yyyy'#39', <frdsRelacaoCheque."DATA_DEVOLUCAO">))]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          AllowVectorExport = True
          Left = 861.732840000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<frdsRelacaoCheque."STATUS">=2'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              ' [IIF(<frdsRelacaoCheque."DATA_COMPENSACAO">=0,'#39#39',FormatDateTime' +
              '('#39'dd/mm/yyyy'#39', <frdsRelacaoCheque."DATA_COMPENSACAO">))]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          AllowVectorExport = True
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<frdsRelacaoCheque."STATUS">=2'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            '[FormatFloat('#39'###00000'#39',<frdsRelacaoCheque."CONTROLE">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndGrpFooterStatus: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 340.157700000000000000
        Width = 1046.929810000000000000
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Left = 944.882500000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',SUM(<frdsRelacaoCheque."VALOR">,BndMasterDa' +
              'ta))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
      end
      object bndReportSummary: TfrxReportSummary
        FillType = ftBrush
        Frame.Typ = []
        Height = 105.826840000000000000
        Top = 427.086890000000000000
        Width = 1046.929810000000000000
        Stretched = True
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Width = 782.362710000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            
              ' * Os valores totais apresentados est'#227'o de acordo com o per'#237'odo ' +
              'e a situa'#231#227'o dos cheques informados')
          ParentFont = False
        end
        object SysMemo8: TfrxSysMemoView
          AllowVectorExport = True
          Left = 884.410020000000000000
          Top = 18.897650000000000000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',SUM((<frdsRelacaoCheque."VALOR">),BndMaster' +
              'Data,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 782.362710000000000000
          Top = 18.897650000000000000
          Width = 102.047246540000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            'Cadastrados : ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          AllowVectorExport = True
          Left = 782.362710000000000000
          Width = 264.567036540000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haCenter
          Memo.UTF8W = (
            'TOTAL GERAL (R$)')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Top = 18.897650000000000000
          Width = 415.748300000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' ** Cheques Devolvidos')
          ParentFont = False
          WordWrap = False
        end
        object SysMemo3: TfrxSysMemoView
          AllowVectorExport = True
          Left = 884.410020000000000000
          Top = 37.795300000000000000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',SUM((<ValorApresentado>+<ValorDevolvido>),B' +
              'ndMasterData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 782.362710000000000000
          Top = 37.795300000000000000
          Width = 102.047244090000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            'Apresentados : ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object SysMemo4: TfrxSysMemoView
          AllowVectorExport = True
          Left = 884.410020000000000000
          Top = 56.692949999999990000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[FormatFloat('#39',0.00'#39',SUM((<ValorDevolvido>),BndMasterData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 782.362710000000000000
          Top = 56.692949999999990000
          Width = 102.047244090000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            'Devolvidos : ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object SysMemo5: TfrxSysMemoView
          AllowVectorExport = True
          Left = 884.410020000000000000
          Top = 75.590600000000000000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[FormatFloat('#39',0.00'#39',SUM((<ValorCompensado>),BndMasterData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 782.362710000000000000
          Top = 75.590600000000000000
          Width = 102.047244090000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            'Compensados : ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
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
    Left = 329
    Top = 296
  end
  object fdQryTipoCheque: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      
        'Select 1 as Codigo, '#39'Emitido'#39'  as Descricao from RDB$DATABASE Un' +
        'ion'
      'Select 2 as Codigo, '#39'Recebido'#39' as Descricao from RDB$DATABASE')
    Left = 329
    Top = 328
  end
  object fdQryBanco: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    b.codigo'
      '  , b.nome'
      '  , b.codigo_nome'
      '  , b.nome_codigo'
      'from VW_BANCO_FEBRABAN b')
    Left = 329
    Top = 360
  end
  object qryBaixas: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    '#39'CP - Contas A Pagar'#39' as tipo'
      
        '  , pb.anolanc || '#39'/'#39' || right('#39'0000000'#39' || pb.numlanc, 7) as la' +
        'ncamento'
      '  , pb.anolanc'
      '  , pb.numlanc'
      '  , pb.seq'
      '  , pb.data_pagto'
      '  , pb.valor_baixa'
      '  , pb.documento_baixa'
      '  , pb.usuario'
      '  , fc.nomeforn      as nome'
      '  , fc.cnpj          as nome_cnpj'
      '  , fc.pessoa_fisica as nome_pf'
      'from TBCONTPAG_BAIXA pb'
      
        '  inner join TBCONTPAG cp on (cp.anolanc = pb.anolanc and cp.num' +
        'lanc = pb.numlanc)'
      '  inner join TBFORNECEDOR fc on (fc.codforn = cp.codforn)'
      'where pb.controle_cheque = :cheque'
      ''
      'union'
      ''
      'Select'
      '    '#39'CR - Contas A Receber'#39' as tipo'
      
        '  , pr.anolanc || '#39'/'#39' || right('#39'0000000'#39' || pr.numlanc, 7) as la' +
        'ncamento'
      '  , pr.anolanc'
      '  , pr.numlanc'
      '  , pr.seq'
      '  , pr.data_pagto'
      '  , pr.valor_baixa'
      '  , pr.documento_baixa'
      '  , pr.usuario'
      '  , cc.nome          as nome'
      '  , cc.cnpj          as nome_cnpj'
      '  , cc.pessoa_fisica as nome_pf'
      'from TBCONTREC_BAIXA pr'
      
        '  inner join TBCONTREC cr on (cr.anolanc = pr.anolanc and cr.num' +
        'lanc = pr.numlanc)'
      '  inner join TBCLIENTE cc on (cc.codigo = cr.cliente)'
      'where pr.controle_cheque = :cheque'
      ''
      'order by'
      '    6'
      '')
    Left = 793
    Top = 312
    ParamData = <
      item
        Name = 'CHEQUE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryBaixasTIPO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TIPO'
      Origin = 'TIPO'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 21
    end
    object qryBaixasLANCAMENTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'LANCAMENTO'
      Origin = 'LANCAMENTO'
      ProviderFlags = []
      ReadOnly = True
      Size = 25
    end
    object qryBaixasANOLANC: TSmallintField
      FieldName = 'ANOLANC'
      Origin = 'ANOLANC'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryBaixasNUMLANC: TIntegerField
      FieldName = 'NUMLANC'
      Origin = 'NUMLANC'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryBaixasSEQ: TSmallintField
      FieldName = 'SEQ'
      Origin = 'SEQ'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryBaixasDATA_PAGTO: TDateField
      FieldName = 'DATA_PAGTO'
      Origin = 'DATA_PAGTO'
    end
    object qryBaixasVALOR_BAIXA: TFMTBCDField
      FieldName = 'VALOR_BAIXA'
      Origin = 'VALOR_BAIXA'
      Precision = 18
      Size = 2
    end
    object qryBaixasDOCUMENTO_BAIXA: TStringField
      FieldName = 'DOCUMENTO_BAIXA'
      Origin = 'DOCUMENTO_BAIXA'
      Size = 10
    end
    object qryBaixasUSUARIO: TStringField
      FieldName = 'USUARIO'
      Origin = 'USUARIO'
      Size = 12
    end
    object qryBaixasNOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME'
      Origin = 'NOMEFORN'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qryBaixasNOME_CNPJ: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_CNPJ'
      Origin = 'CNPJ'
      ProviderFlags = []
      ReadOnly = True
      OnGetText = qryBaixasNOME_CNPJGetText
      Size = 18
    end
    object qryBaixasNOME_PF: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_PF'
      Origin = 'PESSOA_FISICA'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object QryCheque: TFDQuery
    CachedUpdates = True
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    c.controle'
      '  , c.empresa'
      '  , c.tipo'
      '  , c.banco'
      '  , e.logo as banco_logo'
      '  , c.agencia'
      '  , c.conta'
      '  , c.numero'
      '  , c.fornecedor'
      '  , c.cliente'
      '  , c.data_emissao'
      '  , c.data_apresentacao'
      '  , c.data_compensacao'
      '  , c.valor'
      '  , rpad(coalesce(c.nominal_a, '#39#39'), 140, '#39' '#39') as nominal_a'
      '  , c.data_cadastro'
      '  , c.usuario_cadastro'
      '  , c.status'
      '  , c.obs'
      ''
      '  , sc.descricao as status_descricao'
      '  , bc.nome      as banco_nome'
      ''
      '  , coalesce(cc.nome, fc.nomeforn)               as emissor_nome'
      '  , coalesce(cc.cnpj, fc.cnpj)                   as emissor_cnpj'
      '  , coalesce(cc.pessoa_fisica, fc.pessoa_fisica) as emissor_pf'
      'from TBCHEQUE c'
      '  left join TBEMPRESA e on (e.cnpj = c.empresa)'
      '  left join VW_STATUS_CHEQUE sc on (sc.codigo = c.status)'
      '  left join TBCLIENTE cc on (cc.codigo = c.cliente)'
      '  left join TBFORNECEDOR fc on (fc.codforn = c.fornecedor)'
      '  left join TBBANCO bc on (bc.cod = c.banco)'
      ''
      'where c.controle = :cheque')
    Left = 64
    Top = 400
    ParamData = <
      item
        Position = 1
        Name = 'CHEQUE'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QryChequeCONTROLE: TIntegerField
      FieldName = 'CONTROLE'
      Origin = 'CONTROLE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QryChequeEMPRESA: TStringField
      FieldName = 'EMPRESA'
      Origin = 'EMPRESA'
      Size = 18
    end
    object QryChequeTIPO: TSmallintField
      FieldName = 'TIPO'
      Origin = 'TIPO'
    end
    object QryChequeBANCO: TStringField
      FieldName = 'BANCO'
      Origin = 'BANCO'
      Required = True
      Size = 10
    end
    object QryChequeBANCO_LOGO: TBlobField
      AutoGenerateValue = arDefault
      FieldName = 'BANCO_LOGO'
      Origin = 'LOGO'
      ProviderFlags = []
    end
    object QryChequeAGENCIA: TStringField
      FieldName = 'AGENCIA'
      Origin = 'AGENCIA'
      Required = True
    end
    object QryChequeCONTA: TStringField
      FieldName = 'CONTA'
      Origin = 'CONTA'
      Required = True
    end
    object QryChequeNUMERO: TStringField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Required = True
      Size = 30
    end
    object QryChequeFORNECEDOR: TIntegerField
      FieldName = 'FORNECEDOR'
      Origin = 'FORNECEDOR'
    end
    object QryChequeCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
      Origin = 'CLIENTE'
    end
    object QryChequeDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
      Origin = 'DATA_EMISSAO'
    end
    object QryChequeDATA_APRESENTACAO: TDateField
      FieldName = 'DATA_APRESENTACAO'
      Origin = 'DATA_APRESENTACAO'
    end
    object QryChequeDATA_COMPENSACAO: TDateField
      FieldName = 'DATA_COMPENSACAO'
      Origin = 'DATA_COMPENSACAO'
    end
    object QryChequeNOMINAL_A: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOMINAL_A'
      Origin = 'NOMINAL_A'
      ProviderFlags = []
      ReadOnly = True
      Size = 140
    end
    object QryChequeDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      Origin = 'DATA_CADASTRO'
      Required = True
    end
    object QryChequeUSUARIO_CADASTRO: TStringField
      FieldName = 'USUARIO_CADASTRO'
      Origin = 'USUARIO_CADASTRO'
      Size = 12
    end
    object QryChequeSTATUS: TSmallintField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
    end
    object QryChequeOBS: TMemoField
      FieldName = 'OBS'
      Origin = 'OBS'
      BlobType = ftMemo
    end
    object QryChequeSTATUS_DESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'STATUS_DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 11
    end
    object QryChequeBANCO_NOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'BANCO_NOME'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object QryChequeEMISSOR_NOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'EMISSOR_NOME'
      Origin = 'EMISSOR_NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object QryChequeEMISSOR_CNPJ: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'EMISSOR_CNPJ'
      Origin = 'EMISSOR_CNPJ'
      ProviderFlags = []
      ReadOnly = True
      Size = 18
    end
    object QryChequeEMISSOR_PF: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'EMISSOR_PF'
      Origin = 'EMISSOR_PF'
      ProviderFlags = []
      ReadOnly = True
    end
    object QryChequeVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Precision = 18
      Size = 2
    end
  end
  object QryRelacaoCheque: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    ch.empresa'
      '  , ch.controle'
      '  , ch.tipo'
      '  , Case ch.tipo'
      '      when 1 then '#39'Emitido'#39
      '      when 2 then '#39'Recebido'#39
      '      else '#39'Outros'#39
      '    end as tipo_descricao'
      '  , ch.status'
      '  , st.descricao as status_descricao'
      '  , ch.banco'
      '  , bc.nome as banco_nome'
      '  , ch.agencia'
      '  , ch.conta'
      '  , ch.numero'
      '  , ch.data_emissao'
      '  , ch.data_apresentacao'
      '  , ch.data_devolucao'
      '  , ch.data_compensacao'
      '  , ch.valor'
      '  , coalesce(ci.nome, fr.nomeforn) as emissor_nome'
      '  , coalesce(ci.cnpj, fr.cnpj)     as emissor_cpf_cnpj'
      '  , coalesce(ci.pessoa_fisica, fr.pessoa_fisica) as emissor_pf'
      'from TBCHEQUE ch'
      '  left join VW_STATUS_CHEQUE st on (st.codigo = ch.status)'
      '  left join TBCLIENTE ci on (ci.codigo = ch.cliente)'
      '  left join TBFORNECEDOR fr on (fr.codforn = ch.fornecedor)'
      '  left join TBBANCO bc on (bc.cod = ch.banco)'
      ''
      'where ch.empresa = :empresa'
      '  and ch.data_apresentacao between :data_inicial and :data_final'
      ''
      'order by'
      '    ch.status'
      '  , ch.data_apresentacao'
      '  , coalesce(ci.nome, fr.nomeforn)'
      '  , ch.data_emissao')
    Left = 64
    Top = 448
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
        Name = 'DATA_INICIAL'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'DATA_FINAL'
        DataType = ftDate
        ParamType = ptInput
      end>
  end
end
