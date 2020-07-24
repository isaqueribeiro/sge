inherited frmGeVenda: TfrmGeVenda
  Left = 386
  Top = 212
  ActiveControl = nil
  Caption = 'Controle de Vendas'
  ClientHeight = 685
  ClientWidth = 1116
  OldCreateOrder = True
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
            FieldName = 'CODCONTROL'
            Title.Caption = 'No. Venda '
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTVENDA'
            Title.Caption = 'D. Venda '
            Width = 110
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'STATUS'
            Title.Caption = 'Status '
            Width = 112
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Title.Caption = 'Cliente '
            Width = 270
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOTALVENDA_BRUTA'
            Title.Caption = 'Total Venda (R$) '
            Width = 107
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCONTO'
            Title.Caption = 'Desconto (R$) '
            Width = 88
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOTALVENDA'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            Title.Caption = 'Total L'#237'quido (R$) '
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clBlue
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 111
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LUCRO_CALCULADO'
            Title.Caption = 'Margem (%) '
            Width = 78
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NFE'
            Font.Charset = ANSI_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            Title.Alignment = taCenter
            Title.Caption = 'NF-e '
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clMaroon
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SERIE'
            Title.Caption = 'S'#233'rie '
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clMaroon
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
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
        object lblVendaCancelada: TLabel [0]
          Left = 2
          Top = 24
          Width = 118
          Height = 13
          Caption = '* Vendas Canceladas'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblVendaAberta: TLabel [1]
          Left = 2
          Top = 4
          Width = 99
          Height = 13
          Caption = '* Vendas Abertas'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object ShpLucroZerado: TShape [2]
          Left = 2
          Top = 49
          Width = 15
          Height = 15
          Brush.Color = clYellow
        end
        object lblLucroZerado: TLabel [3]
          Left = 22
          Top = 50
          Width = 73
          Height = 13
          Caption = 'Lucro zerado'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object ShpLucroNegativo: TShape [4]
          Left = 99
          Top = 49
          Width = 15
          Height = 15
          Brush.Color = 7434751
        end
        object lblLucroNegativo: TLabel [5]
          Left = 119
          Top = 50
          Width = 46
          Height = 13
          Caption = 'Preju'#237'zo'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object Bevel18: TBevel [6]
          Left = 485
          Top = 4
          Width = 4
          Height = 62
          Align = alRight
          Shape = bsSpacer
          ExplicitLeft = 645
          ExplicitTop = 0
          ExplicitHeight = 35
        end
        inherited grpBxFiltro: TGroupBox
          Left = 489
          Width = 615
          Height = 62
          TabOrder = 1
          ExplicitLeft = 489
          ExplicitWidth = 615
          ExplicitHeight = 62
          DesignSize = (
            615
            62)
          inherited lbltFiltrar: TLabel
            Left = 294
            Top = 27
            Width = 89
            Caption = 'Venda / Cliente:'
            ExplicitLeft = 294
            ExplicitTop = 27
            ExplicitWidth = 89
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
            Top = 23
            Width = 174
            TabOrder = 2
            ExplicitLeft = 392
            ExplicitTop = 23
            ExplicitWidth = 174
          end
          inherited btnFiltrar: TcxButton
            Left = 570
            Height = 35
            TabOrder = 3
            ExplicitLeft = 570
            ExplicitHeight = 35
          end
          object e1Data: TJvDateEdit
            Left = 72
            Top = 23
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
        object RdgStatusVenda: TRadioGroup
          Left = 229
          Top = 4
          Width = 256
          Height = 62
          Align = alRight
          Caption = '&Status venda'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            '(Todas)'
            'Atendimento/Aberta'
            '--'
            'Finalizada'
            'NF-e / NFC-e'
            'Cancelada')
          TabOrder = 0
          OnClick = RdgStatusVendaClick
        end
      end
    end
    inherited tbsCadastro: TTabSheet
      ExplicitWidth = 1108
      ExplicitHeight = 613
      inherited Bevel8: TBevel
        Top = 234
        Width = 1108
        ExplicitTop = 233
        ExplicitWidth = 1108
      end
      object Bevel5: TBevel [1]
        Left = 0
        Top = 113
        Width = 1108
        Height = 4
        Align = alTop
        Shape = bsSpacer
      end
      object Bevel6: TBevel [2]
        Left = 0
        Top = 423
        Width = 1108
        Height = 4
        Align = alBottom
        Shape = bsSpacer
        ExplicitTop = 420
      end
      inherited GrpBxDadosNominais: TGroupBox
        Width = 1108
        Height = 113
        Caption = 'Dados da venda'
        ExplicitWidth = 1108
        ExplicitHeight = 113
        inherited lblCodigo: TLabel
          Width = 58
          Caption = 'No. Venda:'
          ExplicitWidth = 58
        end
        object lblEmpresa: TLabel [1]
          Left = 248
          Top = 24
          Width = 45
          Height = 13
          Caption = 'Empresa:'
          FocusControl = dbEmpresa
        end
        object lblCliente: TLabel [2]
          Left = 672
          Top = 24
          Width = 37
          Height = 13
          Caption = 'Cliente:'
          FocusControl = dbCliente
        end
        object lblDataHora: TLabel [3]
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
        object lblSerie: TLabel [4]
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
        object lblNFe: TLabel [5]
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
        object lblDataEmissao: TLabel [6]
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
        object lblSituacao: TLabel [7]
          Left = 328
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
        object lblVendedor: TLabel [8]
          Left = 856
          Top = 64
          Width = 50
          Height = 13
          Caption = '&Vendedor:'
          FocusControl = dbVendedor
        end
        object lblValorTotal: TLabel [9]
          Left = 720
          Top = 64
          Width = 103
          Height = 13
          Caption = 'Total L'#237'quido (R$):'
          FocusControl = dbValorTotal
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblValorDesconto: TLabel [10]
          Left = 616
          Top = 64
          Width = 84
          Height = 13
          Caption = 'Desconto (R$):'
          FocusControl = dbValorDesconto
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblCFOPVenda: TLabel [11]
          Left = 248
          Top = 64
          Width = 31
          Height = 13
          Caption = 'CFOP:'
          FocusControl = dbCFOPVenda
        end
        object lblValorTotalBruto: TLabel [12]
          Left = 480
          Top = 64
          Width = 98
          Height = 13
          Caption = 'Total Venda (R$):'
          FocusControl = dbValorTotal
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        inherited dbCodigo: TDBEdit
          Width = 89
          TabStop = False
          Color = clMoneyGreen
          DataField = 'CODCONTROL'
          ExplicitWidth = 89
        end
        object dbEmpresa: TDBLookupComboBox
          Left = 248
          Top = 40
          Width = 417
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
        object dbDataHora: TDBEdit
          Left = 112
          Top = 40
          Width = 130
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'DTVENDA'
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
          TabOrder = 4
        end
        object dbNFe: TDBEdit
          Left = 56
          Top = 80
          Width = 97
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'NFE'
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
        object dbDataEmissao: TDBEdit
          Left = 160
          Top = 80
          Width = 81
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'DATAEMISSAO'
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
        object dbSituacao: TDBEdit
          Left = 328
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
          TabOrder = 8
        end
        object dbVendedor: TDBLookupComboBox
          Left = 856
          Top = 80
          Width = 217
          Height = 21
          DataField = 'VENDEDOR_COD'
          DataSource = DtSrcTabela
          DropDownRows = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'COD'
          ListField = 'NOME'
          ListSource = dtsVendedor
          ParentFont = False
          TabOrder = 12
        end
        object dbValorTotal: TDBEdit
          Left = 720
          Top = 80
          Width = 129
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'TOTALVENDA'
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
        object dbValorDesconto: TDBEdit
          Left = 616
          Top = 80
          Width = 97
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'DESCONTO'
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
        object dbValorTotalBruto: TDBEdit
          Left = 480
          Top = 80
          Width = 129
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'TOTALVENDA_BRUTA'
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
        object dbCliente: TJvDBComboEdit
          Left = 672
          Top = 40
          Width = 401
          Height = 21
          ButtonHint = 'Pesquisar Cliente (Ctrl+P)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clMoneyGreen
          DataField = 'NOME'
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
          OnButtonClick = dbClienteButtonClick
        end
        object dbCFOPVenda: TJvDBComboEdit
          Left = 248
          Top = 80
          Width = 73
          Height = 21
          ButtonHint = 'Pesquisar CFOP (Ctrl+P)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clWhite
          DataField = 'CFOP'
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
          TabOrder = 7
          OnButtonClick = dbCFOPVendaButtonClick
          OnExit = ControlEditExit
        end
      end
      object GrpBxDadosProduto: TGroupBox
        Left = 0
        Top = 117
        Width = 1108
        Height = 117
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
          Left = 291
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
          Left = 371
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
        object lblDesconto: TLabel
          Left = 566
          Top = 64
          Width = 45
          Height = 13
          Caption = '% Desc.:'
          FocusControl = dbDesconto
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblValorLiq: TLabel
          Left = 720
          Top = 64
          Width = 88
          Height = 13
          Caption = 'Total L'#237'quido (R$):'
          FocusControl = dbValorLiq
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
        object lblCFOP: TLabel
          Left = 640
          Top = 24
          Width = 31
          Height = 13
          Caption = 'CFOP:'
          FocusControl = dbCFOP
        end
        object lblAliquota: TLabel
          Left = 88
          Top = 64
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
          Left = 251
          Top = 64
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
        object lblReferencia: TLabel
          Left = 847
          Top = 64
          Width = 56
          Height = 13
          Caption = 'Refer'#234'ncia:'
          FocusControl = dbReferencia
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
          Height = 100
          Align = alLeft
          Shape = bsSpacer
          ExplicitHeight = 99
        end
        object lblTotalDesconto: TLabel
          Left = 621
          Top = 65
          Width = 82
          Height = 13
          Caption = 'Total Desc. (R$):'
          FocusControl = dbTotalDesconto
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblProdutoPromocao: TLabel
          Left = 960
          Top = 10
          Width = 142
          Height = 13
          Caption = '* Produtos em Promo'#231#227'o'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblPercRedBC: TLabel
          Left = 160
          Top = 64
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
        object lblLoteProduto: TLabel
          Left = 944
          Top = 65
          Width = 25
          Height = 13
          Caption = 'Lote:'
          FocusControl = dbLoteProduto
          Visible = False
        end
        object lblValorIPI: TLabel
          Left = 485
          Top = 64
          Width = 42
          Height = 13
          Caption = 'IPI (R$):'
          FocusControl = dbValorIPI
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
          Width = 401
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
          Left = 291
          Top = 80
          Width = 73
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
          TabOrder = 9
          OnExit = ControlEditExit
        end
        object dbValorUnit: TDBEdit
          Left = 371
          Top = 80
          Width = 108
          Height = 21
          Color = clMoneyGreen
          DataField = 'PUNIT'
          DataSource = DtSrcTabelaItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 10
          OnExit = ControlEditExit
        end
        object dbDesconto: TDBEdit
          Left = 566
          Top = 80
          Width = 49
          Height = 21
          Color = clWhite
          DataField = 'DESCONTO'
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
        object dbValorLiq: TDBEdit
          Left = 720
          Top = 80
          Width = 121
          Height = 21
          Color = clMoneyGreen
          DataField = 'TOTAL_LIQUIDO'
          DataSource = DtSrcTabelaItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 14
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
        object dbAliquota: TDBEdit
          Left = 88
          Top = 80
          Width = 66
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
          TabOrder = 6
        end
        object dbCST: TDBEdit
          Left = 251
          Top = 80
          Width = 33
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
          TabOrder = 8
          OnKeyPress = dbCSTKeyPress
        end
        object dbReferencia: TDBEdit
          Left = 848
          Top = 80
          Width = 90
          Height = 21
          CharCase = ecUpperCase
          Color = clWhite
          DataField = 'REFERENCIA'
          DataSource = DtSrcTabelaItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 15
          Visible = False
          OnExit = ControlEditExit
        end
        object dbCFOPDescricao: TDBEdit
          Left = 720
          Top = 40
          Width = 352
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'CFOP_DESCRICAO'
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
        object dbPercRedBC: TDBEdit
          Left = 160
          Top = 80
          Width = 85
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
          TabOrder = 7
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
        object dbCFOP: TJvDBComboEdit
          Left = 641
          Top = 40
          Width = 73
          Height = 21
          ButtonHint = 'Pesquisar CFOP (Ctrl+P)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clWhite
          DataField = 'CFOP_COD'
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
          PopupMenu = ppCorrigirDadosNFe
          ReadOnly = True
          ShowHint = True
          TabOrder = 4
          OnButtonClick = dbCFOPButtonClick
          OnExit = ControlEditExit
        end
        object dbTotalDesconto: TJvDBComboEdit
          Left = 621
          Top = 80
          Width = 93
          Height = 21
          ButtonHint = 'Lan'#231'ar Valor Total do Desconto (Ctrl+D)'
          CharCase = ecUpperCase
          ClickKey = 16452
          Color = clMoneyGreen
          DataField = 'TOTAL_DESCONTO'
          DataSource = DtSrcTabelaItens
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            180000000000000600000000000000000000000000000000000000FF0000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
            0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
            FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00C0A090604830
            60483060483060483060483060483060483060483060483060483060483000FF
            0000FF0000FF0000FF009E9E9E43434343434343434343434343434343434343
            434343434343434343434343434300FF0000FF0000FF0000FF00C0A890FFF8F0
            FFF0E0F0E8E0F0E0D0F0D0C0F0C8B0E0C0A0E0B8A0E0B090E0A89060483000FF
            0000FF0000FF0000FF00A3A3A3F6F6F6ECECECE6E6E6DCDCDCCECECEC4C4C4B9
            B9B9B4B4B4ABABABA6A6A643434300FF0000FF0000FF0000FF00C0A8A0FFFFF0
            C0A8A0B0A0A0F0E8E0B0A090B09890B09890B09890B09890E0B09060483000FF
            0000FF0000FF0000FF00A8A8A8FAFAFAA8A8A8A1A1A1E6E6E69C9C9C98989898
            9898989898989898ABABAB43434300FF0000FF0000FF0000FF00C0A8A0FFFFF0
            FFFFF0FFF8F0FFF0E0F0E8E0F0E0D0F0D0C0F0C8B0E0C0A0E0B8A060483000FF
            0000FF0000FF0000FF00A8A8A8FAFAFAFAFAFAF6F6F6ECECECE6E6E6DCDCDCCE
            CECEC4C4C4B9B9B9B4B4B443434300FF0000FF0000FF0000FF00C0A8A0FFFFF0
            B0A8A0B0A0A0FFF8F0B0A090B09890B09890B09890B09890E0C0A060483000FF
            0000FF0000FF0000FF00A8A8A8FAFAFAA6A6A6A1A1A1F6F6F69C9C9C98989898
            9898989898989898B9B9B943434300FF0000FF0000FF0000FF00C0B0A0FFFFF0
            FFFFF0FFFFF0FFFFF0FFF8F0FFF0E0F0E8E0F0E0D0F0D0C0F0C8B060483000FF
            0000FF0000FF0000FF00ACACACFAFAFAFAFAFAFAFAFAFAFAFAF6F6F6ECECECE6
            E6E6DCDCDCCECECEC4C4C443434300FF0000FF0000FF0000FF00C0B0A0FFFFF0
            FFFFF0FFFFF0FFFFF0FFFFF0FFF8F0C0C8C0406070F0E0D0F0D0C060483000FF
            0000FF0000FF0000FF00ACACACFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAF6F6F6C4
            C4C4616161DCDCDCCECECE43434300FF0000FF0000FF0000FF00C0B0A0FFFFFF
            E0E8F0607880E0E0E0FFFFF0C0C8D050607030A8D0203840B0A0A060483000FF
            0000FF00A0B39A408050ACACACFFFFFFE9E9E9787878E0E0E0FAFAFAC9C9C963
            6363A8A8A8383838A1A1A143434300FF0000FF00A9A9A96B6B6BD0B0A0FFFFFF
            90A8B080D0E0506070B0B8C050607060C0E050607030B8F01028301030401028
            3070747D40784050A860AEAEAEFFFFFFA8A8A8CCCCCC636363B9B9B9636363C0
            C0C0636363BBBBBB282828313131282828767676616161898989D0B8A0FFFFFF
            E0E8F090A8B080E0F050607080D0E050607060D0F040607030B0E02098D02088
            B020507050886050B060B3B3B3FFFFFFE9E9E9A8A8A8DBDBDB636363CCCCCC63
            6363CECECE616161B1B1B19C9C9C8989895454547676768E8E8ED0B8A0D0B8A0
            D0B8A0C0B0A090A8B080E0F050607080E0F040587060D0F050C8F040C0F020B0
            E020A0D060987050B870B3B3B3B3B3B3B3B3B3ACACACA8A8A8DBDBDB636363DB
            DBDB5C5C5CCECECEC8C8C8C1C1C1B0B0B0A1A1A186868698989800FF0000FF00
            00FF0000FF0000FF0090A8B080E0F040587080E0F070D8F060D0F050C8F040C0
            F030B8F070A88060C08000FF0000FF0000FF0000FF0000FF00A8A8A8DBDBDB5C
            5C5CDBDBDBD4D4D4CECECEC8C8C8C1C1C1BBBBBB969696A3A3A300FF0000FF00
            00FF0000FF0000FF0000FF0090A8B080E0F080E0F080E0F070D8F060D0F060B0
            D0808890B0C0A090D0A000FF0000FF0000FF0000FF0000FF0000FF00A8A8A8DB
            DBDBDBDBDBDBDBDBD4D4D4CECECEB1B1B1898989B4B4B4BBBBBB00FF0000FF00
            00FF0000FF0000FF0000FF0000FF0090A8B090A0B090A0A08098A08090A08088
            90B9B9BDA0B8A0B0C0A000FF0000FF0000FF0000FF0000FF0000FF0000FF00A8
            A8A8A3A3A39E9E9E989898939393898989BABABAAEAEAEB4B4B400FF0000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
            0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
            FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00}
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 13
          OnButtonClick = dbTotalDescontoButtonClick
          OnExit = ControlEditExit
        end
        object dbLoteProduto: TDBLookupComboBox
          Left = 944
          Top = 80
          Width = 128
          Height = 21
          DataField = 'LOTE_ID'
          DataSource = DtSrcTabelaItens
          DropDownRows = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'ID'
          ListField = 'DESCRICAO'
          ListSource = dtsLotes
          ParentFont = False
          TabOrder = 16
          Visible = False
          OnExit = ControlEditExit
        end
        object dbValorIPI: TDBEdit
          Left = 485
          Top = 80
          Width = 75
          Height = 21
          Color = clMoneyGreen
          DataField = 'VALOR_IPI'
          DataSource = DtSrcTabelaItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 11
          OnExit = ControlEditExit
        end
      end
      object pgcMaisDados: TPageControl
        Left = 0
        Top = 427
        Width = 1108
        Height = 186
        ActivePage = tbsTransporte
        Align = alBottom
        TabOrder = 3
        object tbsRecebimento: TTabSheet
          BorderWidth = 4
          Caption = 'Recebimento'
          object pnlObservacao: TPanel
            Left = 0
            Top = 0
            Width = 520
            Height = 150
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object lblObservacao: TLabel
              Left = 0
              Top = 0
              Width = 520
              Height = 13
              Align = alTop
              Caption = '&Observa'#231#245'es:'
              FocusControl = dbObservacao
              ExplicitWidth = 67
            end
            object Bevel14: TBevel
              Left = 516
              Top = 17
              Width = 4
              Height = 133
              Align = alRight
              Shape = bsSpacer
              ExplicitHeight = 137
            end
            object Bevel15: TBevel
              Left = 0
              Top = 13
              Width = 520
              Height = 4
              Align = alTop
              Shape = bsSpacer
            end
            object dbObservacao: TDBMemo
              Left = 0
              Top = 17
              Width = 516
              Height = 133
              Align = alClient
              DataField = 'OBS'
              DataSource = DtSrcTabela
              ScrollBars = ssBoth
              TabOrder = 0
            end
          end
          object pnlFormaPagto: TPanel
            Left = 520
            Top = 0
            Width = 572
            Height = 150
            Align = alRight
            BevelOuter = bvNone
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            DesignSize = (
              572
              150)
            object lblFormaPagto: TLabel
              Left = 0
              Top = 1
              Width = 124
              Height = 13
              Caption = 'Forma de Pagamento:'
              FocusControl = dbgFormaPagto
            end
            object lblCondicaoPagto: TLabel
              Left = 187
              Top = 1
              Width = 139
              Height = 13
              Caption = 'Condi'#231#227'o de Pagamento:'
              FocusControl = dbCondicaoPagto
            end
            object Label2: TLabel
              Left = 470
              Top = 1
              Width = 60
              Height = 13
              Caption = 'Valor (R$):'
              FocusControl = dbValorFormaPagto
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbFormaPagto: TDBLookupComboBox
              Left = 0
              Top = 17
              Width = 185
              Height = 21
              DataField = 'FORMAPAGTO_COD'
              DataSource = dtsVendaFormaPagto
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
              Visible = False
              OnClick = dbFormaPagtoClick
            end
            object dbCondicaoPagto: TDBLookupComboBox
              Left = 187
              Top = 17
              Width = 281
              Height = 21
              DataField = 'CONDICAOPAGTO_COD'
              DataSource = dtsVendaFormaPagto
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
              TabOrder = 1
              Visible = False
              OnClick = dbCondicaoPagtoClick
            end
            object dbValorFormaPagto: TDBEdit
              Left = 470
              Top = 17
              Width = 102
              Height = 21
              DataField = 'VALOR_FPAGTO'
              DataSource = dtsVendaFormaPagto
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 2
              Visible = False
            end
            object btnFormaPagtoSalvar: TBitBtn
              Left = 210
              Top = 40
              Width = 70
              Height = 25
              Hint = 'Salvar Forma/Condi'#231#227'o de Pagamento'
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
              TabOrder = 6
              Visible = False
            end
            object btnFormaPagtoExcluir: TBitBtn
              Left = 140
              Top = 40
              Width = 70
              Height = 25
              Hint = 'Excluir Forma/Condi'#231#227'o de Pagamento'
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
              TabOrder = 5
              TabStop = False
              Visible = False
            end
            object btnFormaPagtoInserir: TBitBtn
              Left = 0
              Top = 40
              Width = 70
              Height = 25
              Hint = 'Inserir Forma/Condi'#231#227'o de Pagamento'
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
              TabOrder = 3
              Visible = False
              OnClick = btnProdutoInserirClick
            end
            object btnFormaPagtoEditar: TBitBtn
              Left = 70
              Top = 40
              Width = 70
              Height = 25
              Hint = 'Editar Forma/Condi'#231#227'o de Pagamento'
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
              TabOrder = 4
              Visible = False
              OnClick = btnProdutoEditarClick
            end
            object dbgFormaPagto: TDBGrid
              Left = 0
              Top = 16
              Width = 572
              Height = 134
              Hint = 
                'Para inserir nova Forma/Condi'#231#227'o de Pagamento CTRL + INSERT'#13#10#13#10'P' +
                'ara editar Forma/Condi'#231#227'o de Pagamento selecionada CTRL + ENTER'#13 +
                #10#13#10'Para a exclus'#227'o das Formas/Condi'#231#245'es de Pagamentos CTRL + DEL' +
                'ETE'#13#10#13#10'Observa'#231#227'o:'#13#10'======================='#13#10'Todas as formas/con' +
                'di'#231#245'es de pagamentos ser'#227'o exclu'#237'das, zerando o processo'#13#10'de enc' +
                'erramento da venda com uma forma/condi'#231#227'o de pagamento definida ' +
                'como'#13#10'padr'#227'o.'
              Align = alBottom
              Anchors = [akLeft, akTop, akRight, akBottom]
              DataSource = dtsVendaFormaPagto
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Options = [dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
              ParentFont = False
              ParentShowHint = False
              ReadOnly = True
              ShowHint = True
              TabOrder = 7
              TitleFont.Charset = ANSI_CHARSET
              TitleFont.Color = clBlue
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = [fsBold]
              OnDrawColumnCell = dbgDadosDrawColumnCell
              OnEnter = dbgFormaPagtoEnter
              OnKeyDown = dbgFormaPagtoKeyDown
              Columns = <
                item
                  Expanded = False
                  FieldName = 'FormaPagto'
                  Title.Caption = 'Forma de Pagamento '
                  Width = 170
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CondicaoPagto'
                  Title.Caption = 'Condi'#231#227'o de Pagamento '
                  Width = 285
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VALOR_FPAGTO'
                  Title.Caption = 'A Pagar (R$) '
                  Width = 80
                  Visible = True
                end>
            end
            object pnlDicaFormaPagto: TPanel
              Left = 10
              Top = 112
              Width = 551
              Height = 32
              Anchors = [akLeft, akRight, akBottom]
              AutoSize = True
              BevelOuter = bvNone
              TabOrder = 8
              object lblDicaFormaPagto: TLabel
                AlignWithMargins = True
                Left = 3
                Top = 3
                Width = 545
                Height = 26
                Align = alBottom
                Alignment = taCenter
                Caption = 
                  'Nova forma de pagto. (CTRL + INSERT) | Alterar forma de pagto. (' +
                  'CTRL + ENTER) | Limpar forma de pagto. (CTRL + DELETE)'
                FocusControl = dbDadosEntrega
                Font.Charset = ANSI_CHARSET
                Font.Color = clRed
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                WordWrap = True
              end
            end
          end
        end
        object tbsDadosEntrega: TTabSheet
          Caption = 'Dados para Entrega'
          ImageIndex = 4
          object pnlDadosEntrega: TPanel
            Left = 0
            Top = 0
            Width = 1100
            Height = 158
            Align = alClient
            BevelOuter = bvNone
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Lucida Console'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object lblDadosEntrega: TLabel
              Left = 0
              Top = 0
              Width = 1100
              Height = 13
              Align = alTop
              Caption = '&Dados gerais para entrega do(s) produto(s):'
              FocusControl = dbDadosEntrega
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ExplicitWidth = 214
            end
            object Bevel11: TBevel
              Left = 1096
              Top = 17
              Width = 4
              Height = 128
              Align = alRight
              Shape = bsSpacer
              ExplicitLeft = 516
              ExplicitHeight = 137
            end
            object Bevel13: TBevel
              Left = 0
              Top = 13
              Width = 1100
              Height = 4
              Align = alTop
              Shape = bsSpacer
              ExplicitWidth = 520
            end
            object lblDicaDadosEntrega: TLabel
              Left = 0
              Top = 145
              Width = 1100
              Height = 13
              Align = alBottom
              Caption = 
                'Caso voc'#234' deseje corrigir o endere'#231'o de entrega antes da emiss'#227'o' +
                ' da NF-e, basta clicar o bot'#227'o direito do mouse sobre a caixa de' +
                ' texto acima'
              FocusControl = dbDadosEntrega
              Font.Charset = ANSI_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitWidth = 801
            end
            object dbDadosEntrega: TDBMemo
              Left = 0
              Top = 17
              Width = 1096
              Height = 128
              Align = alClient
              DataField = 'DADOS_ENTREGA'
              DataSource = DtSrcTabela
              PopupMenu = ppCorrigirDadosNFe
              ScrollBars = ssBoth
              TabOrder = 0
            end
          end
        end
        object tbsITitulos: TTabSheet
          Caption = 'T'#237'tulo(s) Gerado(s)'
          ImageIndex = 1
          object Bevel9: TBevel
            Left = 74
            Top = 0
            Width = 4
            Height = 158
            Align = alLeft
            Shape = bsSpacer
            ExplicitHeight = 162
          end
          object Bevel10: TBevel
            Left = 0
            Top = 0
            Width = 4
            Height = 158
            Align = alLeft
            Shape = bsSpacer
            ExplicitHeight = 162
          end
          object pnlBotoesTitulo: TPanel
            Left = 4
            Top = 0
            Width = 70
            Height = 158
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
            object btnRegerarTitulo: TBitBtn
              Left = 0
              Top = 1
              Width = 70
              Height = 25
              Hint = 'Regerar T'#237'tulo(s)'
              Caption = 'T'#237'tulo(s)'
              Enabled = False
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnClick = btnRegerarTituloClick
            end
            object btnGerarBoleto: TBitBtn
              Left = 0
              Top = 25
              Width = 70
              Height = 25
              Hint = 'Gerar Boleto(s)'
              Caption = 'Boleto(s)'
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              TabStop = False
              OnClick = btnGerarBoletoClick
            end
            object btnTituloEditar: TBitBtn
              Left = 0
              Top = 49
              Width = 70
              Height = 25
              Hint = 'Editar T'#237'tulo (Vencimentos e Valores)'
              Caption = 'Editar'
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
              TabStop = False
              OnClick = btnTituloEditarClick
            end
            object btnTituloExcluir: TBitBtn
              Left = 0
              Top = 73
              Width = 70
              Height = 25
              Hint = 'Excluir T'#237'tulo'
              Caption = 'Excluir'
              Enabled = False
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              TabOrder = 3
              Visible = False
            end
            object btnTituloQuitar: TBitBtn
              Left = 0
              Top = 97
              Width = 70
              Height = 25
              Hint = 'Baixar T'#237'tulo'
              Caption = 'Baixar'
              Enabled = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clGreen
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              NumGlyphs = 2
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 4
              Visible = False
            end
          end
          object dbgTitulos: TDBGrid
            Tag = 16
            Left = 78
            Top = 0
            Width = 1022
            Height = 158
            Hint = 
              'Para a exclus'#227'o de baixas basta pressionar CTRL + DELETE'#13#10#13#10'Obse' +
              'rva'#231#227'o:'#13#10'======================='#13#10'Apenas usu'#225'rios nas fun'#231#245'es Di' +
              'retoria, Gerente Financeiro, Gerente ADM'#13#10'e/ou Masterdados podem' +
              ' excluir registros de pagamentos.'
            TabStop = False
            Align = alClient
            DataSource = dtsTitulos
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
            TabOrder = 1
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = [fsBold]
            OnDrawColumnCell = dbgDadosDrawColumnCell
            OnKeyDown = dbgTitulosKeyDown
            Columns = <
              item
                Expanded = False
                FieldName = 'Lancamento'
                Title.Caption = 'Lancamento '
                Width = 80
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
                FieldName = 'VALORREC'
                Title.Caption = 'Valor Doc. (R$) '
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'STATUS'
                Title.Caption = 'Status '
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CODBANCO'
                Title.Alignment = taCenter
                Title.Caption = 'Banco '
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOSSONUMERO'
                Title.Caption = 'Nosso N'#250'mero '
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'BAIXADO_'
                Title.Alignment = taCenter
                Title.Caption = 'Baixado '
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DTREC'
                Title.Alignment = taCenter
                Title.Caption = 'Data Baixa '
                Width = 80
                Visible = True
              end>
          end
        end
        object tbsTransporte: TTabSheet
          Caption = 'Dados Transporte'
          ImageIndex = 2
          DesignSize = (
            1100
            158)
          object Bevel16: TBevel
            Left = 0
            Top = 0
            Width = 4
            Height = 158
            Align = alLeft
            Shape = bsSpacer
            ExplicitHeight = 162
          end
          object Bevel17: TBevel
            Left = 74
            Top = 0
            Width = 4
            Height = 158
            Align = alLeft
            Shape = bsSpacer
            ExplicitHeight = 162
          end
          object pnlBotoesTransp: TPanel
            Left = 4
            Top = 0
            Width = 70
            Height = 158
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
            object BtnTransporteInforme: TBitBtn
              Left = 0
              Top = 1
              Width = 70
              Height = 25
              Hint = 
                'Informar dados de transporte:'#13#10'- Modalidade Frete'#13#10'- Dados Ve'#237'cu' +
                'lo'
              Caption = 'Info&rme'
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnClick = BtnTransporteInformeClick
            end
          end
          object GrpBxTransportadora: TGroupBox
            Left = 78
            Top = 0
            Width = 505
            Height = 158
            Align = alLeft
            Caption = 'Transportadora'
            TabOrder = 1
            object lblTranspNome: TLabel
              Left = 8
              Top = 64
              Width = 31
              Height = 13
              Caption = 'Nome:'
              FocusControl = dbTranspNome
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblTranspCnpj: TLabel
              Left = 336
              Top = 64
              Width = 33
              Height = 13
              Caption = 'CNPJ.:'
              FocusControl = dbTranspCnpj
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblTranspEndereco: TLabel
              Left = 8
              Top = 104
              Width = 49
              Height = 13
              Caption = 'Endere'#231'o:'
              FocusControl = dbTranspEndereco
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              Visible = False
            end
            object lblModalidadeFrete: TLabel
              Left = 8
              Top = 24
              Width = 87
              Height = 13
              Caption = 'Modalidade Frete:'
              FocusControl = dbModalidadeFrete
            end
            object dbTranspNome: TDBEdit
              Left = 8
              Top = 80
              Width = 321
              Height = 21
              TabStop = False
              Color = clMoneyGreen
              DataField = 'TRANSP_NOME'
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
            object dbTranspCnpj: TDBEdit
              Left = 336
              Top = 80
              Width = 153
              Height = 21
              TabStop = False
              Color = clMoneyGreen
              DataField = 'TRANSP_CNPJ'
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
            object dbTranspEndereco: TDBEdit
              Left = 8
              Top = 120
              Width = 481
              Height = 21
              TabStop = False
              Color = clMoneyGreen
              DataField = 'TRANSP_ENDERECO'
              DataSource = DtSrcTabela
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
            object dbModalidadeFrete: TDBLookupComboBox
              Left = 8
              Top = 40
              Width = 481
              Height = 21
              DataField = 'NFE_MODALIDADE_FRETE'
              DataSource = DtSrcTabela
              DropDownRows = 10
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              KeyField = 'CODIGO'
              ListField = 'DESCRICAO'
              ListSource = dtsModalidadeFrete
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
          end
          object dbgVolumes: TDBGrid
            Left = 589
            Top = 3
            Width = 517
            Height = 153
            Anchors = [akLeft, akTop, akRight, akBottom]
            DataSource = dtsVendaVolume
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
            OnDrawColumnCell = dbgDadosDrawColumnCell
            Columns = <
              item
                Expanded = False
                FieldName = 'NUMERO'
                Title.Caption = 'Nro. Volume '
                Width = 80
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
                FieldName = 'PESO_BRUTO'
                Title.Caption = 'P. Bruto (Kg) '
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PESO_LIQUIDO'
                Title.Caption = 'P. L'#237'quido (Kg) '
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CUBAGEM'
                Title.Caption = 'Cubagem (m'#179')'
                Width = 100
                Visible = True
              end>
          end
        end
        object TbsInformeNFe: TTabSheet
          Caption = 'Informa'#231#245'es de Envio NF-e'
          ImageIndex = 3
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
          object d2LogNFeLoteDataEmissao: TDBEdit
            Left = 200
            Top = 16
            Width = 57
            Height = 21
            TabStop = False
            Color = clMoneyGreen
            DataField = 'HORAEMISSAO'
            DataSource = DtSrcTabela
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
            TabOrder = 11
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
            TabOrder = 9
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
            TabOrder = 10
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
          object dbLogNFeDenegada: TDBEdit
            Left = 8
            Top = 96
            Width = 553
            Height = 21
            TabStop = False
            Color = clMoneyGreen
            DataField = 'NFE_DENEGADA_MOTIVO'
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
        end
      end
      object dbgProdutos: TDBGrid
        Left = 0
        Top = 238
        Width = 1108
        Height = 185
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
            Width = 23
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODPROD'
            Title.Caption = 'Produto '
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRI_APRESENTACAO'
            Title.Caption = 'Nome do Produto '
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CST'
            Title.Alignment = taCenter
            Title.Caption = 'CST '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CSOSN'
            Title.Caption = 'CSOSN '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CFOP_COD'
            Title.Alignment = taCenter
            Title.Caption = 'CFOP '
            Width = 35
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NCM_SH'
            Title.Caption = 'NCM/SH '
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ALIQUOTA'
            Title.Caption = '% Al'#237'q. '
            Width = 45
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
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PUNIT'
            Title.Caption = 'Valor Un. '
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCONTO'
            Title.Caption = '% Desc. '
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PFINAL'
            Title.Caption = 'Valor L'#237'q. '
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOTAL_BRUTO'
            Title.Caption = 'Total Bruto '
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOTAL_DESCONTO'
            Title.Caption = 'Total Desc. '
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOTAL_LIQUIDO'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            Title.Caption = 'Total L'#237'quido '
            Width = 80
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
      Left = 1112
      ExplicitLeft = 1112
    end
    inherited bvlTool4: TBevel
      Left = 1033
      ExplicitLeft = 1033
    end
    object Bevel12: TBevel [5]
      Left = 579
      Top = 0
      Width = 4
      Height = 35
      Align = alRight
      Shape = bsSpacer
      ExplicitLeft = 589
      ExplicitTop = -2
    end
    inherited btbtnLista: TcxButton
      Visible = True
    end
    inherited btbtnFechar: TcxButton
      Left = 1037
      TabOrder = 11
      ExplicitLeft = 1037
    end
    inherited btbtnSelecionar: TcxButton
      Left = 913
      TabOrder = 10
      ExplicitLeft = 913
    end
    object btnConsultarProduto: TcxButton
      Left = 504
      Top = 0
      Width = 75
      Height = 35
      Hint = 'Consulta Produtos'
      Align = alRight
      Caption = 'P&rodutos'
      OptionsImage.ImageIndex = 19
      OptionsImage.Images = DMRecursos.ImgPrincipal16x16
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
      TabStop = False
      OnClick = btnConsultarProdutoClick
    end
    object btbtnFinalizar: TcxButton
      Tag = 11
      Left = 583
      Top = 0
      Width = 110
      Height = 35
      Align = alRight
      Caption = '&Finalizar Venda'
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
      Left = 803
      Top = 0
      Width = 110
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
    object btbtnCancelarVND: TcxButton
      Tag = 13
      Left = 693
      Top = 0
      Width = 110
      Height = 35
      Hint = 'Cancelar Venda Selecionada'
      Align = alRight
      Caption = 'Cancelar Venda'
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
      OnClick = btbtnCancelarVNDClick
    end
  end
  inherited IbDtstTabela: TIBDataSet
    SelectSQL.Strings = (
      'Select'
      '    v.Ano'
      '  , v.Codcontrol'
      '  , v.Codemp'
      '  , v.Codcliente'
      '  , v.Codcli'
      '  , v.Dtvenda'
      '  , v.Status'
      '  , v.Totalvenda_bruta'
      '  , v.Desconto'
      '  , v.Totalvenda'
      '  , v.Dtfinalizacao_venda'
      '  , v.Obs'
      '  , v.Dados_entrega'
      '  , v.Formapag'
      '  , v.Fatdias'
      '  , v.Serie'
      '  , v.Nfe'
      '  , coalesce(v.modelo_Nf, 0) as modelo_Nf'
      '  , v.Lote_nfe_ano'
      '  , v.Lote_nfe_numero'
      '  , v.Lote_nfe_Recibo'
      '  , v.Nfe_enviada'
      '  , v.Nfe_denegada'
      '  , v.Nfe_denegada_motivo'
      '  , v.caixa_ano'
      '  , v.caixa_num'
      '  , v.caixa_pdv'
      '  , v.Dataemissao'
      '  , v.Horaemissao'
      '  , v.Cancel_usuario'
      '  , v.Cancel_datahora'
      '  , v.Cancel_motivo'
      '  , v.Cfop'
      '  , v.Verificador_nfe'
      '  , v.Xml_nfe_filename'
      '  , v.Xml_nfe'
      '  , v.Vendedor_cod'
      '  , v.Usuario'
      '  , v.Formapagto_cod'
      '  , v.Condicaopagto_cod'
      '  , v.Venda_prazo'
      '  , v.Prazo_01'
      '  , v.Prazo_02'
      '  , v.Prazo_03'
      '  , v.Prazo_04'
      '  , v.Prazo_05'
      '  , v.Prazo_06'
      '  , v.Prazo_07'
      '  , v.Prazo_08'
      '  , v.Prazo_09'
      '  , v.Prazo_10'
      '  , v.Prazo_11'
      '  , v.Prazo_12'
      '  , v.nfe_modalidade_frete'
      '  , v.nfe_transportadora'
      '  , v.nfe_placa_veiculo'
      '  , v.nfe_placa_uf'
      '  , v.nfe_placa_rntc'
      '  , v.gerar_estoque_cliente'
      '  , t.nomeforn as transp_nome'
      '  , t.cnpj     as transp_cnpj'
      '  , t.inscest  as transp_iest'
      
        '  , t.ender || coalesce('#39' - '#39' || t.cidade, '#39#39') as transp_enderec' +
        'o'
      '  , c.Nome'
      '  , c.Bloqueado'
      '  , c.Bloqueado_motivo'
      '  , Case when coalesce(v.totalcusto, 0) > 0'
      
        '      then ((v.totalvenda / coalesce(v.totalcusto, 0)) - 1) * 10' +
        '0'
      '      else 0.0'
      '    end Lucro_Calculado'
      'from TBVENDAS v'
      '  inner join TBCLIENTE c on (c.Codigo = v.Codcliente)'
      '  left join TBFORNECEDOR t on (t.codforn = v.nfe_transportadora)')
    GeneratorField.ApplyEvent = gamOnNewRecord
  end
  inherited DtSrcTabela: TDataSource
    DataSet = fdQryTabela
    Left = 704
    Top = 32
  end
  inherited IbUpdTabela: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  ANO,'
      '  CODCONTROL,'
      '  CODEMP,'
      '  CODCLIENTE,'
      '  CODCLI,'
      '  DTVENDA,'
      '  COMPETENCIA,'
      '  STATUS,'
      '  TOTALVENDA_BRUTA,'
      '  DESCONTO,'
      '  DESCONTO_CUPOM,'
      '  TOTALVENDA,'
      '  TOTALCUSTO,'
      '  DTFINALIZACAO_VENDA,'
      '  OBS,'
      '  FORMAPAG,'
      '  FATDIAS,'
      '  SERIE,'
      '  NFE,'
      '  DATAEMISSAO,'
      '  HORAEMISSAO,'
      '  CFOP,'
      '  VERIFICADOR_NFE,'
      '  XML_NFE,'
      '  VENDEDOR_COD,'
      '  USUARIO,'
      '  FORMAPAGTO_COD,'
      '  CONDICAOPAGTO_COD,'
      '  VENDA_PRAZO,'
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
      '  LOTE_NFE_ANO,'
      '  LOTE_NFE_NUMERO,'
      '  LOTE_NFE_RECIBO,'
      '  NFE_ENVIADA,'
      '  NFE_DENEGADA,'
      '  NFE_DENEGADA_MOTIVO,'
      '  CANCEL_USUARIO,'
      '  CANCEL_DATAHORA,'
      '  CANCEL_MOTIVO,'
      '  XML_NFE_FILENAME,'
      '  NFE_MODALIDADE_FRETE,'
      '  NFE_TRANSPORTADORA,'
      '  NFE_PLACA_VEICULO,'
      '  NFE_PLACA_UF,'
      '  NFE_PLACA_RNTC,'
      '  NFE_VALOR_BASE_ICMS,'
      '  NFE_VALOR_ICMS,'
      '  NFE_VALOR_BASE_ICMS_SUBST,'
      '  NFE_VALOR_ICMS_SUBST,'
      '  NFE_VALOR_TOTAL_PRODUTO,'
      '  NFE_VALOR_FRETE,'
      '  NFE_VALOR_SEGURO,'
      '  NFE_VALOR_DESCONTO,'
      '  NFE_VALOR_TOTAL_II,'
      '  NFE_VALOR_TOTAL_IPI,'
      '  NFE_VALOR_PIS,'
      '  NFE_VALOR_COFINS,'
      '  NFE_VALOR_OUTROS,'
      '  NFE_VALOR_TOTAL_NOTA,'
      '  CUSTO_OPER_PERCENTUAL,'
      '  CUSTO_OPER_FRETE,'
      '  CUSTO_OPER_OUTROS,'
      '  GERAR_ESTOQUE_CLIENTE'
      'from TBVENDAS '
      'where'
      '  ANO = :ANO and'
      '  CODCONTROL = :CODCONTROL')
    ModifySQL.Strings = (
      'update TBVENDAS'
      'set'
      '  ANO = :ANO,'
      '  CANCEL_DATAHORA = :CANCEL_DATAHORA,'
      '  CANCEL_MOTIVO = :CANCEL_MOTIVO,'
      '  CANCEL_USUARIO = :CANCEL_USUARIO,'
      '  CFOP = :CFOP,'
      '  CODCLI = :CODCLI,'
      '  CODCLIENTE = :CODCLIENTE,'
      '  CODCONTROL = :CODCONTROL,'
      '  CODEMP = :CODEMP,'
      '  CONDICAOPAGTO_COD = :CONDICAOPAGTO_COD,'
      '  DATAEMISSAO = :DATAEMISSAO,'
      '  DESCONTO = :DESCONTO,'
      '  DTFINALIZACAO_VENDA = :DTFINALIZACAO_VENDA,'
      '  DTVENDA = :DTVENDA,'
      '  FATDIAS = :FATDIAS,'
      '  FORMAPAG = :FORMAPAG,'
      '  FORMAPAGTO_COD = :FORMAPAGTO_COD,'
      '  GERAR_ESTOQUE_CLIENTE = :GERAR_ESTOQUE_CLIENTE,'
      '  HORAEMISSAO = :HORAEMISSAO,'
      '  LOTE_NFE_ANO = :LOTE_NFE_ANO,'
      '  LOTE_NFE_NUMERO = :LOTE_NFE_NUMERO,'
      '  LOTE_NFE_RECIBO = :LOTE_NFE_RECIBO,'
      '  NFE = :NFE,'
      '  NFE_DENEGADA = :NFE_DENEGADA,'
      '  NFE_DENEGADA_MOTIVO = :NFE_DENEGADA_MOTIVO,'
      '  NFE_ENVIADA = :NFE_ENVIADA,'
      '  NFE_MODALIDADE_FRETE = :NFE_MODALIDADE_FRETE,'
      '  NFE_PLACA_RNTC = :NFE_PLACA_RNTC,'
      '  NFE_PLACA_UF = :NFE_PLACA_UF,'
      '  NFE_PLACA_VEICULO = :NFE_PLACA_VEICULO,'
      '  NFE_TRANSPORTADORA = :NFE_TRANSPORTADORA,'
      '  OBS = :OBS,'
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
      '  SERIE = :SERIE,'
      '  STATUS = :STATUS,'
      '  TOTALVENDA = :TOTALVENDA,'
      '  TOTALVENDA_BRUTA = :TOTALVENDA_BRUTA,'
      '  USUARIO = :USUARIO,'
      '  VENDA_PRAZO = :VENDA_PRAZO,'
      '  VENDEDOR_COD = :VENDEDOR_COD,'
      '  VERIFICADOR_NFE = :VERIFICADOR_NFE,'
      '  XML_NFE = :XML_NFE,'
      '  XML_NFE_FILENAME = :XML_NFE_FILENAME'
      'where'
      '  ANO = :OLD_ANO and'
      '  CODCONTROL = :OLD_CODCONTROL')
    InsertSQL.Strings = (
      'insert into TBVENDAS'
      
        '  (ANO, CANCEL_DATAHORA, CANCEL_MOTIVO, CANCEL_USUARIO, CFOP, CO' +
        'DCLI, CODCLIENTE, '
      
        '   CODCONTROL, CODEMP, CONDICAOPAGTO_COD, DATAEMISSAO, DESCONTO,' +
        ' DTFINALIZACAO_VENDA, '
      
        '   DTVENDA, FATDIAS, FORMAPAG, FORMAPAGTO_COD, GERAR_ESTOQUE_CLI' +
        'ENTE, HORAEMISSAO, '
      
        '   LOTE_NFE_ANO, LOTE_NFE_NUMERO, LOTE_NFE_RECIBO, NFE, NFE_DENE' +
        'GADA, NFE_DENEGADA_MOTIVO, '
      
        '   NFE_ENVIADA, NFE_MODALIDADE_FRETE, NFE_PLACA_RNTC, NFE_PLACA_' +
        'UF, NFE_PLACA_VEICULO, '
      
        '   NFE_TRANSPORTADORA, OBS, PRAZO_01, PRAZO_02, PRAZO_03, PRAZO_' +
        '04, PRAZO_05, '
      
        '   PRAZO_06, PRAZO_07, PRAZO_08, PRAZO_09, PRAZO_10, PRAZO_11, P' +
        'RAZO_12, '
      
        '   SERIE, STATUS, TOTALVENDA, TOTALVENDA_BRUTA, USUARIO, VENDA_P' +
        'RAZO, VENDEDOR_COD, '
      '   VERIFICADOR_NFE, XML_NFE, XML_NFE_FILENAME)'
      'values'
      
        '  (:ANO, :CANCEL_DATAHORA, :CANCEL_MOTIVO, :CANCEL_USUARIO, :CFO' +
        'P, :CODCLI, '
      
        '   :CODCLIENTE, :CODCONTROL, :CODEMP, :CONDICAOPAGTO_COD, :DATAE' +
        'MISSAO, '
      
        '   :DESCONTO, :DTFINALIZACAO_VENDA, :DTVENDA, :FATDIAS, :FORMAPA' +
        'G, :FORMAPAGTO_COD, '
      
        '   :GERAR_ESTOQUE_CLIENTE, :HORAEMISSAO, :LOTE_NFE_ANO, :LOTE_NF' +
        'E_NUMERO, '
      
        '   :LOTE_NFE_RECIBO, :NFE, :NFE_DENEGADA, :NFE_DENEGADA_MOTIVO, ' +
        ':NFE_ENVIADA, '
      
        '   :NFE_MODALIDADE_FRETE, :NFE_PLACA_RNTC, :NFE_PLACA_UF, :NFE_P' +
        'LACA_VEICULO, '
      
        '   :NFE_TRANSPORTADORA, :OBS, :PRAZO_01, :PRAZO_02, :PRAZO_03, :' +
        'PRAZO_04, '
      
        '   :PRAZO_05, :PRAZO_06, :PRAZO_07, :PRAZO_08, :PRAZO_09, :PRAZO' +
        '_10, :PRAZO_11, '
      
        '   :PRAZO_12, :SERIE, :STATUS, :TOTALVENDA, :TOTALVENDA_BRUTA, :' +
        'USUARIO, '
      
        '   :VENDA_PRAZO, :VENDEDOR_COD, :VERIFICADOR_NFE, :XML_NFE, :XML' +
        '_NFE_FILENAME)')
    DeleteSQL.Strings = (
      'delete from TBVENDAS'
      'where'
      '  ANO = :OLD_ANO and'
      '  CODCONTROL = :OLD_CODCONTROL')
  end
  inherited ImgList: TImageList
    Left = 1192
    Top = 376
  end
  inherited fdQryTabela: TFDQuery
    AfterCancel = fdQryTabelaAfterCancel
    AfterScroll = fdQryTabelaAfterScroll
    SQL.Strings = (
      'Select'
      '    v.Ano'
      '  , v.Codcontrol'
      '  , v.Codemp'
      '  , v.Codcliente'
      '  , v.Codcli'
      '  , v.Dtvenda'
      '  , v.Status'
      '  , v.Totalvenda_bruta'
      '  , v.Desconto'
      '  , v.Totalvenda'
      '  , v.Dtfinalizacao_venda'
      '  , v.Obs'
      '  , v.Dados_entrega'
      '  , v.Formapag'
      '  , v.Fatdias'
      '  , v.Serie'
      '  , v.Nfe'
      '  , coalesce(v.modelo_Nf, 0) as modelo_Nf'
      '  , v.Lote_nfe_ano'
      '  , v.Lote_nfe_numero'
      '  , v.Lote_nfe_Recibo'
      '  , v.Nfe_enviada'
      '  , v.Nfe_denegada'
      '  , v.Nfe_denegada_motivo'
      '  , v.caixa_ano'
      '  , v.caixa_num'
      '  , v.caixa_pdv'
      '  , v.Dataemissao'
      '  , v.Horaemissao'
      '  , v.Cancel_usuario'
      '  , v.Cancel_datahora'
      '  , v.Cancel_motivo'
      '  , v.Cfop'
      '  , v.Verificador_nfe'
      '  , v.Xml_nfe_filename'
      '  , v.Xml_nfe'
      '  , v.Vendedor_cod'
      '  , v.Usuario'
      '  , v.Formapagto_cod'
      '  , v.Condicaopagto_cod'
      '  , v.Venda_prazo'
      '  , v.Prazo_01'
      '  , v.Prazo_02'
      '  , v.Prazo_03'
      '  , v.Prazo_04'
      '  , v.Prazo_05'
      '  , v.Prazo_06'
      '  , v.Prazo_07'
      '  , v.Prazo_08'
      '  , v.Prazo_09'
      '  , v.Prazo_10'
      '  , v.Prazo_11'
      '  , v.Prazo_12'
      '  , v.nfe_modalidade_frete'
      '  , v.nfe_transportadora'
      '  , v.nfe_placa_veiculo'
      '  , v.nfe_placa_uf'
      '  , v.nfe_placa_rntc'
      '  , v.gerar_estoque_cliente'
      '  , t.nomeforn as transp_nome'
      '  , t.cnpj     as transp_cnpj'
      '  , t.inscest  as transp_iest'
      
        '  , t.ender || coalesce('#39' - '#39' || t.cidade, '#39#39') as transp_enderec' +
        'o'
      '  , c.Nome'
      '  , c.Bloqueado'
      '  , c.Bloqueado_motivo'
      '  , c.pessoa_fisica'
      '  , c.inscest'
      '  , Case when coalesce(v.totalcusto, 0) > 0'
      
        '      then ((v.totalvenda / coalesce(v.totalcusto, 0)) - 1) * 10' +
        '0'
      '      else 0.0'
      '    end Lucro_Calculado'
      'from TBVENDAS v'
      '  inner join TBCLIENTE c on (c.Codigo = v.Codcliente)'
      '  left join TBFORNECEDOR t on (t.codforn = v.nfe_transportadora)')
    object fdQryTabelaANO: TSmallintField
      FieldName = 'ANO'
      Origin = 'ANO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object fdQryTabelaCODCONTROL: TIntegerField
      DisplayLabel = 'No. Venda'
      FieldName = 'CODCONTROL'
      Origin = 'CODCONTROL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object fdQryTabelaCODEMP: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'CODEMP'
      Origin = 'CODEMP'
      Size = 18
    end
    object fdQryTabelaCODCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CODCLIENTE'
      Origin = 'CODCLIENTE'
    end
    object fdQryTabelaCODCLI: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'CODCLI'
      Origin = 'CODCLI'
      Size = 18
    end
    object fdQryTabelaDTVENDA: TSQLTimeStampField
      DisplayLabel = 'D. Venda'
      FieldName = 'DTVENDA'
      Origin = 'DTVENDA'
      DisplayFormat = 'dd/mm/yyyy hh:mm'
    end
    object fdQryTabelaSTATUS: TSmallintField
      Alignment = taLeftJustify
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
      OnGetText = fdQryTabelaSTATUSGetText
    end
    object fdQryTabelaDTFINALIZACAO_VENDA: TDateField
      FieldName = 'DTFINALIZACAO_VENDA'
      Origin = 'DTFINALIZACAO_VENDA'
    end
    object fdQryTabelaOBS: TMemoField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBS'
      Origin = 'OBS'
      BlobType = ftMemo
    end
    object fdQryTabelaDADOS_ENTREGA: TMemoField
      DisplayLabel = 'Dados de entrega'
      FieldName = 'DADOS_ENTREGA'
      Origin = 'DADOS_ENTREGA'
      BlobType = ftMemo
    end
    object fdQryTabelaFORMAPAG: TStringField
      DisplayLabel = 'Forma de Pagamento'
      FieldName = 'FORMAPAG'
      Origin = 'FORMAPAG'
      Size = 35
    end
    object fdQryTabelaFATDIAS: TSmallintField
      DisplayLabel = 'Fatura Dias'
      FieldName = 'FATDIAS'
      Origin = 'FATDIAS'
    end
    object fdQryTabelaSERIE: TStringField
      Alignment = taCenter
      DisplayLabel = 'S'#233'rie'
      FieldName = 'SERIE'
      Origin = 'SERIE'
      Size = 4
    end
    object fdQryTabelaNFE: TLargeintField
      DisplayLabel = 'NF-e'
      FieldName = 'NFE'
      Origin = 'NFE'
      DisplayFormat = '###0000000'
    end
    object fdQryTabelaMODELO_NF: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'MODELO_NF'
      Origin = 'MODELO_NF'
      ProviderFlags = []
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
    object fdQryTabelaNFE_ENVIADA: TSmallintField
      FieldName = 'NFE_ENVIADA'
      Origin = 'NFE_ENVIADA'
      Required = True
    end
    object fdQryTabelaNFE_DENEGADA: TSmallintField
      FieldName = 'NFE_DENEGADA'
      Origin = 'NFE_DENEGADA'
    end
    object fdQryTabelaNFE_DENEGADA_MOTIVO: TStringField
      FieldName = 'NFE_DENEGADA_MOTIVO'
      Origin = 'NFE_DENEGADA_MOTIVO'
      Size = 100
    end
    object fdQryTabelaCAIXA_ANO: TSmallintField
      FieldName = 'CAIXA_ANO'
      Origin = 'CAIXA_ANO'
    end
    object fdQryTabelaCAIXA_NUM: TIntegerField
      FieldName = 'CAIXA_NUM'
      Origin = 'CAIXA_NUM'
    end
    object fdQryTabelaCAIXA_PDV: TSmallintField
      FieldName = 'CAIXA_PDV'
      Origin = 'CAIXA_PDV'
      Required = True
    end
    object fdQryTabelaDATAEMISSAO: TDateField
      DisplayLabel = 'D. Emiss'#227'o'
      FieldName = 'DATAEMISSAO'
      Origin = 'DATAEMISSAO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object fdQryTabelaHORAEMISSAO: TTimeField
      DisplayLabel = 'H. Emiss'#227'o'
      FieldName = 'HORAEMISSAO'
      Origin = 'HORAEMISSAO'
      DisplayFormat = 'hh:mm'
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
    object fdQryTabelaCFOP: TIntegerField
      FieldName = 'CFOP'
      Origin = 'CFOP'
    end
    object fdQryTabelaVERIFICADOR_NFE: TStringField
      DisplayLabel = 'Verificador'
      FieldName = 'VERIFICADOR_NFE'
      Origin = 'VERIFICADOR_NFE'
      Size = 250
    end
    object fdQryTabelaXML_NFE_FILENAME: TStringField
      FieldName = 'XML_NFE_FILENAME'
      Origin = 'XML_NFE_FILENAME'
      Size = 250
    end
    object fdQryTabelaXML_NFE: TMemoField
      DisplayLabel = 'XML NF-e'
      FieldName = 'XML_NFE'
      Origin = 'XML_NFE'
      BlobType = ftMemo
    end
    object fdQryTabelaVENDEDOR_COD: TIntegerField
      DisplayLabel = 'Vendedor'
      FieldName = 'VENDEDOR_COD'
      Origin = 'VENDEDOR_COD'
    end
    object fdQryTabelaUSUARIO: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'USUARIO'
      Origin = 'USUARIO'
      Size = 50
    end
    object fdQryTabelaFORMAPAGTO_COD: TSmallintField
      DisplayLabel = 'Forma de Pagamento'
      FieldName = 'FORMAPAGTO_COD'
      Origin = 'FORMAPAGTO_COD'
    end
    object fdQryTabelaCONDICAOPAGTO_COD: TSmallintField
      DisplayLabel = 'Condi'#231#227'o de Pagamento'
      FieldName = 'CONDICAOPAGTO_COD'
      Origin = 'CONDICAOPAGTO_COD'
    end
    object fdQryTabelaVENDA_PRAZO: TSmallintField
      DisplayLabel = 'A Prazo?'
      FieldName = 'VENDA_PRAZO'
      Origin = 'VENDA_PRAZO'
      Required = True
    end
    object fdQryTabelaPRAZO_01: TSmallintField
      DisplayLabel = 'Prazo 01'
      FieldName = 'PRAZO_01'
      Origin = 'PRAZO_01'
    end
    object fdQryTabelaPRAZO_02: TSmallintField
      DisplayLabel = 'Prazo 02'
      FieldName = 'PRAZO_02'
      Origin = 'PRAZO_02'
    end
    object fdQryTabelaPRAZO_03: TSmallintField
      DisplayLabel = 'Prazo 03'
      FieldName = 'PRAZO_03'
      Origin = 'PRAZO_03'
    end
    object fdQryTabelaPRAZO_04: TSmallintField
      DisplayLabel = 'Prazo 04'
      FieldName = 'PRAZO_04'
      Origin = 'PRAZO_04'
    end
    object fdQryTabelaPRAZO_05: TSmallintField
      DisplayLabel = 'Prazo 05'
      FieldName = 'PRAZO_05'
      Origin = 'PRAZO_05'
    end
    object fdQryTabelaPRAZO_06: TSmallintField
      DisplayLabel = 'Prazo 06'
      FieldName = 'PRAZO_06'
      Origin = 'PRAZO_06'
    end
    object fdQryTabelaPRAZO_07: TSmallintField
      DisplayLabel = 'Prazo 07'
      FieldName = 'PRAZO_07'
      Origin = 'PRAZO_07'
    end
    object fdQryTabelaPRAZO_08: TSmallintField
      DisplayLabel = 'Prazo 08'
      FieldName = 'PRAZO_08'
      Origin = 'PRAZO_08'
    end
    object fdQryTabelaPRAZO_09: TSmallintField
      DisplayLabel = 'Prazo 09'
      FieldName = 'PRAZO_09'
      Origin = 'PRAZO_09'
    end
    object fdQryTabelaPRAZO_10: TSmallintField
      DisplayLabel = 'Prazo 10'
      FieldName = 'PRAZO_10'
      Origin = 'PRAZO_10'
    end
    object fdQryTabelaPRAZO_11: TSmallintField
      DisplayLabel = 'Prazo 11'
      FieldName = 'PRAZO_11'
      Origin = 'PRAZO_11'
    end
    object fdQryTabelaPRAZO_12: TSmallintField
      DisplayLabel = 'Prazo 12'
      FieldName = 'PRAZO_12'
      Origin = 'PRAZO_12'
    end
    object fdQryTabelaNFE_MODALIDADE_FRETE: TSmallintField
      DisplayLabel = 'Modalidade do Frete'
      FieldName = 'NFE_MODALIDADE_FRETE'
      Origin = 'NFE_MODALIDADE_FRETE'
    end
    object fdQryTabelaNFE_TRANSPORTADORA: TIntegerField
      DisplayLabel = 'Transportadora'
      FieldName = 'NFE_TRANSPORTADORA'
      Origin = 'NFE_TRANSPORTADORA'
    end
    object fdQryTabelaNFE_PLACA_VEICULO: TStringField
      DisplayLabel = 'Placa do Ve'#237'culo'
      FieldName = 'NFE_PLACA_VEICULO'
      Origin = 'NFE_PLACA_VEICULO'
      Size = 10
    end
    object fdQryTabelaNFE_PLACA_UF: TStringField
      DisplayLabel = 'UF da Placa'
      FieldName = 'NFE_PLACA_UF'
      Origin = 'NFE_PLACA_UF'
      Size = 2
    end
    object fdQryTabelaNFE_PLACA_RNTC: TStringField
      DisplayLabel = 'RNTC (Registro Nacional de Transporte de Carga)'
      FieldName = 'NFE_PLACA_RNTC'
      Origin = 'NFE_PLACA_RNTC'
      Size = 10
    end
    object fdQryTabelaGERAR_ESTOQUE_CLIENTE: TSmallintField
      FieldName = 'GERAR_ESTOQUE_CLIENTE'
      Origin = 'GERAR_ESTOQUE_CLIENTE'
      Required = True
    end
    object fdQryTabelaTRANSP_NOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TRANSP_NOME'
      Origin = 'NOMEFORN'
      ProviderFlags = []
      Size = 100
    end
    object fdQryTabelaTRANSP_CNPJ: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TRANSP_CNPJ'
      Origin = 'CNPJ'
      ProviderFlags = []
      Size = 18
    end
    object fdQryTabelaTRANSP_IEST: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TRANSP_IEST'
      Origin = 'INSCEST'
      ProviderFlags = []
    end
    object fdQryTabelaTRANSP_ENDERECO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TRANSP_ENDERECO'
      Origin = 'TRANSP_ENDERECO'
      ProviderFlags = []
      Size = 283
    end
    object fdQryTabelaNOME: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Cliente'
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object fdQryTabelaBLOQUEADO: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'BLOQUEADO'
      Origin = 'BLOQUEADO'
      ProviderFlags = []
    end
    object fdQryTabelaBLOQUEADO_MOTIVO: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'BLOQUEADO_MOTIVO'
      Origin = 'BLOQUEADO_MOTIVO'
      ProviderFlags = []
      BlobType = ftMemo
    end
    object fdQryTabelaPESSOA_FISICA: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'PESSOA_FISICA'
      Origin = 'PESSOA_FISICA'
      ProviderFlags = []
    end
    object fdQryTabelaINSCEST: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'INSCEST'
      Origin = 'INSCEST'
      ProviderFlags = []
    end
    object fdQryTabelaTOTALVENDA_BRUTA: TFMTBCDField
      FieldName = 'TOTALVENDA_BRUTA'
      Origin = 'TOTALVENDA_BRUTA'
      Precision = 18
      Size = 2
    end
    object fdQryTabelaDESCONTO: TBCDField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      Precision = 18
    end
    object fdQryTabelaTOTALVENDA: TFMTBCDField
      FieldName = 'TOTALVENDA'
      Origin = 'TOTALVENDA'
      Precision = 18
      Size = 2
    end
    object fdQryTabelaLUCRO_CALCULADO: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'LUCRO_CALCULADO'
      Origin = 'LUCRO_CALCULADO'
      ProviderFlags = []
      ReadOnly = True
      OnGetText = fdQryTabelaLUCRO_CALCULADOGetText
      Precision = 18
    end
  end
  inherited fdUpdTabela: TFDUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO TBVENDAS'
      '(ANO, CODCONTROL, CODEMP, CODCLIENTE, CODCLI, '
      '  DTVENDA, STATUS, TOTALVENDA_BRUTA, DESCONTO, '
      '  TOTALVENDA, DTFINALIZACAO_VENDA, OBS, DADOS_ENTREGA, '
      '  FORMAPAG, FATDIAS, SERIE, NFE, DATAEMISSAO, '
      '  HORAEMISSAO, CFOP, VERIFICADOR_NFE, XML_NFE, '
      '  XML_NFE_FILENAME, VENDEDOR_COD, USUARIO, '
      '  FORMAPAGTO_COD, CONDICAOPAGTO_COD, VENDA_PRAZO, '
      '  PRAZO_01, PRAZO_02, PRAZO_03, PRAZO_04, '
      '  PRAZO_05, PRAZO_06, PRAZO_07, PRAZO_08, '
      '  PRAZO_09, PRAZO_10, PRAZO_11, PRAZO_12, '
      '  LOTE_NFE_ANO, LOTE_NFE_NUMERO, LOTE_NFE_RECIBO, '
      '  NFE_ENVIADA, NFE_DENEGADA, NFE_DENEGADA_MOTIVO, '
      '  CANCEL_USUARIO, CANCEL_DATAHORA, CANCEL_MOTIVO, '
      '  NFE_MODALIDADE_FRETE, NFE_TRANSPORTADORA, NFE_PLACA_VEICULO, '
      '  NFE_PLACA_UF, NFE_PLACA_RNTC, GERAR_ESTOQUE_CLIENTE, '
      '  CAIXA_ANO, CAIXA_NUM, CAIXA_PDV)'
      
        'VALUES (:NEW_ANO, :NEW_CODCONTROL, :NEW_CODEMP, :NEW_CODCLIENTE,' +
        ' :NEW_CODCLI, '
      
        '  :NEW_DTVENDA, :NEW_STATUS, :NEW_TOTALVENDA_BRUTA, :NEW_DESCONT' +
        'O, '
      
        '  :NEW_TOTALVENDA, :NEW_DTFINALIZACAO_VENDA, :NEW_OBS, :NEW_DADO' +
        'S_ENTREGA, '
      
        '  :NEW_FORMAPAG, :NEW_FATDIAS, :NEW_SERIE, :NEW_NFE, :NEW_DATAEM' +
        'ISSAO, '
      
        '  :NEW_HORAEMISSAO, :NEW_CFOP, :NEW_VERIFICADOR_NFE, :NEW_XML_NF' +
        'E, '
      '  :NEW_XML_NFE_FILENAME, :NEW_VENDEDOR_COD, :NEW_USUARIO, '
      
        '  :NEW_FORMAPAGTO_COD, :NEW_CONDICAOPAGTO_COD, :NEW_VENDA_PRAZO,' +
        ' '
      '  :NEW_PRAZO_01, :NEW_PRAZO_02, :NEW_PRAZO_03, :NEW_PRAZO_04, '
      '  :NEW_PRAZO_05, :NEW_PRAZO_06, :NEW_PRAZO_07, :NEW_PRAZO_08, '
      '  :NEW_PRAZO_09, :NEW_PRAZO_10, :NEW_PRAZO_11, :NEW_PRAZO_12, '
      
        '  :NEW_LOTE_NFE_ANO, :NEW_LOTE_NFE_NUMERO, :NEW_LOTE_NFE_RECIBO,' +
        ' '
      
        '  :NEW_NFE_ENVIADA, :NEW_NFE_DENEGADA, :NEW_NFE_DENEGADA_MOTIVO,' +
        ' '
      
        '  :NEW_CANCEL_USUARIO, :NEW_CANCEL_DATAHORA, :NEW_CANCEL_MOTIVO,' +
        ' '
      
        '  :NEW_NFE_MODALIDADE_FRETE, :NEW_NFE_TRANSPORTADORA, :NEW_NFE_P' +
        'LACA_VEICULO, '
      
        '  :NEW_NFE_PLACA_UF, :NEW_NFE_PLACA_RNTC, :NEW_GERAR_ESTOQUE_CLI' +
        'ENTE, '
      '  :NEW_CAIXA_ANO, :NEW_CAIXA_NUM, :NEW_CAIXA_PDV)'
      'RETURNING ANO, CODCONTROL, MODELO_NF')
    ModifySQL.Strings = (
      'UPDATE TBVENDAS'
      
        'SET ANO = :NEW_ANO, CODCONTROL = :NEW_CODCONTROL, CODEMP = :NEW_' +
        'CODEMP, '
      
        '  CODCLIENTE = :NEW_CODCLIENTE, CODCLI = :NEW_CODCLI, DTVENDA = ' +
        ':NEW_DTVENDA, '
      
        '  STATUS = :NEW_STATUS, TOTALVENDA_BRUTA = :NEW_TOTALVENDA_BRUTA' +
        ', '
      '  DESCONTO = :NEW_DESCONTO, TOTALVENDA = :NEW_TOTALVENDA, '
      
        '  DTFINALIZACAO_VENDA = :NEW_DTFINALIZACAO_VENDA, OBS = :NEW_OBS' +
        ', '
      '  DADOS_ENTREGA = :NEW_DADOS_ENTREGA, FORMAPAG = :NEW_FORMAPAG, '
      '  FATDIAS = :NEW_FATDIAS, SERIE = :NEW_SERIE, NFE = :NEW_NFE, '
      
        '  DATAEMISSAO = :NEW_DATAEMISSAO, HORAEMISSAO = :NEW_HORAEMISSAO' +
        ', '
      '  CFOP = :NEW_CFOP, VERIFICADOR_NFE = :NEW_VERIFICADOR_NFE, '
      
        '  XML_NFE = :NEW_XML_NFE, XML_NFE_FILENAME = :NEW_XML_NFE_FILENA' +
        'ME, '
      '  VENDEDOR_COD = :NEW_VENDEDOR_COD, USUARIO = :NEW_USUARIO, '
      
        '  FORMAPAGTO_COD = :NEW_FORMAPAGTO_COD, CONDICAOPAGTO_COD = :NEW' +
        '_CONDICAOPAGTO_COD, '
      '  VENDA_PRAZO = :NEW_VENDA_PRAZO, PRAZO_01 = :NEW_PRAZO_01, '
      
        '  PRAZO_02 = :NEW_PRAZO_02, PRAZO_03 = :NEW_PRAZO_03, PRAZO_04 =' +
        ' :NEW_PRAZO_04, '
      
        '  PRAZO_05 = :NEW_PRAZO_05, PRAZO_06 = :NEW_PRAZO_06, PRAZO_07 =' +
        ' :NEW_PRAZO_07, '
      
        '  PRAZO_08 = :NEW_PRAZO_08, PRAZO_09 = :NEW_PRAZO_09, PRAZO_10 =' +
        ' :NEW_PRAZO_10, '
      
        '  PRAZO_11 = :NEW_PRAZO_11, PRAZO_12 = :NEW_PRAZO_12, LOTE_NFE_A' +
        'NO = :NEW_LOTE_NFE_ANO, '
      
        '  LOTE_NFE_NUMERO = :NEW_LOTE_NFE_NUMERO, LOTE_NFE_RECIBO = :NEW' +
        '_LOTE_NFE_RECIBO, '
      
        '  NFE_ENVIADA = :NEW_NFE_ENVIADA, NFE_DENEGADA = :NEW_NFE_DENEGA' +
        'DA, '
      
        '  NFE_DENEGADA_MOTIVO = :NEW_NFE_DENEGADA_MOTIVO, CANCEL_USUARIO' +
        ' = :NEW_CANCEL_USUARIO, '
      
        '  CANCEL_DATAHORA = :NEW_CANCEL_DATAHORA, CANCEL_MOTIVO = :NEW_C' +
        'ANCEL_MOTIVO, '
      
        '  NFE_MODALIDADE_FRETE = :NEW_NFE_MODALIDADE_FRETE, NFE_TRANSPOR' +
        'TADORA = :NEW_NFE_TRANSPORTADORA, '
      
        '  NFE_PLACA_VEICULO = :NEW_NFE_PLACA_VEICULO, NFE_PLACA_UF = :NE' +
        'W_NFE_PLACA_UF, '
      
        '  NFE_PLACA_RNTC = :NEW_NFE_PLACA_RNTC, GERAR_ESTOQUE_CLIENTE = ' +
        ':NEW_GERAR_ESTOQUE_CLIENTE, '
      '  CAIXA_ANO = :NEW_CAIXA_ANO, CAIXA_NUM = :NEW_CAIXA_NUM, '
      '  CAIXA_PDV = :NEW_CAIXA_PDV'
      'WHERE ANO = :OLD_ANO AND CODCONTROL = :OLD_CODCONTROL'
      'RETURNING ANO, CODCONTROL, MODELO_NF')
    DeleteSQL.Strings = (
      'DELETE FROM TBVENDAS'
      'WHERE ANO = :OLD_ANO AND CODCONTROL = :OLD_CODCONTROL')
    FetchRowSQL.Strings = (
      'Select'
      '    v.Ano'
      '  , v.Codcontrol'
      '  , v.Codemp'
      '  , v.Codcliente'
      '  , v.Codcli'
      '  , v.Dtvenda'
      '  , v.Status'
      '  , v.Totalvenda_bruta'
      '  , v.Desconto'
      '  , v.Totalvenda'
      '  , v.Dtfinalizacao_venda'
      '  , v.Obs'
      '  , v.Dados_entrega'
      '  , v.Formapag'
      '  , v.Fatdias'
      '  , v.Serie'
      '  , v.Nfe'
      '  , coalesce(v.modelo_Nf, 0) as modelo_Nf'
      '  , v.Lote_nfe_ano'
      '  , v.Lote_nfe_numero'
      '  , v.Lote_nfe_Recibo'
      '  , v.Nfe_enviada'
      '  , v.Nfe_denegada'
      '  , v.Nfe_denegada_motivo'
      '  , v.caixa_ano'
      '  , v.caixa_num'
      '  , v.caixa_pdv'
      '  , v.Dataemissao'
      '  , v.Horaemissao'
      '  , v.Cancel_usuario'
      '  , v.Cancel_datahora'
      '  , v.Cancel_motivo'
      '  , v.Cfop'
      '  , v.Verificador_nfe'
      '  , v.Xml_nfe_filename'
      '  , v.Xml_nfe'
      '  , v.Vendedor_cod'
      '  , v.Usuario'
      '  , v.Formapagto_cod'
      '  , v.Condicaopagto_cod'
      '  , v.Venda_prazo'
      '  , v.Prazo_01'
      '  , v.Prazo_02'
      '  , v.Prazo_03'
      '  , v.Prazo_04'
      '  , v.Prazo_05'
      '  , v.Prazo_06'
      '  , v.Prazo_07'
      '  , v.Prazo_08'
      '  , v.Prazo_09'
      '  , v.Prazo_10'
      '  , v.Prazo_11'
      '  , v.Prazo_12'
      '  , v.nfe_modalidade_frete'
      '  , v.nfe_transportadora'
      '  , v.nfe_placa_veiculo'
      '  , v.nfe_placa_uf'
      '  , v.nfe_placa_rntc'
      '  , v.gerar_estoque_cliente'
      '  , t.nomeforn as transp_nome'
      '  , t.cnpj     as transp_cnpj'
      '  , t.inscest  as transp_iest'
      
        '  , t.ender || coalesce('#39' - '#39' || t.cidade, '#39#39') as transp_enderec' +
        'o'
      '  , c.Nome'
      '  , c.Bloqueado'
      '  , c.Bloqueado_motivo'
      '  , c.pessoa_fisica'
      '  , c.inscest'
      '  , Case when coalesce(v.totalcusto, 0) > 0'
      
        '      then ((v.totalvenda / coalesce(v.totalcusto, 0)) - 1) * 10' +
        '0'
      '      else 0.0'
      '    end Lucro_Calculado'
      'from TBVENDAS v'
      '  inner join TBCLIENTE c on (c.Codigo = v.Codcliente)'
      '  left join TBFORNECEDOR t on (t.codforn = v.nfe_transportadora)'
      'WHERE v.ANO = :ANO AND v.CODCONTROL = :CODCONTROL')
  end
  object dtsEmpresa: TDataSource
    DataSet = fdQryEmpresa
    Left = 960
    Top = 352
  end
  object dtsVendedor: TDataSource
    DataSet = fdQryVendedor
    Left = 960
    Top = 384
  end
  object dtsFormaPagto: TDataSource
    DataSet = cdsFormaPagto
    Left = 960
    Top = 416
  end
  object dtsCondicaoPagto: TDataSource
    DataSet = cdsCondicaoPagto
    Left = 960
    Top = 448
  end
  object DtSrcTabelaItens: TDataSource
    AutoEdit = False
    DataSet = cdsTabelaItens
    OnStateChange = DtSrcTabelaItensStateChange
    Left = 264
    Top = 312
  end
  object dtsTitulos: TDataSource
    AutoEdit = False
    DataSet = qryTitulos
    OnStateChange = DtSrcTabelaItensStateChange
    Left = 264
    Top = 344
  end
  object ppImprimir: TPopupMenu
    Left = 24
    Top = 312
    object nmImprimirVenda: TMenuItem
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
      Caption = '&Or'#231'amento / Venda'
      OnClick = ImprimirOrcamentoClick
    end
    object nmGerarImprimirBoletos: TMenuItem
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
      Caption = 'Gerar / Imprimir &Boletos'
      OnClick = nmGerarImprimirBoletosClick
    end
    object N1: TMenuItem
      Caption = '-'
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
      OnClick = nmImprimirDANFEClick
    end
    object nmImprimirNotaEntrega: TMenuItem
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
      Caption = 'Nota de Entrega (Termo de Recebimento)'
      OnClick = nmImprimirNotaEntregaClick
    end
    object nmImprimirNotaEntregaX: TMenuItem
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
      Caption = 'Nota de Entrega '#224' Domicilio'
      Enabled = False
      OnClick = nmImprimirNotaEntregaXClick
    end
    object nmImprimirCartaCredito: TMenuItem
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
      Caption = 'Carta de Cr'#233'dito'
      OnClick = nmImprimirCartaCreditoClick
    end
    object nmGerarReciboAvulso: TMenuItem
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
      Caption = '&Recibo Avulso'
      OnClick = nmGerarReciboAvulsoClick
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
      OnClick = nmImprimirDANFEClick
    end
    object N3: TMenuItem
      Caption = '-'
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
      Caption = '&Enviar E-mail para o Cliente'
      Enabled = False
      OnClick = nmEnviarEmailClienteClick
    end
  end
  object cdsTotalComprasAbertas: TDataSource
    DataSet = qryTotalComprasAbertas
    Left = 488
    Top = 297
  end
  object dtsVendaFormaPagto: TDataSource
    AutoEdit = False
    DataSet = cdsVendaFormaPagto
    Left = 488
    Top = 328
  end
  object dtsModalidadeFrete: TDataSource
    DataSet = fdQryModalidadeFrete
    Left = 960
    Top = 480
  end
  object dtsVendaVolume: TDataSource
    AutoEdit = False
    DataSet = cdsVendaVolume
    Left = 488
    Top = 360
  end
  object popupAuditoria: TPopupMenu
    Left = 60
    Top = 313
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
    object N4: TMenuItem
      Caption = '-'
    end
    object nmPpCarregarArquivoNFe: TMenuItem
      Caption = 'Carregar XML da Nota Fiscal'
      OnClick = nmPpCarregarArquivoNFeClick
    end
  end
  object dtsNFE: TDataSource
    DataSet = qryNFE
    Left = 264
    Top = 376
  end
  object ppCorrigirDadosNFe: TPopupMenu
    Left = 92
    Top = 313
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
    object nmPpCorrigirDadosEntrega: TMenuItem
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
      Caption = 'Dados de Entrega'
      OnClick = nmPpCorrigirDadosEntregaClick
    end
  end
  object opdNotas: TOpenDialog
    Left = 228
    Top = 377
  end
  object fdQryFormaPagto: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select '
      '    f.cod'
      '  , f.descri'
      '  , f.acrescimo'
      '  , f.conta_corrente'
      '  , f.debitar_limite_cliente'
      '  , f.formapagto_nfce'
      '  , f.formapagto_pdv'
      '  , f.formapagto_pdv_cupom_extra'
      '  , f.ativa'
      'from TBFORMPAGTO f')
    Left = 992
    Top = 416
  end
  object fdQryCondicaoPagto: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select '
      '    c.cond_cod'
      '  , c.cond_descricao'
      '  , c.cond_prazo'
      '  , c.cond_qtde_parcelas'
      '  , c.cond_prazo_01'
      '  , c.cond_prazo_02'
      '  , c.cond_prazo_03'
      '  , c.cond_prazo_04'
      '  , c.cond_prazo_05'
      '  , c.cond_prazo_06'
      '  , c.cond_prazo_07'
      '  , c.cond_prazo_08'
      '  , c.cond_prazo_09'
      '  , c.cond_prazo_10'
      '  , c.cond_prazo_11'
      '  , c.cond_prazo_12'
      '  , c.cond_descricao_full'
      '  , c.cond_descricao_pdv'
      '  , c.cond_pdv'
      '  , c.ativa'
      'from VW_CONDICAOPAGTO c')
    Left = 992
    Top = 448
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
    Left = 992
    Top = 352
  end
  object dtpFormaPagto: TDataSetProvider
    DataSet = fdQryFormaPagto
    Left = 1024
    Top = 416
  end
  object cdsFormaPagto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dtpFormaPagto'
    Left = 1056
    Top = 416
  end
  object dtpCondicaoPagto: TDataSetProvider
    DataSet = fdQryCondicaoPagto
    Left = 1024
    Top = 448
  end
  object cdsCondicaoPagto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dtpCondicaoPagto'
    Left = 1056
    Top = 448
  end
  object fdQryVendedor: TFDQuery
    Filter = 'ativo = 1'
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select '
      '    v.*'
      'from TBVENDEDOR v')
    Left = 992
    Top = 384
  end
  object fdQryLotes: TFDQuery
    Connection = DMBusiness.fdConexao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    e.id'
      '  , e.descricao'
      '  , e.data_fabricacao'
      '  , e.data_validade'
      '  , e.qtde       as qtde_estoque'
      '  , c.quantidade as qtde_cliente'
      'from TBESTOQUE_ALMOX e'
      
        '  left join TBCLIENTE_ESTOQUE c on (c.cod_cliente = :cliente and' +
        ' c.cod_produto = e.produto and coalesce(c.lote_id, '#39#39') = coalesc' +
        'e(e.id, '#39#39'))'
      'where e.empresa = :empresa'
      '  and e.centro_custo = :centro_custo'
      '  and e.produto = :produto'
      
        '  and ((e.qtde > 0.0) or (coalesce(c.quantidade, 0) > 0.0) or (:' +
        'todos = 1))'
      'order by'
      '  e.descricao')
    Left = 992
    Top = 320
    ParamData = <
      item
        Name = 'CLIENTE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'EMPRESA'
        DataType = ftString
        ParamType = ptInput
        Size = 18
        Value = Null
      end
      item
        Name = 'CENTRO_CUSTO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'PRODUTO'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Name = 'TODOS'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object dtsLotes: TDataSource
    DataSet = fdQryLotes
    Left = 960
    Top = 320
  end
  object fdQryModalidadeFrete: TFDQuery
    Connection = DMBusiness.fdConexao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select *'
      'from VW_MODALIDADE_FRETE')
    Left = 992
    Top = 480
  end
  object qryProduto: TFDQuery
    Connection = DMBusiness.fdConexao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    p.Codigo'
      '  , p.Cod'
      '  , p.Descri'
      '  , p.Descri_apresentacao'
      '  , p.Modelo'
      '  , p.Preco'
      '  , p.Preco_Promocao'
      '  , p.Referencia'
      '  , r.referencia   as referencia_cliente'
      '  , p.anvisa       as referencia_anvisa'
      '  , p.codbarra_ean as referencia_fornecedor'
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
      '  , p.Aliquota_tipo'
      '  , p.Aliquota'
      '  , p.Aliquota_csosn'
      '  , p.Aliquota_pis'
      '  , p.Aliquota_cofins'
      '  , p.Percentual_reducao_BC'
      '  , p.Valor_ipi'
      '  , p.Reserva'
      '  , p.Movimenta_Estoque'
      '  , p. estoque_aprop_lote'
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
      
        '  left join TBPRODUTO_CLIENTE r on (r.produto = p.cod and r.clie' +
        'nte = :cliente)'
      'where p.Codigo = :Codigo')
    Left = 824
    Top = 320
    ParamData = <
      item
        Name = 'CLIENTE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object qryCFOP: TFDQuery
    Connection = DMBusiness.fdConexao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    c.Cfop_cod'
      '  , c.Cfop_descricao'
      '  , c.Cfop_cst_padrao_entrada'
      '  , c.Cfop_cst_padrao_saida'
      'from TBCFOP c'
      'where c.Cfop_cod = :Cfop_cod')
    Left = 824
    Top = 368
    ParamData = <
      item
        Name = 'CFOP_COD'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object qryTotalComprasAbertas: TFDQuery
    Connection = DMBusiness.fdConexao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    g.Valor_limite'
      '  , g.Valor_compras_abertas'
      '  , g.Valor_limite_disponivel'
      'from GET_LIMITE_DISPONIVEL_CLIENTE(:CODIGO) g')
    Left = 520
    Top = 296
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object cdsVendaFormaPagto: TFDQuery
    BeforePost = cdsVendaFormaPagtoBeforePost
    OnNewRecord = cdsVendaFormaPagtoNewRecord
    CachedUpdates = True
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    UpdateObject = updVendaFormaPagto
    SQL.Strings = (
      'Select'
      '    f.ano_venda'
      '  , f.controle_venda'
      '  , f.formapagto_cod'
      '  , f.condicaopagto_cod'
      '  , f.venda_prazo'
      '  , f.valor_fpagto'
      '  , f.prazo_01'
      '  , f.prazo_02'
      '  , f.prazo_03'
      '  , f.prazo_04'
      '  , f.prazo_05'
      '  , f.prazo_06'
      '  , f.prazo_07'
      '  , f.prazo_08'
      '  , f.prazo_09'
      '  , f.prazo_10'
      '  , f.prazo_11'
      '  , f.prazo_12'
      'from TBVENDAS_FORMAPAGTO f')
    Left = 520
    Top = 328
    object cdsVendaFormaPagtoANO_VENDA: TSmallintField
      FieldName = 'ANO_VENDA'
      Origin = 'ANO_VENDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsVendaFormaPagtoCONTROLE_VENDA: TIntegerField
      FieldName = 'CONTROLE_VENDA'
      Origin = 'CONTROLE_VENDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsVendaFormaPagtoFORMAPAGTO_COD: TSmallintField
      DisplayLabel = 'Forma de Pagamento'
      FieldName = 'FORMAPAGTO_COD'
      Origin = 'FORMAPAGTO_COD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsVendaFormaPagtoCONDICAOPAGTO_COD: TSmallintField
      DisplayLabel = 'Condi'#231#227'o de Pagamento'
      FieldName = 'CONDICAOPAGTO_COD'
      Origin = 'CONDICAOPAGTO_COD'
    end
    object cdsVendaFormaPagtoVALOR_FPAGTO: TFMTBCDField
      FieldName = 'VALOR_FPAGTO'
      Origin = 'VALOR_FPAGTO'
      Precision = 18
      Size = 2
    end
    object cdsVendaFormaPagtoVENDA_PRAZO: TSmallintField
      FieldName = 'VENDA_PRAZO'
      Origin = 'VENDA_PRAZO'
      Required = True
    end
    object cdsVendaFormaPagtoPRAZO_01: TSmallintField
      FieldName = 'PRAZO_01'
      Origin = 'PRAZO_01'
    end
    object cdsVendaFormaPagtoPRAZO_02: TSmallintField
      FieldName = 'PRAZO_02'
      Origin = 'PRAZO_02'
    end
    object cdsVendaFormaPagtoPRAZO_03: TSmallintField
      FieldName = 'PRAZO_03'
      Origin = 'PRAZO_03'
    end
    object cdsVendaFormaPagtoPRAZO_04: TSmallintField
      FieldName = 'PRAZO_04'
      Origin = 'PRAZO_04'
    end
    object cdsVendaFormaPagtoPRAZO_05: TSmallintField
      FieldName = 'PRAZO_05'
      Origin = 'PRAZO_05'
    end
    object cdsVendaFormaPagtoPRAZO_06: TSmallintField
      FieldName = 'PRAZO_06'
      Origin = 'PRAZO_06'
    end
    object cdsVendaFormaPagtoPRAZO_07: TSmallintField
      FieldName = 'PRAZO_07'
      Origin = 'PRAZO_07'
    end
    object cdsVendaFormaPagtoPRAZO_08: TSmallintField
      FieldName = 'PRAZO_08'
      Origin = 'PRAZO_08'
    end
    object cdsVendaFormaPagtoPRAZO_09: TSmallintField
      FieldName = 'PRAZO_09'
      Origin = 'PRAZO_09'
    end
    object cdsVendaFormaPagtoPRAZO_10: TSmallintField
      FieldName = 'PRAZO_10'
      Origin = 'PRAZO_10'
    end
    object cdsVendaFormaPagtoPRAZO_11: TSmallintField
      FieldName = 'PRAZO_11'
      Origin = 'PRAZO_11'
    end
    object cdsVendaFormaPagtoPRAZO_12: TSmallintField
      FieldName = 'PRAZO_12'
      Origin = 'PRAZO_12'
    end
    object cdsVendaFormaPagtoFormaPagto: TStringField
      DisplayLabel = 'Forma de Pagamento'
      FieldKind = fkLookup
      FieldName = 'FormaPagto'
      LookupDataSet = cdsFormaPagto
      LookupKeyFields = 'COD'
      LookupResultField = 'DESCRI'
      KeyFields = 'FORMAPAGTO_COD'
      ProviderFlags = []
      Size = 50
      Lookup = True
    end
    object cdsVendaFormaPagtoCondicaoPagto: TStringField
      DisplayLabel = 'Condi'#231#227'o de Pagamento'
      FieldKind = fkLookup
      FieldName = 'CondicaoPagto'
      LookupDataSet = cdsCondicaoPagto
      LookupKeyFields = 'COND_COD'
      LookupResultField = 'COND_DESCRICAO_FULL'
      KeyFields = 'CONDICAOPAGTO_COD'
      ProviderFlags = []
      Size = 250
      Lookup = True
    end
  end
  object updVendaFormaPagto: TFDUpdateSQL
    Connection = DMBusiness.fdConexao
    InsertSQL.Strings = (
      'INSERT INTO TBVENDAS_FORMAPAGTO'
      '(ANO_VENDA, CONTROLE_VENDA, FORMAPAGTO_COD, CONDICAOPAGTO_COD, '
      '  VENDA_PRAZO, VALOR_FPAGTO, PRAZO_01, PRAZO_02, '
      '  PRAZO_03, PRAZO_04, PRAZO_05, PRAZO_06, '
      '  PRAZO_07, PRAZO_08, PRAZO_09, PRAZO_10, '
      '  PRAZO_11, PRAZO_12)'
      
        'VALUES (:NEW_ANO_VENDA, :NEW_CONTROLE_VENDA, :NEW_FORMAPAGTO_COD' +
        ', :NEW_CONDICAOPAGTO_COD, '
      
        '  :NEW_VENDA_PRAZO, :NEW_VALOR_FPAGTO, :NEW_PRAZO_01, :NEW_PRAZO' +
        '_02, '
      '  :NEW_PRAZO_03, :NEW_PRAZO_04, :NEW_PRAZO_05, :NEW_PRAZO_06, '
      '  :NEW_PRAZO_07, :NEW_PRAZO_08, :NEW_PRAZO_09, :NEW_PRAZO_10, '
      '  :NEW_PRAZO_11, :NEW_PRAZO_12)'
      'RETURNING ANO_VENDA, CONTROLE_VENDA')
    ModifySQL.Strings = (
      'UPDATE TBVENDAS_FORMAPAGTO'
      
        'SET ANO_VENDA = :NEW_ANO_VENDA, CONTROLE_VENDA = :NEW_CONTROLE_V' +
        'ENDA, '
      
        '  FORMAPAGTO_COD = :NEW_FORMAPAGTO_COD, CONDICAOPAGTO_COD = :NEW' +
        '_CONDICAOPAGTO_COD, '
      
        '  VENDA_PRAZO = :NEW_VENDA_PRAZO, VALOR_FPAGTO = :NEW_VALOR_FPAG' +
        'TO, '
      
        '  PRAZO_01 = :NEW_PRAZO_01, PRAZO_02 = :NEW_PRAZO_02, PRAZO_03 =' +
        ' :NEW_PRAZO_03, '
      
        '  PRAZO_04 = :NEW_PRAZO_04, PRAZO_05 = :NEW_PRAZO_05, PRAZO_06 =' +
        ' :NEW_PRAZO_06, '
      
        '  PRAZO_07 = :NEW_PRAZO_07, PRAZO_08 = :NEW_PRAZO_08, PRAZO_09 =' +
        ' :NEW_PRAZO_09, '
      
        '  PRAZO_10 = :NEW_PRAZO_10, PRAZO_11 = :NEW_PRAZO_11, PRAZO_12 =' +
        ' :NEW_PRAZO_12'
      
        'WHERE ANO_VENDA = :OLD_ANO_VENDA AND CONTROLE_VENDA = :OLD_CONTR' +
        'OLE_VENDA AND '
      '  FORMAPAGTO_COD = :OLD_FORMAPAGTO_COD'
      'RETURNING ANO_VENDA, CONTROLE_VENDA')
    DeleteSQL.Strings = (
      'DELETE FROM TBVENDAS_FORMAPAGTO'
      
        'WHERE ANO_VENDA = :OLD_ANO_VENDA AND CONTROLE_VENDA = :OLD_CONTR' +
        'OLE_VENDA AND '
      '  FORMAPAGTO_COD = :OLD_FORMAPAGTO_COD')
    FetchRowSQL.Strings = (
      
        'SELECT ANO_VENDA, CONTROLE_VENDA, FORMAPAGTO_COD, CONDICAOPAGTO_' +
        'COD, '
      
        '  VENDA_PRAZO, VALOR_FPAGTO, VALOR_RECEBIDO, PRAZO_01, PRAZO_02,' +
        ' '
      '  PRAZO_03, PRAZO_04, PRAZO_05, PRAZO_06, PRAZO_07, PRAZO_08, '
      '  PRAZO_09, PRAZO_10, PRAZO_11, PRAZO_12'
      'FROM TBVENDAS_FORMAPAGTO'
      
        'WHERE ANO_VENDA = :ANO_VENDA AND CONTROLE_VENDA = :CONTROLE_VEND' +
        'A AND '
      '  FORMAPAGTO_COD = :FORMAPAGTO_COD')
    Left = 552
    Top = 328
  end
  object cdsVendaVolume: TFDQuery
    OnNewRecord = cdsVendaVolumeNewRecord
    CachedUpdates = True
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    UpdateObject = updVendaVolume
    SQL.Strings = (
      'Select'
      '    v.ano_venda'
      '  , v.controle_venda'
      '  , v.sequencial'
      '  , v.numero'
      '  , v.quantidade'
      '  , v.especie'
      '  , v.marca'
      '  , v.peso_bruto'
      '  , v.peso_liquido'
      '  , v.cubagem'
      'from TBVENDAS_VOLUME v')
    Left = 520
    Top = 360
    object cdsVendaVolumeANO_VENDA: TSmallintField
      FieldName = 'ANO_VENDA'
      Origin = 'ANO_VENDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsVendaVolumeCONTROLE_VENDA: TIntegerField
      FieldName = 'CONTROLE_VENDA'
      Origin = 'CONTROLE_VENDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsVendaVolumeSEQUENCIAL: TSmallintField
      FieldName = 'SEQUENCIAL'
      Origin = 'SEQUENCIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsVendaVolumeNUMERO: TStringField
      DisplayLabel = 'N'#250'mero do Volume'
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Size = 50
    end
    object cdsVendaVolumeQUANTIDADE: TSmallintField
      DisplayLabel = 'Quantidade de Volumes'
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
    end
    object cdsVendaVolumeESPECIE: TStringField
      DisplayLabel = 'Esp'#233'cie'
      FieldName = 'ESPECIE'
      Origin = 'ESPECIE'
      Size = 50
    end
    object cdsVendaVolumeMARCA: TStringField
      DisplayLabel = 'Marca'
      FieldName = 'MARCA'
      Origin = 'MARCA'
      Size = 50
    end
    object cdsVendaVolumePESO_BRUTO: TFMTBCDField
      FieldName = 'PESO_BRUTO'
      Origin = 'PESO_BRUTO'
      Precision = 18
      Size = 3
    end
    object cdsVendaVolumePESO_LIQUIDO: TFMTBCDField
      FieldName = 'PESO_LIQUIDO'
      Origin = 'PESO_LIQUIDO'
      Precision = 18
      Size = 3
    end
    object cdsVendaVolumeCUBAGEM: TBCDField
      FieldName = 'CUBAGEM'
      Origin = 'CUBAGEM'
      Precision = 18
    end
  end
  object updVendaVolume: TFDUpdateSQL
    Connection = DMBusiness.fdConexao
    InsertSQL.Strings = (
      'INSERT INTO TBVENDAS_VOLUME'
      '(ANO_VENDA, CONTROLE_VENDA, SEQUENCIAL, NUMERO, '
      '  QUANTIDADE, ESPECIE, MARCA, PESO_BRUTO, '
      '  PESO_LIQUIDO, CUBAGEM)'
      
        'VALUES (:NEW_ANO_VENDA, :NEW_CONTROLE_VENDA, :NEW_SEQUENCIAL, :N' +
        'EW_NUMERO, '
      '  :NEW_QUANTIDADE, :NEW_ESPECIE, :NEW_MARCA, :NEW_PESO_BRUTO, '
      '  :NEW_PESO_LIQUIDO, :NEW_CUBAGEM)')
    ModifySQL.Strings = (
      'UPDATE TBVENDAS_VOLUME'
      
        'SET ANO_VENDA = :NEW_ANO_VENDA, CONTROLE_VENDA = :NEW_CONTROLE_V' +
        'ENDA, '
      
        '  SEQUENCIAL = :NEW_SEQUENCIAL, NUMERO = :NEW_NUMERO, QUANTIDADE' +
        ' = :NEW_QUANTIDADE, '
      
        '  ESPECIE = :NEW_ESPECIE, MARCA = :NEW_MARCA, PESO_BRUTO = :NEW_' +
        'PESO_BRUTO, '
      '  PESO_LIQUIDO = :NEW_PESO_LIQUIDO, CUBAGEM = :NEW_CUBAGEM'
      
        'WHERE ANO_VENDA = :OLD_ANO_VENDA AND CONTROLE_VENDA = :OLD_CONTR' +
        'OLE_VENDA AND '
      '  SEQUENCIAL = :OLD_SEQUENCIAL')
    DeleteSQL.Strings = (
      'DELETE FROM TBVENDAS_VOLUME'
      
        'WHERE ANO_VENDA = :OLD_ANO_VENDA AND CONTROLE_VENDA = :OLD_CONTR' +
        'OLE_VENDA AND '
      '  SEQUENCIAL = :OLD_SEQUENCIAL')
    FetchRowSQL.Strings = (
      
        'SELECT ANO_VENDA, CONTROLE_VENDA, SEQUENCIAL, NUMERO, QUANTIDADE' +
        ', ESPECIE, '
      '  MARCA, PESO_BRUTO, PESO_LIQUIDO, CUBAGEM'
      'FROM TBVENDAS_VOLUME'
      
        'WHERE ANO_VENDA = :ANO_VENDA AND CONTROLE_VENDA = :CONTROLE_VEND' +
        'A AND '
      '  SEQUENCIAL = :SEQUENCIAL')
    Left = 552
    Top = 360
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
      '    i.Ano'
      '  , i.Codcontrol'
      '  , i.Seq'
      '  , i.Codprod'
      '  , i.Codemp'
      '  , i.Codcli'
      '  , i.Codcliente'
      '  , i.Codvendedor'
      '  , i.Dtvenda'
      '  , i.Qtde'
      '  , i.Lote_id'
      '  , i.Referencia'
      '  , i.Punit'
      '  , i.Punit_Promocao'
      '  , i.Desconto'
      '  , i.Desconto_valor'
      '  , i.Pfinal'
      '  , i.Qtdefinal'
      '  , i.Unid_cod'
      '  , i.Cfop_cod'
      '  , coalesce(nullif(trim(i.Cst), '#39#39'), p.Cst) as Cst'
      '  , coalesce(nullif(trim(i.Csosn), '#39#39'), p.Csosn) as Csosn'
      '  , i.Aliquota'
      '  , i.Aliquota_csosn'
      '  , i.Aliquota_pis'
      '  , i.Aliquota_cofins'
      '  , i.Valor_ipi'
      '  , i.Percentual_reducao_BC'
      '  , i.Total_bruto'
      '  , i.Total_desconto'
      '  , i.Total_liquido'
      '  , p.Descri'
      '  , p.Descri_apresentacao'
      '  , p.Qtde as Estoque'
      '  , p.Reserva'
      '  , u.Unp_sigla'
      '  , o.Cfop_descricao'
      '  , p.Movimenta_Estoque'
      '  , p.estoque_aprop_lote'
      '  , coalesce(ib.ncm_ibpt, p.ncm_sh) as ncm_sh'
      'from TVENDASITENS i'
      '  inner join TBPRODUTO p on (p.Cod = i.Codprod)'
      '  left join TBUNIDADEPROD u on (u.Unp_cod = p.Codunidade)'
      '  left join TBCFOP o on (o.Cfop_cod = i.Cfop_cod)'
      '  left join SYS_IBPT ib on (ib.id_ibpt = p.tabela_ibpt)')
    Left = 296
    Top = 312
    object cdsTabelaItensANO: TSmallintField
      FieldName = 'ANO'
      Origin = 'ANO'
      Required = True
    end
    object cdsTabelaItensCODCONTROL: TIntegerField
      FieldName = 'CODCONTROL'
      Origin = 'CODCONTROL'
      Required = True
    end
    object cdsTabelaItensSEQ: TSmallintField
      Alignment = taCenter
      DisplayLabel = '#'
      FieldName = 'SEQ'
      Origin = 'SEQ'
      Required = True
      OnGetText = cdsTabelaItensSEQGetText
      DisplayFormat = '00'
    end
    object cdsTabelaItensCODPROD: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'CODPROD'
      Origin = 'CODPROD'
      Required = True
      Size = 10
    end
    object cdsTabelaItensCODEMP: TStringField
      FieldName = 'CODEMP'
      Origin = 'CODEMP'
      Size = 18
    end
    object cdsTabelaItensCODCLI: TStringField
      FieldName = 'CODCLI'
      Origin = 'CODCLI'
      Size = 18
    end
    object cdsTabelaItensCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
      Origin = 'CODCLIENTE'
    end
    object cdsTabelaItensCODVENDEDOR: TIntegerField
      FieldName = 'CODVENDEDOR'
      Origin = 'CODVENDEDOR'
    end
    object cdsTabelaItensDTVENDA: TSQLTimeStampField
      FieldName = 'DTVENDA'
      Origin = 'DTVENDA'
    end
    object cdsTabelaItensLOTE_ID: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE_ID'
      Origin = 'LOTE_ID'
      Size = 38
    end
    object cdsTabelaItensREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Origin = 'REFERENCIA'
      Size = 15
    end
    object cdsTabelaItensUNID_COD: TSmallintField
      FieldName = 'UNID_COD'
      Origin = 'UNID_COD'
    end
    object cdsTabelaItensCFOP_COD: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'CFOP'
      FieldName = 'CFOP_COD'
      Origin = 'CFOP_COD'
    end
    object cdsTabelaItensCST: TStringField
      Alignment = taCenter
      AutoGenerateValue = arDefault
      FieldName = 'CST'
      Origin = 'CST'
      ProviderFlags = []
      Size = 3
    end
    object cdsTabelaItensCSOSN: TStringField
      Alignment = taCenter
      AutoGenerateValue = arDefault
      FieldName = 'CSOSN'
      Origin = 'CSOSN'
      ProviderFlags = []
      Size = 3
    end
    object cdsTabelaItensDESCRI: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Nome do produto'
      FieldName = 'DESCRI'
      Origin = 'DESCRI'
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
    object cdsTabelaItensUNP_SIGLA: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Und.'
      FieldName = 'UNP_SIGLA'
      Origin = 'UNP_SIGLA'
      ProviderFlags = []
      Size = 5
    end
    object cdsTabelaItensCFOP_DESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CFOP_DESCRICAO'
      Origin = 'CFOP_DESCRICAO'
      ProviderFlags = []
      Size = 250
    end
    object cdsTabelaItensMOVIMENTA_ESTOQUE: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'MOVIMENTA_ESTOQUE'
      Origin = 'MOVIMENTA_ESTOQUE'
      ProviderFlags = []
    end
    object cdsTabelaItensESTOQUE_APROP_LOTE: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'ESTOQUE_APROP_LOTE'
      Origin = 'ESTOQUE_APROP_LOTE'
      ProviderFlags = []
    end
    object cdsTabelaItensNCM_SH: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NCM_SH'
      Origin = 'NCM_SH'
      ProviderFlags = []
      Size = 10
    end
    object cdsTabelaItensQTDE: TFMTBCDField
      FieldName = 'QTDE'
      Origin = 'QTDE'
      Required = True
      Precision = 18
      Size = 3
    end
    object cdsTabelaItensPUNIT: TFMTBCDField
      FieldName = 'PUNIT'
      Origin = 'PUNIT'
      Precision = 18
      Size = 2
    end
    object cdsTabelaItensPUNIT_PROMOCAO: TFMTBCDField
      FieldName = 'PUNIT_PROMOCAO'
      Origin = 'PUNIT_PROMOCAO'
      Precision = 18
      Size = 2
    end
    object cdsTabelaItensDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      Precision = 18
      Size = 3
    end
    object cdsTabelaItensDESCONTO_VALOR: TBCDField
      FieldName = 'DESCONTO_VALOR'
      Origin = 'DESCONTO_VALOR'
      Precision = 18
    end
    object cdsTabelaItensPFINAL: TFMTBCDField
      FieldName = 'PFINAL'
      Origin = 'PFINAL'
      Precision = 18
      Size = 2
    end
    object cdsTabelaItensQTDEFINAL: TFMTBCDField
      FieldName = 'QTDEFINAL'
      Origin = 'QTDEFINAL'
      Required = True
      Precision = 18
      Size = 3
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
    object cdsTabelaItensVALOR_IPI: TFMTBCDField
      FieldName = 'VALOR_IPI'
      Origin = 'VALOR_IPI'
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
    object cdsTabelaItensTOTAL_DESCONTO: TFMTBCDField
      FieldName = 'TOTAL_DESCONTO'
      Origin = 'TOTAL_DESCONTO'
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
      'INSERT INTO TVENDASITENS'
      '(ANO, CODCONTROL, CODEMP, SEQ, CODPROD, '
      '  REFERENCIA, CODCLIENTE, CODCLI, CODVENDEDOR, '
      '  DTVENDA, QTDE, LOTE_ID, PUNIT, PUNIT_PROMOCAO, '
      '  DESCONTO, DESCONTO_VALOR, PFINAL, QTDEFINAL, '
      '  UNID_COD, CFOP_COD, CST, CSOSN, ALIQUOTA, '
      '  ALIQUOTA_CSOSN, ALIQUOTA_PIS, ALIQUOTA_COFINS, '
      '  VALOR_IPI, PERCENTUAL_REDUCAO_BC, TOTAL_BRUTO, '
      '  TOTAL_DESCONTO, TOTAL_LIQUIDO)'
      
        'VALUES (:NEW_ANO, :NEW_CODCONTROL, :NEW_CODEMP, :NEW_SEQ, :NEW_C' +
        'ODPROD, '
      
        '  :NEW_REFERENCIA, :NEW_CODCLIENTE, :NEW_CODCLI, :NEW_CODVENDEDO' +
        'R, '
      
        '  :NEW_DTVENDA, :NEW_QTDE, :NEW_LOTE_ID, :NEW_PUNIT, :NEW_PUNIT_' +
        'PROMOCAO, '
      
        '  :NEW_DESCONTO, :NEW_DESCONTO_VALOR, :NEW_PFINAL, :NEW_QTDEFINA' +
        'L, '
      
        '  :NEW_UNID_COD, :NEW_CFOP_COD, :NEW_CST, :NEW_CSOSN, :NEW_ALIQU' +
        'OTA, '
      '  :NEW_ALIQUOTA_CSOSN, :NEW_ALIQUOTA_PIS, :NEW_ALIQUOTA_COFINS, '
      '  :NEW_VALOR_IPI, :NEW_PERCENTUAL_REDUCAO_BC, :NEW_TOTAL_BRUTO, '
      '  :NEW_TOTAL_DESCONTO, :NEW_TOTAL_LIQUIDO)')
    ModifySQL.Strings = (
      'UPDATE TVENDASITENS'
      
        'SET ANO = :NEW_ANO, CODCONTROL = :NEW_CODCONTROL, CODEMP = :NEW_' +
        'CODEMP, '
      
        '  SEQ = :NEW_SEQ, CODPROD = :NEW_CODPROD, REFERENCIA = :NEW_REFE' +
        'RENCIA, '
      
        '  CODCLIENTE = :NEW_CODCLIENTE, CODCLI = :NEW_CODCLI, CODVENDEDO' +
        'R = :NEW_CODVENDEDOR, '
      
        '  DTVENDA = :NEW_DTVENDA, QTDE = :NEW_QTDE, LOTE_ID = :NEW_LOTE_' +
        'ID, '
      '  PUNIT = :NEW_PUNIT, PUNIT_PROMOCAO = :NEW_PUNIT_PROMOCAO, '
      
        '  DESCONTO = :NEW_DESCONTO, DESCONTO_VALOR = :NEW_DESCONTO_VALOR' +
        ', '
      
        '  PFINAL = :NEW_PFINAL, QTDEFINAL = :NEW_QTDEFINAL, UNID_COD = :' +
        'NEW_UNID_COD, '
      '  CFOP_COD = :NEW_CFOP_COD, CST = :NEW_CST, CSOSN = :NEW_CSOSN, '
      
        '  ALIQUOTA = :NEW_ALIQUOTA, ALIQUOTA_CSOSN = :NEW_ALIQUOTA_CSOSN' +
        ', '
      
        '  ALIQUOTA_PIS = :NEW_ALIQUOTA_PIS, ALIQUOTA_COFINS = :NEW_ALIQU' +
        'OTA_COFINS, '
      
        '  VALOR_IPI = :NEW_VALOR_IPI, PERCENTUAL_REDUCAO_BC = :NEW_PERCE' +
        'NTUAL_REDUCAO_BC, '
      
        '  TOTAL_BRUTO = :NEW_TOTAL_BRUTO, TOTAL_DESCONTO = :NEW_TOTAL_DE' +
        'SCONTO, '
      '  TOTAL_LIQUIDO = :NEW_TOTAL_LIQUIDO'
      
        'WHERE ANO = :OLD_ANO AND CODCONTROL = :OLD_CODCONTROL AND SEQ = ' +
        ':OLD_SEQ AND '
      '  CODPROD = :OLD_CODPROD')
    DeleteSQL.Strings = (
      'DELETE FROM TVENDASITENS'
      
        'WHERE ANO = :OLD_ANO AND CODCONTROL = :OLD_CODCONTROL AND SEQ = ' +
        ':OLD_SEQ AND '
      '  CODPROD = :OLD_CODPROD')
    FetchRowSQL.Strings = (
      'Select'
      '    i.Ano'
      '  , i.Codcontrol'
      '  , i.Seq'
      '  , i.Codprod'
      '  , i.Codemp'
      '  , i.Codcli'
      '  , i.Codcliente'
      '  , i.Codvendedor'
      '  , i.Dtvenda'
      '  , i.Qtde'
      '  , i.Lote_id'
      '  , i.Referencia'
      '  , i.Punit'
      '  , i.Punit_Promocao'
      '  , i.Desconto'
      '  , i.Desconto_valor'
      '  , i.Pfinal'
      '  , i.Qtdefinal'
      '  , i.Unid_cod'
      '  , i.Cfop_cod'
      '  , coalesce(nullif(trim(i.Cst), '#39#39'), p.Cst) as Cst'
      '  , coalesce(nullif(trim(i.Csosn), '#39#39'), p.Csosn) as Csosn'
      '  , i.Aliquota'
      '  , i.Aliquota_csosn'
      '  , i.Aliquota_pis'
      '  , i.Aliquota_cofins'
      '  , i.Valor_ipi'
      '  , i.Percentual_reducao_BC'
      '  , i.Total_bruto'
      '  , i.Total_desconto'
      '  , i.Total_liquido'
      '  , p.Descri'
      '  , p.Descri_apresentacao'
      '  , p.Qtde as Estoque'
      '  , p.Reserva'
      '  , u.Unp_sigla'
      '  , o.Cfop_descricao'
      '  , p.Movimenta_Estoque'
      '  , p.estoque_aprop_lote'
      '  , coalesce(ib.ncm_ibpt, p.ncm_sh) as ncm_sh'
      'from TVENDASITENS i'
      '  inner join TBPRODUTO p on (p.Cod = i.Codprod)'
      '  left join TBUNIDADEPROD u on (u.Unp_cod = p.Codunidade)'
      '  left join TBCFOP o on (o.Cfop_cod = i.Cfop_cod)'
      '  left join SYS_IBPT ib on (ib.id_ibpt = p.tabela_ibpt)'
      
        'WHERE i.ANO = :ANO AND i.CODCONTROL = :CODCONTROL AND i.SEQ = :S' +
        'EQ AND i.CODPROD = :CODPROD')
    Left = 328
    Top = 312
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
      '  and n.ANOVENDA = :anovenda'
      '  and n.NUMVENDA = :numvenda')
    Left = 296
    Top = 376
    ParamData = <
      item
        Name = 'EMPRESA'
        DataType = ftString
        ParamType = ptInput
        Size = 18
        Value = Null
      end
      item
        Name = 'ANOVENDA'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Name = 'NUMVENDA'
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
      '  :NEW_LOTE_NUM)')
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
      '  MODELO = :OLD_MODELO')
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
    Left = 328
    Top = 376
  end
  object qryTitulos: TFDQuery
    OnCalcFields = qryTitulosCalcFields
    Connection = DMBusiness.fdConexao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    r.Anolanc'
      '  , r.numlanc'
      '  , r.parcela'
      '  , r.codbanco'
      '  , r.nossonumero'
      '  , r.cnpj'
      '  , r.tippag'
      '  , r.dtemiss'
      '  , r.dtvenc'
      '  , r.valorrec'
      '  , r.percentjuros'
      '  , r.percentmulta'
      '  , r.percentdesconto'
      '  , r.valorrectot'
      '  , r.valorsaldo'
      '  , r.dataprocessoboleto'
      '  , r.Baixado'
      '  , Case when r.Baixado = 1 then '#39'X'#39' else '#39'.'#39' end as Baixado_'
      '  , r.Dtrec'
      '  , r.forma_pagto'
      '  , r.status'
      ''
      '  , b.seq         as pgto_seq'
      '  , b.usuario     as pgto_usuario'
      '  , b.data_pagto  as pgto_data'
      '  , b.forma_pagto as pgto_forma'
      '  , b.valor_baixa as pgto_valor'
      '  , Case when r.valorrectot = b.valor_baixa'
      '      then 1'
      '      else 0'
      '    end as pgto_ok'
      'from TBCONTREC r'
      
        '  left join TBCONTREC_BAIXA b on (b.anolanc = r.anolanc and b.nu' +
        'mlanc = r.numlanc and b.seq = 1)')
    Left = 296
    Top = 344
    object qryTitulosANOLANC: TSmallintField
      FieldName = 'ANOLANC'
      Origin = 'ANOLANC'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryTitulosNUMLANC: TIntegerField
      FieldName = 'NUMLANC'
      Origin = 'NUMLANC'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryTitulosPARCELA: TSmallintField
      Alignment = taCenter
      FieldName = 'PARCELA'
      Origin = 'PARCELA'
      DisplayFormat = '00'
    end
    object qryTitulosCODBANCO: TIntegerField
      FieldName = 'CODBANCO'
      Origin = 'CODBANCO'
    end
    object qryTitulosNOSSONUMERO: TStringField
      FieldName = 'NOSSONUMERO'
      Origin = 'NOSSONUMERO'
    end
    object qryTitulosCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      Size = 18
    end
    object qryTitulosTIPPAG: TStringField
      FieldName = 'TIPPAG'
      Origin = 'TIPPAG'
      Size = 35
    end
    object qryTitulosDTEMISS: TDateField
      Alignment = taCenter
      FieldName = 'DTEMISS'
      Origin = 'DTEMISS'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryTitulosDTVENC: TDateField
      Alignment = taCenter
      FieldName = 'DTVENC'
      Origin = 'DTVENC'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryTitulosDATAPROCESSOBOLETO: TDateField
      FieldName = 'DATAPROCESSOBOLETO'
      Origin = 'DATAPROCESSOBOLETO'
    end
    object qryTitulosBAIXADO: TSmallintField
      FieldName = 'BAIXADO'
      Origin = 'BAIXADO'
      Required = True
    end
    object qryTitulosBAIXADO_: TStringField
      Alignment = taCenter
      AutoGenerateValue = arDefault
      FieldName = 'BAIXADO_'
      Origin = 'BAIXADO_'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qryTitulosDTREC: TDateField
      Alignment = taCenter
      FieldName = 'DTREC'
      Origin = 'DTREC'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryTitulosFORMA_PAGTO: TSmallintField
      FieldName = 'FORMA_PAGTO'
      Origin = 'FORMA_PAGTO'
    end
    object qryTitulosSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Size = 12
    end
    object qryTitulosPGTO_SEQ: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'PGTO_SEQ'
      Origin = 'SEQ'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryTitulosPGTO_USUARIO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PGTO_USUARIO'
      Origin = 'USUARIO'
      ProviderFlags = []
      ReadOnly = True
      Size = 12
    end
    object qryTitulosPGTO_DATA: TDateField
      Alignment = taCenter
      AutoGenerateValue = arDefault
      FieldName = 'PGTO_DATA'
      Origin = 'DATA_PAGTO'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryTitulosPGTO_FORMA: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'PGTO_FORMA'
      Origin = 'FORMA_PAGTO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryTitulosPGTO_VALOR: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PGTO_VALOR'
      Origin = 'VALOR_BAIXA'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qryTitulosPGTO_OK: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'PGTO_OK'
      Origin = 'PGTO_OK'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryTitulosLancamento: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'Lancamento'
      ProviderFlags = []
    end
    object qryTitulosVALORREC: TFMTBCDField
      FieldName = 'VALORREC'
      Origin = 'VALORREC'
      Precision = 18
      Size = 2
    end
    object qryTitulosPERCENTJUROS: TCurrencyField
      FieldName = 'PERCENTJUROS'
      Origin = 'PERCENTJUROS'
    end
    object qryTitulosPERCENTMULTA: TCurrencyField
      FieldName = 'PERCENTMULTA'
      Origin = 'PERCENTMULTA'
    end
    object qryTitulosPERCENTDESCONTO: TCurrencyField
      FieldName = 'PERCENTDESCONTO'
      Origin = 'PERCENTDESCONTO'
    end
    object qryTitulosVALORRECTOT: TFMTBCDField
      FieldName = 'VALORRECTOT'
      Origin = 'VALORRECTOT'
      Precision = 18
      Size = 2
    end
    object qryTitulosVALORSALDO: TFMTBCDField
      FieldName = 'VALORSALDO'
      Origin = 'VALORSALDO'
      Precision = 18
      Size = 2
    end
  end
  object spSetGerarTitulos: TFDStoredProc
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    StoredProcName = 'SET_GERAR_TITULOS'
    Left = 328
    Top = 344
    ParamData = <
      item
        Position = 1
        Name = 'ANOVENDA'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'NUMVENDA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'EMPRESA'
        DataType = ftString
        ParamType = ptOutput
        Size = 18
      end
      item
        Position = 4
        Name = 'CLIENTE_COD'
        DataType = ftInteger
        ParamType = ptOutput
      end
      item
        Position = 5
        Name = 'CLIENTE_CNPJ'
        DataType = ftString
        ParamType = ptOutput
        Size = 18
      end
      item
        Position = 6
        Name = 'PARCELAS'
        DataType = ftSmallint
        ParamType = ptOutput
      end
      item
        Position = 7
        Name = 'VALOR_TOTAL'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 8
        Name = 'PARCELA'
        DataType = ftSmallint
        ParamType = ptOutput
      end
      item
        Position = 9
        Name = 'EMISSAO'
        DataType = ftDate
        ParamType = ptOutput
      end
      item
        Position = 10
        Name = 'VENCIMENTO'
        DataType = ftDate
        ParamType = ptOutput
      end
      item
        Position = 11
        Name = 'VALOR_DOCUMENTO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 12
        Name = 'FORMA_PAGTO'
        DataType = ftSmallint
        ParamType = ptOutput
      end
      item
        Position = 13
        Name = 'DATA_FINALIZ_VENDA'
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
  object CdsRecibo: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 20
    Top = 361
    object CdsReciboANOLANC: TSmallintField
      FieldName = 'ANOLANC'
    end
    object CdsReciboNUMLANC: TIntegerField
      FieldName = 'NUMLANC'
    end
    object CdsReciboPARCELA: TSmallintField
      FieldName = 'PARCELA'
    end
    object CdsReciboCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
    end
    object CdsReciboRZSOC: TStringField
      FieldName = 'RZSOC'
      Size = 60
    end
    object CdsReciboEMPRESA_CNPJ: TStringField
      FieldName = 'EMPRESA_CNPJ'
      Size = 18
    end
    object CdsReciboNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object CdsReciboPESSOA_FISICA: TSmallintField
      FieldName = 'PESSOA_FISICA'
    end
    object CdsReciboCNPJ: TStringField
      FieldName = 'CNPJ'
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
    object CdsReciboVALORREC: TBCDField
      FieldName = 'VALORREC'
      Precision = 18
      Size = 2
    end
    object CdsReciboBANCO: TSmallintField
      FieldName = 'BANCO'
    end
    object CdsReciboBCO_NOME: TStringField
      FieldName = 'BCO_NOME'
      Size = 50
    end
    object CdsReciboNUMERO_CHEQUE: TStringField
      FieldName = 'NUMERO_CHEQUE'
      Size = 30
    end
    object CdsReciboPAGO_: TStringField
      FieldName = 'PAGO_'
      FixedChar = True
      Size = 1
    end
    object CdsReciboDOCBAIX: TStringField
      FieldName = 'DOCBAIX'
      Size = 15
    end
    object CdsReciboBAIXADO: TSmallintField
      FieldName = 'BAIXADO'
    end
    object CdsReciboSEQ: TSmallintField
      FieldName = 'SEQ'
    end
    object CdsReciboDATA_PAGTO: TDateField
      FieldName = 'DATA_PAGTO'
    end
    object CdsReciboFORMA_PAGTO: TSmallintField
      FieldName = 'FORMA_PAGTO'
    end
    object CdsReciboFORMA_PAGTO_DESC: TStringField
      FieldName = 'FORMA_PAGTO_DESC'
      Size = 250
    end
    object CdsReciboHISTORICO: TMemoField
      FieldName = 'HISTORICO'
      BlobType = ftMemo
    end
    object CdsReciboVALOR_BAIXA: TBCDField
      FieldName = 'VALOR_BAIXA'
      Precision = 18
      Size = 2
    end
    object CdsReciboVALOR_BAIXA_EXTENSO: TStringField
      FieldName = 'VALOR_BAIXA_EXTENSO'
      Size = 250
    end
  end
  object ACBrExtenso: TACBrExtenso
    StrMoeda = 'Real'
    StrMoedas = 'Reais'
    StrCentavo = 'Centavo'
    StrCentavos = 'Centavos'
    Left = 52
    Top = 361
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
    ReportOptions.Name = 'Visualizar Recibo Asulso (Vendas)'
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
    OnGetValue = FrReciboA4GetValue
    Left = 16
    Top = 408
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
          Top = 7.559060000000000000
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
            'Recibo Avulso ')
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
        Top = 763.465060000000000000
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
          Top = 15.118120000000000000
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
        Height = 317.480520000000000000
        Top = 177.637910000000000000
        Width = 718.110700000000000000
        Child = FrReciboA4.BndChildAssinatura
        DataSet = FrdRecibo
        DataSetName = 'FrdRecibo'
        RowCount = 0
        Stretched = True
        object Rich1: TfrxRichView
          AllowVectorExport = True
          Left = 37.795300000000000000
          Top = 192.756030000000000000
          Width = 642.520100000000000000
          Height = 124.724490000000000000
          StretchMode = smMaxHeight
          Frame.Typ = []
          GapX = 2.000000000000000000
          GapY = 1.000000000000000000
          RichEdit = {
            7B5C727466315C616E73695C616E7369637067313235325C64656666305C6E6F
            7569636F6D7061745C6465666C616E67313034367B5C666F6E7474626C7B5C66
            305C666E696C5C666368617273657430205461686F6D613B7D7D0D0A7B5C2A5C
            67656E657261746F722052696368656432302031302E302E31383336327D5C76
            6965776B696E64345C756331200D0A5C706172645C6C693134305C7269313830
            5C73623132305C73613132305C736C3336305C736C6D756C74315C716A5C6630
            5C66733230205265636562656D6F7320646F20636C69656E7465205C62205B46
            726452656369626F2E224E4F4D455F434C49454E5445225D5C623020206F2076
            616C6F72206465205C62205224205B494946283C46726452656369626F2E2256
            414C4F525F4241495841223E3D302C275F205F205F205F205F205F205F272C20
            466F726D6174466C6F617428272C302E3030272C203C46726452656369626F2E
            2256414C4F525F4241495841223E29295D205C623020285C62205B494946283C
            46726452656369626F2E2256414C4F525F4241495841223E203D20302C20275F
            205F205F205F205F205F205F205F205F205F205F205F205F205F205F205F205F
            205F205F205F205F205F205F205F205F205F205F205F205F205F205F205F205F
            205F205F205F205F205F205F205F205F205F205F205F205F205F205F205F205F
            272C203C46726452656369626F2E2256414C4F525F42414958415F455854454E
            534F223E295D295C623020207265666572656E7465205C276530205C62205B46
            726452656369626F2E22484953544F5249434F225D5C6230202C20706F722065
            7374652064616D6F732071756974615C2765375C2765336F20746F74616C2E5C
            7061720D0A7D0D0A00}
        end
        object Rich2: TfrxRichView
          AllowVectorExport = True
          Left = 37.795300000000000000
          Width = 642.520100000000000000
          Height = 192.756030000000000000
          Frame.Typ = []
          GapX = 2.000000000000000000
          GapY = 1.000000000000000000
          RichEdit = {
            7B5C727466315C616E73695C616E7369637067313235325C64656666305C6E6F
            7569636F6D7061745C6465666C616E67313034367B5C666F6E7474626C7B5C66
            305C666E696C5C666368617273657430205461686F6D613B7D7D0D0A7B5C2A5C
            67656E657261746F722052696368656432302031302E302E31383336327D5C76
            6965776B696E64345C756331200D0A5C706172645C6C693138305C7269313830
            5C73623132305C73613132305C736C3336305C736C6D756C74315C71635C625C
            66305C667332345C7061720D0A5C66733332205B546974756C6F5D5C7061720D
            0A0D0A5C706172645C6C693138305C72693138305C73623132305C7361313230
            5C736C3336305C736C6D756C74315C71725C62305C667332345C7061720D0A56
            616C6F723A205C62205224205B494946283C46726452656369626F2E2256414C
            4F525F4241495841223E203D20302C20275F205F205F205F205F205F205F272C
            20466F726D6174466C6F617428272C302E3030272C3C46726452656369626F2E
            2256414C4F525F4241495841223E29295D5C62305C7061720D0A7D0D0A00}
        end
      end
      object BndChildAssinatura: TfrxChild
        FillType = ftBrush
        Frame.Typ = []
        Height = 185.196970000000000000
        Top = 517.795610000000000000
        Width = 718.110700000000000000
        Stretched = True
        ToNRows = 0
        ToNRowsMode = rmCount
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 151.181200000000000000
          Top = 86.929190000000000000
          Width = 415.748300000000000000
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
          HAlign = haCenter
          Memo.UTF8W = (
            
              ' CNPJ.: [FormatMaskText('#39'##.###.###/####-##;0;'#39',<FrdRecibo."EMPR' +
              'ESA_CNPJ">)]')
          ParentFont = False
          WordWrap = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 151.181200000000000000
          Top = 68.031540000000000000
          Width = 415.748300000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            ' [FrdRecibo."EMPRESA"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Rich3: TfrxRichView
          AllowVectorExport = True
          Left = 37.795300000000000000
          Width = 642.520100000000000000
          Height = 30.236240000000000000
          StretchMode = smMaxHeight
          Frame.Typ = []
          GapX = 2.000000000000000000
          GapY = 1.000000000000000000
          RichEdit = {
            7B5C727466315C616E73695C616E7369637067313235325C64656666305C6E6F
            7569636F6D7061745C6465666C616E67313034367B5C666F6E7474626C7B5C66
            305C666E696C5C666368617273657430205461686F6D613B7D7D0D0A7B5C2A5C
            67656E657261746F722052696368656432302031302E302E31383336327D5C76
            6965776B696E64345C756331200D0A5C706172645C6C693134305C7269313830
            5C73623132305C73613132305C736C3336305C736C6D756C74315C71725C6630
            5C66733230205B4369646164655D2F5B55465D2C205F205F205F206465205F20
            5F205F205F205F205F205F205F205F205F205F205F205F205F206465205B4672
            6452656369626F2E22414E4F4C414E43225D2E5C7061720D0A7D0D0A00}
        end
        object FrdReciboFORMA_PAGTO_DESC: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 37.795300000000000000
          Top = 143.622140000000000000
          Width = 325.039580000000000000
          Height = 37.795300000000000000
          StretchMode = smMaxHeight
          DataField = 'FORMA_PAGTO_DESC'
          DataSet = FrdRecibo
          DataSetName = 'FrdRecibo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[FrdRecibo."FORMA_PAGTO_DESC"]')
          ParentFont = False
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
    Left = 48
    Top = 408
  end
end
