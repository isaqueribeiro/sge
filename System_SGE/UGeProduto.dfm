inherited frmGeProduto: TfrmGeProduto
  Left = 383
  Top = 220
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
    OnChange = pgcGuiasChange
    ExplicitWidth = 961
    ExplicitHeight = 543
    inherited tbsTabela: TTabSheet
      ExplicitWidth = 953
      ExplicitHeight = 514
      inherited Bevel4: TBevel
        Top = 448
        Width = 953
        ExplicitTop = 472
        ExplicitWidth = 953
      end
      inherited dbgDados: TDBGrid
        Width = 953
        Height = 448
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
        Top = 452
        Width = 953
        ExplicitTop = 452
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
          Left = 288
          Top = 9
          Width = 15
          Height = 15
          Brush.Color = clYellow
        end
        object lblLucroZerado: TLabel [4]
          Left = 308
          Top = 10
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
          Left = 288
          Top = 27
          Width = 15
          Height = 15
          Brush.Color = 12171775
        end
        object lblLucroNegativo: TLabel [6]
          Left = 308
          Top = 28
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
          Left = 392
          Width = 557
          Caption = 'Pesquisar    '
          ExplicitLeft = 392
          ExplicitWidth = 557
          DesignSize = (
            557
            54)
          inherited lbltFiltrar: TLabel
            Width = 48
            Caption = 'Produto:'
            Visible = False
            ExplicitWidth = 48
          end
          inherited edtFiltrar: TEdit
            Left = 231
            Width = 276
            TabOrder = 2
            ExplicitLeft = 231
            ExplicitWidth = 276
          end
          inherited btnFiltrar: TcxButton
            Left = 512
            TabOrder = 3
            ExplicitLeft = 512
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
            Left = 8
            Top = 21
            Width = 217
            Height = 21
            Style = csDropDownList
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
              Left = 136
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
              Width = 210
              Height = 17
              Caption = 'Gerenciar Estoque por Lote / Estoque Apropriado por Lote'
              DataField = 'ESTOQUE_APROP_LOTE'
              DataSource = DtSrcTabela
              TabOrder = 2
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object dbGerarSubproduto: TDBCheckBox
              Left = 236
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
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
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
                ListSource = dtsCor
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
                ListSource = dtsCombustivel
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
              Width = 941
              Height = 13
              Align = alTop
              Caption = 'Especifica'#231#227'o textual:'
              FocusControl = dbEspecificacao
              Transparent = True
              ExplicitWidth = 105
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
  inherited IbDtstTabela: TIBDataSet
    SelectSQL.Strings = (
      'Select'
      '    p.Codigo'
      '  , p.Cod'
      '  , p.Descri'
      '  , p.Apresentacao'
      '  , p.Descri_apresentacao'
      '  , p.Metafonema'
      '  , p.Modelo'
      '  , p.Anvisa'
      '  , p.Referencia'
      '  , p.Nome_amigo'
      '  , p.Especificacao'
      '  , p.Preco'
      '  , p.Preco_Promocao'
      '  , p.Preco_Sugerido'
      '  , p.Secao'
      '  , p.Qtde'
      '  , p.Unidade'
      '  , p.Estoqmin'
      '  , p.fracionador'
      '  , p.peso_bruto'
      '  , p.peso_liquido'
      '  , p.altura'
      '  , p.largura'
      '  , p.espessura'
      '  , p.cubagem'
      '  , p.venda_fracionada'
      '  , p.codunidade_fracionada'
      '  , p.Codtipo'
      '  , p.Codgrupo'
      '  , p.Codfabricante'
      '  , p.Customedio'
      '  , p.Percentual_marckup'
      '  , p.Percentual_margem'
      '  , p.Codemp'
      '  , p.Codsecao'
      '  , p.Codorigem'
      '  , p.Codtributacao'
      '  , p.Cst'
      '  , p.Csosn'
      '  , p.Cst_pis'
      '  , p.Cst_cofins'
      '  , p.Tabela_IBPT'
      '  , p.NCM_SH'
      '  , p.Codigo_NVE'
      '  , p.Codcfop'
      '  , p.Codbarra_ean'
      '  , p.Codunidade'
      '  , p.Aliquota_tipo'
      '  , p.Aliquota'
      '  , p.Aliquota_CSOSN'
      '  , p.Aliquota_pis'
      '  , p.Aliquota_cofins'
      '  , p.Valor_ipi'
      '  , p.Reserva'
      '  , p.Produto_novo'
      '  , p.Cor_veiculo'
      '  , p.Combustivel_veiculo'
      '  , p.Tipo_veiculo'
      '  , p.Renavam_veiculo'
      '  , p.Chassi_veiculo'
      '  , p.Ano_modelo_veiculo'
      '  , p.Ano_fabricacao_veiculo'
      '  , p.Kilometragem_veiculo'
      '  , p.Situacao_atual_veiculo'
      '  , p.Situacao_historico_veiculo'
      '  , p.Percentual_reducao_BC'
      '  , p.Usuario'
      '  , p.Cadastro_ativo'
      '  , p.Produto_imobilizado'
      '  , p.Movimenta_estoque'
      '  , p.Compor_faturamento'
      '  , p.Estoque_Aprop_lote'
      '  , p.Ultima_compra_data'
      '  , p.Ultima_compra_valor'
      '  , p.Ultima_compra_fornec'
      '  , p.gerar_subproduto'
      '  , p.produto_pai'
      '  , case when coalesce(p.Reserva, 0) > 0'
      '      then coalesce(p.Qtde, 0) - coalesce(p.Reserva, 0)'
      '      else coalesce(p.Qtde, 0)'
      '    end as Disponivel'
      '  , g.Descri as Descricao_Grupo'
      '  , f.Nome   as Nome_Fabricante'
      '  , coalesce(s.Scp_descricao, p.Secao) as Descricao_Secao'
      '  , coalesce(u.Unp_descricao, p.Unidade) as Descricao_Unidade'
      '  , u.Unp_sigla'
      '  , uf.unp_descricao as Descricao_Unidade_frac'
      '  , uf.unp_sigla as unp_sigla_frac'
      '  , c.Cfop_descricao'
      '  , c.Cfop_especificacao'
      '  , cr.Descricao as descricao_cor'
      '  , coalesce(cb.Apelido, cb.Descricao) as descricao_combustivel'
      
        '  , coalesce(p.Ano_fabricacao_veiculo || '#39'/'#39' || p.Ano_modelo_vei' +
        'culo, '#39#39') as modelo_fabricacao'
      '  , Case when p.Customedio > 0'
      '      then ((p.Preco / p.Customedio) - 1) * 100'
      '      else 100.0'
      '    end Lucro_Calculado'
      '  , (p.Preco - p.Customedio) as Lucro_Valor'
      
        '  , p.preco / coalesce(nullif(p.fracionador, 0), 1) as preco_fra' +
        'c'
      
        '  , p.preco_promocao / coalesce(nullif(p.fracionador, 0), 1) as ' +
        'preco_promocao_frac'
      
        '  , p.preco_sugerido / coalesce(nullif(p.fracionador, 0), 1) as ' +
        'preco_sugerido_frac'
      'from TBPRODUTO p'
      '  left join TBGRUPOPROD g on (g.Cod = p.Codgrupo)'
      '  left join TBSECAOPROD s on (s.Scp_cod = p.Codsecao)'
      '  left join TBUNIDADEPROD u on (u.Unp_cod = p.Codunidade)'
      
        '  left join TBUNIDADEPROD uf on (uf.Unp_cod = p.codunidade_fraci' +
        'onada)'
      '  left join TBCFOP c on (c.Cfop_cod = p.Codcfop)'
      '  left join TBFABRICANTE f on (f.Cod = p.Codfabricante)'
      '  left join RENAVAM_COR cr on (cr.Codigo = p.Cor_veiculo)'
      
        '  left join RENAVAM_COBUSTIVEL cb on (cb.Codigo = p.Combustivel_' +
        'veiculo)')
    GeneratorField.Field = 'CODIGO'
    GeneratorField.Generator = 'GEN_PRODUTO_ID'
    Left = 872
    Top = 296
  end
  inherited DtSrcTabela: TDataSource
    DataSet = fdQryTabela
    OnDataChange = DtSrcTabelaDataChange
    Left = 872
    Top = 360
  end
  inherited IbUpdTabela: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO,'
      '  COD,'
      '  DESCRI,'
      '  APRESENTACAO,'
      '  DESCRI_APRESENTACAO,'
      '  METAFONEMA,'
      '  MODELO,'
      '  ANVISA,'
      '  REFERENCIA,'
      '  NOME_AMIGO,'
      '  ESPECIFICACAO,'
      '  PRECO,'
      '  PRECO_PROMOCAO,'
      '  SECAO,'
      '  QTDE,'
      '  FRACIONADOR,'
      '  PESO_BRUTO,'
      '  PESO_LIQUIDO,'
      '  LARGURA,'
      '  ALTURA,'
      '  ESPESSURA,'
      '  CUBAGEM,'
      '  VENDA_FRACIONADA,'
      '  UNIDADE,'
      '  ESTOQMIN,'
      '  CODTIPO,'
      '  CODGRUPO,'
      '  CODFABRICANTE,'
      '  CUSTOMEDIO,'
      '  PERCENTUAL_MARCKUP,'
      '  PERCENTUAL_MARGEM,'
      '  PRECO_SUGERIDO,'
      '  CODEMP,'
      '  CODSECAO,'
      '  CODORIGEM,'
      '  CODTRIBUTACAO,'
      '  CST,'
      '  CSOSN,'
      '  CST_PIS,'
      '  CST_COFINS,'
      '  TABELA_IBPT,'
      '  NCM_SH,'
      '  CODIGO_NVE,'
      '  CODIGO_CEST,'
      '  CODCFOP,'
      '  CODBARRA_EAN,'
      '  CODUNIDADE,'
      '  CODUNIDADE_FRACIONADA,'
      '  ALIQUOTA_TIPO,'
      '  ALIQUOTA,'
      '  ALIQUOTA_CSOSN,'
      '  ALIQUOTA_PIS,'
      '  ALIQUOTA_COFINS,'
      '  VALOR_IPI,'
      '  PERCENTUAL_REDUCAO_BC,'
      '  RESERVA,'
      '  PRODUTO_NOVO,'
      '  COR_VEICULO,'
      '  COMBUSTIVEL_VEICULO,'
      '  TIPO_VEICULO,'
      '  ANO_MODELO_VEICULO,'
      '  ANO_FABRICACAO_VEICULO,'
      '  RENAVAM_VEICULO,'
      '  CHASSI_VEICULO,'
      '  KILOMETRAGEM_VEICULO,'
      '  SITUACAO_ATUAL_VEICULO,'
      '  SITUACAO_HISTORICO_VEICULO,'
      '  USUARIO,'
      '  CADASTRO_ATIVO,'
      '  MOVIMENTA_ESTOQUE,'
      '  COMPOR_FATURAMENTO,'
      '  PRODUTO_IMOBILIZADO,'
      '  ESTOQUE_APROP_LOTE,'
      '  CUST_DESP_OFIC,'
      '  CUST_DESP_GERAIS,'
      '  CUST_DESP_ADM,'
      '  CUST_COMISSAO,'
      '  CUST_IMPOSTO,'
      '  FI_RET_FINANC,'
      '  FI_RET_PLANO,'
      '  ULTIMA_COMPRA_DATA,'
      '  ULTIMA_COMPRA_VALOR,'
      '  ULTIMA_COMPRA_FORNEC,'
      '  GERAR_SUBPRODUTO,'
      '  PRODUTO_PAI,'
      '  ARQUIVO_MORTO'
      'from TBPRODUTO '
      'where'
      '  COD = :COD')
    ModifySQL.Strings = (
      'update TBPRODUTO'
      'set'
      '  ALIQUOTA = :ALIQUOTA,'
      '  ALIQUOTA_COFINS = :ALIQUOTA_COFINS,'
      '  ALIQUOTA_CSOSN = :ALIQUOTA_CSOSN,'
      '  ALIQUOTA_PIS = :ALIQUOTA_PIS,'
      '  ALIQUOTA_TIPO = :ALIQUOTA_TIPO,'
      '  ALTURA = :ALTURA,'
      '  ANO_FABRICACAO_VEICULO = :ANO_FABRICACAO_VEICULO,'
      '  ANO_MODELO_VEICULO = :ANO_MODELO_VEICULO,'
      '  ANVISA = :ANVISA,'
      '  APRESENTACAO = :APRESENTACAO,'
      '  CADASTRO_ATIVO = :CADASTRO_ATIVO,'
      '  CHASSI_VEICULO = :CHASSI_VEICULO,'
      '  COD = :COD,'
      '  CODBARRA_EAN = :CODBARRA_EAN,'
      '  CODCFOP = :CODCFOP,'
      '  CODEMP = :CODEMP,'
      '  CODFABRICANTE = :CODFABRICANTE,'
      '  CODGRUPO = :CODGRUPO,'
      '  CODIGO = :CODIGO,'
      '  CODIGO_NVE = :CODIGO_NVE,'
      '  CODORIGEM = :CODORIGEM,'
      '  CODSECAO = :CODSECAO,'
      '  CODTIPO = :CODTIPO,'
      '  CODTRIBUTACAO = :CODTRIBUTACAO,'
      '  CODUNIDADE = :CODUNIDADE,'
      '  CODUNIDADE_FRACIONADA = :CODUNIDADE_FRACIONADA,'
      '  COMBUSTIVEL_VEICULO = :COMBUSTIVEL_VEICULO,'
      '  COMPOR_FATURAMENTO = :COMPOR_FATURAMENTO,'
      '  COR_VEICULO = :COR_VEICULO,'
      '  CSOSN = :CSOSN,'
      '  CST = :CST,'
      '  CST_COFINS = :CST_COFINS,'
      '  CST_PIS = :CST_PIS,'
      '  CUBAGEM = :CUBAGEM,'
      '  CUSTOMEDIO = :CUSTOMEDIO,'
      '  DESCRI = :DESCRI,'
      '  DESCRI_APRESENTACAO = :DESCRI_APRESENTACAO,'
      '  ESPECIFICACAO = :ESPECIFICACAO,'
      '  ESPESSURA = :ESPESSURA,'
      '  ESTOQMIN = :ESTOQMIN,'
      '  ESTOQUE_APROP_LOTE = :ESTOQUE_APROP_LOTE,'
      '  FRACIONADOR = :FRACIONADOR,'
      '  GERAR_SUBPRODUTO = :GERAR_SUBPRODUTO,'
      '  KILOMETRAGEM_VEICULO = :KILOMETRAGEM_VEICULO,'
      '  LARGURA = :LARGURA,'
      '  METAFONEMA = :METAFONEMA,'
      '  MODELO = :MODELO,'
      '  MOVIMENTA_ESTOQUE = :MOVIMENTA_ESTOQUE,'
      '  NCM_SH = :NCM_SH,'
      '  NOME_AMIGO = :NOME_AMIGO,'
      '  PERCENTUAL_MARCKUP = :PERCENTUAL_MARCKUP,'
      '  PERCENTUAL_MARGEM = :PERCENTUAL_MARGEM,'
      '  PERCENTUAL_REDUCAO_BC = :PERCENTUAL_REDUCAO_BC,'
      '  PESO_BRUTO = :PESO_BRUTO,'
      '  PESO_LIQUIDO = :PESO_LIQUIDO,'
      '  PRECO = :PRECO,'
      '  PRECO_PROMOCAO = :PRECO_PROMOCAO,'
      '  PRECO_SUGERIDO = :PRECO_SUGERIDO,'
      '  PRODUTO_IMOBILIZADO = :PRODUTO_IMOBILIZADO,'
      '  PRODUTO_NOVO = :PRODUTO_NOVO,'
      '  PRODUTO_PAI = :PRODUTO_PAI,'
      '  QTDE = :QTDE,'
      '  REFERENCIA = :REFERENCIA,'
      '  RENAVAM_VEICULO = :RENAVAM_VEICULO,'
      '  RESERVA = :RESERVA,'
      '  SECAO = :SECAO,'
      '  SITUACAO_ATUAL_VEICULO = :SITUACAO_ATUAL_VEICULO,'
      '  SITUACAO_HISTORICO_VEICULO = :SITUACAO_HISTORICO_VEICULO,'
      '  TABELA_IBPT = :TABELA_IBPT,'
      '  TIPO_VEICULO = :TIPO_VEICULO,'
      '  ULTIMA_COMPRA_DATA = :ULTIMA_COMPRA_DATA,'
      '  ULTIMA_COMPRA_FORNEC = :ULTIMA_COMPRA_FORNEC,'
      '  ULTIMA_COMPRA_VALOR = :ULTIMA_COMPRA_VALOR,'
      '  UNIDADE = :UNIDADE,'
      '  USUARIO = :USUARIO,'
      '  VALOR_IPI = :VALOR_IPI,'
      '  VENDA_FRACIONADA = :VENDA_FRACIONADA'
      'where'
      '  COD = :OLD_COD')
    InsertSQL.Strings = (
      'insert into TBPRODUTO'
      
        '  (ALIQUOTA, ALIQUOTA_COFINS, ALIQUOTA_CSOSN, ALIQUOTA_PIS, ALIQ' +
        'UOTA_TIPO, '
      
        '   ALTURA, ANO_FABRICACAO_VEICULO, ANO_MODELO_VEICULO, ANVISA, A' +
        'PRESENTACAO, '
      
        '   CADASTRO_ATIVO, CHASSI_VEICULO, COD, CODBARRA_EAN, CODCFOP, C' +
        'ODEMP, '
      
        '   CODFABRICANTE, CODGRUPO, CODIGO, CODIGO_NVE, CODORIGEM, CODSE' +
        'CAO, CODTIPO, '
      
        '   CODTRIBUTACAO, CODUNIDADE, CODUNIDADE_FRACIONADA, COMBUSTIVEL' +
        '_VEICULO, '
      
        '   COMPOR_FATURAMENTO, COR_VEICULO, CSOSN, CST, CST_COFINS, CST_' +
        'PIS, CUBAGEM, '
      
        '   CUSTOMEDIO, DESCRI, DESCRI_APRESENTACAO, ESPECIFICACAO, ESPES' +
        'SURA, ESTOQMIN, '
      
        '   ESTOQUE_APROP_LOTE, FRACIONADOR, GERAR_SUBPRODUTO, KILOMETRAG' +
        'EM_VEICULO, '
      
        '   LARGURA, METAFONEMA, MODELO, MOVIMENTA_ESTOQUE, NCM_SH, NOME_' +
        'AMIGO, '
      
        '   PERCENTUAL_MARCKUP, PERCENTUAL_MARGEM, PERCENTUAL_REDUCAO_BC,' +
        ' PESO_BRUTO, '
      
        '   PESO_LIQUIDO, PRECO, PRECO_PROMOCAO, PRECO_SUGERIDO, PRODUTO_' +
        'IMOBILIZADO, '
      
        '   PRODUTO_NOVO, PRODUTO_PAI, QTDE, REFERENCIA, RENAVAM_VEICULO,' +
        ' RESERVA, '
      
        '   SECAO, SITUACAO_ATUAL_VEICULO, SITUACAO_HISTORICO_VEICULO, TA' +
        'BELA_IBPT, '
      
        '   TIPO_VEICULO, ULTIMA_COMPRA_DATA, ULTIMA_COMPRA_FORNEC, ULTIM' +
        'A_COMPRA_VALOR, '
      '   UNIDADE, USUARIO, VALOR_IPI, VENDA_FRACIONADA)'
      'values'
      
        '  (:ALIQUOTA, :ALIQUOTA_COFINS, :ALIQUOTA_CSOSN, :ALIQUOTA_PIS, ' +
        ':ALIQUOTA_TIPO, '
      
        '   :ALTURA, :ANO_FABRICACAO_VEICULO, :ANO_MODELO_VEICULO, :ANVIS' +
        'A, :APRESENTACAO, '
      
        '   :CADASTRO_ATIVO, :CHASSI_VEICULO, :COD, :CODBARRA_EAN, :CODCF' +
        'OP, :CODEMP, '
      
        '   :CODFABRICANTE, :CODGRUPO, :CODIGO, :CODIGO_NVE, :CODORIGEM, ' +
        ':CODSECAO, '
      
        '   :CODTIPO, :CODTRIBUTACAO, :CODUNIDADE, :CODUNIDADE_FRACIONADA' +
        ', :COMBUSTIVEL_VEICULO, '
      
        '   :COMPOR_FATURAMENTO, :COR_VEICULO, :CSOSN, :CST, :CST_COFINS,' +
        ' :CST_PIS, '
      
        '   :CUBAGEM, :CUSTOMEDIO, :DESCRI, :DESCRI_APRESENTACAO, :ESPECI' +
        'FICACAO, '
      
        '   :ESPESSURA, :ESTOQMIN, :ESTOQUE_APROP_LOTE, :FRACIONADOR, :GE' +
        'RAR_SUBPRODUTO, '
      
        '   :KILOMETRAGEM_VEICULO, :LARGURA, :METAFONEMA, :MODELO, :MOVIM' +
        'ENTA_ESTOQUE, '
      
        '   :NCM_SH, :NOME_AMIGO, :PERCENTUAL_MARCKUP, :PERCENTUAL_MARGEM' +
        ', :PERCENTUAL_REDUCAO_BC, '
      
        '   :PESO_BRUTO, :PESO_LIQUIDO, :PRECO, :PRECO_PROMOCAO, :PRECO_S' +
        'UGERIDO, '
      
        '   :PRODUTO_IMOBILIZADO, :PRODUTO_NOVO, :PRODUTO_PAI, :QTDE, :RE' +
        'FERENCIA, '
      
        '   :RENAVAM_VEICULO, :RESERVA, :SECAO, :SITUACAO_ATUAL_VEICULO, ' +
        ':SITUACAO_HISTORICO_VEICULO, '
      
        '   :TABELA_IBPT, :TIPO_VEICULO, :ULTIMA_COMPRA_DATA, :ULTIMA_COM' +
        'PRA_FORNEC, '
      
        '   :ULTIMA_COMPRA_VALOR, :UNIDADE, :USUARIO, :VALOR_IPI, :VENDA_' +
        'FRACIONADA)')
    DeleteSQL.Strings = (
      'delete from TBPRODUTO'
      'where'
      '  COD = :OLD_COD')
    Left = 904
    Top = 296
  end
  inherited ImgList: TImageList
    Left = 840
    Top = 296
  end
  inherited fdQryTabela: TFDQuery
    BeforePost = fdQryTabelaBeforePost
    UpdateOptions.AssignedValues = [uvFetchGeneratorsPoint, uvGeneratorName]
    UpdateOptions.FetchGeneratorsPoint = gpImmediate
    UpdateOptions.GeneratorName = 'GEN_PRODUTO_ID'
    UpdateOptions.KeyFields = 'COD'
    UpdateOptions.AutoIncFields = 'CODIGO'
    SQL.Strings = (
      'Select'
      '    p.Codigo'
      '  , p.Cod'
      '  , p.Descri'
      '  , p.Apresentacao'
      '  , p.Descri_apresentacao'
      '  , p.Metafonema'
      '  , p.Modelo'
      '  , p.Anvisa'
      '  , p.Referencia'
      '  , p.Nome_amigo'
      '  , p.Especificacao'
      '  , p.Preco'
      '  , p.Preco_Promocao'
      '  , p.Preco_Sugerido'
      '  , p.Secao'
      '  , p.Qtde'
      '  , p.Unidade'
      '  , p.Estoqmin'
      '  , p.fracionador'
      '  , p.peso_bruto'
      '  , p.peso_liquido'
      '  , p.altura'
      '  , p.largura'
      '  , p.espessura'
      '  , p.cubagem'
      '  , p.venda_fracionada'
      '  , p.codunidade_fracionada'
      '  , p.Codtipo'
      '  , p.Codgrupo'
      '  , p.Codfabricante'
      '  , p.Customedio'
      '  , p.Percentual_marckup'
      '  , p.Percentual_margem'
      '  , p.Codemp'
      '  , p.Codsecao'
      '  , p.Codorigem'
      '  , p.Codtributacao'
      '  , p.Cst'
      '  , p.Csosn'
      '  , p.Cst_pis'
      '  , p.Cst_cofins'
      '  , p.Tabela_IBPT'
      '  , p.NCM_SH'
      '  , p.Codigo_NVE'
      '  , p.Codcfop'
      '  , p.Codbarra_ean'
      '  , p.Codunidade'
      '  , p.Aliquota_tipo'
      '  , p.Aliquota'
      '  , p.Aliquota_CSOSN'
      '  , p.Aliquota_pis'
      '  , p.Aliquota_cofins'
      '  , p.Valor_ipi'
      '  , p.Reserva'
      '  , p.Produto_novo'
      '  , p.Cor_veiculo'
      '  , p.Combustivel_veiculo'
      '  , p.Tipo_veiculo'
      '  , p.Renavam_veiculo'
      '  , p.Chassi_veiculo'
      '  , p.Ano_modelo_veiculo'
      '  , p.Ano_fabricacao_veiculo'
      '  , p.Kilometragem_veiculo'
      '  , p.Situacao_atual_veiculo'
      '  , p.Situacao_historico_veiculo'
      '  , p.Percentual_reducao_BC'
      '  , p.Usuario'
      '  , p.Cadastro_ativo'
      '  , p.Produto_imobilizado'
      '  , p.Movimenta_estoque'
      '  , p.Compor_faturamento'
      '  , p.Estoque_Aprop_lote'
      '  , p.Ultima_compra_data'
      '  , p.Ultima_compra_valor'
      '  , p.Ultima_compra_fornec'
      '  , p.gerar_subproduto'
      '  , p.produto_pai'
      '  , case when coalesce(p.Reserva, 0) > 0'
      '      then coalesce(p.Qtde, 0) - coalesce(p.Reserva, 0)'
      '      else coalesce(p.Qtde, 0)'
      '    end as Disponivel'
      '  , g.Descri as Descricao_Grupo'
      '  , f.Nome   as Nome_Fabricante'
      '  , coalesce(s.Scp_descricao, p.Secao) as Descricao_Secao'
      '  , coalesce(u.Unp_descricao, p.Unidade) as Descricao_Unidade'
      '  , u.Unp_sigla'
      '  , uf.unp_descricao as Descricao_Unidade_frac'
      '  , uf.unp_sigla as unp_sigla_frac'
      '  , c.Cfop_descricao'
      '  , c.Cfop_especificacao'
      '  , cr.Descricao as descricao_cor'
      '  , coalesce(cb.Apelido, cb.Descricao) as descricao_combustivel'
      
        '  , coalesce(p.Ano_fabricacao_veiculo || '#39'/'#39' || p.Ano_modelo_vei' +
        'culo, '#39#39') as modelo_fabricacao'
      '  , Case when p.Customedio > 0'
      '      then ((p.Preco / p.Customedio) - 1) * 100'
      '      else 100.0'
      '    end Lucro_Calculado'
      '  , (p.Preco - p.Customedio) as Lucro_Valor'
      
        '  , p.preco / coalesce(nullif(p.fracionador, 0), 1) as preco_fra' +
        'c'
      
        '  , p.preco_promocao / coalesce(nullif(p.fracionador, 0), 1) as ' +
        'preco_promocao_frac'
      
        '  , p.preco_sugerido / coalesce(nullif(p.fracionador, 0), 1) as ' +
        'preco_sugerido_frac'
      'from TBPRODUTO p'
      '  left join TBGRUPOPROD g on (g.Cod = p.Codgrupo)'
      '  left join TBSECAOPROD s on (s.Scp_cod = p.Codsecao)'
      '  left join TBUNIDADEPROD u on (u.Unp_cod = p.Codunidade)'
      
        '  left join TBUNIDADEPROD uf on (uf.Unp_cod = p.codunidade_fraci' +
        'onada)'
      '  left join TBCFOP c on (c.Cfop_cod = p.Codcfop)'
      '  left join TBFABRICANTE f on (f.Cod = p.Codfabricante)'
      '  left join RENAVAM_COR cr on (cr.Codigo = p.Cor_veiculo)'
      
        '  left join RENAVAM_COBUSTIVEL cb on (cb.Codigo = p.Combustivel_' +
        'veiculo)')
    Left = 872
    Top = 328
    object fdQryTabelaCODIGO: TFDAutoIncField
      Alignment = taCenter
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere]
      DisplayFormat = '###0000000'
      IdentityInsert = True
    end
    object fdQryTabelaCOD: TStringField
      Alignment = taCenter
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD'
      Origin = 'COD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object fdQryTabelaDESCRI: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRI'
      Origin = 'DESCRI'
      Required = True
      Size = 50
    end
    object fdQryTabelaAPRESENTACAO: TStringField
      DisplayLabel = 'Apresenta'#231#227'o'
      FieldName = 'APRESENTACAO'
      Origin = 'APRESENTACAO'
      Size = 50
    end
    object fdQryTabelaDESCRI_APRESENTACAO: TStringField
      DisplayLabel = 'Descri'#231#227'o + Apresenta'#231#227'o'
      FieldName = 'DESCRI_APRESENTACAO'
      Origin = 'DESCRI_APRESENTACAO'
      Size = 100
    end
    object fdQryTabelaMETAFONEMA: TStringField
      FieldName = 'METAFONEMA'
      Origin = 'METAFONEMA'
      Size = 100
    end
    object fdQryTabelaMODELO: TStringField
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO'
      Origin = 'MODELO'
      Size = 40
    end
    object fdQryTabelaANVISA: TStringField
      DisplayLabel = 'C'#243'digo Anvisa'
      FieldName = 'ANVISA'
      Origin = 'ANVISA'
      Size = 30
    end
    object fdQryTabelaREFERENCIA: TStringField
      DisplayLabel = 'Refer'#234'ncia'
      FieldName = 'REFERENCIA'
      Origin = 'REFERENCIA'
      Size = 15
    end
    object fdQryTabelaNOME_AMIGO: TStringField
      DisplayLabel = 'Nome Amigo'
      FieldName = 'NOME_AMIGO'
      Origin = 'NOME_AMIGO'
      Required = True
      Size = 100
    end
    object fdQryTabelaESPECIFICACAO: TBlobField
      DisplayLabel = 'Especifica'#231#227'o'
      FieldName = 'ESPECIFICACAO'
      Origin = 'ESPECIFICACAO'
    end
    object fdQryTabelaSECAO: TStringField
      DisplayLabel = 'Se'#231#227'o'
      FieldName = 'SECAO'
      Origin = 'SECAO'
    end
    object fdQryTabelaUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
    end
    object fdQryTabelaALTURA: TBCDField
      DisplayLabel = 'Altura (m)'
      FieldName = 'ALTURA'
      Origin = 'ALTURA'
      DisplayFormat = ',0.###'
      Precision = 18
    end
    object fdQryTabelaLARGURA: TBCDField
      DisplayLabel = 'Largura (m)'
      FieldName = 'LARGURA'
      Origin = 'LARGURA'
      DisplayFormat = ',0.###'
      Precision = 18
    end
    object fdQryTabelaESPESSURA: TBCDField
      DisplayLabel = 'Espessura (m)'
      FieldName = 'ESPESSURA'
      Origin = 'ESPESSURA'
      DisplayFormat = ',0.###'
      Precision = 18
    end
    object fdQryTabelaCUBAGEM: TBCDField
      DisplayLabel = 'Cubagem (m3)'
      FieldName = 'CUBAGEM'
      Origin = 'CUBAGEM'
      DisplayFormat = ',0.000#'
      Precision = 18
    end
    object fdQryTabelaVENDA_FRACIONADA: TSmallintField
      FieldName = 'VENDA_FRACIONADA'
      Origin = 'VENDA_FRACIONADA'
      Required = True
    end
    object fdQryTabelaCODUNIDADE_FRACIONADA: TSmallintField
      DisplayLabel = 'Unidade da Fra'#231#227'o'
      FieldName = 'CODUNIDADE_FRACIONADA'
      Origin = 'CODUNIDADE_FRACIONADA'
      Required = True
    end
    object fdQryTabelaCODTIPO: TSmallintField
      DisplayLabel = 'Tipo do Produto'
      FieldName = 'CODTIPO'
      Origin = 'CODTIPO'
      Required = True
    end
    object fdQryTabelaCODGRUPO: TSmallintField
      DisplayLabel = 'Grupo'
      FieldName = 'CODGRUPO'
      Origin = 'CODGRUPO'
    end
    object fdQryTabelaCODFABRICANTE: TIntegerField
      DisplayLabel = 'Fabricante'
      FieldName = 'CODFABRICANTE'
      Origin = 'CODFABRICANTE'
    end
    object fdQryTabelaCODEMP: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'CODEMP'
      Origin = 'CODEMP'
      Required = True
      Size = 18
    end
    object fdQryTabelaCODSECAO: TSmallintField
      DisplayLabel = 'Se'#231#227'o'
      FieldName = 'CODSECAO'
      Origin = 'CODSECAO'
    end
    object fdQryTabelaCODORIGEM: TStringField
      DisplayLabel = 'Origem'
      FieldName = 'CODORIGEM'
      Origin = 'CODORIGEM'
      Required = True
      Size = 1
    end
    object fdQryTabelaCODTRIBUTACAO: TStringField
      DisplayLabel = 'Tipo Tributa'#231#227'o'
      FieldName = 'CODTRIBUTACAO'
      Origin = 'CODTRIBUTACAO'
      Required = True
      Size = 2
    end
    object fdQryTabelaCST: TStringField
      FieldName = 'CST'
      Origin = 'CST'
      Required = True
      Size = 3
    end
    object fdQryTabelaCSOSN: TStringField
      DisplayLabel = 'Tipo Tributa'#231#227'o ICMS (SN)'
      FieldName = 'CSOSN'
      Origin = 'CSOSN'
      Required = True
      Size = 3
    end
    object fdQryTabelaCST_PIS: TStringField
      DisplayLabel = 'CST PIS'
      FieldName = 'CST_PIS'
      Origin = 'CST_PIS'
      Size = 3
    end
    object fdQryTabelaCST_COFINS: TStringField
      DisplayLabel = 'CST COFINS'
      FieldName = 'CST_COFINS'
      Origin = 'CST_COFINS'
      Size = 3
    end
    object fdQryTabelaTABELA_IBPT: TIntegerField
      DisplayLabel = 'Tabela IBPT (NCM/SH)'
      FieldName = 'TABELA_IBPT'
      Origin = 'TABELA_IBPT'
      Required = True
    end
    object fdQryTabelaNCM_SH: TStringField
      DisplayLabel = 'NCM/SH'
      FieldName = 'NCM_SH'
      Origin = 'NCM_SH'
      Size = 10
    end
    object fdQryTabelaCODIGO_NVE: TStringField
      DisplayLabel = 'C'#243'digo NVE'
      FieldName = 'CODIGO_NVE'
      Origin = 'CODIGO_NVE'
      Size = 10
    end
    object fdQryTabelaCODCFOP: TIntegerField
      DisplayLabel = 'CFOP'
      FieldName = 'CODCFOP'
      Origin = 'CODCFOP'
    end
    object fdQryTabelaCODBARRA_EAN: TStringField
      DisplayLabel = 'C'#243'digo Externo'
      FieldName = 'CODBARRA_EAN'
      Origin = 'CODBARRA_EAN'
      Size = 15
    end
    object fdQryTabelaCODUNIDADE: TSmallintField
      DisplayLabel = 'Unidade'
      FieldName = 'CODUNIDADE'
      Origin = 'CODUNIDADE'
      Required = True
    end
    object fdQryTabelaALIQUOTA_TIPO: TSmallintField
      DisplayLabel = 'Al'#237'quota'
      FieldName = 'ALIQUOTA_TIPO'
      Origin = 'ALIQUOTA_TIPO'
      Required = True
    end
    object fdQryTabelaPRODUTO_NOVO: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'PRODUTO_NOVO'
      Origin = 'PRODUTO_NOVO'
      Required = True
    end
    object fdQryTabelaCOR_VEICULO: TStringField
      DisplayLabel = 'Cor'
      FieldName = 'COR_VEICULO'
      Origin = 'COR_VEICULO'
      Size = 3
    end
    object fdQryTabelaCOMBUSTIVEL_VEICULO: TStringField
      DisplayLabel = 'Combust'#237'vel'
      FieldName = 'COMBUSTIVEL_VEICULO'
      Origin = 'COMBUSTIVEL_VEICULO'
      Size = 3
    end
    object fdQryTabelaTIPO_VEICULO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_VEICULO'
      Origin = 'TIPO_VEICULO'
      Size = 3
    end
    object fdQryTabelaRENAVAM_VEICULO: TStringField
      DisplayLabel = 'Renavam'
      FieldName = 'RENAVAM_VEICULO'
      Origin = 'RENAVAM_VEICULO'
      Size = 50
    end
    object fdQryTabelaCHASSI_VEICULO: TStringField
      DisplayLabel = 'Chassi'
      FieldName = 'CHASSI_VEICULO'
      Origin = 'CHASSI_VEICULO'
      Size = 50
    end
    object fdQryTabelaANO_MODELO_VEICULO: TSmallintField
      DisplayLabel = 'Ano Modelo'
      FieldName = 'ANO_MODELO_VEICULO'
      Origin = 'ANO_MODELO_VEICULO'
    end
    object fdQryTabelaANO_FABRICACAO_VEICULO: TSmallintField
      DisplayLabel = 'Ano Fabrica'#231#227'o'
      FieldName = 'ANO_FABRICACAO_VEICULO'
      Origin = 'ANO_FABRICACAO_VEICULO'
    end
    object fdQryTabelaKILOMETRAGEM_VEICULO: TIntegerField
      DisplayLabel = 'Kilometragem'
      FieldName = 'KILOMETRAGEM_VEICULO'
      Origin = 'KILOMETRAGEM_VEICULO'
    end
    object fdQryTabelaSITUACAO_ATUAL_VEICULO: TStringField
      DisplayLabel = 'Situa'#231#227'o Ve'#237'culo'
      FieldName = 'SITUACAO_ATUAL_VEICULO'
      Origin = 'SITUACAO_ATUAL_VEICULO'
      Size = 100
    end
    object fdQryTabelaSITUACAO_HISTORICO_VEICULO: TMemoField
      FieldName = 'SITUACAO_HISTORICO_VEICULO'
      Origin = 'SITUACAO_HISTORICO_VEICULO'
      BlobType = ftMemo
    end
    object fdQryTabelaUSUARIO: TStringField
      FieldName = 'USUARIO'
      Origin = 'USUARIO'
      Size = 50
    end
    object fdQryTabelaCADASTRO_ATIVO: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'CADASTRO_ATIVO'
      Origin = 'CADASTRO_ATIVO'
      Required = True
    end
    object fdQryTabelaPRODUTO_IMOBILIZADO: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'PRODUTO_IMOBILIZADO'
      Origin = 'PRODUTO_IMOBILIZADO'
      Required = True
    end
    object fdQryTabelaMOVIMENTA_ESTOQUE: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'MOVIMENTA_ESTOQUE'
      Origin = 'MOVIMENTA_ESTOQUE'
      Required = True
    end
    object fdQryTabelaCOMPOR_FATURAMENTO: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'COMPOR_FATURAMENTO'
      Origin = 'COMPOR_FATURAMENTO'
      Required = True
    end
    object fdQryTabelaESTOQUE_APROP_LOTE: TSmallintField
      FieldName = 'ESTOQUE_APROP_LOTE'
      Origin = 'ESTOQUE_APROP_LOTE'
      Required = True
    end
    object fdQryTabelaULTIMA_COMPRA_DATA: TDateField
      FieldName = 'ULTIMA_COMPRA_DATA'
      Origin = 'ULTIMA_COMPRA_DATA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object fdQryTabelaULTIMA_COMPRA_VALOR: TFMTBCDField
      FieldName = 'ULTIMA_COMPRA_VALOR'
      Origin = 'ULTIMA_COMPRA_VALOR'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object fdQryTabelaULTIMA_COMPRA_FORNEC: TIntegerField
      FieldName = 'ULTIMA_COMPRA_FORNEC'
      Origin = 'ULTIMA_COMPRA_FORNEC'
    end
    object fdQryTabelaGERAR_SUBPRODUTO: TSmallintField
      FieldName = 'GERAR_SUBPRODUTO'
      Origin = 'GERAR_SUBPRODUTO'
      Required = True
    end
    object fdQryTabelaPRODUTO_PAI: TStringField
      FieldName = 'PRODUTO_PAI'
      Origin = 'PRODUTO_PAI'
      Size = 10
    end
    object fdQryTabelaDESCRICAO_GRUPO: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Grupo'
      FieldName = 'DESCRICAO_GRUPO'
      Origin = 'DESCRI'
      ProviderFlags = []
      Size = 30
    end
    object fdQryTabelaNOME_FABRICANTE: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Fabricante'
      FieldName = 'NOME_FABRICANTE'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 50
    end
    object fdQryTabelaDESCRICAO_SECAO: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Se'#231#227'o'
      FieldName = 'DESCRICAO_SECAO'
      Origin = 'DESCRICAO_SECAO'
      ProviderFlags = []
      Size = 50
    end
    object fdQryTabelaDESCRICAO_UNIDADE: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Unidade'
      FieldName = 'DESCRICAO_UNIDADE'
      Origin = 'DESCRICAO_UNIDADE'
      ProviderFlags = []
      Size = 50
    end
    object fdQryTabelaUNP_SIGLA: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'UND'
      FieldName = 'UNP_SIGLA'
      Origin = 'UNP_SIGLA'
      ProviderFlags = []
      Size = 5
    end
    object fdQryTabelaDESCRICAO_UNIDADE_FRAC: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO_UNIDADE_FRAC'
      Origin = 'UNP_DESCRICAO'
      ProviderFlags = []
      Size = 50
    end
    object fdQryTabelaUNP_SIGLA_FRAC: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'UNP_SIGLA_FRAC'
      Origin = 'UNP_SIGLA'
      ProviderFlags = []
      Size = 5
    end
    object fdQryTabelaCFOP_DESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CFOP_DESCRICAO'
      Origin = 'CFOP_DESCRICAO'
      ProviderFlags = []
      Size = 250
    end
    object fdQryTabelaCFOP_ESPECIFICACAO: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'CFOP_ESPECIFICACAO'
      Origin = 'CFOP_ESPECIFICACAO'
      ProviderFlags = []
      BlobType = ftMemo
    end
    object fdQryTabelaDESCRICAO_COR: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Cor'
      FieldName = 'DESCRICAO_COR'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      Size = 50
    end
    object fdQryTabelaDESCRICAO_COMBUSTIVEL: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Combust'#237'vel'
      FieldName = 'DESCRICAO_COMBUSTIVEL'
      Origin = 'DESCRICAO_COMBUSTIVEL'
      ProviderFlags = []
      Size = 100
    end
    object fdQryTabelaMODELO_FABRICACAO: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Ano/Modelo'
      FieldName = 'MODELO_FABRICACAO'
      Origin = 'MODELO_FABRICACAO'
      ProviderFlags = []
      Size = 13
    end
    object fdQryTabelaPRECO: TFMTBCDField
      DisplayLabel = 'Pre'#231'o (R$)'
      FieldName = 'PRECO'
      Origin = 'PRECO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object fdQryTabelaPRECO_PROMOCAO: TFMTBCDField
      FieldName = 'PRECO_PROMOCAO'
      Origin = 'PRECO_PROMOCAO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object fdQryTabelaPRECO_SUGERIDO: TFMTBCDField
      FieldName = 'PRECO_SUGERIDO'
      Origin = 'PRECO_SUGERIDO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object fdQryTabelaLUCRO_CALCULADO: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'LUCRO_CALCULADO'
      Origin = 'LUCRO_CALCULADO'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00#'
      Precision = 18
    end
    object fdQryTabelaLUCRO_VALOR: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'LUCRO_VALOR'
      Origin = 'LUCRO_VALOR'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00#'
      Precision = 18
      Size = 2
    end
    object fdQryTabelaPRECO_FRAC: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PRECO_FRAC'
      Origin = 'PRECO_FRAC'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 5
    end
    object fdQryTabelaPRECO_PROMOCAO_FRAC: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PRECO_PROMOCAO_FRAC'
      Origin = 'PRECO_PROMOCAO_FRAC'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 5
    end
    object fdQryTabelaPRECO_SUGERIDO_FRAC: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PRECO_SUGERIDO_FRAC'
      Origin = 'PRECO_SUGERIDO_FRAC'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 5
    end
    object fdQryTabelaQTDE: TFMTBCDField
      DisplayLabel = 'Quantidade'
      FieldName = 'QTDE'
      Origin = 'QTDE'
      Required = True
      DisplayFormat = ',0.###'
      Precision = 18
      Size = 3
    end
    object fdQryTabelaESTOQMIN: TFMTBCDField
      DisplayLabel = 'M'#237'nimo'
      FieldName = 'ESTOQMIN'
      Origin = 'ESTOQMIN'
      Required = True
      DisplayFormat = ',0.###'
      Precision = 18
      Size = 3
    end
    object fdQryTabelaRESERVA: TFMTBCDField
      DisplayLabel = 'Reserva'
      FieldName = 'RESERVA'
      Origin = 'RESERVA'
      Required = True
      DisplayFormat = ',0.###'
      Precision = 18
      Size = 3
    end
    object fdQryTabelaCUSTOMEDIO: TFMTBCDField
      FieldName = 'CUSTOMEDIO'
      Origin = 'CUSTOMEDIO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object fdQryTabelaPERCENTUAL_MARCKUP: TFMTBCDField
      FieldName = 'PERCENTUAL_MARCKUP'
      Origin = 'PERCENTUAL_MARCKUP'
      DisplayFormat = ',0.##'
      Precision = 18
      Size = 3
    end
    object fdQryTabelaPERCENTUAL_MARGEM: TFMTBCDField
      FieldName = 'PERCENTUAL_MARGEM'
      Origin = 'PERCENTUAL_MARGEM'
      DisplayFormat = ',0.##'
      Precision = 18
      Size = 3
    end
    object fdQryTabelaFRACIONADOR: TFMTBCDField
      FieldName = 'FRACIONADOR'
      Origin = 'FRACIONADOR'
      Precision = 18
      Size = 3
    end
    object fdQryTabelaPESO_BRUTO: TFMTBCDField
      DisplayLabel = 'Peso Bruto (Kg)'
      FieldName = 'PESO_BRUTO'
      Origin = 'PESO_BRUTO'
      DisplayFormat = ',0.00#'
      Precision = 18
      Size = 3
    end
    object fdQryTabelaPESO_LIQUIDO: TFMTBCDField
      DisplayLabel = 'Peso L'#237'quido (Kg)'
      FieldName = 'PESO_LIQUIDO'
      Origin = 'PESO_LIQUIDO'
      DisplayFormat = ',0.00#'
      Precision = 18
      Size = 3
    end
    object fdQryTabelaPERCENTUAL_REDUCAO_BC: TFMTBCDField
      DisplayLabel = '% Redu'#231#227'o da Base de C'#225'lculo (BC)'
      FieldName = 'PERCENTUAL_REDUCAO_BC'
      Origin = 'PERCENTUAL_REDUCAO_BC'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object fdQryTabelaVALOR_IPI: TFMTBCDField
      DisplayLabel = 'Valor IPI (R$)'
      FieldName = 'VALOR_IPI'
      Origin = 'VALOR_IPI'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object fdQryTabelaALIQUOTA: TFMTBCDField
      DisplayLabel = '% Al'#237'quota'
      FieldName = 'ALIQUOTA'
      Origin = 'ALIQUOTA'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object fdQryTabelaALIQUOTA_CSOSN: TFMTBCDField
      DisplayLabel = '% Al'#237'quota SN'
      FieldName = 'ALIQUOTA_CSOSN'
      Origin = 'ALIQUOTA_CSOSN'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object fdQryTabelaALIQUOTA_PIS: TFMTBCDField
      DisplayLabel = '% Al'#237'quota PIS'
      FieldName = 'ALIQUOTA_PIS'
      Origin = 'ALIQUOTA_PIS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object fdQryTabelaALIQUOTA_COFINS: TFMTBCDField
      DisplayLabel = '% Al'#237'quota COFINS'
      FieldName = 'ALIQUOTA_COFINS'
      Origin = 'ALIQUOTA_COFINS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object fdQryTabelaDISPONIVEL: TFMTBCDField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Dispon'#237'vel'
      FieldName = 'DISPONIVEL'
      Origin = 'DISPONIVEL'
      ProviderFlags = []
      DisplayFormat = ',0.###'
      Precision = 18
      Size = 3
    end
  end
  inherited fdUpdTabela: TFDUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO TBPRODUTO'
      '(CODIGO, COD, DESCRI, APRESENTACAO, DESCRI_APRESENTACAO, '
      '  METAFONEMA, MODELO, ANVISA, REFERENCIA, '
      '  NOME_AMIGO, ESPECIFICACAO, SECAO, QTDE, '
      '  FRACIONADOR, PESO_BRUTO, PESO_LIQUIDO, LARGURA, '
      '  ALTURA, ESPESSURA, CUBAGEM, VENDA_FRACIONADA, '
      '  UNIDADE, ESTOQMIN, CODTIPO, CODGRUPO, '
      '  CODFABRICANTE, PERCENTUAL_MARCKUP, PERCENTUAL_MARGEM, '
      '  PRECO_SUGERIDO, CODEMP, CODSECAO, CODORIGEM, '
      '  CODTRIBUTACAO, CST, CSOSN, CST_PIS, '
      '  CST_COFINS, TABELA_IBPT, NCM_SH, CODIGO_NVE, '
      '  CODCFOP, CODBARRA_EAN, CODUNIDADE, CODUNIDADE_FRACIONADA, '
      '  ALIQUOTA_TIPO, ALIQUOTA, ALIQUOTA_CSOSN, '
      '  ALIQUOTA_PIS, ALIQUOTA_COFINS, VALOR_IPI, '
      '  PERCENTUAL_REDUCAO_BC, RESERVA, PRODUTO_NOVO, '
      '  COR_VEICULO, COMBUSTIVEL_VEICULO, TIPO_VEICULO, '
      '  ANO_MODELO_VEICULO, ANO_FABRICACAO_VEICULO, RENAVAM_VEICULO, '
      '  CHASSI_VEICULO, KILOMETRAGEM_VEICULO, SITUACAO_ATUAL_VEICULO, '
      '  SITUACAO_HISTORICO_VEICULO, USUARIO, CADASTRO_ATIVO, '
      '  MOVIMENTA_ESTOQUE, COMPOR_FATURAMENTO, PRODUTO_IMOBILIZADO, '
      '  ESTOQUE_APROP_LOTE, PRECO, PRECO_PROMOCAO, '
      '  CUSTOMEDIO, ULTIMA_COMPRA_DATA, ULTIMA_COMPRA_VALOR, '
      '  ULTIMA_COMPRA_FORNEC, GERAR_SUBPRODUTO, PRODUTO_PAI)'
      
        'VALUES (:NEW_CODIGO, :NEW_COD, :NEW_DESCRI, :NEW_APRESENTACAO, :' +
        'NEW_DESCRI_APRESENTACAO, '
      '  :NEW_METAFONEMA, :NEW_MODELO, :NEW_ANVISA, :NEW_REFERENCIA, '
      '  :NEW_NOME_AMIGO, :NEW_ESPECIFICACAO, :NEW_SECAO, :NEW_QTDE, '
      
        '  :NEW_FRACIONADOR, :NEW_PESO_BRUTO, :NEW_PESO_LIQUIDO, :NEW_LAR' +
        'GURA, '
      
        '  :NEW_ALTURA, :NEW_ESPESSURA, :NEW_CUBAGEM, :NEW_VENDA_FRACIONA' +
        'DA, '
      '  :NEW_UNIDADE, :NEW_ESTOQMIN, :NEW_CODTIPO, :NEW_CODGRUPO, '
      
        '  :NEW_CODFABRICANTE, :NEW_PERCENTUAL_MARCKUP, :NEW_PERCENTUAL_M' +
        'ARGEM, '
      
        '  :NEW_PRECO_SUGERIDO, :NEW_CODEMP, :NEW_CODSECAO, :NEW_CODORIGE' +
        'M, '
      '  :NEW_CODTRIBUTACAO, :NEW_CST, :NEW_CSOSN, :NEW_CST_PIS, '
      
        '  :NEW_CST_COFINS, :NEW_TABELA_IBPT, :NEW_NCM_SH, :NEW_CODIGO_NV' +
        'E, '
      
        '  :NEW_CODCFOP, :NEW_CODBARRA_EAN, :NEW_CODUNIDADE, :NEW_CODUNID' +
        'ADE_FRACIONADA, '
      '  :NEW_ALIQUOTA_TIPO, :NEW_ALIQUOTA, :NEW_ALIQUOTA_CSOSN, '
      '  :NEW_ALIQUOTA_PIS, :NEW_ALIQUOTA_COFINS, :NEW_VALOR_IPI, '
      '  :NEW_PERCENTUAL_REDUCAO_BC, :NEW_RESERVA, :NEW_PRODUTO_NOVO, '
      
        '  :NEW_COR_VEICULO, :NEW_COMBUSTIVEL_VEICULO, :NEW_TIPO_VEICULO,' +
        ' '
      
        '  :NEW_ANO_MODELO_VEICULO, :NEW_ANO_FABRICACAO_VEICULO, :NEW_REN' +
        'AVAM_VEICULO, '
      
        '  :NEW_CHASSI_VEICULO, :NEW_KILOMETRAGEM_VEICULO, :NEW_SITUACAO_' +
        'ATUAL_VEICULO, '
      
        '  :NEW_SITUACAO_HISTORICO_VEICULO, :NEW_USUARIO, :NEW_CADASTRO_A' +
        'TIVO, '
      
        '  :NEW_MOVIMENTA_ESTOQUE, :NEW_COMPOR_FATURAMENTO, :NEW_PRODUTO_' +
        'IMOBILIZADO, '
      '  :NEW_ESTOQUE_APROP_LOTE, :NEW_PRECO, :NEW_PRECO_PROMOCAO, '
      
        '  :NEW_CUSTOMEDIO, :NEW_ULTIMA_COMPRA_DATA, :NEW_ULTIMA_COMPRA_V' +
        'ALOR, '
      
        '  :NEW_ULTIMA_COMPRA_FORNEC, :NEW_GERAR_SUBPRODUTO, :NEW_PRODUTO' +
        '_PAI)'
      
        'RETURNING CODIGO, DESCRI, QTDE, USUARIO, ULTIMA_COMPRA_DATA, ULT' +
        'IMA_COMPRA_VALOR, ULTIMA_COMPRA_FORNEC')
    ModifySQL.Strings = (
      'UPDATE TBPRODUTO'
      'SET CODIGO = :NEW_CODIGO, COD = :NEW_COD, DESCRI = :NEW_DESCRI, '
      
        '  APRESENTACAO = :NEW_APRESENTACAO, DESCRI_APRESENTACAO = :NEW_D' +
        'ESCRI_APRESENTACAO, '
      
        '  METAFONEMA = :NEW_METAFONEMA, MODELO = :NEW_MODELO, ANVISA = :' +
        'NEW_ANVISA, '
      '  REFERENCIA = :NEW_REFERENCIA, NOME_AMIGO = :NEW_NOME_AMIGO, '
      '  ESPECIFICACAO = :NEW_ESPECIFICACAO, SECAO = :NEW_SECAO, '
      
        '  QTDE = :NEW_QTDE, FRACIONADOR = :NEW_FRACIONADOR, PESO_BRUTO =' +
        ' :NEW_PESO_BRUTO, '
      '  PESO_LIQUIDO = :NEW_PESO_LIQUIDO, LARGURA = :NEW_LARGURA, '
      
        '  ALTURA = :NEW_ALTURA, ESPESSURA = :NEW_ESPESSURA, CUBAGEM = :N' +
        'EW_CUBAGEM, '
      
        '  VENDA_FRACIONADA = :NEW_VENDA_FRACIONADA, UNIDADE = :NEW_UNIDA' +
        'DE, '
      
        '  ESTOQMIN = :NEW_ESTOQMIN, CODTIPO = :NEW_CODTIPO, CODGRUPO = :' +
        'NEW_CODGRUPO, '
      
        '  CODFABRICANTE = :NEW_CODFABRICANTE, PERCENTUAL_MARCKUP = :NEW_' +
        'PERCENTUAL_MARCKUP, '
      
        '  PERCENTUAL_MARGEM = :NEW_PERCENTUAL_MARGEM, PRECO_SUGERIDO = :' +
        'NEW_PRECO_SUGERIDO, '
      
        '  CODEMP = :NEW_CODEMP, CODSECAO = :NEW_CODSECAO, CODORIGEM = :N' +
        'EW_CODORIGEM, '
      
        '  CODTRIBUTACAO = :NEW_CODTRIBUTACAO, CST = :NEW_CST, CSOSN = :N' +
        'EW_CSOSN, '
      
        '  CST_PIS = :NEW_CST_PIS, CST_COFINS = :NEW_CST_COFINS, TABELA_I' +
        'BPT = :NEW_TABELA_IBPT, '
      
        '  NCM_SH = :NEW_NCM_SH, CODIGO_NVE = :NEW_CODIGO_NVE, CODCFOP = ' +
        ':NEW_CODCFOP, '
      
        '  CODBARRA_EAN = :NEW_CODBARRA_EAN, CODUNIDADE = :NEW_CODUNIDADE' +
        ', '
      
        '  CODUNIDADE_FRACIONADA = :NEW_CODUNIDADE_FRACIONADA, ALIQUOTA_T' +
        'IPO = :NEW_ALIQUOTA_TIPO, '
      
        '  ALIQUOTA = :NEW_ALIQUOTA, ALIQUOTA_CSOSN = :NEW_ALIQUOTA_CSOSN' +
        ', '
      
        '  ALIQUOTA_PIS = :NEW_ALIQUOTA_PIS, ALIQUOTA_COFINS = :NEW_ALIQU' +
        'OTA_COFINS, '
      
        '  VALOR_IPI = :NEW_VALOR_IPI, PERCENTUAL_REDUCAO_BC = :NEW_PERCE' +
        'NTUAL_REDUCAO_BC, '
      '  RESERVA = :NEW_RESERVA, PRODUTO_NOVO = :NEW_PRODUTO_NOVO, '
      
        '  COR_VEICULO = :NEW_COR_VEICULO, COMBUSTIVEL_VEICULO = :NEW_COM' +
        'BUSTIVEL_VEICULO, '
      
        '  TIPO_VEICULO = :NEW_TIPO_VEICULO, ANO_MODELO_VEICULO = :NEW_AN' +
        'O_MODELO_VEICULO, '
      
        '  ANO_FABRICACAO_VEICULO = :NEW_ANO_FABRICACAO_VEICULO, RENAVAM_' +
        'VEICULO = :NEW_RENAVAM_VEICULO, '
      
        '  CHASSI_VEICULO = :NEW_CHASSI_VEICULO, KILOMETRAGEM_VEICULO = :' +
        'NEW_KILOMETRAGEM_VEICULO, '
      
        '  SITUACAO_ATUAL_VEICULO = :NEW_SITUACAO_ATUAL_VEICULO, SITUACAO' +
        '_HISTORICO_VEICULO = :NEW_SITUACAO_HISTORICO_VEICULO, '
      '  USUARIO = :NEW_USUARIO, CADASTRO_ATIVO = :NEW_CADASTRO_ATIVO, '
      
        '  MOVIMENTA_ESTOQUE = :NEW_MOVIMENTA_ESTOQUE, COMPOR_FATURAMENTO' +
        ' = :NEW_COMPOR_FATURAMENTO, '
      
        '  PRODUTO_IMOBILIZADO = :NEW_PRODUTO_IMOBILIZADO, ESTOQUE_APROP_' +
        'LOTE = :NEW_ESTOQUE_APROP_LOTE, '
      '  PRECO = :NEW_PRECO, PRECO_PROMOCAO = :NEW_PRECO_PROMOCAO, '
      
        '  CUSTOMEDIO = :NEW_CUSTOMEDIO, ULTIMA_COMPRA_DATA = :NEW_ULTIMA' +
        '_COMPRA_DATA, '
      
        '  ULTIMA_COMPRA_VALOR = :NEW_ULTIMA_COMPRA_VALOR, ULTIMA_COMPRA_' +
        'FORNEC = :NEW_ULTIMA_COMPRA_FORNEC, '
      
        '  GERAR_SUBPRODUTO = :NEW_GERAR_SUBPRODUTO, PRODUTO_PAI = :NEW_P' +
        'RODUTO_PAI'
      'WHERE COD = :OLD_COD'
      
        'RETURNING CODIGO, DESCRI, QTDE, USUARIO, ULTIMA_COMPRA_DATA, ULT' +
        'IMA_COMPRA_VALOR, ULTIMA_COMPRA_FORNEC')
    DeleteSQL.Strings = (
      'DELETE FROM TBPRODUTO'
      'WHERE COD = :OLD_COD')
    FetchRowSQL.Strings = (
      'Select'
      '    p.Codigo'
      '  , p.Cod'
      '  , p.Descri'
      '  , p.Apresentacao'
      '  , p.Descri_apresentacao'
      '  , p.Metafonema'
      '  , p.Modelo'
      '  , p.Anvisa'
      '  , p.Referencia'
      '  , p.Nome_amigo'
      '  , p.Especificacao'
      '  , p.Preco'
      '  , p.Preco_Promocao'
      '  , p.Preco_Sugerido'
      '  , p.Secao'
      '  , p.Qtde'
      '  , p.Unidade'
      '  , p.Estoqmin'
      '  , p.fracionador'
      '  , p.peso_bruto'
      '  , p.peso_liquido'
      '  , p.altura'
      '  , p.largura'
      '  , p.espessura'
      '  , p.cubagem'
      '  , p.venda_fracionada'
      '  , p.codunidade_fracionada'
      '  , p.Codtipo'
      '  , p.Codgrupo'
      '  , p.Codfabricante'
      '  , p.Customedio'
      '  , p.Percentual_marckup'
      '  , p.Percentual_margem'
      '  , p.Codemp'
      '  , p.Codsecao'
      '  , p.Codorigem'
      '  , p.Codtributacao'
      '  , p.Cst'
      '  , p.Csosn'
      '  , p.Cst_pis'
      '  , p.Cst_cofins'
      '  , p.Tabela_IBPT'
      '  , p.NCM_SH'
      '  , p.Codigo_NVE'
      '  , p.Codcfop'
      '  , p.Codbarra_ean'
      '  , p.Codunidade'
      '  , p.Aliquota_tipo'
      '  , p.Aliquota'
      '  , p.Aliquota_CSOSN'
      '  , p.Aliquota_pis'
      '  , p.Aliquota_cofins'
      '  , p.Valor_ipi'
      '  , p.Reserva'
      '  , p.Produto_novo'
      '  , p.Cor_veiculo'
      '  , p.Combustivel_veiculo'
      '  , p.Tipo_veiculo'
      '  , p.Renavam_veiculo'
      '  , p.Chassi_veiculo'
      '  , p.Ano_modelo_veiculo'
      '  , p.Ano_fabricacao_veiculo'
      '  , p.Kilometragem_veiculo'
      '  , p.Situacao_atual_veiculo'
      '  , p.Situacao_historico_veiculo'
      '  , p.Percentual_reducao_BC'
      '  , p.Usuario'
      '  , p.Cadastro_ativo'
      '  , p.Produto_imobilizado'
      '  , p.Movimenta_estoque'
      '  , p.Compor_faturamento'
      '  , p.Estoque_Aprop_lote'
      '  , p.Ultima_compra_data'
      '  , p.Ultima_compra_valor'
      '  , p.Ultima_compra_fornec'
      '  , p.gerar_subproduto'
      '  , p.produto_pai'
      '  , case when coalesce(p.Reserva, 0) > 0'
      '      then coalesce(p.Qtde, 0) - coalesce(p.Reserva, 0)'
      '      else coalesce(p.Qtde, 0)'
      '    end as Disponivel'
      '  , g.Descri as Descricao_Grupo'
      '  , f.Nome   as Nome_Fabricante'
      '  , coalesce(s.Scp_descricao, p.Secao) as Descricao_Secao'
      '  , coalesce(u.Unp_descricao, p.Unidade) as Descricao_Unidade'
      '  , u.Unp_sigla'
      '  , uf.unp_descricao as Descricao_Unidade_frac'
      '  , uf.unp_sigla as unp_sigla_frac'
      '  , c.Cfop_descricao'
      '  , c.Cfop_especificacao'
      '  , cr.Descricao as descricao_cor'
      '  , coalesce(cb.Apelido, cb.Descricao) as descricao_combustivel'
      
        '  , coalesce(p.Ano_fabricacao_veiculo || '#39'/'#39' || p.Ano_modelo_vei' +
        'culo, '#39#39') as modelo_fabricacao'
      '  , Case when p.Customedio > 0'
      '      then ((p.Preco / p.Customedio) - 1) * 100'
      '      else 100.0'
      '    end Lucro_Calculado'
      '  , (p.Preco - p.Customedio) as Lucro_Valor'
      
        '  , p.preco / coalesce(nullif(p.fracionador, 0), 1) as preco_fra' +
        'c'
      
        '  , p.preco_promocao / coalesce(nullif(p.fracionador, 0), 1) as ' +
        'preco_promocao_frac'
      
        '  , p.preco_sugerido / coalesce(nullif(p.fracionador, 0), 1) as ' +
        'preco_sugerido_frac'
      'from TBPRODUTO p'
      '  left join TBGRUPOPROD g on (g.Cod = p.Codgrupo)'
      '  left join TBSECAOPROD s on (s.Scp_cod = p.Codsecao)'
      '  left join TBUNIDADEPROD u on (u.Unp_cod = p.Codunidade)'
      
        '  left join TBUNIDADEPROD uf on (uf.Unp_cod = p.codunidade_fraci' +
        'onada)'
      '  left join TBCFOP c on (c.Cfop_cod = p.Codcfop)'
      '  left join TBFABRICANTE f on (f.Cod = p.Codfabricante)'
      '  left join RENAVAM_COR cr on (cr.Codigo = p.Cor_veiculo)'
      
        '  left join RENAVAM_COBUSTIVEL cb on (cb.Codigo = p.Combustivel_' +
        'veiculo)'
      'WHERE p.COD = :COD')
    Left = 904
    Top = 328
  end
  object dtsEmpresa: TDataSource
    DataSet = fdQryEmpresa
    Left = 280
  end
  object dtsOrigem: TDataSource
    DataSet = fdQryOrigem
    Left = 344
  end
  object dtsTributacaoNM: TDataSource
    DataSet = fdQryTributacaoNM
    Left = 408
  end
  object dtsAliquota: TDataSource
    DataSet = tblAliquota
    Left = 728
  end
  object dtsTributacaoSN: TDataSource
    DataSet = qryTributacaoSN
    Left = 472
  end
  object dtsCor: TDataSource
    DataSet = tblCor
    Left = 792
  end
  object dtsCombustivel: TDataSource
    DataSet = tblCombustivel
    Left = 536
  end
  object dtsTipoVeiculo: TDataSource
    DataSet = tblTipoVeiculo
    Left = 600
  end
  object dtsAliquotaPIS: TDataSource
    DataSet = qryAliquotaPIS
    Left = 856
  end
  object dtsAliquotaCOFINS: TDataSource
    DataSet = qryAliquotaCOFINS
    Left = 664
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
    Left = 248
  end
  object fdQryTipoProduto: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    t.codigo'
      '  , t.descricao'
      'from SYS_TIPO_PRODUTO t')
    Left = 184
  end
  object dtsTipoProduto: TDataSource
    DataSet = fdQryTipoProduto
    Left = 216
  end
  object fdQryOrigem: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select *'
      'from VW_ORIGEM_PRODUTO')
    Left = 312
  end
  object fdQryTributacaoNM: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      '/*'
      'Select'
      '    t.tpt_cod'
      '  , t.tpt_descricao'
      '  , t.tpt_descricao_full'
      '  , t.tpt_sigla'
      '  , t.crt'
      'from VW_TIPO_TRIBUTACAO t'
      'where t.crt = 0'
      '*/'
      'Select'
      '    t.Tpt_cod'
      '  , t.Tpt_descricao'
      '  , t.Tpt_cod || '#39' - '#39' || t.Tpt_descricao as Tpt_descricao_full'
      '  , t.Tpt_sigla'
      '  , t.Crt'
      '  , coalesce(t.obrigar_cest, 0) as obrigar_cest'
      'from TBTRIBUTACAO_TIPO t'
      'where coalesce(t.obrigar_cest, 0) = 0'
      'order by'
      '    t.Crt'
      '  , t.Tpt_cod')
    Left = 376
  end
  object qryTributacaoSN: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      '/*'
      'Select'
      '    t.tpt_cod'
      '  , t.tpt_descricao'
      '  , t.tpt_descricao_full'
      '  , t.tpt_sigla'
      '  , t.crt'
      'from VW_TIPO_TRIBUTACAO t'
      'where t.crt = 1'
      '*/'
      'Select'
      '    t.Tpt_cod'
      '  , t.Tpt_descricao'
      '  , t.Tpt_cod || '#39' - '#39' || t.Tpt_descricao as Tpt_descricao_full'
      '  , t.Tpt_sigla'
      '  , t.Crt'
      '  , coalesce(t.obrigar_cest, 0) as obrigar_cest'
      'from TBTRIBUTACAO_TIPO t'
      'where coalesce(t.obrigar_cest, 0) = 0'
      'order by'
      '    t.Crt'
      '  , t.Tpt_cod')
    Left = 440
  end
  object tblAliquota: TFDTable
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    UpdateOptions.UpdateTableName = 'VW_TIPO_ALIQUOTA'
    TableName = 'VW_TIPO_ALIQUOTA'
    Left = 696
  end
  object tblCombustivel: TFDTable
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    UpdateOptions.UpdateTableName = 'RENAVAM_COBUSTIVEL'
    TableName = 'RENAVAM_COBUSTIVEL'
    Left = 504
  end
  object tblCor: TFDTable
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    UpdateOptions.UpdateTableName = 'RENAVAM_COR'
    TableName = 'RENAVAM_COR'
    Left = 760
  end
  object tblTipoVeiculo: TFDTable
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    UpdateOptions.UpdateTableName = 'RENAVAM_TIPOVEICULO'
    TableName = 'RENAVAM_TIPOVEICULO'
    Left = 568
  end
  object qryAliquotaPIS: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'select'
      '    Codigo'
      '  , Descricao_FULL'
      '  , Descricao'
      '  , Indice_acbr'
      'from VW_ALIQUOTA_PIS')
    Left = 824
  end
  object qryAliquotaCOFINS: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'select'
      '    Codigo'
      '  , Descricao_FULL'
      '  , Descricao'
      '  , Indice_acbr'
      'from VW_ALIQUOTA_COFINS')
    Left = 632
  end
end
