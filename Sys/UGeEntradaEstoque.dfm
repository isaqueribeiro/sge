inherited frmGeEntradaEstoque: TfrmGeEntradaEstoque
  Left = 395
  Top = 206
  ActiveControl = nil
  Caption = 'Controle de Entradas de Produtos'
  ClientHeight = 677
  ClientWidth = 1114
  OldCreateOrder = True
  ExplicitWidth = 1130
  ExplicitHeight = 716
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 673
    Width = 1114
    ExplicitTop = 674
    ExplicitWidth = 1114
  end
  inherited Bevel3: TBevel
    Top = 634
    Width = 1114
    ExplicitTop = 635
    ExplicitWidth = 1114
  end
  inherited pgcGuias: TPageControl
    Width = 1114
    Height = 634
    OnChange = pgcGuiasChange
    ExplicitWidth = 1114
    ExplicitHeight = 634
    inherited tbsTabela: TTabSheet
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 1106
      ExplicitHeight = 605
      inherited Bevel4: TBevel
        Top = 539
        Width = 1106
        ExplicitTop = 540
        ExplicitWidth = 1106
      end
      inherited dbgDados: TDBGrid
        Width = 1106
        Height = 539
        Columns = <
          item
            Expanded = False
            FieldName = 'CODCONTROL'
            Title.Caption = 'No. Compra '
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTENT'
            Title.Caption = 'Data Entrada '
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NF'
            Title.Caption = 'Documento '
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NFSERIE'
            Title.Alignment = taCenter
            Title.Caption = 'S'#233'rie '
            Width = 35
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTEMISS'
            Title.Caption = 'Data Emiss'#227'o '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'STATUS'
            Title.Caption = 'Status '
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMEFORN'
            Title.Caption = 'Fornecedor '
            Width = 350
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QT_ITENS'
            Title.Alignment = taCenter
            Title.Caption = 'Itens '
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOTALPROD'
            Title.Caption = 'Total Produto '
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOTALNF'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            Title.Caption = 'Total Nota Fiscal '
            Width = 110
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        Top = 543
        Width = 1106
        ExplicitTop = 543
        ExplicitWidth = 1106
        object lblEntradaAberta: TLabel [0]
          Left = 2
          Top = 4
          Width = 108
          Height = 13
          Caption = '* Entradas Abertas'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblEntradaCancelada: TLabel [1]
          Left = 2
          Top = 24
          Width = 127
          Height = 13
          Caption = '* Entradas Canceladas'
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
          Left = 477
          Width = 625
          ExplicitLeft = 477
          ExplicitWidth = 625
          DesignSize = (
            625
            54)
          inherited lbltFiltrar: TLabel
            Left = 294
            Width = 47
            Caption = 'Entrada:'
            ExplicitLeft = 294
            ExplicitWidth = 47
          end
          object lblData: TLabel [1]
            Left = 14
            Top = 25
            Width = 49
            Height = 13
            Caption = 'Emiss'#227'o:'
            FocusControl = e1Data
          end
          inherited edtFiltrar: TEdit
            Left = 344
            Width = 232
            TabOrder = 2
            ExplicitLeft = 344
            ExplicitWidth = 232
          end
          inherited btnFiltrar: TcxButton
            Left = 580
            TabOrder = 3
            ExplicitLeft = 580
          end
          object e1Data: TJvDateEdit
            Left = 72
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
            Left = 184
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
      ExplicitWidth = 1106
      ExplicitHeight = 605
      inherited Bevel8: TBevel
        Top = 113
        Width = 1106
        ExplicitTop = 113
        ExplicitWidth = 1106
      end
      object Bevel5: TBevel [1]
        Left = 0
        Top = 328
        Width = 1106
        Height = 4
        Align = alTop
        Shape = bsSpacer
        ExplicitTop = 313
      end
      object Bevel9: TBevel [2]
        Left = 0
        Top = 416
        Width = 1106
        Height = 4
        Align = alBottom
        Shape = bsSpacer
        ExplicitTop = 412
      end
      object Bevel11: TBevel [3]
        Left = 0
        Top = 207
        Width = 1106
        Height = 4
        Align = alTop
        Shape = bsSpacer
        ExplicitTop = 193
      end
      inherited GrpBxDadosNominais: TGroupBox
        Width = 1106
        Height = 113
        Caption = 'Dados nominais da NF'
        ExplicitWidth = 1106
        ExplicitHeight = 113
        DesignSize = (
          1106
          113)
        inherited lblCodigo: TLabel
          Width = 67
          Caption = 'No. Entrada:'
          ExplicitWidth = 67
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
          Left = 528
          Top = 24
          Width = 59
          Height = 13
          Caption = 'Fornecedor:'
          FocusControl = dbFornecedor
        end
        object lblDataEmissao: TLabel [4]
          Left = 16
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
        object lblNotaFiscal: TLabel [5]
          Left = 240
          Top = 64
          Width = 115
          Height = 13
          Caption = 'N'#250'mero Documento:'
          FocusControl = dbNotaFiscal
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblSerie: TLabel [6]
          Left = 368
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
        object lblDataEntrada: TLabel [7]
          Left = 416
          Top = 64
          Width = 68
          Height = 13
          Caption = 'Data Entrada:'
          FocusControl = dbDataEntrada
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblCFOPNF: TLabel [8]
          Left = 528
          Top = 64
          Width = 31
          Height = 13
          Caption = 'CFOP:'
          FocusControl = dbCFOPNF
        end
        object lblSituacao: TLabel [9]
          Left = 952
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
        object lblAutorizacao: TLabel [10]
          Left = 824
          Top = 64
          Width = 57
          Height = 13
          Caption = 'Autoriza'#231#227'o'
          FocusControl = dbAutorizacao
        end
        object lblTipoDocumento: TLabel [11]
          Left = 128
          Top = 64
          Width = 81
          Height = 13
          Anchors = [akLeft, akBottom]
          Caption = 'Tipo Documento:'
          FocusControl = dbTipoDocumento
        end
        object lblTipoEntrada: TLabel [12]
          Left = 904
          Top = 24
          Width = 65
          Height = 13
          Anchors = [akLeft, akBottom]
          Caption = 'Tipo Entrada:'
          FocusControl = dbTipoEntrada
        end
        inherited dbCodigo: TDBEdit
          Width = 89
          TabStop = False
          Color = clMoneyGreen
          DataField = 'CODCONTROL'
          ExplicitWidth = 89
        end
        object dbDataHora: TDBEdit
          Left = 112
          Top = 40
          Width = 121
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'DTLANCAMENTO'
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
          Left = 241
          Top = 40
          Width = 281
          Height = 21
          DataField = 'CODEMP'
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
        object dbNotaFiscal: TDBEdit
          Left = 240
          Top = 80
          Width = 121
          Height = 21
          Color = clWhite
          DataField = 'NF'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 7
        end
        object dbSerie: TDBEdit
          Left = 368
          Top = 80
          Width = 41
          Height = 21
          Color = clWhite
          DataField = 'NFSERIE'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 8
          OnKeyPress = dbSerieKeyPress
        end
        object dbCFOPNFDescricao: TDBEdit
          Left = 624
          Top = 80
          Width = 193
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'CFOP_DESCRICAO'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 11
        end
        object dbSituacao: TDBEdit
          Left = 952
          Top = 80
          Width = 124
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
          TabOrder = 13
        end
        object dbTipoDocumento: TDBLookupComboBox
          Left = 128
          Top = 80
          Width = 105
          Height = 21
          Anchors = [akLeft, akBottom]
          DataField = 'TIPO_DOCUMENTO'
          DataSource = DtSrcTabela
          DropDownRows = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'TPD_CODIGO'
          ListField = 'TPD_DESCRICAO'
          ListSource = dtsTipoDocumento
          ParentFont = False
          TabOrder = 6
        end
        object dbTipoEntrada: TDBLookupComboBox
          Left = 904
          Top = 40
          Width = 172
          Height = 21
          Anchors = [akLeft, akBottom]
          DataField = 'TIPO_ENTRADA'
          DataSource = DtSrcTabela
          DropDownRows = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'TPE_CODIGO'
          ListField = 'TPE_DESCRICAO'
          ListSource = dtsTipoEntrada
          ParentFont = False
          TabOrder = 4
        end
        object dbFornecedor: TJvDBComboEdit
          Left = 528
          Top = 40
          Width = 369
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
        object dbCFOPNF: TJvDBComboEdit
          Left = 529
          Top = 80
          Width = 89
          Height = 21
          ButtonHint = 'Pesquisar CFOP (Ctrl+P)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clWhite
          DataField = 'NFCFOP'
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
          PopupMenu = ppCorrigirDadosNFe
          ShowHint = True
          TabOrder = 10
          OnButtonClick = dbCFOPNFButtonClick
          OnExit = ControlEditExit
        end
        object dbAutorizacao: TJvDBComboEdit
          Left = 824
          Top = 80
          Width = 121
          Height = 21
          ButtonHint = 'Pesquisar Autoriza'#231#227'o (Ctrl+P)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clMoneyGreen
          DataField = 'AUTORIZACAO_CODIGO'
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
          OnButtonClick = dbAutorizacaoButtonClick
        end
        object dbDataEmissao: TJvDBDateEdit
          Left = 16
          Top = 80
          Width = 105
          Height = 21
          DataField = 'DTEMISS'
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
          TabOrder = 5
        end
        object dbDataEntrada: TJvDBDateEdit
          Left = 416
          Top = 80
          Width = 105
          Height = 21
          DataField = 'DTENT'
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
          TabOrder = 9
        end
      end
      object GrpBxDadosValores: TGroupBox
        Left = 0
        Top = 117
        Width = 1106
        Height = 90
        Align = alTop
        Caption = 'Valores (R$)'
        TabOrder = 1
        object lblValorFrete: TLabel
          Left = 568
          Top = 24
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
          Left = 224
          Top = 24
          Width = 89
          Height = 13
          Caption = 'Base ICMS Subst.:'
          FocusControl = dbBaseICMSSubs
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblTotalProduto: TLabel
          Left = 464
          Top = 24
          Width = 69
          Height = 13
          Caption = 'Total Produto:'
          FocusControl = dbTotalProduto
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblValorOutros: TLabel
          Left = 760
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
          Left = 952
          Top = 24
          Width = 83
          Height = 13
          Caption = 'Total Nota Fiscal:'
          FocusControl = dbTotalNotaFiscal
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblValorDesconto: TLabel
          Left = 664
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
          Left = 856
          Top = 24
          Width = 18
          Height = 13
          Caption = 'IPI:'
          FocusControl = dbValorIPI
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblValorICMSSubs: TLabel
          Left = 344
          Top = 24
          Width = 90
          Height = 13
          Caption = 'Valor ICMS Subst.:'
          FocusControl = dbValorICMSSubs
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblValorICMS: TLabel
          Left = 120
          Top = 24
          Width = 56
          Height = 13
          Caption = 'Valor ICMS:'
          FocusControl = dbValorICMS
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblCalcularTotaisInfo: TLabel
          Left = 224
          Top = 67
          Width = 456
          Height = 13
          Caption = 
            '(Esta op'#231#227'o deve ser marcada apenas se o objetivo da entrada '#233' g' +
            'erar uma NFe)'
          FocusControl = dbBaseICMSSubs
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbValorFrete: TDBEdit
          Left = 568
          Top = 40
          Width = 89
          Height = 21
          Color = clWhite
          DataField = 'FRETE'
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
          DataField = 'ICMSBASE'
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
          Left = 224
          Top = 40
          Width = 113
          Height = 21
          DataField = 'ICMSSUBSTBASE'
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
          Left = 464
          Top = 40
          Width = 97
          Height = 21
          DataField = 'TOTALPROD'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
        object dbValorOutros: TDBEdit
          Left = 760
          Top = 40
          Width = 89
          Height = 21
          DataField = 'OUTROSCUSTOS'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
        end
        object dbTotalNotaFiscal: TDBEdit
          Left = 952
          Top = 40
          Width = 124
          Height = 21
          DataField = 'TOTALNF'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
        end
        object dbValorDesconto: TDBEdit
          Left = 664
          Top = 40
          Width = 89
          Height = 21
          DataField = 'DESCONTO'
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
          Left = 856
          Top = 40
          Width = 89
          Height = 21
          DataField = 'IPI'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
        end
        object dbValorICMSSubs: TDBEdit
          Left = 344
          Top = 40
          Width = 113
          Height = 21
          DataField = 'ICMSSUBSTVALOR'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object dbValorICMS: TDBEdit
          Left = 120
          Top = 40
          Width = 97
          Height = 21
          DataField = 'ICMSVALOR'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object dbCalcularTotais: TDBCheckBox
          Left = 16
          Top = 67
          Width = 202
          Height = 17
          Caption = 'Calcular totais automaticamente'
          DataField = 'CALCULAR_TOTAIS'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
      object pgcMaisDados: TPageControl
        Left = 0
        Top = 420
        Width = 1106
        Height = 185
        ActivePage = tbsPagamento
        Align = alBottom
        HotTrack = True
        TabOrder = 4
        object tbsPagamento: TTabSheet
          Caption = 'Pagamento'
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          DesignSize = (
            1098
            157)
          object lblObservacao: TLabel
            Left = 0
            Top = 0
            Width = 1098
            Height = 13
            Align = alTop
            Caption = '&Observa'#231#245'es:'
            FocusControl = dbObservacao
            ExplicitWidth = 67
          end
          object lblFormaPagto: TLabel
            Left = 0
            Top = 114
            Width = 106
            Height = 13
            Anchors = [akLeft, akBottom]
            Caption = '&Forma de Pagamento:'
            FocusControl = dbFormaPagto
            ExplicitTop = 119
          end
          object lblCondicaoPagto: TLabel
            Left = 152
            Top = 114
            Width = 120
            Height = 13
            Anchors = [akLeft, akBottom]
            Caption = 'Condi'#231#227'o de Pagamento:'
            FocusControl = dbCondicaoPagto
            ExplicitTop = 119
          end
          object lblPrazo01: TLabel
            Left = 600
            Top = 114
            Width = 24
            Height = 13
            Anchors = [akLeft, akBottom]
            Caption = 'P01:'
            FocusControl = dbPrazo01
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitTop = 119
          end
          object lblPrazo02: TLabel
            Left = 640
            Top = 114
            Width = 24
            Height = 13
            Anchors = [akLeft, akBottom]
            Caption = 'P02:'
            FocusControl = dbPrazo02
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitTop = 119
          end
          object lblPrazo03: TLabel
            Left = 680
            Top = 114
            Width = 24
            Height = 13
            Anchors = [akLeft, akBottom]
            Caption = 'P03:'
            FocusControl = dbPrazo03
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitTop = 119
          end
          object lblPrazo04: TLabel
            Left = 720
            Top = 114
            Width = 24
            Height = 13
            Anchors = [akLeft, akBottom]
            Caption = 'P04:'
            FocusControl = dbPrazo04
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitTop = 119
          end
          object lblPrazo05: TLabel
            Left = 760
            Top = 114
            Width = 24
            Height = 13
            Anchors = [akLeft, akBottom]
            Caption = 'P05:'
            FocusControl = dbPrazo05
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitTop = 119
          end
          object lblPrazo06: TLabel
            Left = 800
            Top = 114
            Width = 24
            Height = 13
            Anchors = [akLeft, akBottom]
            Caption = 'P06:'
            FocusControl = dbPrazo06
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitTop = 119
          end
          object lblPrazo07: TLabel
            Left = 840
            Top = 114
            Width = 24
            Height = 13
            Anchors = [akLeft, akBottom]
            Caption = 'P07:'
            FocusControl = dbPrazo07
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitTop = 119
          end
          object lblPrazo08: TLabel
            Left = 880
            Top = 114
            Width = 24
            Height = 13
            Anchors = [akLeft, akBottom]
            Caption = 'P08:'
            FocusControl = dbPrazo08
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitTop = 119
          end
          object lblPrazo09: TLabel
            Left = 920
            Top = 114
            Width = 24
            Height = 13
            Anchors = [akLeft, akBottom]
            Caption = 'P09:'
            FocusControl = dbPrazo09
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitTop = 119
          end
          object lblPrazo10: TLabel
            Left = 960
            Top = 114
            Width = 24
            Height = 13
            Anchors = [akLeft, akBottom]
            Caption = 'P10:'
            FocusControl = dbPrazo10
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitTop = 119
          end
          object lblPrazo11: TLabel
            Left = 1000
            Top = 114
            Width = 24
            Height = 13
            Anchors = [akLeft, akBottom]
            Caption = 'P11:'
            FocusControl = dbPrazo11
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitTop = 119
          end
          object lblPrazo12: TLabel
            Left = 1040
            Top = 114
            Width = 24
            Height = 13
            Anchors = [akLeft, akBottom]
            Caption = 'P12:'
            FocusControl = dbPrazo12
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitTop = 119
          end
          object Bevel13: TBevel
            Left = 0
            Top = 13
            Width = 1098
            Height = 4
            Align = alTop
            Shape = bsSpacer
          end
          object lblTipoDespesa: TLabel
            Left = 384
            Top = 114
            Width = 83
            Height = 13
            Anchors = [akLeft, akBottom]
            Caption = 'Tipo de Despesa:'
            FocusControl = dbTipoDespesa
            ExplicitTop = 119
          end
          object dbObservacao: TDBMemo
            Left = 0
            Top = 17
            Width = 1098
            Height = 95
            Align = alTop
            Anchors = [akLeft, akTop, akRight, akBottom]
            DataField = 'OBS'
            DataSource = DtSrcTabela
            TabOrder = 0
          end
          object dbFormaPagto: TDBLookupComboBox
            Left = 0
            Top = 130
            Width = 145
            Height = 21
            Anchors = [akLeft, akBottom]
            DataField = 'FORMAPAGTO_COD'
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
            TabOrder = 1
          end
          object dbCondicaoPagto: TDBLookupComboBox
            Left = 152
            Top = 130
            Width = 225
            Height = 21
            Anchors = [akLeft, akBottom]
            DataField = 'CONDICAOPAGTO_COD'
            DataSource = DtSrcTabela
            DropDownRows = 10
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            KeyField = 'COND_COD'
            ListField = 'COND_DESCRICAO'
            ListSource = dtsCondicaoPagto
            ParentFont = False
            TabOrder = 2
            OnClick = dbCondicaoPagtoClick
          end
          object dbPrazo01: TDBEdit
            Left = 600
            Top = 130
            Width = 33
            Height = 21
            TabStop = False
            Anchors = [akLeft, akBottom]
            Color = clMoneyGreen
            DataField = 'PRAZO_01'
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
          object dbPrazo02: TDBEdit
            Left = 640
            Top = 130
            Width = 33
            Height = 21
            TabStop = False
            Anchors = [akLeft, akBottom]
            Color = clMoneyGreen
            DataField = 'PRAZO_02'
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
          object dbPrazo03: TDBEdit
            Left = 680
            Top = 130
            Width = 33
            Height = 21
            TabStop = False
            Anchors = [akLeft, akBottom]
            Color = clMoneyGreen
            DataField = 'PRAZO_03'
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
          object dbPrazo04: TDBEdit
            Left = 720
            Top = 130
            Width = 33
            Height = 21
            TabStop = False
            Anchors = [akLeft, akBottom]
            Color = clMoneyGreen
            DataField = 'PRAZO_04'
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
          object dbPrazo05: TDBEdit
            Left = 760
            Top = 130
            Width = 33
            Height = 21
            TabStop = False
            Anchors = [akLeft, akBottom]
            Color = clMoneyGreen
            DataField = 'PRAZO_05'
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
          object dbPrazo06: TDBEdit
            Left = 800
            Top = 130
            Width = 33
            Height = 21
            TabStop = False
            Anchors = [akLeft, akBottom]
            Color = clMoneyGreen
            DataField = 'PRAZO_06'
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
          object dbPrazo07: TDBEdit
            Left = 840
            Top = 130
            Width = 33
            Height = 21
            TabStop = False
            Anchors = [akLeft, akBottom]
            Color = clMoneyGreen
            DataField = 'PRAZO_07'
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
          object dbPrazo08: TDBEdit
            Left = 880
            Top = 130
            Width = 33
            Height = 21
            TabStop = False
            Anchors = [akLeft, akBottom]
            Color = clMoneyGreen
            DataField = 'PRAZO_08'
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
          object dbPrazo09: TDBEdit
            Left = 920
            Top = 130
            Width = 33
            Height = 21
            TabStop = False
            Anchors = [akLeft, akBottom]
            Color = clMoneyGreen
            DataField = 'PRAZO_09'
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
          object dbPrazo10: TDBEdit
            Left = 960
            Top = 130
            Width = 33
            Height = 21
            TabStop = False
            Anchors = [akLeft, akBottom]
            Color = clMoneyGreen
            DataField = 'PRAZO_10'
            DataSource = DtSrcTabela
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 13
          end
          object dbPrazo11: TDBEdit
            Left = 1000
            Top = 130
            Width = 33
            Height = 21
            TabStop = False
            Anchors = [akLeft, akBottom]
            Color = clMoneyGreen
            DataField = 'PRAZO_11'
            DataSource = DtSrcTabela
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 14
          end
          object dbPrazo12: TDBEdit
            Left = 1040
            Top = 130
            Width = 33
            Height = 21
            TabStop = False
            Anchors = [akLeft, akBottom]
            Color = clMoneyGreen
            DataField = 'PRAZO_12'
            DataSource = DtSrcTabela
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 15
          end
          object dbTipoDespesa: TDBLookupComboBox
            Left = 384
            Top = 130
            Width = 209
            Height = 21
            Anchors = [akLeft, akBottom]
            DataField = 'TIPO_DESPESA'
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
            TabOrder = 3
            OnClick = dbCondicaoPagtoClick
          end
        end
        object tbsDuplicatas: TTabSheet
          Caption = 'Duplicata(s) Gerada(s)'
          ImageIndex = 1
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object Bevel6: TBevel
            Left = 89
            Top = 0
            Width = 4
            Height = 157
            Align = alLeft
            Shape = bsSpacer
            ExplicitHeight = 162
          end
          object Bevel7: TBevel
            Left = 0
            Top = 0
            Width = 4
            Height = 157
            Align = alLeft
            Shape = bsSpacer
            ExplicitHeight = 162
          end
          object pnlBotoesTitulo: TPanel
            Left = 4
            Top = 0
            Width = 85
            Height = 157
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
            object btnRegerarDuplicata: TBitBtn
              Left = 0
              Top = 0
              Width = 85
              Height = 25
              Hint = 'Regerar Duplicata(s)'
              Align = alTop
              Caption = 'Duplicata(s)'
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnClick = btnRegerarDuplicataClick
            end
            object btnTituloEditar: TBitBtn
              Left = 0
              Top = 25
              Width = 85
              Height = 25
              Hint = 'Editar T'#237'tulo'
              Align = alTop
              Caption = 'Editar'
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              TabStop = False
              OnClick = btnTituloEditarClick
            end
            object btnTituloExcluir: TBitBtn
              Left = 0
              Top = 50
              Width = 85
              Height = 25
              Hint = 'Excluir T'#237'tulo'
              Align = alTop
              Caption = 'Excluir'
              Enabled = False
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
              Visible = False
            end
          end
          object dbgTitulos: TDBGrid
            Left = 93
            Top = 0
            Width = 1005
            Height = 157
            TabStop = False
            Align = alClient
            DataSource = dtsDuplicatas
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
                FieldName = 'Lancamento'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PARCELA'
                Title.Alignment = taCenter
                Width = 40
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
                FieldName = 'VALORPAG'
                Title.Caption = 'Valor A Pagar (R$)'
                Width = 110
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TIPPAG'
                Width = 180
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SITUACAO_DESC'
                Title.Caption = 'Situa'#231#227'o'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PAGO_'
                Title.Alignment = taCenter
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NUMCHQ'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'BCO_NOME'
                Width = 220
                Visible = True
              end>
          end
        end
        object tbsLotes: TTabSheet
          Caption = 'Lote(s) Gerado(s) no Estoque'
          ImageIndex = 3
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object DBGrid1: TDBGrid
            Left = 0
            Top = 0
            Width = 1098
            Height = 157
            TabStop = False
            Align = alClient
            DataSource = DtSrcTabelaLotes
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
                FieldName = 'CODPROD'
                Title.Caption = 'C'#243'digo'
                Width = 75
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESCRI_APRESENTACAO'
                Title.Caption = 'Produto'
                Width = 350
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'REFERENCIA'
                Title.Caption = 'Refer'#234'ncia'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LOTE_DESCRICAO'
                Title.Caption = 'Lote'
                Width = 250
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'QTDE'
                Title.Caption = 'Qtde.'
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LOTE_DATA_FAB'
                Title.Caption = 'Fabrica'#231#227'o'
                Width = 85
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LOTE_DATA_VAL'
                Title.Caption = 'Validade'
                Width = 85
                Visible = True
              end>
          end
        end
        object TbsInformeNFe: TTabSheet
          Caption = 'Informa'#231#245'es de Envio NF-e'
          ImageIndex = 2
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
            Left = 408
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
          object lblLogNFeLoteChave: TLabel
            Left = 728
            Top = 0
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
          object BtnLimparDadosNFe: TSpeedButton
            Left = 8
            Top = 48
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
            OnClick = nmPpLimparDadosNFeClick
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
          object lblLogNFeCancelMotivo: TLabel
            Left = 728
            Top = 40
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
          object lblLogNFeDenegada: TLabel
            Left = 8
            Top = 80
            Width = 87
            Height = 13
            Caption = 'NF-e denegada:'
            FocusControl = dbLogNFeDenegada
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
          object BtnCorrigirDadosNFe: TSpeedButton
            Left = 8
            Top = 120
            Width = 185
            Height = 30
            Hint = 'Limpar LOG de Envio'
            Caption = 'Corrigir Dados p/ Envio'
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
            OnClick = BtnCorrigirDadosNFeClick
          end
          object dbLogNFeLote: TDBEdit
            Left = 8
            Top = 16
            Width = 97
            Height = 21
            TabStop = False
            Color = clMoneyGreen
            DataField = 'LOTE_NFE_NUMERO'
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
          object dbLogNFeLoteRecibo: TDBEdit
            Left = 264
            Top = 16
            Width = 137
            Height = 21
            TabStop = False
            Color = clMoneyGreen
            DataField = 'LOTE_NFE_RECIBO'
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
            Left = 408
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
          object dbLogNFeUsuario: TDBEdit
            Left = 568
            Top = 16
            Width = 153
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
            TabOrder = 5
          end
          object dbLogNFeLoteChave: TDBEdit
            Left = 728
            Top = 16
            Width = 361
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
            TabOrder = 7
          end
          object dbLogNFeCancelUsuario: TDBEdit
            Left = 568
            Top = 56
            Width = 153
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
            TabOrder = 8
          end
          object dbLogNFeCancelMotivo: TDBMemo
            Left = 728
            Top = 56
            Width = 361
            Height = 61
            TabStop = False
            Color = clMoneyGreen
            DataField = 'CANCEL_MOTIVO'
            DataSource = DtSrcTabela
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            ScrollBars = ssVertical
            TabOrder = 9
          end
          object dbLogNFeDenegada: TDBEdit
            Left = 8
            Top = 96
            Width = 553
            Height = 21
            TabStop = False
            Color = clMoneyGreen
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
          object dbLogNFeCancelData: TDBEdit
            Left = 568
            Top = 96
            Width = 153
            Height = 21
            TabStop = False
            Color = clMoneyGreen
            DataField = 'CANCEL_DATAHORA'
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
        end
      end
      object GrpBxDadosProduto: TGroupBox
        Left = 0
        Top = 211
        Width = 1106
        Height = 117
        Align = alTop
        Caption = 'Dados do produto'
        TabOrder = 2
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
        object lblParticipacao: TLabel
          Left = 528
          Top = 64
          Width = 49
          Height = 13
          Caption = '% Partic.:'
          FocusControl = dbParticipacao
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblTotalBruto: TLabel
          Left = 408
          Top = 64
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
        object lblValorIPIProduto: TLabel
          Left = 304
          Top = 64
          Width = 69
          Height = 13
          Caption = 'Valor IPI (R$):'
          FocusControl = dbValorIPIProduto
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Bevel10: TBevel
          Left = 2
          Top = 15
          Width = 4
          Height = 100
          Align = alLeft
          Shape = bsSpacer
          ExplicitHeight = 99
        end
        object lblFrete: TLabel
          Left = 592
          Top = 64
          Width = 54
          Height = 13
          Caption = 'Frete (R$):'
          FocusControl = dbFrete
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblDesconto: TLabel
          Left = 696
          Top = 64
          Width = 73
          Height = 13
          Caption = 'Desconto (R$):'
          FocusControl = dbDesconto
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblOutros: TLabel
          Left = 800
          Top = 64
          Width = 61
          Height = 13
          Caption = 'Outros (R$):'
          FocusControl = dbOutros
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblCustoMedio: TLabel
          Left = 904
          Top = 64
          Width = 56
          Height = 13
          Caption = 'Custo (R$):'
          FocusControl = dbCustoMedio
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblNCM_SH: TLabel
          Left = 704
          Top = 24
          Width = 43
          Height = 13
          Caption = 'NCM/SH:'
          FocusControl = dbNCM_SH
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblCST: TLabel
          Left = 800
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
        object lblCFOPItem: TLabel
          Left = 640
          Top = 24
          Width = 31
          Height = 13
          Caption = 'CFOP:'
          FocusControl = dbCFOPItem
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblAliquota: TLabel
          Left = 904
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
        object lblPercRedBC: TLabel
          Left = 983
          Top = 24
          Width = 76
          Height = 13
          Caption = '% Redu'#231#227'o BC:'
          FocusControl = dbPercRedBC
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblCSOSN: TLabel
          Left = 848
          Top = 24
          Width = 38
          Height = 13
          Caption = 'CSOSN:'
          FocusControl = dbCSOSN
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
          DataField = 'DESCRI'
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
          TabOrder = 10
          OnExit = ControlEditExit
        end
        object dbValorUnit: TDBEdit
          Left = 184
          Top = 80
          Width = 113
          Height = 21
          Color = clWhite
          DataField = 'PRECOUNIT'
          DataSource = DtSrcTabelaItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 11
          OnExit = ControlEditExit
        end
        object dbUnidade: TDBEdit
          Left = 592
          Top = 40
          Width = 41
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
        object dbParticipacao: TDBEdit
          Left = 528
          Top = 80
          Width = 57
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'PERC_PARTICIPACAO'
          DataSource = DtSrcTabelaItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 14
        end
        object dbTotalBruto: TDBEdit
          Left = 408
          Top = 80
          Width = 113
          Height = 21
          Color = clMoneyGreen
          DataField = 'TOTAL_BRUTO'
          DataSource = DtSrcTabelaItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 13
          OnExit = ControlEditExit
        end
        object dbValorIPIProduto: TDBEdit
          Left = 304
          Top = 80
          Width = 97
          Height = 21
          Color = clWhite
          DataField = 'VALOR_IPI'
          DataSource = DtSrcTabelaItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 12
          OnExit = ControlEditExit
        end
        object pnlBotoesProduto: TPanel
          Left = 6
          Top = 15
          Width = 70
          Height = 100
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
            Top = 75
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
        object dbFrete: TDBEdit
          Left = 592
          Top = 80
          Width = 97
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'VALOR_FRETE'
          DataSource = DtSrcTabelaItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 15
        end
        object dbDesconto: TDBEdit
          Left = 696
          Top = 80
          Width = 97
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'VALOR_DESCONTO'
          DataSource = DtSrcTabelaItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 16
        end
        object dbOutros: TDBEdit
          Left = 800
          Top = 80
          Width = 97
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'VALOR_OUTROS'
          DataSource = DtSrcTabelaItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 17
        end
        object dbCustoMedio: TDBEdit
          Left = 904
          Top = 80
          Width = 105
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'CUSTOMEDIO'
          DataSource = DtSrcTabelaItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 18
        end
        object dbNCM_SH: TDBEdit
          Left = 704
          Top = 40
          Width = 89
          Height = 21
          Color = clWhite
          DataField = 'NCM_SH'
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
        object dbCST: TDBEdit
          Left = 800
          Top = 40
          Width = 41
          Height = 21
          Color = clWhite
          DataField = 'CST'
          DataSource = DtSrcTabelaItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          OnExit = ControlEditExit
        end
        object dbCFOPItem: TDBEdit
          Left = 640
          Top = 40
          Width = 57
          Height = 21
          Color = clWhite
          DataField = 'CFOP'
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
        object dbAliquota: TDBEdit
          Left = 904
          Top = 40
          Width = 73
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'ALIQUOTA'
          DataSource = DtSrcTabelaItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 8
        end
        object dbPercRedBC: TDBEdit
          Left = 983
          Top = 40
          Width = 93
          Height = 21
          Color = clMoneyGreen
          DataField = 'PERCENTUAL_REDUCAO_BC'
          DataSource = DtSrcTabelaItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 9
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
          DataField = 'CODPROD'
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
        object dbCSOSN: TDBEdit
          Left = 848
          Top = 40
          Width = 49
          Height = 21
          Color = clWhite
          DataField = 'CSOSN'
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
      end
      object dbgProdutos: TDBGrid
        Left = 0
        Top = 332
        Width = 1106
        Height = 84
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
            FieldName = 'SEQ'
            Title.Alignment = taCenter
            Title.Caption = '# '
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODPROD'
            Title.Caption = 'Produto '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRI'
            Title.Caption = 'Produto/Servi'#231'o '
            Width = 350
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTDE'
            Title.Caption = 'Qtde. '
            Width = 40
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
            FieldName = 'PRECOUNIT'
            Title.Caption = 'Valor Un. (R$) '
            Width = 110
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PERC_PARTICIPACAO'
            Title.Caption = '% Part. '
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CUSTOMEDIO'
            Title.Caption = 'Custo (R$) '
            Width = 110
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOTAL_BRUTO'
            Title.Caption = 'Total Bruto (R$) '
            Width = 110
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOTAL_LIQUIDO'
            Title.Caption = 'Total Liquido (R$) '
            Width = 110
            Visible = True
          end>
      end
    end
  end
  inherited tlbBotoes: TPanel
    Top = 638
    Width = 1114
    ExplicitTop = 638
    ExplicitWidth = 1114
    inherited bvlTool1: TBevel
      Left = 333
      ExplicitLeft = 333
    end
    inherited bvlTool2: TBevel
      Left = 487
      ExplicitLeft = 487
    end
    inherited bvlTool3: TBevel
      Left = 811
      ExplicitLeft = 1031
    end
    inherited bvlTool4: TBevel
      Left = 1110
      ExplicitLeft = 1110
    end
    object Bevel12: TBevel [5]
      Left = 1086
      Top = 2
      Width = 4
      Height = 31
      Shape = bsSpacer
    end
    object bvlImportar: TBevel [6]
      Left = 104
      Top = 0
      Width = 4
      Height = 35
      Align = alLeft
      Shape = bsSpacer
      ExplicitLeft = 16
    end
    inherited btbtnIncluir: TcxButton
      Left = 108
      ExplicitLeft = 108
    end
    inherited btbtnAlterar: TcxButton
      Left = 183
      ExplicitLeft = 183
    end
    inherited btbtnExcluir: TcxButton
      Left = 258
      ExplicitLeft = 258
    end
    inherited btbtnCancelar: TcxButton
      Left = 337
      ExplicitLeft = 337
    end
    inherited btbtnSalvar: TcxButton
      Left = 412
      ExplicitLeft = 412
    end
    inherited btbtnLista: TcxButton
      Left = 491
      Caption = 'Imprimir'
      Visible = True
      ExplicitLeft = 491
    end
    inherited btbtnFechar: TcxButton
      Left = 1035
      TabOrder = 10
      ExplicitLeft = 1035
    end
    inherited btbtnSelecionar: TcxButton
      Left = 925
      Width = 110
      TabOrder = 9
      ExplicitLeft = 925
      ExplicitWidth = 110
    end
    object btbtnFinalizar: TcxButton
      Tag = 11
      Left = 591
      Top = 0
      Width = 110
      Height = 35
      Hint = 'Finalizar Entrada'
      Align = alRight
      Caption = '&Finalizar'
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
      TabOrder = 6
      OnClick = btbtnFinalizarClick
    end
    object btbtnGerarNFe: TcxButton
      Tag = 12
      Left = 815
      Top = 0
      Width = 110
      Height = 35
      Hint = 'Gerar NF-e de Entrada'
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
    object btbtnCancelarENT: TcxButton
      Tag = 13
      Left = 701
      Top = 0
      Width = 110
      Height = 35
      Hint = 'Cancelar Entrada Selecionada'
      Align = alRight
      Caption = 'Cancelar'
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
      TabOrder = 7
      OnClick = btbtnCancelarENTClick
    end
    object btnImportar: TcxButton
      Tag = 1
      Left = 4
      Top = 0
      Width = 100
      Height = 35
      Hint = 'Baixar/Importar XML da NF-e'
      Align = alLeft
      Caption = 'Importar NF-e'
      OptionsImage.ImageIndex = 28
      OptionsImage.Images = DMRecursos.ImgBotoes16x16
      ParentShowHint = False
      ShowHint = True
      TabOrder = 11
      OnClick = btnImportarClick
    end
  end
  inherited IbDtstTabela: TIBDataSet
    SelectSQL.Strings = (
      'Select'
      '    c.ANO'
      '  , c.CODCONTROL'
      '  , c.CODEMP'
      '  , c.CODFORN'
      '  , c.TIPO_ENTRADA'
      '  , c.TIPO_DOCUMENTO'
      '  , c.TIPO_MOVIMENTO'
      '  , c.NF'
      '  , c.NFSERIE'
      '  , c.VERIFICADOR_NFE'
      '  , c.XML_NFE_FILENAME'
      '  , c.LOTE_NFE_ANO'
      '  , c.LOTE_NFE_NUMERO'
      '  , c.LOTE_NFE_RECIBO'
      '  , c.DTLANCAMENTO'
      '  , c.DTEMISS'
      '  , c.DTENT'
      '  , c.DTFINALIZACAO_COMPRA'
      '  , c.NFCFOP'
      '  , c.NATUREZA'
      '  , c.STATUS'
      '  , c.CALCULAR_TOTAIS'
      '  , c.IPI'
      '  , c.ICMSBASE'
      '  , c.ICMSVALOR'
      '  , c.ICMSSUBSTBASE'
      '  , c.ICMSSUBSTVALOR'
      '  , c.FRETE'
      '  , c.OUTROSCUSTOS'
      '  , c.DESCONTO'
      '  , c.TOTALNF'
      '  , c.TOTALPROD'
      '  , c.OBS'
      '  , c.USUARIO'
      '  , c.FORMAPAGTO_COD'
      '  , c.CONDICAOPAGTO_COD'
      '  , c.COMPRA_PRAZO'
      '  , c.PRAZO_01'
      '  , c.PRAZO_02'
      '  , c.PRAZO_03'
      '  , c.PRAZO_04'
      '  , c.PRAZO_05'
      '  , c.PRAZO_06'
      '  , c.PRAZO_07'
      '  , c.PRAZO_08'
      '  , c.PRAZO_09'
      '  , c.PRAZO_10'
      '  , c.PRAZO_11'
      '  , c.PRAZO_12'
      '  , c.TIPO_DESPESA'
      '  , c.AUTORIZACAO_ANO'
      '  , c.AUTORIZACAO_CODIGO'
      '  , c.AUTORIZACAO_EMPRESA'
      '  , c.Cancel_usuario'
      '  , c.Cancel_datahora'
      '  , c.Cancel_motivo'
      '  , f.Nomeforn'
      '  , f.Cnpj'
      '  , n.Cfop_descricao'
      '  , coalesce(('
      '      Select'
      '        count(i.seq)'
      '      from TBCOMPRASITENS i'
      '      where i.ano        = c.ano'
      '        and i.codcontrol = c.codcontrol'
      '    ), 0) as qt_itens'
      'from TBCOMPRAS c'
      '  left join TBFORNECEDOR f on (f.Codforn = c.Codforn)'
      '  left join TBCFOP n on (n.Cfop_cod = c.Nfcfop)')
    GeneratorField.Field = 'CODCONTROL'
    GeneratorField.Generator = 'GEN_COMPRAS_CONTROLE_2011'
    GeneratorField.ApplyEvent = gamOnNewRecord
    Left = 960
    Top = 40
  end
  inherited DtSrcTabela: TDataSource
    DataSet = fdQryTabela
    OnDataChange = DtSrcTabelaDataChange
    Left = 1024
    Top = 72
  end
  inherited IbUpdTabela: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  ANO,'
      '  CODCONTROL,'
      '  CODEMP,'
      '  CODFORN,'
      '  TIPO_ENTRADA,'
      '  TIPO_DOCUMENTO,'
      '  TIPO_MOVIMENTO,'
      '  NF,'
      '  NFSERIE,'
      '  LOTE_NFE_ANO,'
      '  LOTE_NFE_NUMERO,'
      '  LOTE_NFE_RECIBO,'
      '  NFE_ENVIADA,'
      '  NFE_DENEGADA,'
      '  NFE_DENEGADA_MOTIVO,'
      '  VERIFICADOR_NFE,'
      '  XML_NFE,'
      '  XML_NFE_FILENAME,'
      '  DTLANCAMENTO,'
      '  DTEMISS,'
      '  HREMISS,'
      '  DTENT,'
      '  NFCFOP,'
      '  NATUREZA,'
      '  STATUS,'
      '  CALCULAR_TOTAIS,'
      '  IPI,'
      '  ICMSBASE,'
      '  ICMSVALOR,'
      '  ICMSSUBSTBASE,'
      '  ICMSSUBSTVALOR,'
      '  FRETE,'
      '  OUTROSCUSTOS,'
      '  DESCONTO,'
      '  VALORSEGURO,'
      '  VALORTOTAL_II,'
      '  VALORTOTAL_IPI,'
      '  VALORPIS,'
      '  VALORCOFINS,'
      '  TOTALPROD,'
      '  TOTALNF,'
      '  OBS,'
      '  USUARIO,'
      '  FORMAPAGTO_COD,'
      '  CONDICAOPAGTO_COD,'
      '  COMPRA_PRAZO,'
      '  PRAZO_01,'
      '  PRAZO_02,'
      '  PRAZO_03,'
      '  PRAZO_04,'
      '  PRAZO_05,'
      '  PRAZO_06,'
      '  PRAZO_07,'
      '  PRAZO_08,'
      '  PRAZO_09,'
      '  PRAZO_10,'
      '  PRAZO_11,'
      '  PRAZO_12,'
      '  DTFINALIZACAO_COMPRA,'
      '  TIPO_DESPESA,'
      '  CANCEL_USUARIO,'
      '  CANCEL_DATAHORA,'
      '  CANCEL_MOTIVO,'
      '  AUTORIZACAO_ANO,'
      '  AUTORIZACAO_CODIGO,'
      '  AUTORIZACAO_EMPRESA,'
      '  DNFE_ENTRADA_ANO,'
      '  DNFE_ENTRADA_COD,'
      '  DNFE_FORMA,'
      '  DNFE_UF,'
      '  DNFE_CNPJ_CPF,'
      '  DNFE_IE,'
      '  DNFE_COMPETENCIA,'
      '  DNFE_SERIE,'
      '  DNFE_NUMERO,'
      '  DNFE_MODELO,'
      '  DNFE_CHAVE,'
      '  DECF_MODELO,'
      '  DECF_NUMERO,'
      '  DECF_COO'
      'from TBCOMPRAS '
      'where'
      '  ANO = :ANO and'
      '  CODCONTROL = :CODCONTROL')
    ModifySQL.Strings = (
      'update TBCOMPRAS'
      'set'
      '  ANO = :ANO,'
      '  AUTORIZACAO_ANO = :AUTORIZACAO_ANO,'
      '  AUTORIZACAO_CODIGO = :AUTORIZACAO_CODIGO,'
      '  AUTORIZACAO_EMPRESA = :AUTORIZACAO_EMPRESA,'
      '  CALCULAR_TOTAIS = :CALCULAR_TOTAIS,'
      '  CODCONTROL = :CODCONTROL,'
      '  CODEMP = :CODEMP,'
      '  CODFORN = :CODFORN,'
      '  COMPRA_PRAZO = :COMPRA_PRAZO,'
      '  CONDICAOPAGTO_COD = :CONDICAOPAGTO_COD,'
      '  DESCONTO = :DESCONTO,'
      '  DTEMISS = :DTEMISS,'
      '  DTENT = :DTENT,'
      '  DTFINALIZACAO_COMPRA = :DTFINALIZACAO_COMPRA,'
      '  DTLANCAMENTO = :DTLANCAMENTO,'
      '  FORMAPAGTO_COD = :FORMAPAGTO_COD,'
      '  FRETE = :FRETE,'
      '  ICMSBASE = :ICMSBASE,'
      '  ICMSSUBSTBASE = :ICMSSUBSTBASE,'
      '  ICMSSUBSTVALOR = :ICMSSUBSTVALOR,'
      '  ICMSVALOR = :ICMSVALOR,'
      '  IPI = :IPI,'
      '  LOTE_NFE_ANO = :LOTE_NFE_ANO,'
      '  LOTE_NFE_NUMERO = :LOTE_NFE_NUMERO,'
      '  LOTE_NFE_RECIBO = :LOTE_NFE_RECIBO,'
      '  NATUREZA = :NATUREZA,'
      '  NF = :NF,'
      '  NFCFOP = :NFCFOP,'
      '  NFSERIE = :NFSERIE,'
      '  OBS = :OBS,'
      '  OUTROSCUSTOS = :OUTROSCUSTOS,'
      '  PRAZO_01 = :PRAZO_01,'
      '  PRAZO_02 = :PRAZO_02,'
      '  PRAZO_03 = :PRAZO_03,'
      '  PRAZO_04 = :PRAZO_04,'
      '  PRAZO_05 = :PRAZO_05,'
      '  PRAZO_06 = :PRAZO_06,'
      '  PRAZO_07 = :PRAZO_07,'
      '  PRAZO_08 = :PRAZO_08,'
      '  PRAZO_09 = :PRAZO_09,'
      '  PRAZO_10 = :PRAZO_10,'
      '  PRAZO_11 = :PRAZO_11,'
      '  PRAZO_12 = :PRAZO_12,'
      '  STATUS = :STATUS,'
      '  TIPO_DESPESA = :TIPO_DESPESA,'
      '  TIPO_DOCUMENTO = :TIPO_DOCUMENTO,'
      '  TIPO_ENTRADA = :TIPO_ENTRADA,'
      '  TIPO_MOVIMENTO = :TIPO_MOVIMENTO,'
      '  TOTALNF = :TOTALNF,'
      '  TOTALPROD = :TOTALPROD,'
      '  USUARIO = :USUARIO'
      'where'
      '  ANO = :OLD_ANO and'
      '  CODCONTROL = :OLD_CODCONTROL')
    InsertSQL.Strings = (
      'insert into TBCOMPRAS'
      
        '  (ANO, AUTORIZACAO_ANO, AUTORIZACAO_CODIGO, AUTORIZACAO_EMPRESA' +
        ', CALCULAR_TOTAIS, '
      
        '   CODCONTROL, CODEMP, CODFORN, COMPRA_PRAZO, CONDICAOPAGTO_COD,' +
        ' DESCONTO, '
      
        '   DTEMISS, DTENT, DTFINALIZACAO_COMPRA, DTLANCAMENTO, FORMAPAGT' +
        'O_COD, '
      
        '   FRETE, ICMSBASE, ICMSSUBSTBASE, ICMSSUBSTVALOR, ICMSVALOR, IP' +
        'I, LOTE_NFE_ANO, '
      
        '   LOTE_NFE_NUMERO, LOTE_NFE_RECIBO, NATUREZA, NF, NFCFOP, NFSER' +
        'IE, OBS, '
      
        '   OUTROSCUSTOS, PRAZO_01, PRAZO_02, PRAZO_03, PRAZO_04, PRAZO_0' +
        '5, PRAZO_06, '
      
        '   PRAZO_07, PRAZO_08, PRAZO_09, PRAZO_10, PRAZO_11, PRAZO_12, S' +
        'TATUS, '
      
        '   TIPO_DESPESA, TIPO_DOCUMENTO, TIPO_ENTRADA, TIPO_MOVIMENTO, T' +
        'OTALNF, '
      '   TOTALPROD, USUARIO)'
      'values'
      
        '  (:ANO, :AUTORIZACAO_ANO, :AUTORIZACAO_CODIGO, :AUTORIZACAO_EMP' +
        'RESA, :CALCULAR_TOTAIS, '
      
        '   :CODCONTROL, :CODEMP, :CODFORN, :COMPRA_PRAZO, :CONDICAOPAGTO' +
        '_COD, :DESCONTO, '
      
        '   :DTEMISS, :DTENT, :DTFINALIZACAO_COMPRA, :DTLANCAMENTO, :FORM' +
        'APAGTO_COD, '
      
        '   :FRETE, :ICMSBASE, :ICMSSUBSTBASE, :ICMSSUBSTVALOR, :ICMSVALO' +
        'R, :IPI, '
      
        '   :LOTE_NFE_ANO, :LOTE_NFE_NUMERO, :LOTE_NFE_RECIBO, :NATUREZA,' +
        ' :NF, :NFCFOP, '
      
        '   :NFSERIE, :OBS, :OUTROSCUSTOS, :PRAZO_01, :PRAZO_02, :PRAZO_0' +
        '3, :PRAZO_04, '
      
        '   :PRAZO_05, :PRAZO_06, :PRAZO_07, :PRAZO_08, :PRAZO_09, :PRAZO' +
        '_10, :PRAZO_11, '
      
        '   :PRAZO_12, :STATUS, :TIPO_DESPESA, :TIPO_DOCUMENTO, :TIPO_ENT' +
        'RADA, :TIPO_MOVIMENTO, '
      '   :TOTALNF, :TOTALPROD, :USUARIO)')
    DeleteSQL.Strings = (
      'delete from TBCOMPRAS'
      'where'
      '  ANO = :OLD_ANO and'
      '  CODCONTROL = :OLD_CODCONTROL')
    Left = 992
    Top = 40
  end
  inherited ImgList: TImageList
    Left = 928
    Top = 40
  end
  inherited fdQryTabela: TFDQuery
    AfterCancel = fdQryTabelaAfterCancel
    AfterScroll = fdQryTabelaAfterScroll
    UpdateOptions.AssignedValues = [uvFetchGeneratorsPoint, uvGeneratorName]
    UpdateOptions.FetchGeneratorsPoint = gpImmediate
    UpdateOptions.GeneratorName = 'GEN_COMPRAS_CONTROLE_2019'
    UpdateOptions.KeyFields = 'ANO;CODCONTROL;CODEMP'
    UpdateOptions.AutoIncFields = 'CODCONTROL'
    SQL.Strings = (
      'Select'
      '    c.ANO'
      '  , c.CODCONTROL'
      '  , c.CODEMP'
      '  , c.CODFORN'
      '  , c.TIPO_ENTRADA'
      '  , c.TIPO_DOCUMENTO'
      '  , c.TIPO_MOVIMENTO'
      '  , c.NF'
      '  , c.NFSERIE'
      '  , c.NFNSU'
      '  , c.VERIFICADOR_NFE'
      '  , c.XML_NFE_FILENAME'
      '  , c.LOTE_NFE_ANO'
      '  , c.LOTE_NFE_NUMERO'
      '  , c.LOTE_NFE_RECIBO'
      '  , c.DTLANCAMENTO'
      '  , c.DTEMISS'
      '  , c.DTENT'
      '  , c.DTFINALIZACAO_COMPRA'
      '  , c.NFCFOP'
      '  , c.NATUREZA'
      '  , c.STATUS'
      '  , c.CALCULAR_TOTAIS'
      '  , c.IPI'
      '  , c.ICMSBASE'
      '  , c.ICMSVALOR'
      '  , c.ICMSSUBSTBASE'
      '  , c.ICMSSUBSTVALOR'
      '  , c.FRETE'
      '  , c.OUTROSCUSTOS'
      '  , c.DESCONTO'
      '  , c.TOTALNF'
      '  , c.TOTALPROD'
      '  , c.OBS'
      '  , c.USUARIO'
      '  , c.FORMAPAGTO_COD'
      '  , c.CONDICAOPAGTO_COD'
      '  , c.COMPRA_PRAZO'
      '  , c.PRAZO_01'
      '  , c.PRAZO_02'
      '  , c.PRAZO_03'
      '  , c.PRAZO_04'
      '  , c.PRAZO_05'
      '  , c.PRAZO_06'
      '  , c.PRAZO_07'
      '  , c.PRAZO_08'
      '  , c.PRAZO_09'
      '  , c.PRAZO_10'
      '  , c.PRAZO_11'
      '  , c.PRAZO_12'
      '  , c.TIPO_DESPESA'
      '  , c.AUTORIZACAO_ANO'
      '  , c.AUTORIZACAO_CODIGO'
      '  , c.AUTORIZACAO_EMPRESA'
      '  , c.Cancel_usuario'
      '  , c.Cancel_datahora'
      '  , c.Cancel_motivo'
      '  , f.Nomeforn'
      '  , f.Cnpj'
      '  , n.Cfop_descricao'
      '  , coalesce(('
      '      Select'
      '        count(i.seq)'
      '      from TBCOMPRASITENS i'
      '      where i.ano        = c.ano'
      '        and i.codcontrol = c.codcontrol'
      '    ), 0) as qt_itens'
      'from TBCOMPRAS c'
      '  left join TBFORNECEDOR f on (f.Codforn = c.Codforn)'
      '  left join TBCFOP n on (n.Cfop_cod = c.Nfcfop)')
    Left = 960
    Top = 72
    object fdQryTabelaANO: TSmallintField
      DisplayLabel = 'Ano'
      FieldName = 'ANO'
      Origin = 'ANO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object fdQryTabelaCODCONTROL: TIntegerField
      AutoGenerateValue = arAutoInc
      DisplayLabel = 'No. Compra'
      FieldName = 'CODCONTROL'
      Origin = 'CODCONTROL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object fdQryTabelaCODEMP: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'CODEMP'
      Origin = 'CODEMP'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 18
    end
    object fdQryTabelaCODFORN: TIntegerField
      DisplayLabel = 'Fornecedor'
      FieldName = 'CODFORN'
      Origin = 'CODFORN'
    end
    object fdQryTabelaTIPO_ENTRADA: TSmallintField
      Alignment = taLeftJustify
      DisplayLabel = 'Tipo Entrada'
      FieldName = 'TIPO_ENTRADA'
      Origin = 'TIPO_ENTRADA'
      Required = True
    end
    object fdQryTabelaTIPO_DOCUMENTO: TSmallintField
      Alignment = taLeftJustify
      DisplayLabel = 'Tipo Documento'
      FieldName = 'TIPO_DOCUMENTO'
      Origin = 'TIPO_DOCUMENTO'
      Required = True
    end
    object fdQryTabelaTIPO_MOVIMENTO: TSmallintField
      FieldName = 'TIPO_MOVIMENTO'
      Origin = 'TIPO_MOVIMENTO'
    end
    object fdQryTabelaNF: TIntegerField
      DisplayLabel = 'N'#250'mero do Documento'
      FieldName = 'NF'
      Origin = 'NF'
      Required = True
    end
    object fdQryTabelaNFSERIE: TStringField
      DisplayLabel = 'S'#233'rie do Documento'
      FieldName = 'NFSERIE'
      Origin = 'NFSERIE'
      Size = 4
    end
    object fdQryTabelaNFNSU: TStringField
      FieldName = 'NFNSU'
      Origin = 'NFNSU'
    end
    object fdQryTabelaVERIFICADOR_NFE: TStringField
      FieldName = 'VERIFICADOR_NFE'
      Origin = 'VERIFICADOR_NFE'
      Size = 250
    end
    object fdQryTabelaXML_NFE_FILENAME: TStringField
      FieldName = 'XML_NFE_FILENAME'
      Origin = 'XML_NFE_FILENAME'
      Size = 250
    end
    object fdQryTabelaLOTE_NFE_ANO: TSmallintField
      FieldName = 'LOTE_NFE_ANO'
      Origin = 'LOTE_NFE_ANO'
    end
    object fdQryTabelaLOTE_NFE_NUMERO: TIntegerField
      FieldName = 'LOTE_NFE_NUMERO'
      Origin = 'LOTE_NFE_NUMERO'
    end
    object fdQryTabelaLOTE_NFE_RECIBO: TStringField
      FieldName = 'LOTE_NFE_RECIBO'
      Origin = 'LOTE_NFE_RECIBO'
      Size = 250
    end
    object fdQryTabelaDTLANCAMENTO: TSQLTimeStampField
      DisplayLabel = 'Data Lan'#231'amento'
      FieldName = 'DTLANCAMENTO'
      Origin = 'DTLANCAMENTO'
      Required = True
      DisplayFormat = 'dd/mm/yyyy hh:mm'
    end
    object fdQryTabelaDTEMISS: TDateField
      DisplayLabel = 'Data Emiss'#227'o'
      FieldName = 'DTEMISS'
      Origin = 'DTEMISS'
      Required = True
      DisplayFormat = 'dd/mm/yyyy'
    end
    object fdQryTabelaDTENT: TDateField
      DisplayLabel = 'Data Entrada'
      FieldName = 'DTENT'
      Origin = 'DTENT'
      Required = True
      DisplayFormat = 'dd/mm/yyyy'
    end
    object fdQryTabelaDTFINALIZACAO_COMPRA: TSQLTimeStampField
      FieldName = 'DTFINALIZACAO_COMPRA'
      Origin = 'DTFINALIZACAO_COMPRA'
    end
    object fdQryTabelaNFCFOP: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'CFOP'
      FieldName = 'NFCFOP'
      Origin = 'NFCFOP'
    end
    object fdQryTabelaNATUREZA: TStringField
      DisplayLabel = 'Natureza'
      FieldName = 'NATUREZA'
      Origin = 'NATUREZA'
      Size = 4
    end
    object fdQryTabelaSTATUS: TSmallintField
      Alignment = taLeftJustify
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
      OnGetText = fdQryTabelaSTATUSGetText
    end
    object fdQryTabelaCALCULAR_TOTAIS: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'CALCULAR_TOTAIS'
      Origin = 'CALCULAR_TOTAIS'
    end
    object fdQryTabelaOBS: TMemoField
      FieldName = 'OBS'
      Origin = 'OBS'
      BlobType = ftMemo
    end
    object fdQryTabelaIPI: TFMTBCDField
      FieldName = 'IPI'
      Origin = 'IPI'
      Precision = 18
      Size = 2
    end
    object fdQryTabelaICMSBASE: TFMTBCDField
      FieldName = 'ICMSBASE'
      Origin = 'ICMSBASE'
      Precision = 18
      Size = 2
    end
    object fdQryTabelaICMSVALOR: TFMTBCDField
      FieldName = 'ICMSVALOR'
      Origin = 'ICMSVALOR'
      Precision = 18
      Size = 2
    end
    object fdQryTabelaICMSSUBSTBASE: TFMTBCDField
      FieldName = 'ICMSSUBSTBASE'
      Origin = 'ICMSSUBSTBASE'
      Precision = 18
      Size = 2
    end
    object fdQryTabelaICMSSUBSTVALOR: TFMTBCDField
      FieldName = 'ICMSSUBSTVALOR'
      Origin = 'ICMSSUBSTVALOR'
      Precision = 18
      Size = 2
    end
    object fdQryTabelaFRETE: TFMTBCDField
      FieldName = 'FRETE'
      Origin = 'FRETE'
      Precision = 18
      Size = 2
    end
    object fdQryTabelaOUTROSCUSTOS: TFMTBCDField
      FieldName = 'OUTROSCUSTOS'
      Origin = 'OUTROSCUSTOS'
      Precision = 18
      Size = 2
    end
    object fdQryTabelaDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      Precision = 18
      Size = 2
    end
    object fdQryTabelaTOTALNF: TFMTBCDField
      FieldName = 'TOTALNF'
      Origin = 'TOTALNF'
      Precision = 18
      Size = 2
    end
    object fdQryTabelaTOTALPROD: TFMTBCDField
      FieldName = 'TOTALPROD'
      Origin = 'TOTALPROD'
      Precision = 18
      Size = 2
    end
    object fdQryTabelaUSUARIO: TStringField
      FieldName = 'USUARIO'
      Origin = 'USUARIO'
      Size = 50
    end
    object fdQryTabelaFORMAPAGTO_COD: TSmallintField
      DisplayLabel = 'Forma de Pagamento'
      FieldName = 'FORMAPAGTO_COD'
      Origin = 'FORMAPAGTO_COD'
      Required = True
    end
    object fdQryTabelaCONDICAOPAGTO_COD: TSmallintField
      DisplayLabel = 'Condi'#231#227'o de Pagamento'
      FieldName = 'CONDICAOPAGTO_COD'
      Origin = 'CONDICAOPAGTO_COD'
      Required = True
    end
    object fdQryTabelaTIPO_DESPESA: TSmallintField
      Alignment = taLeftJustify
      DisplayLabel = 'Tipo Despesa'
      FieldName = 'TIPO_DESPESA'
      Origin = 'TIPO_DESPESA'
      Required = True
    end
    object fdQryTabelaCOMPRA_PRAZO: TSmallintField
      FieldName = 'COMPRA_PRAZO'
      Origin = 'COMPRA_PRAZO'
      Required = True
    end
    object fdQryTabelaPRAZO_01: TSmallintField
      Alignment = taCenter
      FieldName = 'PRAZO_01'
      Origin = 'PRAZO_01'
    end
    object fdQryTabelaPRAZO_02: TSmallintField
      Alignment = taCenter
      FieldName = 'PRAZO_02'
      Origin = 'PRAZO_02'
    end
    object fdQryTabelaPRAZO_03: TSmallintField
      Alignment = taCenter
      FieldName = 'PRAZO_03'
      Origin = 'PRAZO_03'
    end
    object fdQryTabelaPRAZO_04: TSmallintField
      Alignment = taCenter
      FieldName = 'PRAZO_04'
      Origin = 'PRAZO_04'
    end
    object fdQryTabelaPRAZO_05: TSmallintField
      Alignment = taCenter
      FieldName = 'PRAZO_05'
      Origin = 'PRAZO_05'
    end
    object fdQryTabelaPRAZO_06: TSmallintField
      Alignment = taCenter
      FieldName = 'PRAZO_06'
      Origin = 'PRAZO_06'
    end
    object fdQryTabelaPRAZO_07: TSmallintField
      Alignment = taCenter
      FieldName = 'PRAZO_07'
      Origin = 'PRAZO_07'
    end
    object fdQryTabelaPRAZO_08: TSmallintField
      Alignment = taCenter
      FieldName = 'PRAZO_08'
      Origin = 'PRAZO_08'
    end
    object fdQryTabelaPRAZO_09: TSmallintField
      Alignment = taCenter
      FieldName = 'PRAZO_09'
      Origin = 'PRAZO_09'
    end
    object fdQryTabelaPRAZO_10: TSmallintField
      Alignment = taCenter
      FieldName = 'PRAZO_10'
      Origin = 'PRAZO_10'
    end
    object fdQryTabelaPRAZO_11: TSmallintField
      Alignment = taCenter
      FieldName = 'PRAZO_11'
      Origin = 'PRAZO_11'
    end
    object fdQryTabelaPRAZO_12: TSmallintField
      Alignment = taCenter
      FieldName = 'PRAZO_12'
      Origin = 'PRAZO_12'
    end
    object fdQryTabelaAUTORIZACAO_ANO: TSmallintField
      FieldName = 'AUTORIZACAO_ANO'
      Origin = 'AUTORIZACAO_ANO'
    end
    object fdQryTabelaAUTORIZACAO_CODIGO: TIntegerField
      FieldName = 'AUTORIZACAO_CODIGO'
      Origin = 'AUTORIZACAO_CODIGO'
      OnGetText = fdQryTabelaAUTORIZACAO_CODIGOGetText
    end
    object fdQryTabelaAUTORIZACAO_EMPRESA: TStringField
      FieldName = 'AUTORIZACAO_EMPRESA'
      Origin = 'AUTORIZACAO_EMPRESA'
      Size = 18
    end
    object fdQryTabelaCANCEL_USUARIO: TStringField
      FieldName = 'CANCEL_USUARIO'
      Origin = 'CANCEL_USUARIO'
      Size = 50
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
    object fdQryTabelaNOMEFORN: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Fornecedor'
      FieldName = 'NOMEFORN'
      Origin = 'NOMEFORN'
      ProviderFlags = []
      Size = 100
    end
    object fdQryTabelaCNPJ: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'CPF/CNPJ'
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      ProviderFlags = []
      Size = 18
    end
    object fdQryTabelaCFOP_DESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CFOP_DESCRICAO'
      Origin = 'CFOP_DESCRICAO'
      ProviderFlags = []
      Size = 250
    end
    object fdQryTabelaQT_ITENS: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'QT_ITENS'
      Origin = 'QT_ITENS'
      ProviderFlags = []
      DisplayFormat = ',0'
    end
  end
  inherited fdUpdTabela: TFDUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO TBCOMPRAS'
      '(ANO, CODCONTROL, CODEMP, CODFORN, TIPO_ENTRADA, '
      '  TIPO_DOCUMENTO, TIPO_MOVIMENTO, NF, NFSERIE, NFNSU,'
      '  LOTE_NFE_ANO, LOTE_NFE_NUMERO, LOTE_NFE_RECIBO,'
      '  VERIFICADOR_NFE, XML_NFE_FILENAME, DTLANCAMENTO,'
      '  DTEMISS, DTENT, NFCFOP, NATUREZA, STATUS,'
      '  CALCULAR_TOTAIS, IPI, ICMSBASE, ICMSVALOR,'
      '  ICMSSUBSTBASE, ICMSSUBSTVALOR, FRETE, OUTROSCUSTOS,'
      '  DESCONTO, TOTALPROD, TOTALNF, OBS, USUARIO,'
      '  FORMAPAGTO_COD, CONDICAOPAGTO_COD, COMPRA_PRAZO,'
      '  PRAZO_01, PRAZO_02, PRAZO_03, PRAZO_04,'
      '  PRAZO_05, PRAZO_06, PRAZO_07, PRAZO_08,'
      '  PRAZO_09, PRAZO_10, PRAZO_11, PRAZO_12,'
      '  DTFINALIZACAO_COMPRA, TIPO_DESPESA, CANCEL_USUARIO,'
      '  CANCEL_DATAHORA, CANCEL_MOTIVO, AUTORIZACAO_ANO,'
      '  AUTORIZACAO_CODIGO, AUTORIZACAO_EMPRESA)'
      
        'VALUES (:NEW_ANO, :NEW_CODCONTROL, :NEW_CODEMP, :NEW_CODFORN, :N' +
        'EW_TIPO_ENTRADA,'
      
        '  :NEW_TIPO_DOCUMENTO, :NEW_TIPO_MOVIMENTO, :NEW_NF, :NEW_NFSERI' +
        'E, :NEW_NFNSU,'
      
        '  :NEW_LOTE_NFE_ANO, :NEW_LOTE_NFE_NUMERO, :NEW_LOTE_NFE_RECIBO,' +
        ' '
      
        '  :NEW_VERIFICADOR_NFE, :NEW_XML_NFE_FILENAME, :NEW_DTLANCAMENTO' +
        ', '
      
        '  :NEW_DTEMISS, :NEW_DTENT, :NEW_NFCFOP, :NEW_NATUREZA, :NEW_STA' +
        'TUS, '
      
        '  :NEW_CALCULAR_TOTAIS, :NEW_IPI, :NEW_ICMSBASE, :NEW_ICMSVALOR,' +
        ' '
      
        '  :NEW_ICMSSUBSTBASE, :NEW_ICMSSUBSTVALOR, :NEW_FRETE, :NEW_OUTR' +
        'OSCUSTOS, '
      
        '  :NEW_DESCONTO, :NEW_TOTALPROD, :NEW_TOTALNF, :NEW_OBS, :NEW_US' +
        'UARIO, '
      
        '  :NEW_FORMAPAGTO_COD, :NEW_CONDICAOPAGTO_COD, :NEW_COMPRA_PRAZO' +
        ', '
      '  :NEW_PRAZO_01, :NEW_PRAZO_02, :NEW_PRAZO_03, :NEW_PRAZO_04, '
      '  :NEW_PRAZO_05, :NEW_PRAZO_06, :NEW_PRAZO_07, :NEW_PRAZO_08, '
      '  :NEW_PRAZO_09, :NEW_PRAZO_10, :NEW_PRAZO_11, :NEW_PRAZO_12, '
      
        '  :NEW_DTFINALIZACAO_COMPRA, :NEW_TIPO_DESPESA, :NEW_CANCEL_USUA' +
        'RIO, '
      
        '  :NEW_CANCEL_DATAHORA, :NEW_CANCEL_MOTIVO, :NEW_AUTORIZACAO_ANO' +
        ', '
      '  :NEW_AUTORIZACAO_CODIGO, :NEW_AUTORIZACAO_EMPRESA)'
      'RETURNING CODCONTROL, USUARIO')
    ModifySQL.Strings = (
      'UPDATE TBCOMPRAS'
      
        'SET ANO = :NEW_ANO, CODCONTROL = :NEW_CODCONTROL, CODEMP = :NEW_' +
        'CODEMP, '
      '  CODFORN = :NEW_CODFORN, TIPO_ENTRADA = :NEW_TIPO_ENTRADA, '
      
        '  TIPO_DOCUMENTO = :NEW_TIPO_DOCUMENTO, TIPO_MOVIMENTO = :NEW_TI' +
        'PO_MOVIMENTO, '
      
        '  NF = :NEW_NF, NFSERIE = :NEW_NFSERIE, NFNSU = :NEW_NFNSU, LOTE' +
        '_NFE_ANO = :NEW_LOTE_NFE_ANO,'
      
        '  LOTE_NFE_NUMERO = :NEW_LOTE_NFE_NUMERO, LOTE_NFE_RECIBO = :NEW' +
        '_LOTE_NFE_RECIBO, '
      
        '  VERIFICADOR_NFE = :NEW_VERIFICADOR_NFE, XML_NFE_FILENAME = :NE' +
        'W_XML_NFE_FILENAME, '
      '  DTLANCAMENTO = :NEW_DTLANCAMENTO, DTEMISS = :NEW_DTEMISS, '
      
        '  DTENT = :NEW_DTENT, NFCFOP = :NEW_NFCFOP, NATUREZA = :NEW_NATU' +
        'REZA, '
      '  STATUS = :NEW_STATUS, CALCULAR_TOTAIS = :NEW_CALCULAR_TOTAIS, '
      
        '  IPI = :NEW_IPI, ICMSBASE = :NEW_ICMSBASE, ICMSVALOR = :NEW_ICM' +
        'SVALOR, '
      
        '  ICMSSUBSTBASE = :NEW_ICMSSUBSTBASE, ICMSSUBSTVALOR = :NEW_ICMS' +
        'SUBSTVALOR, '
      
        '  FRETE = :NEW_FRETE, OUTROSCUSTOS = :NEW_OUTROSCUSTOS, DESCONTO' +
        ' = :NEW_DESCONTO, '
      
        '  TOTALPROD = :NEW_TOTALPROD, TOTALNF = :NEW_TOTALNF, OBS = :NEW' +
        '_OBS, '
      '  USUARIO = :NEW_USUARIO, FORMAPAGTO_COD = :NEW_FORMAPAGTO_COD, '
      
        '  CONDICAOPAGTO_COD = :NEW_CONDICAOPAGTO_COD, COMPRA_PRAZO = :NE' +
        'W_COMPRA_PRAZO, '
      
        '  PRAZO_01 = :NEW_PRAZO_01, PRAZO_02 = :NEW_PRAZO_02, PRAZO_03 =' +
        ' :NEW_PRAZO_03, '
      
        '  PRAZO_04 = :NEW_PRAZO_04, PRAZO_05 = :NEW_PRAZO_05, PRAZO_06 =' +
        ' :NEW_PRAZO_06, '
      
        '  PRAZO_07 = :NEW_PRAZO_07, PRAZO_08 = :NEW_PRAZO_08, PRAZO_09 =' +
        ' :NEW_PRAZO_09, '
      
        '  PRAZO_10 = :NEW_PRAZO_10, PRAZO_11 = :NEW_PRAZO_11, PRAZO_12 =' +
        ' :NEW_PRAZO_12, '
      
        '  DTFINALIZACAO_COMPRA = :NEW_DTFINALIZACAO_COMPRA, TIPO_DESPESA' +
        ' = :NEW_TIPO_DESPESA, '
      
        '  CANCEL_USUARIO = :NEW_CANCEL_USUARIO, CANCEL_DATAHORA = :NEW_C' +
        'ANCEL_DATAHORA, '
      
        '  CANCEL_MOTIVO = :NEW_CANCEL_MOTIVO, AUTORIZACAO_ANO = :NEW_AUT' +
        'ORIZACAO_ANO, '
      
        '  AUTORIZACAO_CODIGO = :NEW_AUTORIZACAO_CODIGO, AUTORIZACAO_EMPR' +
        'ESA = :NEW_AUTORIZACAO_EMPRESA'
      
        'WHERE ANO = :OLD_ANO AND CODCONTROL = :OLD_CODCONTROL AND CODEMP' +
        ' = :OLD_CODEMP'
      'RETURNING CODCONTROL, USUARIO')
    DeleteSQL.Strings = (
      'DELETE FROM TBCOMPRAS'
      
        'WHERE ANO = :OLD_ANO AND CODCONTROL = :OLD_CODCONTROL AND CODEMP' +
        ' = :OLD_CODEMP')
    FetchRowSQL.Strings = (
      'Select'
      '    c.ANO'
      '  , c.CODCONTROL'
      '  , c.CODEMP'
      '  , c.CODFORN'
      '  , c.TIPO_ENTRADA'
      '  , c.TIPO_DOCUMENTO'
      '  , c.TIPO_MOVIMENTO'
      '  , c.NF'
      '  , c.NFSERIE'
      '  , c.VERIFICADOR_NFE'
      '  , c.XML_NFE_FILENAME'
      '  , c.LOTE_NFE_ANO'
      '  , c.LOTE_NFE_NUMERO'
      '  , c.LOTE_NFE_RECIBO'
      '  , c.DTLANCAMENTO'
      '  , c.DTEMISS'
      '  , c.DTENT'
      '  , c.DTFINALIZACAO_COMPRA'
      '  , c.NFCFOP'
      '  , c.NATUREZA'
      '  , c.STATUS'
      '  , c.CALCULAR_TOTAIS'
      '  , c.IPI'
      '  , c.ICMSBASE'
      '  , c.ICMSVALOR'
      '  , c.ICMSSUBSTBASE'
      '  , c.ICMSSUBSTVALOR'
      '  , c.FRETE'
      '  , c.OUTROSCUSTOS'
      '  , c.DESCONTO'
      '  , c.TOTALNF'
      '  , c.TOTALPROD'
      '  , c.OBS'
      '  , c.USUARIO'
      '  , c.FORMAPAGTO_COD'
      '  , c.CONDICAOPAGTO_COD'
      '  , c.COMPRA_PRAZO'
      '  , c.PRAZO_01'
      '  , c.PRAZO_02'
      '  , c.PRAZO_03'
      '  , c.PRAZO_04'
      '  , c.PRAZO_05'
      '  , c.PRAZO_06'
      '  , c.PRAZO_07'
      '  , c.PRAZO_08'
      '  , c.PRAZO_09'
      '  , c.PRAZO_10'
      '  , c.PRAZO_11'
      '  , c.PRAZO_12'
      '  , c.TIPO_DESPESA'
      '  , c.AUTORIZACAO_ANO'
      '  , c.AUTORIZACAO_CODIGO'
      '  , c.AUTORIZACAO_EMPRESA'
      '  , c.Cancel_usuario'
      '  , c.Cancel_datahora'
      '  , c.Cancel_motivo'
      '  , f.Nomeforn'
      '  , f.Cnpj'
      '  , n.Cfop_descricao'
      '  , coalesce(('
      '      Select'
      '        count(i.seq)'
      '      from TBCOMPRASITENS i'
      '      where i.ano        = c.ano'
      '        and i.codcontrol = c.codcontrol'
      '    ), 0) as qt_itens'
      'from TBCOMPRAS c'
      '  left join TBFORNECEDOR f on (f.Codforn = c.Codforn)'
      '  left join TBCFOP n on (n.Cfop_cod = c.Nfcfop)'
      
        'WHERE c.ANO = :ANO AND c.CODCONTROL = :CODCONTROL AND c.CODEMP =' +
        ' :CODEMP')
    Left = 992
    Top = 72
  end
  object dtsEmpresa: TDataSource
    DataSet = fdQryEmpresa
    Left = 640
    Top = 16
  end
  object dtsFormaPagto: TDataSource
    DataSet = qryFormaPagto
    Left = 640
    Top = 48
  end
  object dtsCondicaoPagto: TDataSource
    DataSet = qryCondicaoPagto
    Left = 640
    Top = 80
  end
  object DtSrcTabelaItens: TDataSource
    AutoEdit = False
    DataSet = cdsTabelaItens
    OnStateChange = DtSrcTabelaItensStateChange
    Left = 424
    Top = 352
  end
  object dtsDuplicatas: TDataSource
    AutoEdit = False
    DataSet = qryDuplicatas
    Left = 424
    Top = 384
  end
  object ppImprimir: TPopupMenu
    Left = 56
    Top = 384
    object nmImprimirEspelho: TMenuItem
      Caption = 'Espelho do Documento de Entrada'
      OnClick = nmImprimirEspelhoClick
    end
    object dvImprimirEspelho: TMenuItem
      Caption = '-'
    end
    object nmImprimirDANFE: TMenuItem
      Caption = 'Imprimir DANFE'
      Enabled = False
      OnClick = nmImprimirDANFEClick
    end
    object nmGerarDANFEXML: TMenuItem
      Caption = 'Gerar/Salvar XML da NF-e'
      Enabled = False
      OnClick = nmGerarDANFEXMLClick
    end
  end
  object dtsTpDespesa: TDataSource
    DataSet = qryTipoDespesa
    Left = 640
    Top = 112
  end
  object dtsTipoDocumento: TDataSource
    DataSet = qryTipoDocumento
    Left = 640
    Top = 144
  end
  object dtsTipoEntrada: TDataSource
    DataSet = qryTipoEntrada
    Left = 640
    Top = 184
  end
  object dtsNFE: TDataSource
    DataSet = qryNFE
    Left = 960
    Top = 384
  end
  object ppCorrigirDadosNFe: TPopupMenu
    Left = 124
    Top = 385
    object nmPpCorrigirDadosNFeCFOP: TMenuItem
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
      Caption = 'Corrigir CFOP'
      OnClick = nmPpCorrigirDadosNFeCFOPClick
    end
  end
  object popupAuditoria: TPopupMenu
    Left = 92
    Top = 385
    object nmPpLimparDadosNFe: TMenuItem
      Caption = 'Limpar LOG de Envio de NF-e'
      OnClick = nmPpLimparDadosNFeClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object nmPpReciboNFe: TMenuItem
      Caption = '&1. Visualizar Recibo da NF-e'
      OnClick = nmPpReciboNFeClick
    end
    object nmPpChaveNFe: TMenuItem
      Caption = '&2. Visualizar Chave da NF-e'
      OnClick = nmPpChaveNFeClick
    end
    object nmPpArquivoNFe: TMenuItem
      Caption = '&3. Visualizar Nome do Arquivo NF-e'
      OnClick = nmPpArquivoNFeClick
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
    Left = 672
    Top = 16
  end
  object qryAutorizacaoProduto: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    i.produto'
      '  , p.descri'
      '  , p.apresentacao'
      '  , p.descri_apresentacao'
      '  , i.unidade'
      '  , u.unp_descricao'
      '  , u.unp_sigla'
      '  , p.codcfop'
      '  , p.ncm_sh'
      '  , p.cst'
      '  , p.csosn'
      '  , p.aliquota'
      '  , p.percentual_reducao_bc'
      '  , p.aliquota_csosn'
      '  , p.aliquota_pis'
      '  , p.aliquota_cofins'
      '  , i.quantidade'
      '  , p.qtde as estoque'
      '  , i.quantidade + coalesce(p.qtde, 0.0) as novo_estoque'
      '  , i.valor_unitario'
      '  , p.valor_ipi'
      ''
      'from TBAUTORIZA_COMPRA c'
      
        '  inner join TBAUTORIZA_COMPRAITEM i on (i.ano = c.ano and i.cod' +
        'igo = c.codigo and i.empresa = c.empresa)'
      
        '  inner join TBPRODUTO p on (p.cod = i.produto and p.aliquota_ti' +
        'po = :tipo)'
      '  left join TBUNIDADEPROD u on (u.unp_cod = i.unidade)'
      ''
      'where c.ano     = :ano'
      '  and c.codigo  = :cod'
      '  and c.empresa = :emp'
      '')
    Left = 960
    Top = 104
    ParamData = <
      item
        Name = 'TIPO'
        DataType = ftSmallint
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ANO'
        DataType = ftSmallint
        ParamType = ptInput
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
  object qryProduto: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    p.Codigo'
      '  , p.Cod'
      '  , p.Descri'
      '  , p.Modelo'
      '  , p.Preco'
      '  , p.Referencia'
      '  , p.Secao'
      '  , p.Qtde'
      '  , p.Unidade'
      '  , p.Estoqmin'
      '  , p.Codgrupo'
      '  , p.Customedio'
      '  , p.Codemp'
      '  , p.Codsecao'
      '  , p.Codorigem'
      '  , p.Codtributacao'
      '  , p.Cst'
      '  , p.Csosn'
      '  , p.Codcfop'
      '  , p.Codbarra_ean'
      '  , p.Codunidade'
      '  , p.Ncm_sh'
      '  , p.Aliquota_tipo'
      '  , p.Aliquota'
      '  , p.Aliquota_csosn'
      '  , p.Aliquota_pis'
      '  , p.Aliquota_cofins'
      '  , p.Percentual_reducao_BC'
      '  , p.Valor_ipi'
      '  , p.Reserva'
      '  , case when coalesce(p.Reserva, 0) > 0'
      '      then coalesce(p.Qtde, 0) - coalesce(p.Reserva, 0)'
      '      else coalesce(p.Qtde, 0)'
      '    end as Disponivel'
      '  , g.Descri as Descricao_Grupo'
      '  , coalesce(s.Scp_descricao, p.Secao) as Descricao_Secao'
      '  , coalesce(u.Unp_descricao, p.Unidade) as Descricao_Unidade'
      '  , u.Unp_sigla'
      '  , c.Cfop_descricao'
      '  , c.Cfop_especificacao'
      'from TBPRODUTO p'
      '  left join TBGRUPOPROD g on (g.Cod = p.Codgrupo)'
      '  left join TBSECAOPROD s on (s.Scp_cod = p.Codsecao)'
      '  left join TBUNIDADEPROD u on (u.Unp_cod = p.Codunidade)'
      '  left join TBCFOP c on (c.Cfop_cod = p.Codcfop)'
      'where p.Codigo = :Codigo')
    Left = 896
    Top = 336
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object qryCFOP: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    c.Cfop_cod'
      '  , c.Cfop_descricao'
      '  , c.Cfop_cst_padrao_entrada'
      '  , c.Cfop_cst_padrao_saida'
      'from TBCFOP c'
      'where c.Cfop_cod = :Cfop_cod')
    Left = 928
    Top = 336
    ParamData = <
      item
        Name = 'CFOP_COD'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object spGerarDuplicatas: TFDStoredProc
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    StoredProcName = 'SET_GERAR_DUPLICATAS'
    Left = 960
    Top = 336
    ParamData = <
      item
        Position = 1
        Name = 'ANOCOMPRA'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'NUMCOMPRA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'FORNECEDOR'
        DataType = ftInteger
        ParamType = ptOutput
      end
      item
        Position = 4
        Name = 'NOTAFISCAL'
        DataType = ftInteger
        ParamType = ptOutput
      end
      item
        Position = 5
        Name = 'PARCELAS'
        DataType = ftSmallint
        ParamType = ptOutput
      end
      item
        Position = 6
        Name = 'VALOR_TOTAL'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 7
        Name = 'PARCELA'
        DataType = ftSmallint
        ParamType = ptOutput
      end
      item
        Position = 8
        Name = 'EMISSAO'
        DataType = ftDate
        ParamType = ptOutput
      end
      item
        Position = 9
        Name = 'VENCIMENTO'
        DataType = ftDate
        ParamType = ptOutput
      end
      item
        Position = 10
        Name = 'VALOR_DOCUMENTO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 11
        Name = 'FORMA_PAGTO'
        DataType = ftSmallint
        ParamType = ptOutput
      end
      item
        Position = 12
        Name = 'CONDICAO_PAGTO'
        DataType = ftSmallint
        ParamType = ptOutput
      end
      item
        Position = 13
        Name = 'DATA_ENTRADA'
        DataType = ftDate
        ParamType = ptOutput
      end
      item
        Position = 14
        Name = 'ANO_LANC'
        DataType = ftSmallint
        ParamType = ptOutput
      end
      item
        Position = 15
        Name = 'NUM_LANC'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
  object qryNFE: TFDQuery
    CachedUpdates = True
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    UpdateObject = updNFE
    SQL.Strings = (
      'Select'
      '    n.EMPRESA'
      '  , n.SERIE'
      '  , n.NUMERO'
      '  , n.MODELO'
      '  , n.VERSAO'
      '  , n.DATAEMISSAO'
      '  , n.HORAEMISSAO'
      '  , n.CHAVE'
      '  , n.PROTOCOLO'
      '  , n.RECIBO'
      '  , n.XML_FILENAME'
      '  , n.XML_FILE'
      '  , n.LOTE_ANO'
      '  , n.LOTE_NUM'
      '  , n.ANOVENDA'
      '  , n.NUMVENDA'
      '  , n.ANOCOMPRA'
      '  , n.NUMCOMPRA'
      'from TBNFE_ENVIADA n'
      'where n.EMPRESA = :empresa'
      '  and n.ANOCOMPRA = :anocompra'
      '  and n.NUMCOMPRA = :numcompra')
    Left = 896
    Top = 384
    ParamData = <
      item
        Name = 'EMPRESA'
        DataType = ftString
        ParamType = ptInput
        Size = 18
        Value = Null
      end
      item
        Name = 'ANOCOMPRA'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Name = 'NUMCOMPRA'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qryNFEEMPRESA: TStringField
      FieldName = 'EMPRESA'
      Origin = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 18
    end
    object qryNFESERIE: TStringField
      FieldName = 'SERIE'
      Origin = 'SERIE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object qryNFENUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryNFEMODELO: TSmallintField
      FieldName = 'MODELO'
      Origin = 'MODELO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryNFEVERSAO: TSmallintField
      FieldName = 'VERSAO'
      Origin = 'VERSAO'
    end
    object qryNFEDATAEMISSAO: TDateField
      FieldName = 'DATAEMISSAO'
      Origin = 'DATAEMISSAO'
    end
    object qryNFEHORAEMISSAO: TTimeField
      FieldName = 'HORAEMISSAO'
      Origin = 'HORAEMISSAO'
    end
    object qryNFECHAVE: TStringField
      FieldName = 'CHAVE'
      Origin = 'CHAVE'
      Size = 250
    end
    object qryNFEPROTOCOLO: TStringField
      FieldName = 'PROTOCOLO'
      Origin = 'PROTOCOLO'
      Size = 250
    end
    object qryNFERECIBO: TStringField
      FieldName = 'RECIBO'
      Origin = 'RECIBO'
      Size = 250
    end
    object qryNFEXML_FILENAME: TStringField
      FieldName = 'XML_FILENAME'
      Origin = 'XML_FILENAME'
      Size = 250
    end
    object qryNFEXML_FILE: TMemoField
      FieldName = 'XML_FILE'
      Origin = 'XML_FILE'
      BlobType = ftMemo
    end
    object qryNFELOTE_ANO: TSmallintField
      FieldName = 'LOTE_ANO'
      Origin = 'LOTE_ANO'
    end
    object qryNFELOTE_NUM: TIntegerField
      FieldName = 'LOTE_NUM'
      Origin = 'LOTE_NUM'
      Required = True
    end
    object qryNFEANOVENDA: TSmallintField
      FieldName = 'ANOVENDA'
      Origin = 'ANOVENDA'
    end
    object qryNFENUMVENDA: TIntegerField
      FieldName = 'NUMVENDA'
      Origin = 'NUMVENDA'
    end
    object qryNFEANOCOMPRA: TSmallintField
      FieldName = 'ANOCOMPRA'
      Origin = 'ANOCOMPRA'
    end
    object qryNFENUMCOMPRA: TIntegerField
      FieldName = 'NUMCOMPRA'
      Origin = 'NUMCOMPRA'
    end
  end
  object updNFE: TFDUpdateSQL
    Connection = DMBusiness.fdConexao
    InsertSQL.Strings = (
      'INSERT INTO TBNFE_ENVIADA'
      '(EMPRESA, SERIE, NUMERO, MODELO, VERSAO, '
      '  ANOVENDA, NUMVENDA, ANOCOMPRA, NUMCOMPRA, '
      '  DATAEMISSAO, HORAEMISSAO, CHAVE, PROTOCOLO, '
      '  RECIBO, XML_FILENAME, XML_FILE, LOTE_ANO, '
      '  LOTE_NUM)'
      
        'VALUES (:NEW_EMPRESA, :NEW_SERIE, :NEW_NUMERO, :NEW_MODELO, :NEW' +
        '_VERSAO, '
      '  :NEW_ANOVENDA, :NEW_NUMVENDA, :NEW_ANOCOMPRA, :NEW_NUMCOMPRA, '
      
        '  :NEW_DATAEMISSAO, :NEW_HORAEMISSAO, :NEW_CHAVE, :NEW_PROTOCOLO' +
        ', '
      '  :NEW_RECIBO, :NEW_XML_FILENAME, :NEW_XML_FILE, :NEW_LOTE_ANO, '
      '  :NEW_LOTE_NUM)'
      'RETURNING DATAEMISSAO, HORAEMISSAO, CANCELADA')
    ModifySQL.Strings = (
      'UPDATE TBNFE_ENVIADA'
      
        'SET EMPRESA = :NEW_EMPRESA, SERIE = :NEW_SERIE, NUMERO = :NEW_NU' +
        'MERO, '
      
        '  MODELO = :NEW_MODELO, VERSAO = :NEW_VERSAO, ANOVENDA = :NEW_AN' +
        'OVENDA, '
      
        '  NUMVENDA = :NEW_NUMVENDA, ANOCOMPRA = :NEW_ANOCOMPRA, NUMCOMPR' +
        'A = :NEW_NUMCOMPRA, '
      
        '  DATAEMISSAO = :NEW_DATAEMISSAO, HORAEMISSAO = :NEW_HORAEMISSAO' +
        ', '
      
        '  CHAVE = :NEW_CHAVE, PROTOCOLO = :NEW_PROTOCOLO, RECIBO = :NEW_' +
        'RECIBO, '
      '  XML_FILENAME = :NEW_XML_FILENAME, XML_FILE = :NEW_XML_FILE, '
      '  LOTE_ANO = :NEW_LOTE_ANO, LOTE_NUM = :NEW_LOTE_NUM'
      
        'WHERE EMPRESA = :OLD_EMPRESA AND SERIE = :OLD_SERIE AND NUMERO =' +
        ' :OLD_NUMERO AND '
      '  MODELO = :OLD_MODELO'
      'RETURNING DATAEMISSAO, HORAEMISSAO, CANCELADA')
    DeleteSQL.Strings = (
      'DELETE FROM TBNFE_ENVIADA'
      
        'WHERE EMPRESA = :OLD_EMPRESA AND SERIE = :OLD_SERIE AND NUMERO =' +
        ' :OLD_NUMERO AND '
      '  MODELO = :OLD_MODELO')
    FetchRowSQL.Strings = (
      
        'SELECT EMPRESA, SERIE, NUMERO, MODELO, VERSAO, ANOVENDA, NUMVEND' +
        'A, '
      '  ANOCOMPRA, NUMCOMPRA, NFC_NUMERO, DATAEMISSAO, HORAEMISSAO, '
      '  CHAVE, PROTOCOLO, RECIBO, XML_FILENAME, XML_FILE, LOTE_ANO, '
      '  LOTE_NUM, CANCELADA'
      'FROM TBNFE_ENVIADA'
      
        'WHERE EMPRESA = :EMPRESA AND SERIE = :SERIE AND NUMERO = :NUMERO' +
        ' AND '
      '  MODELO = :MODELO')
    Left = 928
    Top = 384
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
      '    i.Ano'
      '  , i.Codcontrol'
      '  , i.Codemp'
      '  , i.Seq'
      '  , i.Codprod'
      '  , i.Codforn'
      '  , i.Dtent'
      '  , i.Qtde'
      '  , i.Qtdeantes'
      '  , i.Qtdefinal'
      '  , i.Precounit'
      '  , i.Customedio'
      '  , i.Nf'
      '  , i.Perc_participacao'
      '  , i.Valor_frete'
      '  , i.Valor_desconto'
      '  , i.Valor_outros'
      '  , i.Valor_IPI'
      '  , i.Unid_cod'
      '  , i.Ncm_sh'
      '  , i.Cst'
      '  , i.Csosn'
      '  , i.Cfop'
      '  , i.aliquota'
      '  , i.aliquota_csosn'
      '  , i.aliquota_pis'
      '  , i.aliquota_cofins'
      '  , i.percentual_reducao_bc'
      '  , i.total_bruto'
      '  , i.total_liquido'
      ''
      '  , coalesce(p.descri_apresentacao, p.Descri) as Descri'
      '  , p.Qtde as Estoque'
      '  , p.estoque_aprop_lote'
      '  , u.Unp_sigla'
      'from TBCOMPRASITENS i'
      '  inner join TBPRODUTO p on (p.Cod = i.Codprod)'
      '  left join TBUNIDADEPROD u on (u.Unp_cod = p.Codunidade)')
    Left = 360
    Top = 352
    object cdsTabelaItensANO: TSmallintField
      FieldName = 'ANO'
      Origin = 'ANO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTabelaItensCODCONTROL: TIntegerField
      FieldName = 'CODCONTROL'
      Origin = 'CODCONTROL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTabelaItensCODEMP: TStringField
      FieldName = 'CODEMP'
      Origin = 'CODEMP'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 18
    end
    object cdsTabelaItensSEQ: TSmallintField
      Alignment = taCenter
      DisplayLabel = '#'
      FieldName = 'SEQ'
      Origin = 'SEQ'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '00'
    end
    object cdsTabelaItensCODPROD: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'CODPROD'
      Origin = 'CODPROD'
      Size = 10
    end
    object cdsTabelaItensCODFORN: TIntegerField
      FieldName = 'CODFORN'
      Origin = 'CODFORN'
    end
    object cdsTabelaItensDTENT: TDateField
      FieldName = 'DTENT'
      Origin = 'DTENT'
    end
    object cdsTabelaItensNF: TIntegerField
      FieldName = 'NF'
      Origin = 'NF'
    end
    object cdsTabelaItensUNID_COD: TSmallintField
      DisplayLabel = 'Und.'
      FieldName = 'UNID_COD'
      Origin = 'UNID_COD'
    end
    object cdsTabelaItensNCM_SH: TStringField
      FieldName = 'NCM_SH'
      Origin = 'NCM_SH'
      Size = 10
    end
    object cdsTabelaItensCST: TStringField
      FieldName = 'CST'
      Origin = 'CST'
      Size = 3
    end
    object cdsTabelaItensCSOSN: TStringField
      FieldName = 'CSOSN'
      Origin = 'CSOSN'
      Size = 3
    end
    object cdsTabelaItensCFOP: TIntegerField
      FieldName = 'CFOP'
      Origin = 'CFOP'
    end
    object cdsTabelaItensDESCRI: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRI'
      Origin = 'DESCRI'
      ProviderFlags = []
      Size = 100
    end
    object cdsTabelaItensUNP_SIGLA: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Und.'
      FieldName = 'UNP_SIGLA'
      Origin = 'UNP_SIGLA'
      ProviderFlags = []
      Size = 5
    end
    object cdsTabelaItensESTOQUE_APROP_LOTE: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'ESTOQUE_APROP_LOTE'
      Origin = 'ESTOQUE_APROP_LOTE'
      ProviderFlags = []
    end
    object cdsTabelaItensQTDE: TFMTBCDField
      FieldName = 'QTDE'
      Origin = 'QTDE'
      Required = True
      Precision = 18
      Size = 3
    end
    object cdsTabelaItensQTDEANTES: TFMTBCDField
      FieldName = 'QTDEANTES'
      Origin = 'QTDEANTES'
      Required = True
      Precision = 18
      Size = 3
    end
    object cdsTabelaItensQTDEFINAL: TFMTBCDField
      FieldName = 'QTDEFINAL'
      Origin = 'QTDEFINAL'
      Required = True
      Precision = 18
      Size = 3
    end
    object cdsTabelaItensPRECOUNIT: TFMTBCDField
      FieldName = 'PRECOUNIT'
      Origin = 'PRECOUNIT'
      Precision = 18
      Size = 2
    end
    object cdsTabelaItensCUSTOMEDIO: TFMTBCDField
      FieldName = 'CUSTOMEDIO'
      Origin = 'CUSTOMEDIO'
      Precision = 18
      Size = 2
    end
    object cdsTabelaItensPERC_PARTICIPACAO: TFMTBCDField
      FieldName = 'PERC_PARTICIPACAO'
      Origin = 'PERC_PARTICIPACAO'
      Precision = 18
      Size = 2
    end
    object cdsTabelaItensVALOR_FRETE: TFMTBCDField
      FieldName = 'VALOR_FRETE'
      Origin = 'VALOR_FRETE'
      Precision = 18
      Size = 2
    end
    object cdsTabelaItensVALOR_DESCONTO: TFMTBCDField
      FieldName = 'VALOR_DESCONTO'
      Origin = 'VALOR_DESCONTO'
      Precision = 18
      Size = 2
    end
    object cdsTabelaItensVALOR_OUTROS: TFMTBCDField
      FieldName = 'VALOR_OUTROS'
      Origin = 'VALOR_OUTROS'
      Precision = 18
      Size = 2
    end
    object cdsTabelaItensVALOR_IPI: TFMTBCDField
      FieldName = 'VALOR_IPI'
      Origin = 'VALOR_IPI'
      Precision = 18
      Size = 2
    end
    object cdsTabelaItensALIQUOTA: TFMTBCDField
      FieldName = 'ALIQUOTA'
      Origin = 'ALIQUOTA'
      Precision = 18
      Size = 2
    end
    object cdsTabelaItensALIQUOTA_CSOSN: TFMTBCDField
      FieldName = 'ALIQUOTA_CSOSN'
      Origin = 'ALIQUOTA_CSOSN'
      Precision = 18
      Size = 2
    end
    object cdsTabelaItensALIQUOTA_PIS: TFMTBCDField
      FieldName = 'ALIQUOTA_PIS'
      Origin = 'ALIQUOTA_PIS'
      Precision = 18
      Size = 2
    end
    object cdsTabelaItensALIQUOTA_COFINS: TFMTBCDField
      FieldName = 'ALIQUOTA_COFINS'
      Origin = 'ALIQUOTA_COFINS'
      Precision = 18
      Size = 2
    end
    object cdsTabelaItensPERCENTUAL_REDUCAO_BC: TFMTBCDField
      FieldName = 'PERCENTUAL_REDUCAO_BC'
      Origin = 'PERCENTUAL_REDUCAO_BC'
      Precision = 18
      Size = 2
    end
    object cdsTabelaItensTOTAL_BRUTO: TFMTBCDField
      FieldName = 'TOTAL_BRUTO'
      Origin = 'TOTAL_BRUTO'
      Precision = 18
      Size = 2
    end
    object cdsTabelaItensTOTAL_LIQUIDO: TFMTBCDField
      FieldName = 'TOTAL_LIQUIDO'
      Origin = 'TOTAL_LIQUIDO'
      Precision = 18
      Size = 2
    end
    object cdsTabelaItensESTOQUE: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'ESTOQUE'
      Origin = 'QTDE'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 3
    end
  end
  object updTabelaItens: TFDUpdateSQL
    Connection = DMBusiness.fdConexao
    InsertSQL.Strings = (
      'INSERT INTO TBCOMPRASITENS'
      '(ANO, CODCONTROL, CODEMP, SEQ, CODFORN, '
      '  CODPROD, QTDE, PRECOUNIT, CUSTOMEDIO, '
      '  DTENT, NF, QTDEANTES, QTDEFINAL, PERC_PARTICIPACAO, '
      '  VALOR_FRETE, VALOR_DESCONTO, VALOR_OUTROS, '
      '  VALOR_IPI, UNID_COD, NCM_SH, CST, CSOSN, '
      '  CFOP, ALIQUOTA, ALIQUOTA_CSOSN, ALIQUOTA_PIS, '
      '  ALIQUOTA_COFINS, PERCENTUAL_REDUCAO_BC, TOTAL_BRUTO, '
      '  TOTAL_LIQUIDO)'
      
        'VALUES (:NEW_ANO, :NEW_CODCONTROL, :NEW_CODEMP, :NEW_SEQ, :NEW_C' +
        'ODFORN, '
      '  :NEW_CODPROD, :NEW_QTDE, :NEW_PRECOUNIT, :NEW_CUSTOMEDIO, '
      
        '  :NEW_DTENT, :NEW_NF, :NEW_QTDEANTES, :NEW_QTDEFINAL, :NEW_PERC' +
        '_PARTICIPACAO, '
      '  :NEW_VALOR_FRETE, :NEW_VALOR_DESCONTO, :NEW_VALOR_OUTROS, '
      
        '  :NEW_VALOR_IPI, :NEW_UNID_COD, :NEW_NCM_SH, :NEW_CST, :NEW_CSO' +
        'SN, '
      
        '  :NEW_CFOP, :NEW_ALIQUOTA, :NEW_ALIQUOTA_CSOSN, :NEW_ALIQUOTA_P' +
        'IS, '
      
        '  :NEW_ALIQUOTA_COFINS, :NEW_PERCENTUAL_REDUCAO_BC, :NEW_TOTAL_B' +
        'RUTO, '
      '  :NEW_TOTAL_LIQUIDO)'
      'RETURNING QTDE')
    ModifySQL.Strings = (
      'UPDATE TBCOMPRASITENS'
      
        'SET ANO = :NEW_ANO, CODCONTROL = :NEW_CODCONTROL, CODEMP = :NEW_' +
        'CODEMP, '
      
        '  SEQ = :NEW_SEQ, CODFORN = :NEW_CODFORN, CODPROD = :NEW_CODPROD' +
        ', '
      
        '  QTDE = :NEW_QTDE, PRECOUNIT = :NEW_PRECOUNIT, CUSTOMEDIO = :NE' +
        'W_CUSTOMEDIO, '
      '  DTENT = :NEW_DTENT, NF = :NEW_NF, QTDEANTES = :NEW_QTDEANTES, '
      
        '  QTDEFINAL = :NEW_QTDEFINAL, PERC_PARTICIPACAO = :NEW_PERC_PART' +
        'ICIPACAO, '
      
        '  VALOR_FRETE = :NEW_VALOR_FRETE, VALOR_DESCONTO = :NEW_VALOR_DE' +
        'SCONTO, '
      '  VALOR_OUTROS = :NEW_VALOR_OUTROS, VALOR_IPI = :NEW_VALOR_IPI, '
      
        '  UNID_COD = :NEW_UNID_COD, NCM_SH = :NEW_NCM_SH, CST = :NEW_CST' +
        ', '
      
        '  CSOSN = :NEW_CSOSN, CFOP = :NEW_CFOP, ALIQUOTA = :NEW_ALIQUOTA' +
        ', '
      
        '  ALIQUOTA_CSOSN = :NEW_ALIQUOTA_CSOSN, ALIQUOTA_PIS = :NEW_ALIQ' +
        'UOTA_PIS, '
      
        '  ALIQUOTA_COFINS = :NEW_ALIQUOTA_COFINS, PERCENTUAL_REDUCAO_BC ' +
        '= :NEW_PERCENTUAL_REDUCAO_BC, '
      
        '  TOTAL_BRUTO = :NEW_TOTAL_BRUTO, TOTAL_LIQUIDO = :NEW_TOTAL_LIQ' +
        'UIDO'
      
        'WHERE ANO = :OLD_ANO AND CODCONTROL = :OLD_CODCONTROL AND CODEMP' +
        ' = :OLD_CODEMP AND '
      '  SEQ = :OLD_SEQ'
      'RETURNING QTDE')
    DeleteSQL.Strings = (
      'DELETE FROM TBCOMPRASITENS'
      
        'WHERE ANO = :OLD_ANO AND CODCONTROL = :OLD_CODCONTROL AND CODEMP' +
        ' = :OLD_CODEMP AND '
      '  SEQ = :OLD_SEQ')
    FetchRowSQL.Strings = (
      
        'SELECT ANO, CODCONTROL, CODEMP, SEQ, CODFORN, CODPROD, QTDE, PES' +
        'O_BRUTO, '
      '  PESO_LIQUIDO, LARGURA, ALTURA, ESPESSURA, CUBAGEM, PRECOUNIT, '
      
        '  CUSTOMEDIO, DTENT, NF, QTDEANTES, QTDEFINAL, PERC_PARTICIPACAO' +
        ', '
      
        '  VALOR_FRETE, VALOR_DESCONTO, VALOR_OUTROS, VALOR_IPI, UNID_COD' +
        ', '
      
        '  NCM_SH, CST, CSOSN, CFOP, ALIQUOTA, ALIQUOTA_CSOSN, ALIQUOTA_P' +
        'IS, '
      
        '  ALIQUOTA_COFINS, PERCENTUAL_REDUCAO_BC, TOTAL_BRUTO, TOTAL_LIQ' +
        'UIDO, '
      '  LOTE_ID, LOTE_DESCRICAO, LOTE_DATA_FAB, LOTE_DATA_VAL'
      'FROM TBCOMPRASITENS'
      
        'WHERE ANO = :ANO AND CODCONTROL = :CODCONTROL AND CODEMP = :CODE' +
        'MP AND '
      '  SEQ = :SEQ')
    Left = 392
    Top = 352
  end
  object qryDuplicatas: TFDQuery
    OnCalcFields = qryDuplicatasCalcFields
    CachedUpdates = True
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    UpdateObject = updDuplicatas
    SQL.Strings = (
      'Select'
      '    p.Anolanc'
      '  , p.Numlanc'
      '  , p.parcela'
      '  , p.Codforn'
      '  , f.Nomeforn'
      '  , f.Cnpj'
      '  , p.Notfisc'
      '  , p.Tippag'
      '  , p.Dtemiss'
      '  , p.Dtvenc'
      '  , p.Valorpag'
      '  , p.Banco'
      '  , b.Bco_nome'
      '  , p.Numchq'
      '  , Case when p.Dtpag is not null then '#39'X'#39' else '#39'.'#39' end as Pago_'
      '  , p.Docbaix'
      '  , p.situacao'
      
        '  , Case when p.situacao = 1 then '#39'Ativa'#39' else '#39'Cancelada'#39' end a' +
        's situacao_desc'
      'from TBCONTPAG p'
      '  inner join TBFORNECEDOR f on (f.Codforn = p.Codforn)'
      '  left join TBBANCO_BOLETO b on (b.Bco_cod = p.Banco)')
    Left = 360
    Top = 384
    object qryDuplicatasANOLANC: TSmallintField
      FieldName = 'ANOLANC'
      Origin = 'ANOLANC'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryDuplicatasNUMLANC: TIntegerField
      FieldName = 'NUMLANC'
      Origin = 'NUMLANC'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryDuplicatasPARCELA: TSmallintField
      Alignment = taCenter
      DisplayLabel = 'Parc.'
      FieldName = 'PARCELA'
      Origin = 'PARCELA'
      DisplayFormat = '00'
    end
    object qryDuplicatasCODFORN: TSmallintField
      FieldName = 'CODFORN'
      Origin = 'CODFORN'
    end
    object qryDuplicatasNOMEFORN: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Fornecedor'
      FieldName = 'NOMEFORN'
      Origin = 'NOMEFORN'
      ProviderFlags = []
      Size = 100
    end
    object qryDuplicatasCNPJ: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      ProviderFlags = []
      Size = 18
    end
    object qryDuplicatasNOTFISC: TStringField
      DisplayLabel = 'Nota Fiscal'
      FieldName = 'NOTFISC'
      Origin = 'NOTFISC'
      Size = 15
    end
    object qryDuplicatasTIPPAG: TStringField
      DisplayLabel = 'Tipo de Pagamento'
      FieldName = 'TIPPAG'
      Origin = 'TIPPAG'
      Size = 35
    end
    object qryDuplicatasDTEMISS: TDateField
      DisplayLabel = 'Emiss'#227'o'
      FieldName = 'DTEMISS'
      Origin = 'DTEMISS'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryDuplicatasDTVENC: TDateField
      DisplayLabel = 'Vencimento'
      FieldName = 'DTVENC'
      Origin = 'DTVENC'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryDuplicatasVALORPAG: TFMTBCDField
      FieldName = 'VALORPAG'
      Origin = 'VALORPAG'
      Precision = 18
      Size = 2
    end
    object qryDuplicatasBANCO: TSmallintField
      FieldName = 'BANCO'
      Origin = 'BANCO'
    end
    object qryDuplicatasBCO_NOME: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Banco'
      FieldName = 'BCO_NOME'
      Origin = 'BCO_NOME'
      ProviderFlags = []
      Size = 50
    end
    object qryDuplicatasNUMCHQ: TStringField
      DisplayLabel = 'No. Cheque'
      FieldName = 'NUMCHQ'
      Origin = 'NUMCHQ'
      Size = 10
    end
    object qryDuplicatasPAGO_: TStringField
      Alignment = taCenter
      AutoGenerateValue = arDefault
      DisplayLabel = 'Pago?'
      FieldName = 'PAGO_'
      Origin = 'PAGO_'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object qryDuplicatasDOCBAIX: TStringField
      DisplayLabel = 'Doc. Baixa'
      FieldName = 'DOCBAIX'
      Origin = 'DOCBAIX'
      Size = 15
    end
    object qryDuplicatasSITUACAO: TSmallintField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
    end
    object qryDuplicatasSITUACAO_DESC: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'SITUACAO_DESC'
      Origin = 'SITUACAO_DESC'
      ProviderFlags = []
      FixedChar = True
      Size = 9
    end
    object qryDuplicatasLancamento: TStringField
      Alignment = taCenter
      DisplayLabel = 'Lan'#231'amento'
      FieldKind = fkInternalCalc
      FieldName = 'Lancamento'
      Size = 10
    end
  end
  object updDuplicatas: TFDUpdateSQL
    Connection = DMBusiness.fdConexao
    InsertSQL.Strings = (
      'INSERT INTO TBCONTPAG'
      '(ANOLANC, NUMLANC, CODFORN, PARCELA, TIPPAG, '
      '  NOTFISC, DTEMISS, DTVENC, DOCBAIX, VALORPAG, '
      '  BANCO, NUMCHQ, SITUACAO)'
      
        'VALUES (:NEW_ANOLANC, :NEW_NUMLANC, :NEW_CODFORN, :NEW_PARCELA, ' +
        ':NEW_TIPPAG, '
      
        '  :NEW_NOTFISC, :NEW_DTEMISS, :NEW_DTVENC, :NEW_DOCBAIX, :NEW_VA' +
        'LORPAG, '
      '  :NEW_BANCO, :NEW_NUMCHQ, :NEW_SITUACAO)')
    ModifySQL.Strings = (
      'UPDATE TBCONTPAG'
      
        'SET ANOLANC = :NEW_ANOLANC, NUMLANC = :NEW_NUMLANC, CODFORN = :N' +
        'EW_CODFORN, '
      
        '  PARCELA = :NEW_PARCELA, TIPPAG = :NEW_TIPPAG, NOTFISC = :NEW_N' +
        'OTFISC, '
      
        '  DTEMISS = :NEW_DTEMISS, DTVENC = :NEW_DTVENC, DOCBAIX = :NEW_D' +
        'OCBAIX, '
      
        '  VALORPAG = :NEW_VALORPAG, BANCO = :NEW_BANCO, NUMCHQ = :NEW_NU' +
        'MCHQ, '
      '  SITUACAO = :NEW_SITUACAO'
      'WHERE ANOLANC = :OLD_ANOLANC AND NUMLANC = :OLD_NUMLANC')
    DeleteSQL.Strings = (
      'DELETE FROM TBCONTPAG'
      'WHERE ANOLANC = :OLD_ANOLANC AND NUMLANC = :OLD_NUMLANC')
    FetchRowSQL.Strings = (
      'Select'
      '    p.Anolanc'
      '  , p.Numlanc'
      '  , p.parcela'
      '  , p.Codforn'
      '  , f.Nomeforn'
      '  , f.Cnpj'
      '  , p.Notfisc'
      '  , p.Tippag'
      '  , p.Dtemiss'
      '  , p.Dtvenc'
      '  , p.Valorpag'
      '  , p.Banco'
      '  , b.Bco_nome'
      '  , p.Numchq'
      '  , Case when p.Dtpag is not null then '#39'X'#39' else '#39'.'#39' end as Pago_'
      '  , p.Docbaix'
      '  , p.situacao'
      
        '  , Case when p.situacao = 1 then '#39'Ativa'#39' else '#39'Cancelada'#39' end a' +
        's situacao_desc'
      'from TBCONTPAG p'
      '  inner join TBFORNECEDOR f on (f.Codforn = p.Codforn)'
      '  left join TBBANCO_BOLETO b on (b.Bco_cod = p.Banco)'
      'WHERE p.ANOLANC = :ANOLANC AND p.NUMLANC = :NUMLANC')
    Left = 392
    Top = 384
  end
  object qryFormaPagto: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select * from TBFORMPAGTO')
    Left = 672
    Top = 48
  end
  object qryCondicaoPagto: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select * from VW_CONDICAOPAGTO')
    Left = 672
    Top = 80
  end
  object qryTipoDespesa: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select *'
      'from TBTPDESPESA t'
      'where (t.ativo = :ativo) or (:todos = 1)'
      'order by t.tipodesp')
    Left = 672
    Top = 112
    ParamData = <
      item
        Name = 'ATIVO'
        DataType = ftSmallint
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'TODOS'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object qryTipoDocumento: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select * from VW_TIPO_DOCUMENTO_ENTRADA')
    Left = 672
    Top = 144
  end
  object qryTipoEntrada: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select * from VW_TIPO_ENTRADA')
    Left = 672
    Top = 184
  end
  object DtSrcTabelaLotes: TDataSource
    DataSet = cdsTabelaLotes
    Left = 392
    Top = 416
  end
  object cdsTabelaLotes: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '     ci.ano'
      '   , ci.codcontrol'
      '   , ci.codemp'
      '   , ci.seq'
      '   , ci.codprod'
      '   , pr.descri'
      '   , pr.apresentacao'
      '   , pr.descri_apresentacao'
      '   , pr.referencia'
      '   , ci.lote_id'
      '   , ci.lote_descricao'
      '   , ci.lote_data_fab'
      '   , ci.lote_data_val'
      '   , ci.qtde'
      'from TBCOMPRASITENS ci'
      
        '  inner join TBCOMPRAS cp on (cp.ano = ci.ano and cp.codcontrol ' +
        '= ci.codcontrol and cp.codemp = ci.codemp)'
      '  inner join TBPRODUTO pr on (pr.cod = ci.codprod)'
      '  left join TBCFOP cf on (cf.cfop_cod = cp.nfcfop)'
      'where (ci.ano        = :ano)'
      '  and (ci.codcontrol = :compra)'
      '  and (ci.lote_id is not null)'
      'order by'
      '     ci.seq')
    Left = 360
    Top = 416
    ParamData = <
      item
        Name = 'ANO'
        DataType = ftSmallint
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'COMPRA'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object cdsTabelaLotesANO: TSmallintField
      FieldName = 'ANO'
      Origin = 'ANO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTabelaLotesCODCONTROL: TIntegerField
      FieldName = 'CODCONTROL'
      Origin = 'CODCONTROL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTabelaLotesCODEMP: TStringField
      FieldName = 'CODEMP'
      Origin = 'CODEMP'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 18
    end
    object cdsTabelaLotesSEQ: TSmallintField
      Alignment = taCenter
      FieldName = 'SEQ'
      Origin = 'SEQ'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '00'
    end
    object cdsTabelaLotesCODPROD: TStringField
      FieldName = 'CODPROD'
      Origin = 'CODPROD'
      Size = 10
    end
    object cdsTabelaLotesDESCRI: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRI'
      Origin = 'DESCRI'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object cdsTabelaLotesAPRESENTACAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'APRESENTACAO'
      Origin = 'APRESENTACAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object cdsTabelaLotesDESCRI_APRESENTACAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRI_APRESENTACAO'
      Origin = 'DESCRI_APRESENTACAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object cdsTabelaLotesREFERENCIA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'REFERENCIA'
      Origin = 'REFERENCIA'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsTabelaLotesLOTE_ID: TStringField
      FieldName = 'LOTE_ID'
      Origin = 'LOTE_ID'
      Size = 38
    end
    object cdsTabelaLotesLOTE_DESCRICAO: TStringField
      FieldName = 'LOTE_DESCRICAO'
      Origin = 'LOTE_DESCRICAO'
      Size = 30
    end
    object cdsTabelaLotesLOTE_DATA_FAB: TDateField
      FieldName = 'LOTE_DATA_FAB'
      Origin = 'LOTE_DATA_FAB'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsTabelaLotesLOTE_DATA_VAL: TDateField
      FieldName = 'LOTE_DATA_VAL'
      Origin = 'LOTE_DATA_VAL'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsTabelaLotesQTDE: TFMTBCDField
      FieldName = 'QTDE'
      Origin = 'QTDE'
      Required = True
      DisplayFormat = ',0.###'
      Precision = 18
      Size = 3
    end
  end
end
