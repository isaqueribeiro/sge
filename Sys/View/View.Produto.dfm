inherited ViewProduto: TViewProduto
  Left = 383
  Top = 220
  ActiveControl = dbCodigo
  Caption = 'Cadastro de Produtos/Servi'#231'os'
  ClientHeight = 586
  ClientWidth = 961
  OldCreateOrder = True
  ExplicitWidth = 977
  ExplicitHeight = 625
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 582
    Width = 961
    ExplicitTop = 606
    ExplicitWidth = 961
  end
  inherited Bevel3: TBevel
    Top = 543
    Width = 961
    ExplicitTop = 567
    ExplicitWidth = 961
  end
  inherited pgcGuias: TPageControl
    Width = 961
    Height = 543
    ActivePage = tbsCadastro
    OnChange = pgcGuiasChange
    ExplicitWidth = 961
    ExplicitHeight = 543
    inherited tbsTabela: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 953
      ExplicitHeight = 514
      inherited Bevel4: TBevel
        Top = 440
        Width = 953
        ExplicitTop = 472
        ExplicitWidth = 953
      end
      inherited dbgDados: TDBGrid
        Width = 953
        Height = 440
        PopupMenu = popFerramentas
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Title.Caption = 'C'#243'digo '
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRI_APRESENTACAO'
            Title.Caption = 'Descri'#231#227'o + Apresenta'#231#227'o '
            Width = 280
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTDE'
            Title.Caption = 'Estoque '
            Width = 75
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
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'REFERENCIA'
            Title.Caption = 'Refer'#234'ncia '
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MODELO_FABRICACAO'
            Title.Caption = 'Ano/Modelo '
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO_COR'
            Title.Caption = 'Cor '
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO_COMBUSTIVEL'
            Title.Caption = 'Combust'#237'vel '
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KILOMETRAGEM_VEICULO'
            Title.Caption = 'Km '
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UNP_SIGLA'
            Title.Alignment = taCenter
            Title.Caption = 'UND '
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CUSTOMEDIO'
            Title.Caption = 'Custo (R$) '
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'PRECO'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            Title.Caption = 'Pre'#231'o (R$) '
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clBlue
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PERCENTUAL_MARCKUP'
            Title.Caption = '% Markup '
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO_GRUPO'
            Title.Caption = 'Grupo '
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        Top = 444
        Width = 953
        ExplicitTop = 444
        ExplicitWidth = 953
        object lblProdutoPromocao: TLabel [0]
          Left = 2
          Top = 4
          Width = 142
          Height = 13
          Caption = '* Produtos em Promo'#231#227'o'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object lblProdutoSemEstoque: TLabel [1]
          Left = 2
          Top = 24
          Width = 136
          Height = 13
          Caption = '* Produtos sem Estoque'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object lblProdutoDesativado: TLabel [2]
          Left = 2
          Top = 44
          Width = 169
          Height = 13
          Caption = '* Servi'#231'o/Produto desativado'
          Font.Charset = ANSI_CHARSET
          Font.Color = 7303023
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object ShpLucroZerado: TShape [3]
          Left = 271
          Top = 15
          Width = 15
          Height = 15
          Brush.Color = clYellow
        end
        object lblLucroZerado: TLabel [4]
          Left = 292
          Top = 18
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
        object ShpLucroNegativo: TShape [5]
          Left = 272
          Top = 35
          Width = 15
          Height = 15
          Brush.Color = 12171775
        end
        object lblLucroNegativo: TLabel [6]
          Left = 292
          Top = 36
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
        inherited grpBxFiltro: TGroupBox
          Left = 379
          Width = 570
          Caption = 'Pesquisar    '
          ExplicitLeft = 379
          ExplicitWidth = 570
          inherited lbltFiltrar: TLabel
            Width = 48
            Caption = 'Produto:'
            Visible = False
            ExplicitWidth = 48
          end
          inherited edtFiltrar: TEdit
            Left = 234
            Width = 292
            TabOrder = 2
            ExplicitLeft = 234
            ExplicitTop = 25
            ExplicitWidth = 292
          end
          inherited btnFiltrar: TcxButton
            Left = 532
            TabOrder = 3
            ExplicitLeft = 532
          end
          object chkProdutoComEstoque: TCheckBox
            Left = 68
            Top = -1
            Width = 213
            Height = 17
            TabStop = False
            Caption = '&0 - Apenas produtos com estoque'
            Checked = True
            Ctl3D = True
            ParentCtl3D = False
            State = cbChecked
            TabOrder = 0
            OnClick = chkProdutoComEstoqueClick
          end
          object CmbBxFiltrarTipo: TComboBox
            AlignWithMargins = True
            Left = 12
            Top = 24
            Width = 216
            Height = 22
            Margins.Left = 10
            Margins.Top = 9
            Margins.Bottom = 13
            Align = alClient
            BevelEdges = []
            BevelInner = bvNone
            BevelKind = bkSoft
            Style = csOwnerDrawFixed
            ItemIndex = 0
            TabOrder = 1
            Text = 'por Produto (C'#243'digo / Descri'#231#227'o)'
            Items.Strings = (
              'por Produto (C'#243'digo / Descri'#231#227'o)'
              'por Refer'#234'ncia (Placa)'
              'por Fabricante'
              'por Grupo')
          end
        end
      end
    end
    inherited tbsCadastro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 953
      ExplicitHeight = 514
      inherited Bevel8: TBevel
        Top = 153
        Width = 953
        ExplicitTop = 113
        ExplicitWidth = 953
      end
      object Bevel5: TBevel [1]
        Left = 0
        Top = 233
        Width = 953
        Height = 4
        Align = alTop
        Shape = bsSpacer
        ExplicitTop = 193
      end
      inherited GrpBxDadosNominais: TGroupBox
        Width = 953
        Height = 153
        ExplicitWidth = 953
        ExplicitHeight = 153
        object lblCodigoAnvisa: TLabel [0]
          Left = 17
          Top = 107
          Width = 72
          Height = 13
          Caption = 'C'#243'digo Ansiva:'
          FocusControl = dbCodigoAnvisa
          Visible = False
        end
        object lblDescricao: TLabel [2]
          Left = 400
          Top = 24
          Width = 97
          Height = 13
          Caption = 'Descri'#231#227'o comercial:'
          FocusControl = dbDescricao
        end
        object lblReferencia: TLabel [3]
          Left = 208
          Top = 107
          Width = 56
          Height = 13
          Caption = 'Refer'#234'ncia:'
          FocusControl = dbReferencia
        end
        object lblModelo: TLabel [4]
          Left = 17
          Top = 107
          Width = 38
          Height = 13
          Caption = 'Modelo:'
          FocusControl = dbModelo
        end
        object lblSecao: TLabel [5]
          Left = 728
          Top = 107
          Width = 33
          Height = 13
          Caption = 'Se'#231#227'o:'
          FocusControl = dbSecao
        end
        object lblGrupo: TLabel [6]
          Left = 400
          Top = 107
          Width = 33
          Height = 13
          Caption = 'Grupo:'
          FocusControl = dbGrupo
        end
        object lblCodigoEAN: TLabel [7]
          Left = 208
          Top = 24
          Width = 60
          Height = 13
          Caption = 'C'#243'digo EAN:'
          FocusControl = dbCodigoEAN
        end
        object lblFabricante: TLabel [8]
          Left = 728
          Top = 64
          Width = 55
          Height = 13
          Caption = 'Fabricante:'
          FocusControl = dbFabricante
        end
        object lblApresentacao: TLabel [9]
          Left = 728
          Top = 24
          Width = 118
          Height = 13
          Caption = 'Apresenta'#231#227'o comercial:'
          FocusControl = dbApresentacao
        end
        object lblTipoCadastro: TLabel [10]
          Left = 87
          Top = 24
          Width = 71
          Height = 13
          Caption = 'Tipo Cadastro:'
          FocusControl = dbTipoCadastro
        end
        object lblNomeAmigo: TLabel [11]
          Left = 208
          Top = 64
          Width = 232
          Height = 13
          Caption = 'Nome amigo (Descri'#231#227'o p/ identifica'#231#227'o interna):'
          FocusControl = dbNomeAmigo
        end
        object lblTipoProduto: TLabel [12]
          Left = 17
          Top = 64
          Width = 65
          Height = 13
          Caption = 'Tipo Produto:'
          FocusControl = dbTipoProduto
        end
        object dbCodigoAnvisa: TDBEdit [13]
          Left = 17
          Top = 123
          Width = 185
          Height = 21
          CharCase = ecUpperCase
          DataField = 'ANVISA'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
          Visible = False
        end
        object dbModelo: TDBEdit [14]
          Left = 17
          Top = 123
          Width = 185
          Height = 21
          CharCase = ecUpperCase
          DataField = 'MODELO'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
        end
        object dbReferencia: TDBEdit [15]
          Left = 208
          Top = 123
          Width = 186
          Height = 21
          CharCase = ecUpperCase
          DataField = 'REFERENCIA'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
        end
        inherited dbCodigo: TDBEdit
          Color = clMoneyGreen
          DataField = 'CODIGO'
        end
        object dbDescricao: TDBEdit
          Left = 400
          Top = 40
          Width = 322
          Height = 21
          CharCase = ecUpperCase
          DataField = 'DESCRI'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object dbCodigoEAN: TDBEdit
          Left = 208
          Top = 40
          Width = 186
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CODBARRA_EAN'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 13
          ParentFont = False
          TabOrder = 2
        end
        object dbApresentacao: TDBEdit
          Left = 728
          Top = 40
          Width = 209
          Height = 21
          DataField = 'APRESENTACAO'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
        object dbTipoCadastro: TDBLookupComboBox
          Left = 87
          Top = 40
          Width = 115
          Height = 21
          DataField = 'ALIQUOTA_TIPO'
          DataSource = DtSrcTabela
          DropDownRows = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'CODIGO'
          ListField = 'TIPO'
          ListSource = dtsAliquota
          ParentFont = False
          TabOrder = 1
        end
        object dbGrupo: TJvDBComboEdit
          Left = 400
          Top = 123
          Width = 322
          Height = 21
          ButtonHint = 'Pesquisar Grupo (Ctrl+P)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clMoneyGreen
          DataField = 'DESCRICAO_GRUPO'
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
          TabOrder = 11
          OnButtonClick = dbGrupoButtonClick
        end
        object dbFabricante: TJvDBComboEdit
          Left = 728
          Top = 80
          Width = 209
          Height = 21
          ButtonHint = 'Pesquisar Fabricante (Ctrl+P)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clMoneyGreen
          DataField = 'NOME_FABRICANTE'
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
          OnButtonClick = dbFabricanteButtonClick
        end
        object dbSecao: TJvDBComboEdit
          Left = 728
          Top = 123
          Width = 209
          Height = 21
          ButtonHint = 'Pesquisar Se'#231#227'o (Ctrl+P)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clMoneyGreen
          DataField = 'DESCRICAO_SECAO'
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
          OnButtonClick = dbSecaoButtonClick
        end
        object dbNomeAmigo: TDBEdit
          Left = 208
          Top = 80
          Width = 514
          Height = 21
          CharCase = ecUpperCase
          DataField = 'NOME_AMIGO'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
        end
        object dbTipoProduto: TDBLookupComboBox
          Left = 17
          Top = 80
          Width = 185
          Height = 21
          DataField = 'CODTIPO'
          DataSource = DtSrcTabela
          DropDownRows = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'CODIGO'
          ListField = 'DESCRICAO'
          ListSource = dtsTipoProduto
          ParentFont = False
          TabOrder = 5
        end
      end
      object pgcMaisDados: TPageControl
        Left = 0
        Top = 237
        Width = 953
        Height = 277
        ActivePage = tbsValores
        Align = alClient
        TabOrder = 2
        object tbsValores: TTabSheet
          Caption = 'Valores / Par'#226'metros'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          object lblCusto: TLabel
            Left = 272
            Top = 8
            Width = 63
            Height = 13
            Caption = 'Custo (R$):'
            FocusControl = dbCusto
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblPreco: TLabel
            Left = 16
            Top = 8
            Width = 101
            Height = 13
            Caption = 'Pre'#231'o Venda (R$):'
            FocusControl = dbPreco
          end
          object lblPrecoPromocao: TLabel
            Left = 152
            Top = 8
            Width = 99
            Height = 13
            Caption = 'Pre'#231'o Prom. (R$):'
            FocusControl = dbPrecoPromocao
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblPercentualMarkup: TLabel
            Left = 738
            Top = 8
            Width = 62
            Height = 13
            Caption = '% Markup:'
            FocusControl = dbPercentualMarkup
          end
          object lblPrecoVendaSugestao: TLabel
            Left = 619
            Top = 8
            Width = 93
            Height = 13
            Caption = 'PV. Sugest. (R$):'
            FocusControl = dbPrecoVendaSugestao
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            Visible = False
          end
          object lblLucroValor: TLabel
            Left = 499
            Top = 8
            Width = 91
            Height = 13
            Caption = 'Lucro Calc. (R$):'
            FocusControl = dbLucroValor
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblPercentualMargem: TLabel
            Left = 391
            Top = 8
            Width = 100
            Height = 13
            Caption = '% Margem Lucro:'
            FocusControl = dbPercentualMargem
          end
          object dbCusto: TDBEdit
            Left = 272
            Top = 24
            Width = 113
            Height = 21
            Color = clMoneyGreen
            DataField = 'CUSTOMEDIO'
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
          object dbPreco: TDBEdit
            Left = 16
            Top = 24
            Width = 129
            Height = 21
            CharCase = ecUpperCase
            DataField = 'PRECO'
            DataSource = DtSrcTabela
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object dbPrecoPromocao: TDBEdit
            Left = 152
            Top = 24
            Width = 113
            Height = 21
            Color = clMoneyGreen
            DataField = 'PRECO_PROMOCAO'
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
          object dbPercentualMarkup: TDBEdit
            Left = 738
            Top = 24
            Width = 62
            Height = 21
            CharCase = ecUpperCase
            Color = clMoneyGreen
            DataField = 'PERCENTUAL_MARCKUP'
            DataSource = DtSrcTabela
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 6
          end
          object dbPrecoVendaSugestao: TDBEdit
            Left = 619
            Top = 24
            Width = 113
            Height = 21
            Color = clMoneyGreen
            DataField = 'PRECO_SUGERIDO'
            DataSource = DtSrcTabela
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
            Visible = False
          end
          object dbLucroValor: TDBEdit
            Left = 499
            Top = 24
            Width = 113
            Height = 21
            Color = clMoneyGreen
            DataField = 'LUCRO_VALOR'
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
          object GrpBxFracionamentoPreco: TGroupBox
            Left = 16
            Top = 48
            Width = 525
            Height = 73
            Caption = 'Fracionamento'
            TabOrder = 7
            object lblPrecoFrac: TLabel
              Left = 16
              Top = 24
              Width = 101
              Height = 13
              Caption = 'Pre'#231'o Venda (R$):'
              FocusControl = dbPrecoFrac
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblPrecoPromocaoFrac: TLabel
              Left = 136
              Top = 24
              Width = 99
              Height = 13
              Caption = 'Pre'#231'o Prom. (R$):'
              FocusControl = dbPrecoPromocaoFrac
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblPrecoSugeridoFrac: TLabel
              Left = 256
              Top = 24
              Width = 93
              Height = 13
              Caption = 'PV. Sugest. (R$):'
              FocusControl = dbPrecoSugeridoFrac
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbPrecoFrac: TDBEdit
              Left = 16
              Top = 40
              Width = 113
              Height = 21
              Color = clMoneyGreen
              DataField = 'PRECO_FRAC'
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
            object dbPrecoPromocaoFrac: TDBEdit
              Left = 137
              Top = 40
              Width = 113
              Height = 21
              Color = clMoneyGreen
              DataField = 'PRECO_PROMOCAO_FRAC'
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
            object dbPrecoSugeridoFrac: TDBEdit
              Left = 256
              Top = 40
              Width = 113
              Height = 21
              Color = clMoneyGreen
              DataField = 'PRECO_SUGERIDO_FRAC'
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
            object dbVendaFracionada: TDBCheckBox
              Left = 376
              Top = 42
              Width = 137
              Height = 17
              Caption = 'Venda Fracionada'
              DataField = 'VENDA_FRACIONADA'
              DataSource = DtSrcTabela
              Enabled = False
              TabOrder = 3
              ValueChecked = '1'
              ValueUnchecked = '0'
              Visible = False
            end
          end
          object GrpBxParametroGeral: TGroupBox
            Left = 15
            Top = 127
            Width = 285
            Height = 106
            Caption = 'Par'#226'metros Gerais'
            TabOrder = 9
            object dbCadastroAtivo: TDBCheckBox
              Left = 16
              Top = 27
              Width = 110
              Height = 17
              Caption = 'Cadastro Ativo'
              DataField = 'CADASTRO_ATIVO'
              DataSource = DtSrcTabela
              TabOrder = 0
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object dbProdutoNovo: TDBCheckBox
              Left = 16
              Top = 50
              Width = 110
              Height = 17
              Caption = 'Produto Novo'
              DataField = 'PRODUTO_NOVO'
              DataSource = DtSrcTabela
              TabOrder = 1
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object dbComporFaturamento: TDBCheckBox
              Left = 17
              Top = 73
              Width = 257
              Height = 17
              Caption = 'Produto/Servi'#231'o Comp'#245'e o Faturamento'
              DataField = 'COMPOR_FATURAMENTO'
              DataSource = DtSrcTabela
              TabOrder = 2
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
          end
          object GrpBxParametroProdudo: TGroupBox
            Left = 306
            Top = 127
            Width = 494
            Height = 106
            Caption = 'Par'#226'metros para Produtos'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 10
            object dbProdutoMovEstoque: TDBCheckBox
              Left = 15
              Top = 50
              Width = 209
              Height = 17
              Caption = 'Produto Movimenta Estoque'
              DataField = 'MOVIMENTA_ESTOQUE'
              DataSource = DtSrcTabela
              TabOrder = 1
              ValueChecked = '1'
              ValueUnchecked = '0'
              OnClick = dbProdutoMovEstoqueClick
            end
            object dbProdutoEhImobilizado: TDBCheckBox
              Left = 15
              Top = 27
              Width = 153
              Height = 17
              Caption = 'Produto '#233' Imobilizado'
              DataField = 'PRODUTO_IMOBILIZADO'
              DataSource = DtSrcTabela
              TabOrder = 0
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object dbProdutoPorLote: TDBCheckBox
              Left = 15
              Top = 73
              Width = 346
              Height = 17
              Caption = 'Gerenciar Estoque por Lote / Estoque Apropriado por Lote'
              DataField = 'ESTOQUE_APROP_LOTE'
              DataSource = DtSrcTabela
              TabOrder = 2
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object dbGerarSubproduto: TDBCheckBox
              Left = 260
              Top = 27
              Width = 150
              Height = 17
              Caption = 'Gerar Subproduto'
              DataField = 'GERAR_SUBPRODUTO'
              DataSource = DtSrcTabela
              TabOrder = 3
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
          end
          object GrpBxUltimaCompra: TGroupBox
            Left = 547
            Top = 48
            Width = 253
            Height = 73
            Caption = #218'ltima Compra'
            TabOrder = 8
            object lblUltimaCompraData: TLabel
              Left = 16
              Top = 24
              Width = 30
              Height = 13
              Caption = 'Data:'
              FocusControl = dbUltimaCompraData
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblUltimaCompraValor: TLabel
              Left = 127
              Top = 24
              Width = 60
              Height = 13
              Caption = 'Valor (R$):'
              FocusControl = dbUltimaCompraValor
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbUltimaCompraData: TDBEdit
              Left = 16
              Top = 40
              Width = 105
              Height = 21
              Color = clMoneyGreen
              DataField = 'ULTIMA_COMPRA_DATA'
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
            object dbUltimaCompraValor: TDBEdit
              Left = 127
              Top = 40
              Width = 106
              Height = 21
              Color = clMoneyGreen
              DataField = 'ULTIMA_COMPRA_VALOR'
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
          object dbPercentualMargem: TDBEdit
            Left = 391
            Top = 24
            Width = 102
            Height = 21
            CharCase = ecUpperCase
            DataField = 'PERCENTUAL_MARGEM'
            DataSource = DtSrcTabela
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
        end
        object tbsCustoVeiculo: TTabSheet
          Caption = 'Custos e F&&I p/ Ve'#237'culos'
          ImageIndex = 4
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object grpCustosVeiculo: TGroupBox
            Left = 0
            Top = 0
            Width = 945
            Height = 121
            Align = alTop
            Caption = 'Custos'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object lblValorCompraVeiculo: TLabel
              Left = 16
              Top = 24
              Width = 107
              Height = 13
              Caption = 'Valor Compra (R$):'
              FocusControl = dbTipoVeiculo
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblOutros: TLabel
              Left = 295
              Top = 72
              Width = 69
              Height = 13
              Caption = 'Outros (R$):'
              FocusControl = dbTipoVeiculo
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblValorOficinaVeiculo: TLabel
              Left = 295
              Top = 24
              Width = 69
              Height = 13
              Caption = 'Oficina (R$):'
              FocusControl = dbTipoVeiculo
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblValorComissaoVeiculo: TLabel
              Left = 155
              Top = 24
              Width = 85
              Height = 13
              Caption = 'Comiss'#227'o (R$):'
              FocusControl = dbTipoVeiculo
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblImpostos: TLabel
              Left = 16
              Top = 72
              Width = 85
              Height = 13
              Caption = 'Impostos (R$):'
              FocusControl = dbTipoVeiculo
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblAdm: TLabel
              Left = 155
              Top = 72
              Width = 57
              Height = 13
              Caption = 'ADM (R$):'
              FocusControl = dbTipoVeiculo
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbValorCompraVeiculo: TDBEdit
              Left = 16
              Top = 41
              Width = 129
              Height = 21
              CharCase = ecUpperCase
              DataField = 'PRECO2'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object dbValorComissaoVeiculo: TDBEdit
              Left = 155
              Top = 41
              Width = 129
              Height = 21
              CharCase = ecUpperCase
              DataField = 'CUST_COMISSAO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
            object dbValorOficinaVeiculo: TDBEdit
              Left = 295
              Top = 41
              Width = 129
              Height = 21
              CharCase = ecUpperCase
              DataField = 'CUST_DESP_OFIC'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
            end
            object dbImpostos: TDBEdit
              Left = 16
              Top = 89
              Width = 129
              Height = 21
              CharCase = ecUpperCase
              DataField = 'CUST_IMPOSTO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
            end
            object dbAdm: TDBEdit
              Left = 155
              Top = 89
              Width = 129
              Height = 21
              CharCase = ecUpperCase
              DataField = 'CUST_DESP_ADM'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
            end
            object dbOutros: TDBEdit
              Left = 295
              Top = 89
              Width = 129
              Height = 21
              CharCase = ecUpperCase
              DataField = 'CUST_DESP_GERAIS'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 5
            end
          end
          object grpFIVeiculo: TGroupBox
            Left = 0
            Top = 121
            Width = 945
            Height = 72
            Align = alTop
            Caption = 'F&&I - Retorno'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object lblRetPlano: TLabel
              Left = 155
              Top = 24
              Width = 84
              Height = 13
              Caption = 'Por Plano (R$):'
              FocusControl = dbTipoVeiculo
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblFinanciadora: TLabel
              Left = 16
              Top = 24
              Width = 103
              Height = 13
              Caption = 'Financiadora (R$):'
              FocusControl = dbTipoVeiculo
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lvlValorRetornoVeiculo: TLabel
              Left = 296
              Top = 24
              Width = 109
              Height = 13
              Caption = 'Total Retorno (R$):'
              FocusControl = dbTipoVeiculo
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbFinanciadora: TDBEdit
              Left = 16
              Top = 41
              Width = 129
              Height = 21
              CharCase = ecUpperCase
              DataField = 'FI_RET_FINANC'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object dbPorPlano: TDBEdit
              Left = 155
              Top = 41
              Width = 129
              Height = 21
              CharCase = ecUpperCase
              DataField = 'FI_RET_PLANO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
            object dbValorRetornoVeiculo: TDBEdit
              Left = 294
              Top = 41
              Width = 129
              Height = 21
              CharCase = ecUpperCase
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
            end
          end
        end
        object tbsTributacao: TTabSheet
          Caption = 'Tributa'#231#245'es'
          ImageIndex = 3
          object Bevel6: TBevel
            Left = 0
            Top = 233
            Width = 945
            Height = 4
            Align = alTop
            Shape = bsSpacer
          end
          object Bevel7: TBevel
            Left = 0
            Top = 116
            Width = 945
            Height = 4
            Align = alTop
            Shape = bsSpacer
          end
          object GrpBxDadosTributoICMS: TGroupBox
            Left = 0
            Top = 0
            Width = 945
            Height = 116
            Align = alTop
            Caption = 'Dados fiscais para ICMS/ISS'
            TabOrder = 0
            object lblOrigem: TLabel
              Left = 16
              Top = 24
              Width = 38
              Height = 13
              Caption = 'Origem:'
              FocusControl = dbOrigem
            end
            object lblTipoTributacaoNM: TLabel
              Left = 344
              Top = 24
              Width = 121
              Height = 13
              Caption = 'Tipo de Tributa'#231#227'o ICMS:'
              FocusControl = dbTipoTributacaoNM
            end
            object lblCFOP: TLabel
              Left = 16
              Top = 64
              Width = 169
              Height = 13
              Caption = 'CFOP (C'#243'digo Fiscal de Opera'#231#227'o):'
              FocusControl = dbCFOP
            end
            object lblAliquota: TLabel
              Left = 584
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
            object lblIPI: TLabel
              Left = 848
              Top = 64
              Width = 69
              Height = 13
              Caption = 'Valor IPI (R$):'
              FocusControl = dbIPI
            end
            object lblAliquotaTipo: TLabel
              Left = 488
              Top = 64
              Width = 43
              Height = 13
              Caption = 'Al'#237'quota:'
              Enabled = False
              FocusControl = dbAliquotaTipo
            end
            object lblNCM_SH: TLabel
              Left = 152
              Top = 24
              Width = 43
              Height = 13
              Caption = 'NCM/SH:'
              FocusControl = dbNCM_SH
            end
            object lblTipoTributacaoSN: TLabel
              Left = 584
              Top = 24
              Width = 233
              Height = 13
              Caption = 'Tipo de Tributa'#231#227'o ICMS (Simples Nacional - SN):'
              FocusControl = dbTipoTributacaoSN
            end
            object lblAliquotaSN: TLabel
              Left = 672
              Top = 64
              Width = 73
              Height = 13
              Caption = '% Al'#237'quota SN:'
              FocusControl = dbAliquotaSN
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblPercentualReducaoBC: TLabel
              Left = 760
              Top = 64
              Width = 76
              Height = 13
              Caption = '% Redu'#231#227'o BC:'
              FocusControl = dbPercentualReducaoBC
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblNVE: TLabel
              Left = 261
              Top = 24
              Width = 23
              Height = 13
              Caption = 'NVE:'
              FocusControl = dbNVE
            end
            object dbOrigem: TDBLookupComboBox
              Left = 16
              Top = 40
              Width = 129
              Height = 21
              DataField = 'CODORIGEM'
              DataSource = DtSrcTabela
              DropDownRows = 10
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              KeyField = 'ORP_COD'
              ListField = 'ORP_DESCRICAO_FULL'
              ListSource = dtsOrigem
              ParentFont = False
              TabOrder = 0
            end
            object dbTipoTributacaoNM: TDBLookupComboBox
              Left = 344
              Top = 40
              Width = 233
              Height = 21
              DataField = 'CODTRIBUTACAO'
              DataSource = DtSrcTabela
              DropDownRows = 10
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              KeyField = 'TPT_COD'
              ListField = 'TPT_DESCRICAO_FULL'
              ListSource = dtsTributacaoNM
              ParentFont = False
              TabOrder = 3
            end
            object dbAliquota: TDBEdit
              Left = 584
              Top = 80
              Width = 81
              Height = 21
              CharCase = ecUpperCase
              DataField = 'ALIQUOTA'
              DataSource = DtSrcTabela
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 7
            end
            object dbIPI: TDBEdit
              Left = 848
              Top = 80
              Width = 85
              Height = 21
              CharCase = ecUpperCase
              DataField = 'VALOR_IPI'
              DataSource = DtSrcTabela
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 10
            end
            object dbAliquotaTipo: TDBLookupComboBox
              Left = 488
              Top = 80
              Width = 89
              Height = 21
              DataField = 'ALIQUOTA_TIPO'
              DataSource = DtSrcTabela
              DropDownRows = 10
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              KeyField = 'CODIGO'
              ListField = 'DESCRICAO'
              ListSource = dtsAliquota
              ParentFont = False
              TabOrder = 6
            end
            object dbTipoTributacaoSN: TDBLookupComboBox
              Left = 584
              Top = 40
              Width = 349
              Height = 21
              DataField = 'CSOSN'
              DataSource = DtSrcTabela
              DropDownRows = 10
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              KeyField = 'TPT_COD'
              ListField = 'TPT_DESCRICAO_FULL'
              ListSource = dtsTributacaoSN
              ParentFont = False
              TabOrder = 4
            end
            object dbAliquotaSN: TDBEdit
              Left = 672
              Top = 80
              Width = 81
              Height = 21
              CharCase = ecUpperCase
              DataField = 'ALIQUOTA_CSOSN'
              DataSource = DtSrcTabela
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 8
            end
            object dbPercentualReducaoBC: TDBEdit
              Left = 760
              Top = 80
              Width = 81
              Height = 21
              CharCase = ecUpperCase
              DataField = 'PERCENTUAL_REDUCAO_BC'
              DataSource = DtSrcTabela
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 9
            end
            object dbNVE: TDBEdit
              Left = 261
              Top = 40
              Width = 77
              Height = 21
              CharCase = ecUpperCase
              DataField = 'CODIGO_NVE'
              DataSource = DtSrcTabela
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
            end
            object dbCFOP: TJvDBComboEdit
              Left = 16
              Top = 80
              Width = 465
              Height = 21
              ButtonHint = 'Pesquisar CFOP (Ctrl+P)'
              CharCase = ecUpperCase
              ClickKey = 16464
              Color = clMoneyGreen
              DataField = 'CFOP_DESCRICAO'
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
              OnButtonClick = dbCFOPButtonClick
            end
            object dbNCM_SH: TJvDBComboEdit
              Left = 152
              Top = 40
              Width = 103
              Height = 21
              ButtonHint = 'Pesquisar Tabela IBPT (Ctrl+P)'
              CharCase = ecUpperCase
              ClickKey = 16464
              Color = clMoneyGreen
              DataField = 'NCM_SH'
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
              OnButtonClick = dbNCM_SHButtonClick
            end
          end
          object GrpBxDadosTributoPIS: TGroupBox
            Left = 0
            Top = 120
            Width = 945
            Height = 113
            Align = alTop
            Caption = 'Dados fiscais p/ PIS e COFINS'
            TabOrder = 1
            object lblCSTPIS: TLabel
              Left = 16
              Top = 24
              Width = 193
              Height = 13
              Caption = 'CST - C'#243'digo de Situa'#231#227'o Tribut'#225'ria PIS:'
              FocusControl = dbCSTPIS
            end
            object lblCSTCOFINS: TLabel
              Left = 16
              Top = 64
              Width = 215
              Height = 13
              Caption = 'CST - C'#243'digo de Situa'#231#227'o Tribut'#225'ria COFINS:'
              FocusControl = dbCSTCOFINS
            end
            object lblAliquotaCOFINS: TLabel
              Left = 848
              Top = 64
              Width = 56
              Height = 13
              Caption = '% COFINS:'
              FocusControl = dbAliquotaCOFINS
            end
            object lblAliquotaPIS: TLabel
              Left = 848
              Top = 24
              Width = 34
              Height = 13
              Caption = '% PIS:'
              FocusControl = dbAliquotaPIS
            end
            object dbCSTPIS: TDBLookupComboBox
              Left = 16
              Top = 40
              Width = 825
              Height = 21
              DataField = 'CST_PIS'
              DataSource = DtSrcTabela
              DropDownRows = 10
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              KeyField = 'CODIGO'
              ListField = 'DESCRICAO_FULL'
              ListSource = dtsAliquotaPIS
              ParentFont = False
              TabOrder = 0
            end
            object dbCSTCOFINS: TDBLookupComboBox
              Left = 16
              Top = 80
              Width = 825
              Height = 21
              DataField = 'CST_COFINS'
              DataSource = DtSrcTabela
              DropDownRows = 10
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              KeyField = 'CODIGO'
              ListField = 'DESCRICAO_FULL'
              ListSource = dtsAliquotaCOFINS
              ParentFont = False
              TabOrder = 2
            end
            object dbAliquotaCOFINS: TDBEdit
              Left = 848
              Top = 80
              Width = 85
              Height = 21
              CharCase = ecUpperCase
              DataField = 'ALIQUOTA_COFINS'
              DataSource = DtSrcTabela
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
            end
            object dbAliquotaPIS: TDBEdit
              Left = 848
              Top = 40
              Width = 85
              Height = 21
              CharCase = ecUpperCase
              DataField = 'ALIQUOTA_PIS'
              DataSource = DtSrcTabela
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
          end
        end
        object TbsEspecificacao: TTabSheet
          Caption = 'Especifica'#231#245'es'
          ImageIndex = 2
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnlVeiculo: TPanel
            Left = 0
            Top = 0
            Width = 945
            Height = 113
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object GrpVeiculo: TGroupBox
              Left = 0
              Top = 0
              Width = 945
              Height = 113
              Align = alClient
              Caption = 'Ve'#237'culo'
              TabOrder = 0
              object lblTipoVeiculo: TLabel
                Left = 16
                Top = 24
                Width = 24
                Height = 13
                Caption = 'Tipo:'
                FocusControl = dbTipoVeiculo
              end
              object lblRenavam: TLabel
                Left = 16
                Top = 64
                Width = 49
                Height = 13
                Caption = 'Renavam:'
                FocusControl = dbRenavam
              end
              object lblCorVeiculo: TLabel
                Left = 256
                Top = 24
                Width = 21
                Height = 13
                Caption = 'Cor:'
                FocusControl = dbCorVeiculo
              end
              object lblChassi: TLabel
                Left = 256
                Top = 64
                Width = 35
                Height = 13
                Caption = 'Chassi:'
                FocusControl = dbChassi
              end
              object lblTipoCombustivel: TLabel
                Left = 488
                Top = 24
                Width = 85
                Height = 13
                Caption = 'Tipo Combust'#237'vel:'
                FocusControl = dbTipoCombustivel
              end
              object lblAnoFabricacao: TLabel
                Left = 488
                Top = 64
                Width = 78
                Height = 13
                Caption = 'Ano Fabrica'#231#227'o:'
                FocusControl = dbAnoFabricacao
              end
              object lblAnoModelo: TLabel
                Left = 592
                Top = 64
                Width = 60
                Height = 13
                Caption = 'Ano Modelo:'
                FocusControl = dbAnoModelo
              end
              object lblKilometragem: TLabel
                Left = 696
                Top = 64
                Width = 68
                Height = 13
                Caption = 'Kilometragem:'
                FocusControl = dbKilometragem
              end
              object dbTipoVeiculo: TDBLookupComboBox
                Left = 16
                Top = 40
                Width = 233
                Height = 21
                DataField = 'TIPO_VEICULO'
                DataSource = DtSrcTabela
                DropDownRows = 10
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                KeyField = 'CODIGO'
                ListField = 'DESCRICAO'
                ListSource = dtsTipoVeiculo
                ParentFont = False
                TabOrder = 0
              end
              object dbRenavam: TDBEdit
                Left = 16
                Top = 80
                Width = 233
                Height = 21
                CharCase = ecUpperCase
                DataField = 'RENAVAM_VEICULO'
                DataSource = DtSrcTabela
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
              end
              object dbCorVeiculo: TDBLookupComboBox
                Left = 256
                Top = 40
                Width = 225
                Height = 21
                DataField = 'COR_VEICULO'
                DataSource = DtSrcTabela
                DropDownRows = 10
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                KeyField = 'CODIGO'
                ListField = 'DESCRICAO'
                ListSource = dtsCorVeiculo
                ParentFont = False
                TabOrder = 2
              end
              object dbChassi: TDBEdit
                Left = 256
                Top = 80
                Width = 225
                Height = 21
                CharCase = ecUpperCase
                DataField = 'CHASSI_VEICULO'
                DataSource = DtSrcTabela
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 3
              end
              object dbTipoCombustivel: TDBLookupComboBox
                Left = 488
                Top = 40
                Width = 441
                Height = 21
                DataField = 'COMBUSTIVEL_VEICULO'
                DataSource = DtSrcTabela
                DropDownRows = 10
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                KeyField = 'CODIGO'
                ListField = 'DESCRICAO'
                ListSource = dtsTipoCombustivel
                ParentFont = False
                TabOrder = 4
              end
              object dbAnoFabricacao: TDBEdit
                Left = 488
                Top = 80
                Width = 97
                Height = 21
                CharCase = ecUpperCase
                DataField = 'ANO_FABRICACAO_VEICULO'
                DataSource = DtSrcTabela
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 5
              end
              object dbAnoModelo: TDBEdit
                Left = 592
                Top = 80
                Width = 97
                Height = 21
                CharCase = ecUpperCase
                DataField = 'ANO_MODELO_VEICULO'
                DataSource = DtSrcTabela
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 6
              end
              object dbKilometragem: TDBEdit
                Left = 696
                Top = 80
                Width = 97
                Height = 21
                CharCase = ecUpperCase
                DataField = 'KILOMETRAGEM_VEICULO'
                DataSource = DtSrcTabela
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 7
              end
            end
          end
          object pnlVolume: TPanel
            Left = 0
            Top = 113
            Width = 945
            Height = 64
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            object GrpVolume: TGroupBox
              Left = 0
              Top = 0
              Width = 945
              Height = 64
              Align = alClient
              Caption = 'Pesos, Dimens'#245'es e Volume'
              TabOrder = 0
              object lblPesoBruto: TLabel
                Left = 16
                Top = 16
                Width = 79
                Height = 13
                Caption = 'Peso bruto (Kg):'
                FocusControl = dbPesoBruto
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object lblPesoLiquido: TLabel
                Left = 136
                Top = 16
                Width = 83
                Height = 13
                Caption = 'Peso l'#237'quido (Kg):'
                FocusControl = dbPesoLiquido
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object lblCubagem: TLabel
                Left = 591
                Top = 16
                Width = 74
                Height = 13
                Caption = 'Cubagem (m3):'
                FocusControl = dbCubagem
              end
              object lblAltura: TLabel
                Left = 256
                Top = 16
                Width = 52
                Height = 13
                Caption = 'Altura (m):'
                FocusControl = dbAltura
              end
              object lblLargura: TLabel
                Left = 367
                Top = 16
                Width = 60
                Height = 13
                Caption = 'Largura (m):'
                FocusControl = dbLargura
              end
              object lblEspessura: TLabel
                Left = 488
                Top = 16
                Width = 72
                Height = 13
                Caption = 'Espessura (m):'
                FocusControl = dbEspessura
              end
              object dbPesoBruto: TDBEdit
                Left = 16
                Top = 32
                Width = 113
                Height = 21
                DataField = 'PESO_BRUTO'
                DataSource = DtSrcTabela
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
              end
              object dbPesoLiquido: TDBEdit
                Left = 136
                Top = 32
                Width = 113
                Height = 21
                DataField = 'PESO_LIQUIDO'
                DataSource = DtSrcTabela
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
              end
              object dbCubagem: TDBEdit
                Left = 591
                Top = 32
                Width = 113
                Height = 21
                DataField = 'CUBAGEM'
                DataSource = DtSrcTabela
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 5
              end
              object dbAltura: TDBEdit
                Left = 256
                Top = 32
                Width = 105
                Height = 21
                DataField = 'ALTURA'
                DataSource = DtSrcTabela
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 2
              end
              object dbLargura: TDBEdit
                Left = 367
                Top = 32
                Width = 113
                Height = 21
                DataField = 'LARGURA'
                DataSource = DtSrcTabela
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 3
              end
              object dbEspessura: TDBEdit
                Left = 488
                Top = 32
                Width = 97
                Height = 21
                DataField = 'ESPESSURA'
                DataSource = DtSrcTabela
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 4
              end
            end
          end
          object pnlEspecificacao: TPanel
            Left = 0
            Top = 177
            Width = 945
            Height = 72
            Align = alClient
            BevelOuter = bvNone
            BorderWidth = 2
            TabOrder = 2
            object lblEspecificacao: TLabel
              Left = 2
              Top = 2
              Width = 105
              Height = 13
              Align = alTop
              Caption = 'Especifica'#231#227'o textual:'
              FocusControl = dbEspecificacao
              Transparent = True
            end
            object Bevel9: TBevel
              Left = 2
              Top = 15
              Width = 941
              Height = 4
              Align = alTop
              Shape = bsSpacer
            end
            object dbEspecificacao: TDBMemo
              Left = 2
              Top = 19
              Width = 941
              Height = 51
              Align = alClient
              DataField = 'ESPECIFICACAO'
              DataSource = DtSrcTabela
              TabOrder = 0
            end
          end
        end
        object tbsHistoricoVeiculo: TTabSheet
          Caption = 'Hist'#243'ricos'
          ImageIndex = 1
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          DesignSize = (
            945
            249)
          object lblSituacaoVeiculo: TLabel
            Left = 16
            Top = 8
            Width = 81
            Height = 13
            Caption = 'Situa'#231#227'o ve'#237'culo:'
            FocusControl = dbSituacaoVeiculo
          end
          object lblHistoricoSituacaoVeiculo: TLabel
            Left = 16
            Top = 48
            Width = 103
            Height = 13
            Caption = 'Hist'#243'rico da situa'#231#227'o:'
            FocusControl = dbHistoricoSituacaoVeiculo
          end
          object dbSituacaoVeiculo: TDBEdit
            Left = 16
            Top = 24
            Width = 913
            Height = 21
            DataField = 'SITUACAO_ATUAL_VEICULO'
            DataSource = DtSrcTabela
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object dbHistoricoSituacaoVeiculo: TDBMemo
            Left = 16
            Top = 64
            Width = 913
            Height = 170
            TabStop = False
            Anchors = [akLeft, akTop, akRight, akBottom]
            DataField = 'SITUACAO_HISTORICO_VEICULO'
            DataSource = DtSrcTabela
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Lucida Console'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            ScrollBars = ssBoth
            TabOrder = 1
          end
        end
      end
      object GrpBxDadosEstoque: TGroupBox
        Left = 0
        Top = 157
        Width = 953
        Height = 76
        Align = alTop
        Caption = 'Dados estoque'
        TabOrder = 1
        object lblEstoqueQtde: TLabel
          Left = 336
          Top = 24
          Width = 60
          Height = 13
          Caption = 'Quantidade:'
          FocusControl = dbEstoqueQtde
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblEstoqueMinimo: TLabel
          Left = 572
          Top = 24
          Width = 36
          Height = 13
          Caption = 'M'#237'nimo:'
          FocusControl = dbEstoqueMinimo
        end
        object lblEmpresa: TLabel
          Left = 16
          Top = 24
          Width = 45
          Height = 13
          Caption = 'Empresa:'
          FocusControl = dbEmpresa
        end
        object lblReserva: TLabel
          Left = 880
          Top = 24
          Width = 44
          Height = 13
          Caption = 'Reserva:'
          FocusControl = dbReserva
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object lblFracionador: TLabel
          Left = 649
          Top = 24
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
        object lblUnidadeFracao: TLabel
          Left = 728
          Top = 24
          Width = 94
          Height = 13
          Caption = 'Unidade da Fra'#231#227'o:'
          FocusControl = dbUnidadeFracao
        end
        object lblUnidade: TLabel
          Left = 415
          Top = 24
          Width = 43
          Height = 13
          Caption = 'Unidade:'
          FocusControl = dbUnidade
        end
        object dbEstoqueQtde: TDBEdit
          Left = 336
          Top = 40
          Width = 73
          Height = 21
          CharCase = ecUpperCase
          Color = clMoneyGreen
          DataField = 'QTDE'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object dbEstoqueMinimo: TDBEdit
          Left = 572
          Top = 40
          Width = 73
          Height = 21
          CharCase = ecUpperCase
          DataField = 'ESTOQMIN'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object dbEmpresa: TDBLookupComboBox
          Left = 16
          Top = 40
          Width = 313
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
          TabOrder = 0
        end
        object dbReserva: TDBEdit
          Left = 880
          Top = 40
          Width = 57
          Height = 21
          CharCase = ecUpperCase
          DataField = 'RESERVA'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          Visible = False
        end
        object dbFracionador: TDBEdit
          Left = 649
          Top = 40
          Width = 73
          Height = 21
          CharCase = ecUpperCase
          DataField = 'FRACIONADOR'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
        object dbUnidade: TJvDBComboEdit
          Left = 415
          Top = 40
          Width = 151
          Height = 21
          ButtonHint = 'Pesquisar Unidade (Ctrl+P)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clMoneyGreen
          DataField = 'DESCRICAO_UNIDADE'
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
          TabOrder = 2
          OnButtonClick = dbUnidadeButtonClick
        end
        object dbUnidadeFracao: TJvDBComboEdit
          Left = 728
          Top = 40
          Width = 145
          Height = 21
          ButtonHint = 'Pesquisar Unidade (Ctrl+P)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clMoneyGreen
          DataField = 'DESCRICAO_UNIDADE_FRAC'
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
          OnButtonClick = dbUnidadeFracaoButtonClick
        end
      end
    end
  end
  inherited tlbBotoes: TPanel
    Top = 547
    Width = 961
    ExplicitTop = 547
    ExplicitWidth = 961
    inherited bvlTool3: TBevel
      Left = 878
      ExplicitLeft = 878
    end
    inherited bvlTool4: TBevel
      Left = 957
      ExplicitLeft = 957
    end
    inherited btbtnFechar: TcxButton
      Left = 882
      ExplicitLeft = 882
    end
    inherited btbtnSelecionar: TcxButton
      Left = 758
      ExplicitLeft = 758
    end
  end
  inherited DtSrcTabela: TDataSource
    OnDataChange = DtSrcTabelaDataChange
    Left = 912
  end
  inherited ImgList: TImageList
    Left = 880
  end
  object dtsEmpresa: TDataSource
    Left = 248
  end
  object dtsOrigem: TDataSource
    Left = 280
  end
  object dtsTributacaoNM: TDataSource
    Left = 312
  end
  object dtsAliquota: TDataSource
    Left = 184
  end
  object dtsTributacaoSN: TDataSource
    Left = 344
  end
  object dtsCorVeiculo: TDataSource
    Left = 472
  end
  object dtsTipoCombustivel: TDataSource
    Left = 504
  end
  object dtsTipoVeiculo: TDataSource
    Left = 440
  end
  object dtsAliquotaPIS: TDataSource
    Left = 376
  end
  object dtsAliquotaCOFINS: TDataSource
    Left = 408
  end
  object popFerramentas: TPopupMenu
    Left = 528
    Top = 527
    object ppMnAtualizarMetafonema: TMenuItem
      Caption = 'Atualizar C'#243'digo Metaf'#244'nico'
      OnClick = ppMnAtualizarMetafonemaClick
    end
    object ppMnAtualizarTabelaIBPT: TMenuItem
      Caption = 'Atualizar Tabela IBPT (NCM/SH)'
      OnClick = ppMnAtualizarTabelaIBPTClick
    end
    object ppMnAtualizarNomeAmigo: TMenuItem
      Caption = 'Atualizar Nome Amigo'
      OnClick = ppMnAtualizarNomeAmigoClick
    end
  end
  object ppImprimir: TPopupMenu
    Images = ImgList
    Left = 496
    Top = 528
    object nmProdutoLista: TMenuItem
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
      Caption = 'Lista de Produtos'
      Enabled = False
      ImageIndex = 16
    end
    object nmProdutoFicha: TMenuItem
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
      Caption = 'Ficha de Produtos'
      Enabled = False
    end
    object nmProdutoEtiqueta: TMenuItem
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
      Caption = 'Etiqueta de Produtos'
      Enabled = False
    end
  end
  object dtsTipoProduto: TDataSource
    Left = 216
  end
end
