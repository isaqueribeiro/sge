inherited ViewCliente: TViewCliente
  Left = 400
  Top = 237
  Caption = 'Cadastro de Clientes'
  ClientHeight = 535
  ClientWidth = 844
  OldCreateOrder = True
  OnClose = FormClose
  ExplicitWidth = 860
  ExplicitHeight = 574
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 531
    Width = 844
    ExplicitTop = 494
    ExplicitWidth = 844
  end
  inherited Bevel3: TBevel
    Top = 492
    Width = 844
    ExplicitTop = 455
    ExplicitWidth = 844
  end
  inherited pgcGuias: TPageControl
    Width = 844
    Height = 492
    OnChange = pgcGuiasChange
    ExplicitWidth = 844
    ExplicitHeight = 492
    inherited tbsTabela: TTabSheet
      ExplicitWidth = 836
      ExplicitHeight = 463
      inherited Bevel4: TBevel
        Top = 389
        Width = 836
        ExplicitTop = 360
        ExplicitWidth = 836
      end
      inherited dbgDados: TDBGrid
        Width = 836
        Height = 389
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Title.Caption = 'C'#243'digo '
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Title.Caption = 'Nome / Raz'#227'o Social '
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMEFANT'
            Title.Caption = 'Nome Fantasia '
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CNPJ'
            Title.Caption = 'CPF / CNPJ '
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CIDADE'
            Title.Caption = 'Cidade (UF) '
            Width = 150
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        Top = 393
        Width = 836
        ExplicitTop = 393
        ExplicitWidth = 836
        object Bevel6: TBevel [0]
          Left = 456
          Top = 4
          Width = 4
          Height = 62
          Align = alRight
          Shape = bsSpacer
          ExplicitLeft = 460
          ExplicitHeight = 54
        end
        inherited grpBxFiltro: TGroupBox
          Left = 460
          Width = 372
          ExplicitLeft = 460
          ExplicitWidth = 372
          ExplicitHeight = 62
          inherited lbltFiltrar: TLabel
            Width = 42
            Caption = 'Cliente:'
            Visible = False
            ExplicitWidth = 42
          end
          inherited edtFiltrar: TEdit
            Left = 170
            Width = 158
            TabOrder = 2
            ExplicitLeft = 170
            ExplicitTop = 24
            ExplicitWidth = 158
          end
          inherited btnFiltrar: TcxButton
            Left = 334
            ExplicitLeft = 334
          end
          object CmbBxFiltrarTipo: TComboBox
            AlignWithMargins = True
            Left = 12
            Top = 24
            Width = 152
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
            TabOrder = 0
            Text = 'por C'#243'digo / Raz'#227'o'
            OnKeyPress = CmbBxFiltrarTipoKeyPress
            Items.Strings = (
              'por C'#243'digo / Raz'#227'o'
              'por CPF / CNPJ'
              'por Cidade'
              'por Telefones')
          end
        end
        object Panel1: TPanel
          Left = 4
          Top = 4
          Width = 452
          Height = 62
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object lblRegistroDesativado: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 46
            Width = 127
            Height = 13
            Align = alBottom
            Caption = '* Clientes desativados'
            Font.Charset = ANSI_CHARSET
            Font.Color = 7303023
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
            Visible = False
          end
          object lblMotivoBloqueio: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 116
            Height = 13
            Align = alClient
            Caption = 'Motivo do bloqueio...'
            Font.Charset = ANSI_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
            Visible = False
            WordWrap = True
          end
        end
      end
    end
    inherited tbsCadastro: TTabSheet
      ExplicitWidth = 836
      ExplicitHeight = 463
      inherited Bevel8: TBevel
        Top = 113
        Width = 836
        ExplicitTop = 113
        ExplicitWidth = 836
      end
      object Bevel5: TBevel [1]
        Left = 0
        Top = 233
        Width = 836
        Height = 4
        Align = alTop
        Shape = bsSpacer
      end
      inherited GrpBxDadosNominais: TGroupBox
        Width = 836
        Height = 113
        ExplicitWidth = 836
        ExplicitHeight = 113
        object lblCNPJ: TLabel [1]
          Left = 192
          Top = 24
          Width = 58
          Height = 13
          Caption = 'CPF / CNPJ:'
          FocusControl = dbCNPJ
        end
        object lblRazao: TLabel [2]
          Left = 352
          Top = 24
          Width = 101
          Height = 13
          Caption = 'Nome / Raz'#227'o Social:'
          FocusControl = dbRazao
        end
        object lblIE: TLabel [3]
          Left = 264
          Top = 64
          Width = 115
          Height = 13
          Caption = 'RG / Inscri'#231#227'o Estadual:'
          FocusControl = dbIE
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblIM: TLabel [4]
          Left = 408
          Top = 64
          Width = 93
          Height = 13
          Caption = 'Inscri'#231#227'o Municipal:'
          FocusControl = dbIM
        end
        object lblDataCadastro: TLabel [5]
          Left = 728
          Top = 24
          Width = 84
          Height = 13
          Caption = 'Data Cadastro:'
          FocusControl = dbDataCadastro
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblVendedor: TLabel [6]
          Left = 552
          Top = 64
          Width = 111
          Height = 13
          Caption = 'Vendedor respons'#225'vel:'
          FocusControl = dbVendedor
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblTipoCNPJ: TLabel [7]
          Left = 696
          Top = 64
          Width = 52
          Height = 13
          Caption = 'Tipo CNPJ:'
          Enabled = False
          FocusControl = dbTipoCNPJ
        end
        object lblNomeFantasia: TLabel [8]
          Left = 16
          Top = 64
          Width = 75
          Height = 13
          Caption = 'Nome Fantasia:'
          FocusControl = dbNomeFantasia
        end
        inherited dbCodigo: TDBEdit
          Color = clMoneyGreen
          DataField = 'CODIGO'
        end
        object dbPessoaFisica: TDBCheckBox
          Left = 88
          Top = 42
          Width = 97
          Height = 17
          Caption = 'Pessoa F'#237'sica'
          DataField = 'PESSOA_FISICA'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbRazao: TDBEdit
          Left = 352
          Top = 40
          Width = 369
          Height = 21
          CharCase = ecUpperCase
          DataField = 'NOME'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object dbIE: TDBEdit
          Left = 264
          Top = 80
          Width = 137
          Height = 21
          CharCase = ecUpperCase
          DataField = 'INSCEST'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
        end
        object dbIM: TDBEdit
          Left = 408
          Top = 80
          Width = 137
          Height = 21
          CharCase = ecUpperCase
          DataField = 'INSCMUN'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
        end
        object dbDataCadastro: TDBEdit
          Left = 728
          Top = 40
          Width = 89
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'DTCAD'
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
        object dbVendedor: TDBLookupComboBox
          Left = 552
          Top = 80
          Width = 137
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
          TabOrder = 8
        end
        object dbTipoCNPJ: TDBLookupComboBox
          Left = 696
          Top = 80
          Width = 121
          Height = 21
          DataField = 'TIPO'
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
          ListSource = dtsTipoCnpj
          ParentFont = False
          TabOrder = 9
        end
        object dbNomeFantasia: TDBEdit
          Left = 16
          Top = 80
          Width = 241
          Height = 21
          CharCase = ecUpperCase
          DataField = 'NOMEFANT'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
        object dbCNPJ: TJvDBComboEdit
          Left = 192
          Top = 40
          Width = 153
          Height = 21
          ButtonHint = 'Consultar CPF/CNPJ junto a Receita Federal (Ctrl + P).'
          CharCase = ecUpperCase
          ClickKey = 16464
          DataField = 'CNPJ'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            180000000000000600000000000000000000000000000000000000FF0000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF009993
            9D203040938B9300FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
            FF0000FF0000FF0000FF0000FF009696963333338E8E8E00FF0000FF00B0A090
            6048306048306048306048306048306048306048306048306048305048403050
            604078C03048609C989D00FF009C9C9C43434343434343434343434343434343
            43434343434343434343434646465151518888884C4C4C99999900FF00B0A090
            FFFFFFB0A090B0A090B0A090B0A090B0A090B0A090B0A0909088803050703080
            D04098E050B0F050687000FF009C9C9CFFFFFF9C9C9C9C9C9C9C9C9C9C9C9C9C
            9C9C9C9C9C9C9C9C868686565656909090A4A4A4B9B9B968686800FF00B0A090
            FFFFFFFFFFFFFFF8FFF0F0F0D0D8D090989070686060686050586040709040A0
            E060C8FF7090A0B7B3B500FF009C9C9CFFFFFFFFFFFFFAFAFAF0F0F0D4D4D494
            9494666666646464595959747474A9A9A9CECECE919191B4B4B400FF00B0A090
            FFFFFFFFFFFFFFFFFFE0E0E0909090B0A8A0D0C0B0D0B0A08078705058506090
            B07098B0A6AAAE00FF0000FF009C9C9CFFFFFFFFFFFFFFFFFFE0E0E0909090A6
            A6A6BCBCBCAEAEAE7676765454549494949B9B9BAAAAAA00FF0000FF00B0A090
            FFFFFFFFFFFFFFFFFFB0B0B0C0B8B0FFF0E0FFE8E0F0D8C0F0D0B0807870988D
            92A8ADB100FF0000FF0000FF009C9C9CFFFFFFFFFFFFFFFFFFB0B0B0B6B6B6EC
            ECECE7E7E7D3D3D3C9C9C97676768F8F8FADADAD00FF0000FF0000FF00C0A890
            FFFFFFFFFFFFFFFFFFA09890F0E8E0FFF8F0FFF0F0FFE8E0F0D8D0D0B0A06267
            6000FF0000FF0000FF0000FF00A3A3A3FFFFFFFFFFFFFFFFFF969696E6E6E6F6
            F6F6F1F1F1E7E7E7D8D8D8AEAEAE64646400FF0000FF0000FF0000FF00C0A8A0
            FFFFFFFFFFFFFFFFFFA0A090F0E8E0FFFFFFFFF8F0FFF0F0FFE8E0E0C0B0716F
            6F00FF0000FF0000FF0000FF00A8A8A8FFFFFFFFFFFFFFFFFF9B9B9BE6E6E6FF
            FFFFF6F6F6F1F1F1E7E7E7BEBEBE6F6F6F00FF0000FF0000FF0000FF00C0B0A0
            FFFFFFFFFFFFFFFFFFC0C8C0C0C0C0FFFFFFFFFFFFFFF8F0FFF0E0B0A090A5A0
            A000FF0000FF0000FF0000FF00ACACACFFFFFFFFFFFFFFFFFFC4C4C4C0C0C0FF
            FFFFFFFFFFF6F6F6ECECEC9C9C9CA0A0A000FF0000FF0000FF0000FF00D0B0A0
            FFFFFFFFFFFFFFFFFFF0F8FFC0B8B0C0C0C0F0E8E0F0E8E0B0B0A070706000FF
            0000FF0000FF0000FF0000FF00AEAEAEFFFFFFFFFFFFFFFFFFF9F9F9B6B6B6C0
            C0C0E6E6E6E6E6E6ABABAB6B6B6B00FF0000FF0000FF0000FF0000FF00D0B8A0
            FFFFFFFFFFFFFFFFFFFFFFFFF0F8FFC0C8C0A0A09090908090909060504000FF
            0000FF0000FF0000FF0000FF00B3B3B3FFFFFFFFFFFFFFFFFFFFFFFFF9F9F9C4
            C4C49B9B9B8B8B8B9090904C4C4C00FF0000FF0000FF0000FF0000FF00D0B8B0
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0A09060483060483060483000FF
            0000FF0000FF0000FF0000FF00B8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF9C9C9C43434343434343434300FF0000FF0000FF0000FF0000FF00D0C0B0
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A890D0C8C060483000FF0000FF
            0000FF0000FF0000FF0000FF00BCBCBCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFA3A3A3C6C6C643434300FF0000FF0000FF0000FF0000FF0000FF00E0C0B0
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A8A060483000FF0000FF0000FF
            0000FF0000FF0000FF0000FF00BEBEBEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFA8A8A843434300FF0000FF0000FF0000FF0000FF0000FF0000FF00E0C0B0
            E0C0B0E0C0B0E0C0B0E0C0B0D0C0B0D0B8B0D0B0A000FF0000FF0000FF0000FF
            0000FF0000FF0000FF0000FF00BEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBCBCBCB8
            B8B8AEAEAE00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
            0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
            FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00}
          NumGlyphs = 2
          ParentFont = False
          TabOrder = 2
          OnButtonClick = dbCNPJButtonClick
        end
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 117
        Width = 836
        Height = 116
        Align = alTop
        Caption = 'Endere'#231'o'
        TabOrder = 1
        object lblCidade: TLabel
          Left = 176
          Top = 24
          Width = 37
          Height = 13
          Caption = 'Cidade:'
        end
        object lblEstado: TLabel
          Left = 16
          Top = 24
          Width = 37
          Height = 13
          Caption = 'Estado:'
        end
        object lblBairro: TLabel
          Left = 456
          Top = 24
          Width = 32
          Height = 13
          Caption = 'Bairro:'
        end
        object lblLogradouro: TLabel
          Left = 16
          Top = 64
          Width = 59
          Height = 13
          Caption = 'Logradouro:'
        end
        object lblCEP: TLabel
          Left = 696
          Top = 24
          Width = 23
          Height = 13
          Caption = 'CEP:'
          FocusControl = dbCEP
        end
        object lblNumero: TLabel
          Left = 456
          Top = 64
          Width = 41
          Height = 13
          Caption = 'N'#250'mero:'
          FocusControl = dbNumero
        end
        object lblComplemento: TLabel
          Left = 528
          Top = 64
          Width = 69
          Height = 13
          Caption = 'Complemento:'
          FocusControl = dbComplemento
        end
        object lblPais: TLabel
          Left = 696
          Top = 64
          Width = 23
          Height = 13
          Caption = 'Pa'#237's:'
        end
        object dbNumero: TDBEdit
          Left = 456
          Top = 80
          Width = 65
          Height = 21
          CharCase = ecUpperCase
          DataField = 'NUMERO_END'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
        object dbComplemento: TDBEdit
          Left = 528
          Top = 80
          Width = 161
          Height = 21
          CharCase = ecUpperCase
          DataField = 'COMPLEMENTO'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
        end
        object dbEstado: TJvDBComboEdit
          Left = 16
          Top = 40
          Width = 153
          Height = 21
          ButtonHint = 'Pesquisar Estado (Ctrl+P)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clMoneyGreen
          DataField = 'EST_NOME'
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
          OnButtonClick = dbEstadoButtonClick
        end
        object dbCidade: TJvDBComboEdit
          Left = 176
          Top = 40
          Width = 273
          Height = 21
          ButtonHint = 'Pesquisar Cidade (Ctrl+P)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clMoneyGreen
          DataField = 'CID_NOME'
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
          OnButtonClick = dbCidadeButtonClick
        end
        object dbBairro: TJvDBComboEdit
          Left = 456
          Top = 40
          Width = 233
          Height = 21
          ButtonHint = 'Pesquisar Bairro (Ctrl+P)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clMoneyGreen
          DataField = 'BAIRRO'
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
          OnButtonClick = dbBairroButtonClick
        end
        object dbLogradouro: TJvDBComboEdit
          Left = 16
          Top = 80
          Width = 433
          Height = 21
          ButtonHint = 'Pesquisar Logradouro (Ctrl+P)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clMoneyGreen
          DataField = 'LOGRADOURO'
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
          TabOrder = 4
          OnButtonClick = dbLogradouroButtonClick
        end
        object dbPais: TJvDBComboEdit
          Left = 696
          Top = 80
          Width = 121
          Height = 21
          ButtonHint = 'Pesquisar Pa'#237's (Ctrl+P)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clMoneyGreen
          DataField = 'PAIS_NOME'
          DataSource = DtSrcTabela
          Enabled = False
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
        end
        object dbCEP: TJvDBMaskEdit
          Left = 696
          Top = 40
          Width = 120
          Height = 21
          DataField = 'CEP'
          DataSource = DtSrcTabela
          MaxLength = 10
          TabOrder = 3
          EditMask = '99.999-999;0; '
        end
      end
      object pgcMaisDados: TPageControl
        Left = 0
        Top = 237
        Width = 836
        Height = 226
        ActivePage = tbsContato
        Align = alClient
        TabOrder = 2
        TabStop = False
        object tbsContato: TTabSheet
          Caption = '&1. Contato'
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object lblFoneFixo: TLabel
            Left = 8
            Top = 0
            Width = 69
            Height = 13
            Caption = 'Telefone Fixo:'
            FocusControl = dbFoneFixo
          end
          object lblEmail: TLabel
            Left = 488
            Top = 0
            Width = 32
            Height = 13
            Caption = 'E-mail:'
            FocusControl = dbEmail
          end
          object lblHome: TLabel
            Left = 8
            Top = 40
            Width = 58
            Height = 13
            Caption = 'Home page:'
            FocusControl = dbHome
          end
          object lblFoneCelular: TLabel
            Left = 168
            Top = 0
            Width = 82
            Height = 13
            Caption = 'Telefone Celular:'
            FocusControl = dbFoneCelular
          end
          object lblFoneComercial: TLabel
            Left = 328
            Top = 0
            Width = 95
            Height = 13
            Caption = 'Telefone Comercial:'
            FocusControl = dbFoneComercial
          end
          object dbFoneFixo: TDBEdit
            Left = 8
            Top = 16
            Width = 153
            Height = 21
            CharCase = ecUpperCase
            DataField = 'FONE'
            DataSource = DtSrcTabela
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object dbEmail: TDBEdit
            Left = 488
            Top = 16
            Width = 305
            Height = 21
            CharCase = ecLowerCase
            DataField = 'EMAIL'
            DataSource = DtSrcTabela
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
          object dbHome: TDBEdit
            Left = 8
            Top = 56
            Width = 473
            Height = 21
            CharCase = ecLowerCase
            DataField = 'SITE'
            DataSource = DtSrcTabela
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            OnKeyPress = ProximoCampoKeyPress
          end
          object dbFoneCelular: TDBEdit
            Left = 168
            Top = 16
            Width = 153
            Height = 21
            CharCase = ecUpperCase
            DataField = 'FONECEL'
            DataSource = DtSrcTabela
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object dbFoneComercial: TDBEdit
            Left = 328
            Top = 16
            Width = 153
            Height = 21
            CharCase = ecUpperCase
            DataField = 'FONECOMERC'
            DataSource = DtSrcTabela
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
        end
        object tbsDadosAdcionais: TTabSheet
          Caption = '&2. Outras Informa'#231#245'es'
          ImageIndex = 2
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object dbNFeDevolucao: TDBCheckBox
            Left = 12
            Top = 114
            Width = 321
            Height = 17
            Caption = 'Permitir emiss'#227'o de NF-e de Devolu'#231#227'o para o cliente'
            DataField = 'EMITIR_NFE_DEVOLUCAO'
            DataSource = DtSrcTabela
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object GrpBxCustosOper: TGroupBox
            Left = 5
            Top = 8
            Width = 321
            Height = 97
            Align = alCustom
            Caption = 'Custos Operacionais nas Vendas para o cliente'
            TabOrder = 0
            object lblFrete: TLabel
              Left = 16
              Top = 48
              Width = 30
              Height = 13
              Caption = 'Frete:'
              FocusControl = dbFrete
            end
            object lblOutros: TLabel
              Left = 120
              Top = 48
              Width = 37
              Height = 13
              Caption = 'Outros:'
              FocusControl = dbOutros
            end
            object imgAjuda: TImage
              Left = 273
              Top = 15
              Width = 41
              Height = 41
              Cursor = crHandPoint
              Hint = 'D'#250'vidas sobre estes dados?'#13#10'Clique aqui!'
              Center = True
              Picture.Data = {
                055449636F6E0000010008002020100001000400E80200008600000020200200
                01000100300100006E0300003030000001000800A80E00009E04000020200000
                01000800A808000046130000101000000100080068050000EE1B000030300000
                01002000A8250000562100002020000001002000A8100000FE46000010100000
                0100200068040000A65700002800000020000000400000000100040000000000
                0000000000000000000000000000000000000000000000000000000000800000
                00808000800000008000800080800000C0C0C000808080000000FF0000FF0000
                00FFFF00FF000000FF00FF00FFFF0000FFFFFF00111111111111111111188111
                1111111111111111111111111188811111111111111111111111111110088111
                1111111111111111111111110F088111111111111111111111111110FF088111
                11111111111111111111180FFF08811111111111111111111188880FFF088888
                11111111111111118880007FFF08888888111111111111180007FFFFFF700088
                88811111111111007FFFFFFFFFFFF700888811111111107FFFFFFFFFFFFFFFF7
                0888811111110FFFFFFFFFFFFFFFFFFFF08888111110FFFFFFFFF7CC7FFFFFFF
                FF088881118FFFFFFFFFFCCCCFFFFFFFFFF08881187FFFFFFFFFFCCCCFFFFFFF
                FFF7088818FFFFFFFFFFF7CC7FFFFFFFFFFF088887FFFFFFFFFFFFFFFFFFFFFF
                FFFF70888FFFFFFFFFFFFFCCFFFFFFFFFFFFF0888FFFFFFFFFFFFFCC7FFFFFFF
                FFFFF0888FFFFFFFFFFFFFCCCFFFFFFFFFFFF0888FFFFFFFFFFFFF7CCCFFFFFF
                FFFFF0888FFFFFFFFF7CC7FCCCCFFFFFFFFFF08187FFFFFFFFCCCCF7CCCCFFFF
                FFFF708118FFFFFFFFCCCCFFCCCCFFFFFFFF0811187FFFFFFFCCFFFFCCCCFFFF
                FFF70111118FFFFFFF7C7FFCCCC7FFFFFFF011111118FFFFFFF7CCCCCC7FFFFF
                FF01111111118FFFFFFFFFFFFFFFFFFFF01111111111187FFFFFFFFFFFFFFFF7
                81111111111111887FFFFFFFFFFFF78811111111111111118887FFFFFF788811
                1111111111111111111888888881111111111111FFFFE7FFFFFFC7FFFFFF87FF
                FFFF07FFFFFE07FFFFF807FFFFC000FFFF00003FFE00001FFC00000FF8000007
                F0000003E0000001C00000018000000080000000000000000000000000000000
                000000000000000000000001000000018000000380000007C000000FE000001F
                F000003FF800007FFC0000FFFF0003FFFFE01FFF280000002000000040000000
                0100010000000000000000000000000000000000000000000000000000000000
                FFFFFF00000000FFFFFFFFFFFFFF9FFFFFFF5FFFFFFEDFFFFFFDDFFFFFFDDFFF
                FFE1DFFFFF0FC3FFFC7FF8FFF9FFFE7FF7FFFFBFEFFCFFDFDFF87FEF9FF87FE7
                BFFCFFF73FFFFFF37FFCFFFB7FFCFFFB7FFC7FFB7FFE3FFB7FE61FFB3FC30FF3
                BFC30FF79FCF0FE7DFEE1FEFEFF03FDFF7FFFFBFF9FFFE7FFC7FF8FFFF0FC3FF
                FFE01FFFFFFFFFFFFFFFFFFFFFFF9FFFFFFF1FFFFFFE1FFFFFFC1FFFFFFC1FFF
                FFE01FFFFF0003FFFC0000FFF800007FF000003FE000001FC000000F80000007
                8000000700000003000000030000000300000003000000030000000300000003
                8000000780000007C000000FE000001FF000003FF800007FFC0000FFFF0003FF
                FFE01FFF28000000300000006000000001000800000000000000000000000000
                000000000000000000000000000000006037240083635400BAA8A00098320000
                9632000095310000933100008C2E0000822C00007E2A00007B28000074260000
                6D2400006522000060200000862D01008C32050099390900923A0E007C330E00
                9A3F1200893910006E2F1000A44A1D00AD562B008C472300C06436005A301B00
                8D4E2E00D57849005E34200062392500E78D5F00653E2A00FB9D6F0069422F00
                6B463400A46D5100704C3A00745140007855440087695A008B6E5F008A6D5E00
                8E72640094796C009B827500ECEAE900EAE8E700B0643A006A3E25009E5E3C00
                D78E6700B47A5A00CB9C8300D6AA9200DBB59F00A78C7D00794D3100E8A37A00
                D19A7700E2C5B400875A3B0091654700C68E6A00CA9A7900E2BCA200E4B89600
                F2EEEB00A2734B00B5835A00A3795800AC846200D6A47D00ECCCB100ECD0BA00
                FFF3E900FDF1E700FFF9F400F9F3EE00B17C4C00B38C6A00EEC29900BB987800
                F3CDAA00EAC5A400EBC8A900F8D7B900F9DBBF00FFE3C900FFE3CA00FFE5CD00
                F8E0CA00FFE9D500E5D4C500FBE9D900E8D9CB00DACDC100FDEFE200F8EADE00
                FDF5EE00BA906800C2997100D5AD8500E2B78E00B6947300D6B08A00C5A38100
                C8A68400C2A18000CAA88600B7987900BD9D7E00DAB59200CEAC8C00B7997C00
                EFC8A300D3B29100DCBA9800F8D2AC00E0BD9B00C3A58800E4C2A000FED8B300
                FAD5B100C6A98C00B99E8300FFDBB700C9AD9100FEDAB800FFDDBA00FAD8B600
                EBCBAB00D2B59900FFDEBD00F4D4B500D5B99E00FFDFBE00FEDDBD00FCDCBC00
                E1C4A800DDC1A500D6BCA200CDB49C00FFE1C300E4C9AE00BAA48E00FFE1C400
                FFE2C500FFE3C700D8C0A800F1D7BD00FFE4C900E6CDB500C0AB9700F9DFC500
                C9B6A300FDE6CF00E1CDB900FFE9D300FFEAD500E3D0BD00F9E5D100CDBCAC00
                FFEBD700D9C8B700FFEBD800EAD8C600F3E0CE00FFEDDC00FAE8D700E7D7C700
                FFEEDD00FFEEDE00FCECDC00FFF1E300EDE0D300FFF2E500F2E6DA00FDF1E500
                DBD2C900FFF5EB00FAF0E600EDE4DB00FFF6ED00FFF7EF00EAE3DC00F3ECE500
                E3DDD700FFF9F300FFFAF500FFFBF700FAF6F200F4F1EE00FEFDFC00FCFBFA00
                F9F8F700F4F3F200EDECEB00FFDBB500FFE0C000F7D9BA00FFE2C300FCDFC000
                FFE5CA00FFE6CB00FFE6CC00D9C4AE00FFE8CE00FFE7CE00FFE8D000F1DBC400
                FFEAD300F2DEC900E7D4C000FFECD800FFEDDA00FFEEDB00D0C2B300FFF0E000
                EBDDCE00D0C5B900FBEEE000FFF3E600FFF5EA00F1E9E000F3E5D500FFF2E300
                DFD8D000FFF8F000FAF3EB00EEE9E300FFEDD600EBE7E200FCF9F500FFEFD800
                E5E1DB00F6F4F100E6E4E100FFF2DE00FFF4E300FFFBF300FBFAF800F7F6F400
                FFFBF000FFFAE700FFFEF900FFFCEB00FFFFF100FFFFF700FFFFFC00F1F1F000
                FFFFFF00EDEDED00FFFFFF000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000002F2E2D00000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000002F4640282D000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000002B514A51272D00000000000000000000000000000000000000000000
                0000000000000000000000000000000000000002514A6851272D000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00002846426B6951272D00000000000000000000000000000000000000000000
                000000000000000000000000000000000029514268696951272D000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                293F6C6F69536947272D00000000000000000000000000000000000000000000
                0000000000000000000000000000000224486C684453696624022D0000000000
                000000000000000000000000000000000000000000000000000000002B292422
                40546C6B53537252202228020000000000000000000000000000000000000000
                0000000000000000002C29404849495270716D725353726746331F2024280000
                00000000000000000000000000000000000000000000002C4848527470707054
                716C7677755372736E6647461C1F222800000000000000000000000000000000
                00000000002F49527F7F7F716E6C6D6F73767975787579766F6E717152511C1F
                242900000000000000000000000000000000000052527F7F7A7E818176727779
                797B557D7C78757972736F6C6E7152461C20272D000000000000000000000000
                0000005274937A818689797B7B85787D7D7D7C7C7C7C7D557B797776737A6E54
                47201F252C000000000000000000000000006A939381868F8D85888484828280
                4A181B533C78C87C7D78757B7776737A6E663F1F252D00000000000000000000
                0070939B908F8D4BCA8C8B878783834A0A1018231B328080C8C87C78857B7776
                7E7A663F1F272D00000000000000000074939B909792CACCC9C9C9C98A8A8732
                0C09060510095380808080807C785679767E7A663B0129020000000000000071
                939B90979A599494CB919191C9C9C9340D0A07080C0B69878383838383808457
                79867E7A661C2202000000000000819B9B9DD09A9C5A96969595959594919141
                0E0F0E0E0D147D8A8787878383838384858E86817A471F27020000000000939B
                9DD09A9CCDCD5B5A99999696969595581A0F0F0F0E3DC9C9C9C98A8787878787
                84858E86816E3B222A00000000819B9DD09F9C5C5CCFCFCDCDCD5A5A5A5A5A96
                963D414155CBCB91919191C9C9C98A8A8ACA858E8681661F282D0000009B9DA4
                9FD49ED3D3D2D2D25C5CCFCDCDCDCD5B5A5A5A5A5A9696959595919191919191
                91C988928F906C1F252D0000909DA4A6D7A3A0A0A0D3D3D3D3D2D2D2D25CCFCF
                CE594456CD5B5A5A5A969695969594949494CC4B8D899049222D000090A4DBA2
                D6A1A1A1A1A1A0A0A0D3D3D3D3D3D2D2D2440632CE5CCDCDCD5A5A5A5A969695
                959696989A8E896E222B00009DA4A65FA3D9A5A7A5A5A1A1A1D5A0A0A0A0D3D3
                D3440618D2D2D25C5CCFCDCDCD5A5B999996CD9C4C929773222B0000A4DB6261
                60AAD9D9D9D8D8A7A5A5A1A5A1A0A0A0A057070544D3D2D3D2D2D25CCF5CCECD
                CD5BCE5B989A9789222B0000DBDB62DDAFAEADAAAAAAAAD9D9D8D8D8A5A5A5A1
                A1A113061844A0D3D3D3D3D2D2D2D2D2D25CD1D2989AD097222B0000DEDE62DD
                AEB0DCAEAEAEAEADADAAAAD9D9D9D8D8A7A74208071E3C9CA0A0A0A0D3D3D3D3
                D3D2D3A0D49AD0D0222B0000DEDEB5B163B2B0B0DCDCDCDCAEAEAEADADAAAAAA
                D9D95D14081223214BA5A1A1A0D5A0A0A0A0A1E9D4A2D0D0222D0000DEDEB5B1
                B4E1B2B2B2B0B0B0DCDCDCDCAEAEAEAEAEADAA360C07181E1B4BA5A5A5A5A1A1
                5EA1E9ECD6D7A697252D0000DE62E5B84EB94DE0B2B2B2B2E4B0B0B0B0DCDCDC
                DCDCAE4B0D1005181518D9D9D8D8A7A5A5A5F0F0D6D79F8F282D0000A6B5E5B8
                B7F5B6E14D4D4D4DE0E0B2B2AB47353C4AB0DCDC140C0507111043AAAAAAAAD9
                D9DAF6F0A9A8A2862A000000A6B5E5BBBCF2F5B6B6B6E14D4D4D4DE03609191E
                1572B0B0340D0607090A42AEAEADADAAAAF1F9ABA9A85F712F00000000B5E5ED
                E265FAE6B9B9B9B9B9B6B64D0C0905111042E0E0340D07060A0A42B0DCDCDCDC
                E4F9F8E3DDAC9F2A00000000005FE5BDEA45FBF7E6E6BABABABAB9B90D0A0410
                0A374D4D1D0D07070B0B42B2B0B0B0B2F9FDDFE3DD61893A000000000000E5BD
                BBBCC1FDFB4FE6E6E6E6BABA1D0D08091A64B6640D0C07080C0C4CE0E0B2E0F9
                FDF564E3DDA23A00000000000000E5BDEDE845BFFDFDBFBEBEBEBEBE370E0A10
                39BAB9370D0B100C0D34E1E14DE1FAFDF7DFB3B1DD8F030000000000000000BD
                EDEF30C2C0FDFDF7BF4F4F4FBE260D10193837100B0C0E0E1D64B6B6BAFDFDFD
                B7E2B8B19F9300000000000000000000BDEFEFC7C2F7FDFDFDF7C0C0BFBF3716
                080606080C0F175264BABEF7FDFDFDB7BCB8B85F9B0000000000000000000000
                00EDEFEAC7EEF7FDFDFDFDFBF7C0BFBF3E373737373E4F4FFAFDFDFDFDFBE7BC
                E2B861A40000000000000000000000000000EDEF3145EEC5FDFDFDFDFDFDF7C0
                C0C0C0C0C0C0FBFDFDFDFDFDBE5045E8EA61A600000000000000000000000000
                000000BB3130FEFCF4F3FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD4FC15045BCE8
                61B5000000000000000000000000000000000000B1EAC7FEFCC6F4C5C3FDFDFD
                FDFDFDFDFDFDFDFDEBC1EEC24545B8AC00000000000000000000000000000000
                000000000000B130FEFEFCFCC6C5C4C3FBFBFBC3FBF7F3F4C6C24545E8DDB100
                000000000000000000000000000000000000000000000000B1E8C7C7FEFCC6C6
                C6C6C6C6C6C6C6FCFC45E2B1B100000000000000000000000000000000000000
                0000000000000000000000B1BBEA30C7C7C7C7C73030EAB8B3B1000000000000
                000000000000000000000000FFFFFFFFFFFF0000FFFFFFFFFFFF0000FFFFFFE3
                FFFF0000FFFFFF83FFFF0000FFFFFF03FFFF0000FFFFFE03FFFF0000FFFFFC03
                FFFF0000FFFFF803FFFF0000FFFFF003FFFF0000FFFFE001FFFF0000FFFF0000
                FFFF0000FFF800003FFF0000FFE000000FFF0000FF80000003FF0000FF000000
                00FF0000FE000000007F0000FC000000003F0000F8000000001F0000F0000000
                000F0000E0000000000F0000C000000000070000C00000000007000080000000
                0003000080000000000300000000000000030000000000000003000000000000
                0003000000000000000300000000000000030000000000000003000000000000
                0003000000000000000300000000000000030000000000000007000000000000
                0007000080000000000F000080000000000F0000C0000000001F0000C0000000
                001F0000E0000000003F0000F0000000007F0000F800000000FF0000FC000000
                01FF0000FE00000003FF0000FF0000000FFF0000FFC000001FFF0000FFF00000
                7FFF0000FFFE0003FFFF00002800000020000000400000000100080000000000
                000000000000000000000000000000000000000000000000FEFDFD00FAF9F900
                F9F8F800F5F4F400EEEDED00751C00006A1A00005C180000802400007B240000
                74220000872900008E2D02006D2C0F0094310100772903009B3907009C3B0C00
                A13F0F00903D1400AB4A1B0078351400883E1A00A64E200099481F00A8532800
                C866350097533000A65C3600BC8A7000CB998000EEECEB00EDEBEA00EBE9E800
                E6E4E3007D310900C86F4000D0835A00C8876200BE886900C58E7100C7957900
                BE968000AC6C4600AD7C5D00F7B28800F3EEEB00CEA18400DBAF9000CAA58D00
                FAEDE400F9F6F400E3AF8A00D4B39A00EDE5DF00CAC6C300F0C49F00CEB49E00
                F3D5BC00F9DDC600F2DCCA00EBD7C600F9ECE1007A746F00F3E8DF00F9F0E900
                AC886800BF9A7800B8977900E2BB980088736100C3A78D00B79D8500F0D1B500
                FBDCC000FFE0C4006F635800F9E2CD00D5C6B8008B817800D7C9BC00FCECDE00
                EFE1D400D2C6BB00F1E5DA00EDE3DA00D2A27300C4996D00B9936D00BE9A7600
                B8957300C8A37E00B3917100DBB48C00CFA98400886F5700E9C09600BD9C7B00
                B7977800AB8D7000EBC39B00B8987900D2AF8B00BE9E7E00DBB89500CFAE8D00
                F5CEA800E7C29F00ECC8A400D8B69600F9D3AE00F7D1AC00FDD8B200E9C7A400
                BDA18500B69B8000E3C2A200FEDAB600ECCBAB00FFDDBA00FBD9B700F4D3B200
                D9BB9E00A58E7800FDDBB900CAAF9400E7C8AA00FFDEBD00FCDCBC00FFDFBF00
                FFE0C100FCDDBE00F8D9BB00FFE1C300BCA69000FFE2C5008F7F6F00FFE3C800
                FFE4C900F6DCC300FFE5CC00CAB5A100645A5000F9E0C80085786B00FFE7CF00
                FFE8D100DAC6B200FFE9D300CBB9A800FFEAD500A7998B00FFEBD800FFECD900
                CEBFB000FFEDDB00FFEDDC00FFEEDD00F2E1D100FFEFDF00FDEDDD00FFF0E100
                FFF1E300ECDFD200EBE4DD00E8E1DA00F2EBE400DCD6D000FFF9F300EBE6E100
                AAA7A400FEFAF600F6F2EE00FDFBF900E3E1DF00FBFAF900967D6300C4A48200
                B5997C00D1B39200C8AB8D00FFDCB500FDDCB900E2C7AB00FFE3C600BEAA9500
                FFE5CA00E2CBB300CEB9A300FFE6CC00D7C3AD00BDAB9800FFE8CE00D2BFAA00
                E5D1BC00C3B3A200C2B2A100FFEBD600F9E6D100D6C5B300FAE9D600DBCDBE00
                B1A79C00CEC3B700A9A09600FFF2E400DBD0C400FFF3E600FFF4E800FFF5EA00
                DDD5CC00FFE1BF00FFE2C100FFE3C300FFE4C400FFE7CB00FFEEDA006E686100
                FFF5E900FFF8F000FAF5EF00FFEBD200FEEDD600B2A69700FFF0DD00FFF3E300
                524F4B005B585400FFF7ED00EDE9E400FFF3E100FFF4E400FCF5EB00FCF8F200
                FFFDFA00FFFAF100E1DED900FCF7ED00FFFDF90076757300FFFEFC00FFF5DF00
                FFFAEA00FFFBEE00FFFCF300FFFDF500FFFFF800FFFFFB00F0F1F100FFFFFF00
                EDEDED006C6C6C005E5E5E0056565600FFFFFF00000000000000000000000000
                000000000000DADA000000000000000000000000000000000000000000000000
                0000000000DA43DA000000000000000000000000000000000000000000000000
                00000000DA58574D000000000000000000000000000000000000000000000000
                000000DA595E574D000000000000000000000000000000000000000000000000
                0000DA5C5F6157DA000000000000000000000000000000000000000000000000
                00DAB3B25E655FDA00000000000000000000000000000000000000000000DADA
                DAB3B3B246655F60FEDA000000000000000000000000000000000000DADA6463
                664568676565675A2D60E3FD00000000000000000000000000007C5D747373B2
                5F6A6E6C706B466AB26859608FFC00000000000000000000006474487E367B75
                777A706FB6B66B6C696AB562434DFD000000000000000000B3877E7B7F7A797D
                82391D252E357871706D46B4484460FD0000000000000074873AB83B82838282
                D52C061315196F7876766F726EB56260FD000000000049BABDBC4BB988868683
                D61C070C0B246BD478787876777BB5688FFD00000049C0BDBC3CBB8A8A8AB988
                D8300808082CD78282808080B7777B7E5BE4000000BA96BC9092BE8DBB8B8A8A
                8BBE31283084884C868383828281777BB547FD0049C4C83E939392929292BE8D
                8D8DC14B8BBE8A8A8888884C868685B83A7CF0008E9BC3C7C697979595939393
                92DE4A1835DF8DBB8A8A8A8A88B9884ABF484040964F3E9A9A9A99C697979795
                93C64A0F27F293BEBE8D8D8D8B8BBB8CBC3A5040CC51A4A09E9D9D9C9A9A9999
                C6C6DF191246DF9792929292BEBEC190BCBF9840CCCA53A3A2A0A0A09E9E9C9C
                9A9AE730091B2E909A9593939392DE4EC394E040CCCF55D1CECEA2A3A2A2A0A2
                E8E2E83D170D1B268CD997979795DFC7C3BFE04054D355E5D2D0D0D0CECED052
                3B3CA1F32D06110F2DE89C9A9999F2C93EC2CB4054A856EEECD2D2D1D1D1DB28
                1A252AF6320B0F091C4EE29D9CE1F3C794C2AB4000A8A642F7DCE5E5E5E53F10
                0D0C1DF4360B0F0A193DD1A0A0F4F39FBFC5C5000054EDA7ACF1A9DCDCDC4216
                0C091EFA2B070F061C52D1A3F4F83FA4CACDC5000000EDAAADEBFAACA9A9F643
                07143D331C0B0A0730F6DBF5FAE955A4C5C50000000054AFE6ADF1FAEBACEB42
                2D091A1A06080E2BF5ECEBFAEA4156C83800000000000054232234F1FAFAF1FA
                EF3E1F292A3A56FAFAFAFAEAA737CF3800000000000000005423FB04B0FAFAFA
                FAFAFAFAFAFAFAFAFAEBDD2FE6CAC50000000000000000000054AA20F9040201
                FAFAFAFAFAFAFAAE34AD2FA5D3000000000000000000000000000054E605F904
                03B0B0B0AEB034042FE6EDC500000000000000000000000000000000000054AA
                21FBFBFB0520E656560000000000000000000000FFFFCFFFFFFF8FFFFFFF0FFF
                FFFE0FFFFFFC0FFFFFF80FFFFFC003FFFF0000FFFC00003FF800001FF000000F
                E0000007C0000003800000038000000100000001000000000000000000000000
                000000000000000000000000000000008000000180000001C0000003C0000007
                E000000FF000001FF800007FFE0000FFFFC007FF280000001000000020000000
                0100080000000000000000000000000000000000000000000000000000000000
                640000005C00000057000000490000008D1D0000904E3600701F0000A73B0F00
                9D3A1100853E210088340F00A5461900B9714D00C59A8400BD988500EFEDEC00
                C8754700AB7A5E00BD886A00CB896000C5997F00C2A79700CEA08200E2C5B200
                DCB69900D2B39D00E3B69300D3A98800E8BF9F00F1D1B600CAB8A900F6E2D100
                F5F0EC00CFAF9200C1A48A00EDCDAF00DEC6B000EBD3BE00AB856100C39B7300
                B1906E00DCB79200EAC49F00C3A486006F5E4D00F3CEAA00937E6900B1998100
                A28C76006E605200D6BBA000FCDCBD00EDD2B800FFE4CA00D6C0AB00FFE6CD00
                E3CDB700DDC7B200FFE9D300FFEAD500D9C7B50083786D00B5A79900877D7300
                FFEEDE00D4C6B800FBECDD00FFF2E500F0E5DA00DDD3C900FCF1E600807B7600
                F4EFEA00F5F1ED00856D5400BE9E7C00C4A68500AB9074009E856B00B5997C00
                C6A98900C2A58700E4C3A000DEBF9D00FFDDB800E4C5A500FFDEBA00675A4C00
                B9A28900E5CAAD00DCC3A900FFE3C500FBE1C400B8A59000FFE7CD00FFE8CE00
                FFEBD600FFEDD900FFEEDC00D2C9BF00FFE1BC00FFE5C600FFE9CF00FFEAD000
                FFEBD400847D7500CFC5B900FFF4E700F4EFE900EDE8E200FFE3BF00FFE8CB00
                FFEBD100FFECD400FFF1DF00FFF3E300FFF7ED00EFECE800FFE8C700FFEACD00
                FFEBCF00FFF0DA00FFF1DD00FAF0E100FFF7EB005D5B5800FFE7C000FFEFD600
                FFF2DE00FFEFD200FFF6E700FFFEFC00E3E2E000FFEFCE00FFF8E700FFF4D700
                FFF8E400FFF9E900FFFBE600FFFEEF00FFFFE900FFFFF600FFFFF800FFFFFB00
                FFFFFD00F8F9F900F6F9FA00FAFCFE00F5F5F600EBEBEC00FFFFFF0070707000
                6B6B6B00656565005D5D5D005C5C5C005252520044444400FFFFFF0000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000003E3E3E0000000000000000000000003E28273E000000000000000000
                00003E302A4F99000000000000000000402F31512B4C589D9800000000004E4E
                2322542E7F534D292D9C0000004E595B34861B09115557562C4B9B00005E3978
                70881C040765776F2452329A5E3D7271386780191E825C5C665A509E1F207B61
                3C698B141D8D5F36705D337E6B43744163738F170C79893B6860256A64477D44
                6C83818C0B083587627A3A48646D8E75971505261201138F8A7C376A00858490
                970F02180A031A9791453F000064969797970E0D061697974A42000000006410
                949797979797972146000000000000006476959392496E6400000000FF1F0000
                FE1F7C5DFC1F73B2F0076E6CC003466A80015960800000000000000000000000
                0000744800007B750000706F80016B6C8003B562C007FD00F00F000028000000
                3000000060000000010020000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000552A1502552A1508552A1513552A151D552A1519552A150C
                552A150300000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000552A1502552A150A552A1520552A1542552A1556552A1543552A151E
                552A1508552A1501000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                552A1502552A150C552A152B552A1565552A1596552A15A0552A1575552A1532
                552A150C552A1501000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000000000000000552A1501552A1502
                552A1511552A1544552A1595946037DF8D5933E8552A15CF552A1590552A153C
                552A150E552A1501000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000000000000000552A1504552A151A
                552A1558552A15AEB07A47F9D5A87BFFB27A46FB552A15D9552A1594552A153E
                552A150F552A1501000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000552A1503552A1525552A1579
                552A15B9AF7A48FAD0A77DFFDAAF85FFB17947FC552A15D8552A1594552A153F
                552A150F552A1501000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000552A1501552A150100000000552A1501552A1518552A1582552A15D0
                9A673DF3C9A27AFFDAB186FFE1B58AFFB17948FC552A15D8552A1592552A153E
                552A150F552A1501000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000000000000000552A1501
                552A1502552A1504552A1504552A1503552A1510552A156E552A15CDAC794AFA
                C69F78FFD5AD85FFE5BA8FFFE3B88EFFB27C4BFC552A15D5552A1590552A1540
                552A1513552A1504552A15010000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000552A1501552A1502552A1506552A150A
                552A1509552A1506552A1507552A150F552A154E572C16C67C4E30EEC6A27EFE
                CDA882FFE0B78EFFEFC398FFE2B990FFB58152FD552A15D8552A159A552A1557
                552A152A552A1516552A150D552A1506552A1502552A15010000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000552A1501552A1502552A1507552A1510552A151F552A152D
                552A152C552A1530552A1543552A156C562B16BD5C311BEA9E7556F7C6A37FFF
                D1AC86FFE7BE93FFEDC399FFDFB891FFBE8D62FE582D17E7552A15C1552A1592
                552A1569552A154D552A1536552A1520552A1510552A1507552A1502552A1501
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000552A1502552A1506552A1510552A1521552A153D552A155E552A1581
                552A1595552A15AE582D17CE592E18E660351FF48E6448F9BB9777FEC5A381FF
                D5B08AFFEDC49AFFEBC29AFFDCB691FFB38966FE5D321CF5552A15E7552A15D2
                552A15BB552A15A4552A1585552A155E552A153D552A1521552A1510552A1506
                552A150200000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000000000000000552A1501
                552A1503552A150A552A151C552A153A552A155F552A158B552A15B05A2F19CF
                805234EA9F7453F7A78161FBA98365FDB08D6EFEB79778FFBE9D7DFFC8A684FF
                D9B490FFEEC59CFFE8C099FFDAB48FFFC29971FFA3734AFE663920F9552A15F3
                552A15EC552A15E1552A15CE552A15B0552A158B552A155F552A153A552A151C
                552A150A552A1503552A15010000000000000000000000000000000000000000
                000000000000000000000000000000000000000000000000552A1501552A1504
                552A150F552A1527552A1551552A1583552A15AF986A46E8A37752F7AF8B68FD
                B7987BFFB89879FFB89879FFB89979FFBA997AFFBE9D7DFFC6A483FFD2B08DFF
                E0BC96FFF1C8A2FFE8C19AFFDCB691FFCDAB88FFC3A281FFB7916AFFB18458FF
                A47449FE552A15F8552A15F2552A15E6552A15D1552A15AF552A1583552A1551
                552A1527552A150F552A1504552A150100000000000000000000000000000000
                0000000000000000000000000000000000000000552A1501552A1506552A1514
                552A1532552A1561592E189BAC825AF4B18D6AFFB89C81FFB89D82FFB99E82FF
                BC9E80FFC0A07FFFC5A381FFC8A583FFCAA886FFCEAC8CFFD6B492FFDFBB99FF
                EEC7A2FFF8D0A9FFF0CAA3FFE2BD98FFD5B290FFC9A887FFC1A181FFBD9D7EFF
                BB9C7BFFB48B61FFAA7B50FE572C16F9552A15F2552A15E3552A15C7552A1599
                552A1561552A1532552A1514552A1506552A1501000000000000000000000000
                00000000000000000000000000000000552A1501552A1505552A1515552A1539
                552A156FAB815AE4B18F6DFEB89E85FFBBA086FFBFA489FFC5A88CFFC9AC8EFF
                CDAF91FFD3B291FFD8B592FFDCBA96FFDFBD9BFFE2C09DFFE7C3A0FFF4CDA9FF
                FBD5ADFFFED6AFFFFBD3ACFFEEC8A2FFE2BD9AFFD8B593FFCFAE8CFFC9A887FF
                C3A384FFBFA081FFBD9E7FFFB48B63FFA3744BFE552A15F8552A15ED552A15D4
                552A15A7552A156F552A1539552A1515552A1505552A15010000000000000000
                00000000000000000000000000000000552A1504552A1512552A15376C40277D
                B28C68F7B69A7EFFBBA288FFC0A68CFFC8AC92FFD0B497FFD8B99CFFDDBD9FFF
                E1C1A2FFE5C4A4FFEECCABFFF4D1ADFFF8D4B0FFFAD5B0FFFCD6B2FFFED8B3FF
                FFD9B3FFFFD9B3FFFFD9B2FFFCD5B0FFF4CFA9FFE7C39FFFE1BD9AFFDBB897FF
                D3B290FFCCAB8BFFC5A686FFC0A182FFBB9975FFB3855AFF60341DFA552A15F1
                552A15DB552A15AF552A1572552A1537552A1512552A15040000000000000000
                000000000000000000000000552A1502552A150C552A152CA174519DB59371FC
                BAA38BFFBEA58DFFC7AD93FFD0B59AFFDABDA0FFE2C3A6FFEBCCADFFF5D4B2FF
                F9D7B5FFFBD9B7FFFDDAB8FFFEDAB8FFFFDCB7FFDBA27BFF9F4B1FFFC26536FF
                FFC394FFE6A175FFF9D0A9FFFFDAB4FFFED9B3FFFBD6B0FFF6D2ACFFEDC9A5FF
                E4C19EFFDDBB99FFD4B492FFCCAC8CFFC4A587FFC1A284FFB88D64FF845535FC
                552A15F3552A15DD552A15AC552A1568552A152C552A150C552A150200000000
                0000000000000000552A1501552A1507552A1520AB805C99B59677FDBAA48DFF
                C0A891FFCBB299FFD7BCA2FFE1C5A9FFEDCFB1FFF8D9B9FFFCDCBCFFFEDDBDFF
                FFDEBDFFFFDEBCFFFFDDBBFFFFDDBBFFDAA37DFF7E2A00FF852E02FFA94E20FF
                FA9D6EFFC36638FFB26438FFFFDAB7FFFFDBB6FFFFDBB5FFFFDAB5FFFDD7B3FF
                F8D3AFFFEECCA8FFE4C2A0FFDBBA99FFD0B091FFC6A88AFFC2A385FFBA926AFF
                895B39FD552A15F3552A15D7552A15A0552A1558552A1520552A1507552A1501
                0000000000000000552A1504552A1514A074526DB79779FCBAA490FFC0AA93FF
                CCB49DFFDAC0A6FFE5CAAFFFF6D8BBFFFCDFBFFFFFE0C1FFFFE0C1FFFFDFC0FF
                FFDFC0FFFFDFBFFFFFDFBEFFFFDFBDFFAA663FFF762700FF822B00FF943100FF
                943302FF862F03FF822C00FFEBBC96FFFFDCB8FFFFDCB8FFFFDBB7FFFFDBB7FF
                FFDBB7FFFDD9B4FFF7D3AFFFE8C6A4FFDEBE9DFFD2B394FFC7A98BFFC2A587FF
                B9916AFF75482CFC552A15EF552A15CD552A158C552A1542552A1514552A1504
                00000000552A1501552A1509552A1528B9997AF6BCA892FFC0AB96FFCCB69FFF
                DAC2A9FFE6CCB3FFF8DCC0FFFEE1C4FFFFE1C4FFFFE2C3FFFFE1C3FFFFE0C3FF
                FFE1C2FFFFE0C1FFFFE0C1FFFFE0C0FF9D5A34FF6B2300FF7F2A00FF933100FF
                8D2F00FF772700FF792800FFE2B08AFFFFDEBCFFFFDDBBFFFFDCBBFFFFDCBAFF
                FFDCB9FFFFDCB9FFFFDBB8FFF9D6B4FFEAC9A8FFDFBF9FFFD2B496FFC7AB8DFF
                C3A78AFFB99067FF552A15F9552A15E7552A15B8552A156B552A1528552A1509
                552A1501552A1503552A1512BF9C7BD8BDA893FFC1AD99FFCCB8A1FFDAC3ACFF
                E7CEB5FFF9DEC3FFFEE3C8FFFFE3C7FFFFE3C7FFFFE2C6FFFFE2C5FFFFE2C5FF
                FFE2C5FFFFE1C4FFFFE1C3FFFFE1C2FFC68D69FF632100FF622000FF662200FF
                672200FF6C2400FF7E330DFFF8D3B3FFFFDFBEFFFFDEBDFFFFDEBDFFFFDEBCFF
                FFDDBBFFFFDDBBFFFFDDBAFFFFDCBAFFFAD8B6FFEACAAAFFDFC0A2FFD3B598FF
                C9AD90FFC6A788FFB2865DFE552A15F4552A15D6552A1594552A1542552A1512
                552A1503552A1506BB906D5ABDA58CFEC2AF9CFFCCB7A3FFDAC4AEFFE6CFB7FF
                F8DFC6FFFEE5CBFFFFE5CAFFFFE4CAFFFFE3C9FFFFE4C9FFFFE4C8FFFFE3C7FF
                FFE3C7FFFFE3C7FFFFE2C6FFFFE2C5FFF8D7B9FF894926FF5E1F00FF5E1F00FF
                612000FF672200FFD19975FFFFE0C1FFFFDFC1FFFFDFC0FFFFE0C0FFFFDFBFFF
                FFDEBEFFFFDEBEFFFFDEBDFFFFDEBDFFFFDEBCFFFAD8B7FFEACBABFFDFC1A4FF
                D3B79AFFCBAF93FFC39F7CFF794C30FB552A15E8552A15B4552A1560552A1521
                552A1506552A150CC1A384E5C2B09EFFC9B6A3FFD7C2AEFFE5CEB9FFF7DFC7FF
                FEE5CDFFFFE6CDFFFFE6CCFFFFE6CCFFFFE5CBFFFFE5CAFFFFE5CAFFFFE3C9FF
                FFE3C9FFFFE3C8FFFFE3C8FFFFE3C8FFFFE3C7FFFFE3C7FFD09A78FFC68E6BFF
                C78E6BFFF2CCACFFFFE2C3FFFFE2C3FFFFE1C3FFFFE0C3FFFFE1C2FFFFE0C2FF
                FFE0C1FFFFE0C0FFFFE0C0FFFFDFBFFFFFDFBEFFFFDFBEFFF8D9B9FFE9CBADFF
                DDC1A4FFD1B59AFFCBB195FFBA9169FF552A15F2552A15CE552A1583552A1534
                552A150C875D4118C0A992FEC5B4A2FFD1BEACFFE0CCB8FFF0DAC4FFFDE6CFFF
                FFE8D0FFFFE7D0FFFFE7CEFFFFE6CEFFFFE6CEFFFFE6CDFFFFE6CDFFFFE6CCFF
                FFE5CBFFFFE5CBFFFFE5CBFFFFE5CBFFFFE3CAFFFFE3C9FFFFE3C9FFFFE3C8FF
                FFE3C8FFFFE3C8FFFFE3C7FFFFE3C6FFFFE2C6FFFFE2C5FFFFE2C5FFFFE1C3FF
                FFE1C3FFFFE1C3FFFFE1C2FFFFE0C2FFFFE0C2FFFFE1C2FFFFE0C0FFF3D4B7FF
                E6C9ADFFD8BDA2FFCEB49AFFC6A483FF5A2E19F8552A15DF552A159D552A1544
                552A1511CCAB8CB6C6B6A6FFCBBAA9FFD9C6B4FFE7D4C0FFFAE4CEFFFFE8D2FF
                FFE8D2FFFFE8D2FFFFE8D1FFFFE8D0FFFFE8D0FFFFE8D0FFFFE7CFFFFFE6CEFF
                FFE7CEFFFFE6CEFFFFE6CDFFFFE6CCFFFFE6CCFFFFE6CBFFF9DABEFFE4B694FF
                ECC3A4FFFFE5CAFFFFE3CAFFFFE3C9FFFFE3C9FFFFE3C8FFFFE3C7FFFFE3C7FF
                FFE2C6FFFFE3C6FFFFE2C5FFFFE1C5FFFFE2C4FFFFE1C4FFFFE2C4FFFCDEC0FF
                ECCFB2FFE0C5A9FFD4BAA0FFCFB59DFFAC815EFD552A15E6552A15A9552A154B
                552A1513C9AE95EDC9BAABFFD2C2B1FFE1CFBDFFF0DDC9FFFEEAD4FFFFEAD5FF
                FFEAD5FFFFEAD4FFFFEAD4FFFFE9D3FFFFE9D2FFFFE9D2FFFFE8D1FFFFE8D1FF
                FFE8D1FFFFE8D0FFFFE7D0FFFFE7CEFFFFE7CFFFFFE7CEFFE3B696FF943100FF
                B36338FFFFE6CBFFFFE5CCFFFFE5CBFFFFE5CBFFFFE5CAFFFFE3C9FFFFE3C9FF
                FFE3C8FFFFE3C8FFFFE3C7FFFFE3C7FFFFE2C6FFFFE2C6FFFFE3C6FFFFE3C6FF
                F3D8BCFFE7CCB1FFDBC2A7FFD3BAA1FFC5A07CFF552A15E8552A15AD552A154E
                552A1514CAB5A0FCCDBDB0FFD8C9B8FFE7D5C5FFF8E5D3FFFFEDD9FFFFEBD7FF
                FFEBD8FFFFEBD7FFFFEBD6FFFFEAD5FFFFEAD5FFFFEAD5FFFFEAD3FFFFE9D3FF
                FFE9D3FFFFE9D2FFFFE9D2FFFFE8D1FFFFE8D1FFFFE8D0FFE3B799FF943100FF
                A44A1CFFFFE6CEFFFFE6CEFFFFE6CEFFFFE5CDFFFFE5CCFFFFE6CCFFFFE5CBFF
                FFE5CAFFFFE5CAFFFFE3C9FFFFE4CAFFFFE4C9FFFFE4C9FFFFE3C7FFFFE5CAFF
                FBDFC4FFECD1B8FFE0C8AEFFD7BEA7FFD0AD8FFF552A15E9552A15AE552A154F
                552A1514CCBBABFFCFC1B3FFDBCCBEFFEAD9CAFFFBE9D9FFFFEEDCFFFFECDAFF
                FFEDDAFFFFECDAFFFFECD9FFFFECD8FFFFEBD8FFFFEBD7FFFFEBD6FFFFEAD6FF
                FFEBD6FFFFEAD5FFFFE9D3FFFFE9D3FFFFE9D3FFFFE9D3FFEBC7AAFF923000FF
                963200FFE4B899FFFFE8D0FFFFE7CFFFFFE7D0FFFFE7CFFFFFE6CEFFFFE7CEFF
                FFE6CDFFFFE6CCFFFFE5CDFFFFE6CBFFFFE5CBFFFFE5CAFFFFE4CAFFFFE6CBFF
                FFE4CBFFEFD6BDFFE3CBB3FFD9C2AAFFD5B99CFF552A15E9552A15AE552A154F
                552A1514CEC1B3FFCFC3B6FFDCCEC0FFEBDCCDFFFCECDCFFFFEFDEFFFFEEDDFF
                FFEDDDFFFFEEDCFFFFEDDCFFFFEDDBFFFFECDAFFFFECDAFFFFECD9FFFFECD8FF
                FFECD8FFFFEBD7FFFFEBD7FFFFEBD7FFFFEAD6FFFFEAD5FFFFEAD5FF923A0EFF
                953100FFA34717FFE4B595FFFFE8D2FFFFE8D1FFFFE8D1FFFFE7D0FFFFE7D0FF
                FFE7CFFFFFE7CFFFFFE7CEFFFFE7CEFFFFE6CEFFFFE6CEFFFFE6CDFFFFE8CEFF
                FFE7CFFFF1D8BFFFE5CDB6FFDAC2ACFFD8C0A7FF552A15E9552A15AE552A154F
                552A1514CFC4B8FFD0C4B8FFDDD0C3FFECDED0FFFDEEDFFFFFF1E2FFFFEFE0FF
                FFEFDFFFFFEEDEFFFFEEDEFFFFEEDEFFFFEEDDFFFFEEDDFFFFEEDCFFFFEDDBFF
                FFEDDAFFFFECDAFFFFECDAFFFFECD8FFFFECD8FFFFEBD8FFFFEBD8FFCA9474FF
                8A2E00FF933201FFDB7E4FFFE8A67EFFF9DEC6FFFFE9D3FFFFE9D3FFFFE8D3FF
                FFE8D2FFFFE8D1FFFFE8D0FFFFE8D0FFFFE8D0FFFFE7D0FFFFE7CFFFFFE9D0FF
                FFE9D2FFF1DAC2FFE5CEB7FFDAC4AEFFDAC4ADFF552A15E8552A15AD552A154E
                552A1514CFC3B8FFD0C5BBFFDDD2C6FFECDFD3FFFDEFE2FFFFF2E4FFFFF0E2FF
                FFF0E2FFFFF0E1FFFFEFE0FFFFF0E0FFFFEFE0FFFFEEDFFFFFEFDEFFFFEEDEFF
                FFEEDDFFFFEEDDFFFFEDDCFFFFEDDBFFFFEDDBFFFFEDDAFFFFEDDAFFF8E0CCFF
                7F340EFF8C2E00FF993909FFFB9D6FFFE78D5FFFEDC9B0FFFFEBD6FFFFEAD5FF
                FFEAD5FFFFE9D3FFFFEAD3FFFFE9D3FFFFE9D3FFFFE9D2FFFFE8D2FFFFEBD4FF
                FFECD5FFF2DCC5FFE5D0BAFFDAC6B1FFD8C3ACFF552A15E6552A15A9552A154B
                552A1513CEC4B7FFD1C8BEFFDED4C9FFEDE1D5FFFDF1E5FFFFF5E8FFFFF2E5FF
                FFF2E5FFFFF2E4FFFFF1E3FFFFF1E2FFFFF0E3FFFFF0E1FFFFF0E1FFFFEFE0FF
                FFEFE0FFFFEFDFFFFFEFDFFFFFEEDEFFFFEEDEFFFFEEDEFFFFEEDDFFFFEDDCFF
                B17758FF762700FF913000FFA64617FFD7794AFFBB6135FFECCAB0FFFFEBD7FF
                FFEBD7FFFFEBD6FFFFEBD6FFFFEBD5FFFFEAD5FFFFE9D5FFFFEAD4FFFFEDD7FF
                FFEFD8FFF2DDC8FFE7D3BEFFDBC9B4FFD7C0A9FF552A15DF552A159D552A1544
                552A1511D0C3B6FCD4CBC3FFE0D7CEFFEEE3D9FFFDF1E7FFFFF8ECFFFFF3E8FF
                FFF3E7FFFFF2E6FFFFF2E6FFFFF3E5FFFFF2E5FFFFF2E3FFFFF1E3FFFFF1E3FF
                FFF1E2FFFFF0E2FFFFF0E1FFFFF0E1FFFFF0E0FFFFF0E0FFFFEFE0FFFFEFDEFF
                EACBB4FF6B2300FF852C00FF953200FFA84B1DFF9C4013FF9E4D22FFFFECDAFF
                FFECDAFFFFECD9FFFFECD8FFFFEBD8FFFFEBD7FFFFEAD7FFFFEBD6FFFFF2DDFF
                FFF2DEFFF3DFCAFFE8D4C1FFDECCB9FFD6BCA3FF552A15CE552A1583552A1534
                552A150CD6C5B4ECD8D0C8FFE1D9D0FFEDE4DBFFF9EFE6FFFFFBF0FFFFF6EBFF
                FFF4EAFFFFF3E9FFFFF4E8FFFFF3E8FFFFF3E8FFFFF3E6FFFFF3E6FFFFF2E6FF
                FFF2E5FFF9E6D7FFBF805EFFD78E67FFEBA27BFFD49F81FFFFF0E2FFFFF1E1FF
                FFF0E0FF77320FFF742600FF953200FF933303FF893004FF852D01FFE2BCA2FF
                FFEEDCFFFFEDDCFFFFEDDBFFFFEDDBFFFFECDAFFFFECDAFFFFEEDBFFFFFAE7FF
                FFF2DEFFF3E0CEFFEAD7C5FFE2D0BDFFD2B498FD552A15B4552A1560552A1521
                552A1506DEC9B2B1DBD4CDFFE0D9D1FFEBE2DBFFF4EBE4FFFFFCF3FFFFFAF1FF
                FFF5ECFFFFF5ECFFFFF5EBFFFFF4EAFFFFF3EAFFFFF3E9FFFFF3E9FFFFF3E8FF
                FFF3E7FFB77C5CFF832D01FFB25526FFCD7042FF983D10FFDCB297FFFFF1E3FF
                FFF1E3FF9C5E3DFF6F2500FF943100FF933100FF812B00FF802A00FFCB9779FF
                FFEEDEFFFFEFDFFFFFEEDDFFFFEEDDFFFFEDDDFFFFEEDCFFFFF4E3FFFFFFF0FF
                FBE9D7FFF2E0CEFFE9D8C6FFE4D3C2FFBB987BF2552A1594552A1542552A1512
                552A1503DFBFA109DBD1C9FDDED8D2FFE7E0D9FFF1E9E2FFFDF5EEFFFFFFF8FF
                FFF8F1FFFFF6EDFFFFF7EDFFFFF6EDFFFFF6EDFFFFF6ECFFFFF6EBFFFFF5EBFF
                FFF3EAFF732600FF822B00FF953200FF8E3305FF842D01FFCD9A7DFFFFF3E6FF
                FFF3E6FF9D5F3EFF6F2500FF933100FF943100FF7D2A00FF7D2900FFCA977AFF
                FFF0E2FFFFF0E1FFFFF0E1FFFFEFE0FFFFEFE0FFFFF2E2FFFFFFF2FFFFFCEBFF
                F6E6D5FFEEDECEFFE7D8C7FFE1CBB7FF5C311BBA552A156B552A1528552A1509
                552A150100000000DECDBEDFDDD8D3FFE3DDD8FFEDE7E0FFF5F0E9FFFFFFFCFF
                FFFFF9FFFFF8F1FFFFF8F0FFFFF7F0FFFFF7EFFFFFF7EFFFFFF7EEFFFFF6EDFF
                FFF6EDFF6B2300FF7D2900FF983200FF862C00FF7D2900FFCD9A7FFFFFF3EAFF
                FFF3E9FF904E2DFF6F2500FF933100FF923000FF7A2800FF7A2800FFCA987CFF
                FFF2E5FFFFF1E3FFFFF1E3FFFFF1E3FFFFF2E4FFFFFFF0FFFFFFFFFFFCEEDFFF
                F3E5D6FFEBDCCEFFE7D8CAFFD3B79CF9552A158C552A1542552A1514552A1504
                0000000000000000EACFB542DDD6CEFDE0DCD8FFE9E3DEFFF2ECE7FFFBF6F1FF
                FFFFFFFFFFFFFCFFFFF9F4FFFFF8F1FFFFF8F1FFFFF8F1FFFFF8F0FFFFF7EFFF
                FFF8EFFF8B4D2EFF6C2400FF8E2F00FF832B00FF8F441FFFF9EADEFFFFF6EBFF
                F8E9DCFF6E2400FF722600FF933100FF8A2E00FF752700FF762700FFEBCFBCFF
                FFF3E7FFFFF3E6FFFFF2E6FFFFF3E6FFFFFFF3FFFFFFFFFFFFFCEFFFF7EADCFF
                F0E3D5FFE9DCCFFFE3D1BEFF8A6248B8552A1558552A1520552A1507552A1501
                000000000000000000000000E3D3C3CAE1DDD9FFE5E1DDFFEDE8E4FFF4EFEBFF
                FFFAF5FFFFFFFFFFFFFFFEFFFFFAF5FFFFF9F3FFFFF9F3FFFFF9F3FFFFF8F2FF
                FFF8F2FFC69A82FF642100FF7E2A00FF852C00FFDBB59FFFFFF7EFFFFFF6EEFF
                CA9A80FF6E2400FF7A2800FF872D00FF712500FF6E2400FFA0613FFFFFF5EAFF
                FFF4EAFFFFF4E9FFFFF6EAFFFFFFF6FFFFFFFFFFFFFFFAFFF9EEE1FFF3E7DBFF
                EDE1D4FFE9DCCEFFD1B49BEE552A1568552A152C552A150C552A150200000000
                00000000000000000000000000000000E3D9CFEFE3E1DDFFE7E3E1FFEEEAE7FF
                F5F1EDFFFFFCF8FFFFFFFFFFFFFFFFFFFFFDF8FFFFFAF5FFFFFAF4FFFFF9F4FF
                FFF9F4FFFFF9F3FFA46D51FF702500FF852C00FFA7572FFFD6AA92FFD09D82FF
                882D00FF782800FF712500FF642100FF662200FF8D4E2EFFF8E9DEFFFFF5ECFF
                FFF5ECFFFFF9EFFFFFFFFEFFFFFFFFFFFFFFFFFFFAEFE4FFF4EADFFFEEE4D9FF
                EBE1D5FFE2CDB9FA552A1572552A1537552A1512552A15040000000000000000
                00000000000000000000000000000000EDD3BA3BE5DED6F8E4E2E0FFE8E5E2FF
                EEECE9FFF5F2EFFFFFFEFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDF8FFFFFBF7FF
                FFFBF6FFFFFAF5FFFFFAF5FFC89C84FF893910FF8D2F00FF953100FF953100FF
                892D00FF722600FF612000FF6E2F10FFB9886FFFF8ECE1FFFFF7F0FFFFFAF2FF
                FFFFFAFFFFFFFFFFFFFFFFFFFFFFFFFFFAF1E7FFF4EBE2FFEEE5DDFFECE2D9FF
                E6D5C5FD936D5390552A1539552A1515552A1505552A15010000000000000000
                0000000000000000000000000000000000000000EDD6C165E5E0DAF9E4E3E1FF
                E8E6E4FFEFEDEBFFF6F4F1FFFFFDF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFCFFFFFCF9FFFFFBF7FFFFFAF6FFFFFAF6FFE3C5B4FFCE9E85FFCE9E85FF
                CC9D84FFC99B84FFE0C4B3FFFFF9F4FFFFFAF4FFFFFEF7FFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFCFFFAF3EBFFF5EDE5FFEFE7E0FFECE3DBFFE7D9CCFD
                B593799F552A1532552A1514552A1506552A1501000000000000000000000000
                000000000000000000000000000000000000000000000000ECD6BF5AE5DFD9F6
                E6E5E3FFEAE9E7FFF0EFEDFFF6F4F3FFFAF9F6FFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFDF9FFFFFBF8FFFFFBF7FFFFFBF7FFFFFBF7FF
                FFFBF6FFFFFAF7FFFFFCF7FFFFFFFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFEF9F2FFFAF3EDFFF5EFE9FFF0E9E3FFEDE6DFFFE8D9CCFBB6947A8E
                552A1527552A150F552A1504552A150100000000000000000000000000000000
                00000000000000000000000000000000000000000000000000000000EACFB615
                E7DFD6E6E9E7E7FFEBEAEAFFEFEEEDFFF3F1F1FFF7F6F4FFFBFAF8FFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEF9F5FF
                FAF6F1FFF7F2EEFFF4EEE9FFF1EBE6FFEEE8E1FFE4D5C6EF80584049552A151C
                552A150A552A1503552A15010000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000EBDCCCB1EAE7E4FBECECEBFFEEEEEDFFF1F0F0FFF4F3F2FFF7F7F5FF
                F9F8F7FFFDFCFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFCF9F5FFFAF6F3FFF7F4F0FF
                F4F1EDFFF2EEEAFFF1ECE9FFEDE5DCFCDFC9B6C3552A1521552A1510552A1506
                552A150200000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000D3B69D05EDE0D5CFECEAE7FCEDEDEDFFEEEDEEFFF0F0EFFF
                F2F2F1FFF5F4F4FFF8F8F7FFFCFBFAFFFEFDFCFFFFFEFDFFFFFEFCFFFFFEFCFF
                FFFDFCFFFFFEFCFFFEFDFAFFFBF9F7FFF8F5F4FFF5F3F2FFF3F1EEFFF2EFEDFF
                F1EFECFFEFE9E2FDE7D7C6D9673D2823552A1510552A1507552A1502552A1501
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000552A1501EEDFD0B8EDE9E3F4EDECEBFF
                ECECECFFEEEEEEFFF1F1F1FFF3F2F3FFF3F3F3FFF3F2F2FFF3F3F2FFF3F3F3FF
                F4F3F3FFF4F3F2FFF4F3F2FFF4F3F1FFF2F1EFFFF1EFEEFFF0EDEAFFEFE7DEF6
                E7D6C5C1552A1516552A150D552A1506552A1502552A15010000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000000000000000EDD4BC1F
                EBDCCCA9E9E1D7E3EBE6E2F8EBEAE9FEECECEBFFECECECFFECECECFFECECECFF
                ECECECFFECEAEBFFECEAE8FEECE6E2F9EDE2D6E4EAD7C7AEBFA1882C552A150C
                552A1507552A1503552A15010000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000FFFFFF80FFFF0000FFFFFF007FFF0000FFFFFE007FFF0000FFFFF800
                7FFF0000FFFFF8007FFF0000FFFFF0007FFF0000FFFF20007FFF0000FFFC0000
                3FFF0000FFE0000007FF0000FF80000001FF0000FF00000000FF0000FC000000
                003F0000F8000000001F0000F0000000000F0000E000000000070000E0000000
                00070000C0000000000300008000000000010000800000000001000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000080000000000100008000000000010000C000000000030000E0000000
                00070000E000000000070000F0000000000F0000F8000000001F0000FC000000
                003F0000FF00000000FF0000FF80000001FF0000FFE0000007FF0000FFFC0000
                3FFF000028000000200000004000000001002000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000009000000370000005C0000001B
                0000000200000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000085D42275E916940C91F160DA30000002B
                0000000400000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000046E4E2E5FC19466F4D3A171FE2D2012B00000002B
                0000000400000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000175553440B4895EE7D9B28BFFD0A070FA2C1F12AF0000002B
                0000000400000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000100000005
                00000007644B331AC0966BDFD0AA85FFE9C096FFD0A173FB31251AB100000031
                0000000300000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000100000008000000100000001D00000034
                000000408269518AC5A481FBDCB58DFFEEC49AFFD0A67DFC30271FB600000055
                0000001C0000000E000000020000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000010000000C000000250000004916100B744D3E30A6564739BC
                735F4BCCB09275F2C5A381FFE3BC95FFEAC29BFFCDA884FC66503BD6000000A9
                00000089000000670000002E0000000F00000004000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000005000000251F1912635D4833BB886B4DE0A78768F2B69676FCB79778FD
                B89779FFBE9D7EFFD0AE8BFFE9C29CFFEAC29CFFD4AF8BFFBD9975FD9D7A56F1
                806040E415100BBC0000009F00000068000000330000000C0000000000000000
                000000000000000000000000000000000000000000000000000000000000000B
                30261C477A5F44B8B18F6EFAB89B7FFFBBA085FFBEA185FFC5A583FFCBA986FF
                CFAE8CFFD8B594FFE7C29FFFF8D1AAFFF4CEA7FFE0BB98FFCEAD8CFFC1A282FF
                BD9D7EFFB7926CFF7E6042E22C2116BF000000930000004C0000001400000001
                0000000000000000000000000000000000000000000000000000000D56443169
                A38465ECB59B80FFC0A68EFFCAAE93FFD5B699FFDCBC9DFFE3C2A2FFEDCBA8FF
                F5D3B0FFF6D1ACFFFBD3AEFFFFDBB4FFFFDCB5FFF5CFAAFFE6C29EFFDBB895FF
                D0AF8FFFC7A98AFFBC9D7DFFAD8A64F9533E2AD2000000A30000006100000019
                000000010000000000000000000000000000000000000008896C5080B39678F8
                BCA58DFFC9B097FFD8BBA0FFE7C8AAFFF3D3B3FFFBD9B7FFFDDBB9FFFFDFBEFF
                F0C49FFFA55832FFC67041FFF7AE81FFE8B289FFFFDEB9FFFDD8B2FFF7D2ADFF
                ECC8A4FFDFBD9AFFD1B392FFC5A78AFFBF9A78FF795C3FE0050403A70000005C
                000000110000000000000000000000000000000290735662B4997EF9BCA792FF
                CEB59DFFE1C6ABFFF3D6B8FFFEDFBFFFFFE0C1FFFFDFBFFFFFDFBEFFFFE2C1FF
                AC6A43FF741D00FFA13F0FFFAB4A1BFF9A481DFFF9D3AEFFFFDDB9FFFFDBB7FF
                FFDAB6FFF8D4AFFFE9C7A4FFD7B797FFC7AA8DFFBD9C7BFF71563CDD000000A0
                0000004500000007000000000000000078624C2CB3977DF0BDAA96FFCEB8A1FF
                E3CAB0FFF9DCC0FFFFE3C6FFFFE2C4FFFFE1C3FFFFE1C3FFFFE0C1FFFFE3C3FF
                995834FF6C1F00FF872B00FF762100FF7D3109FFF5CCA8FFFFE1BFFFFFDCBBFF
                FFDDBAFFFFDDBAFFFDD9B6FFECCAA9FFD8B99BFFC8AD90FFC19F7DFF413324CD
                0000008A00000026000000032E251D05BA9B7DBCBDAB98FFCEB9A4FFE2CBB4FF
                F8DFC5FFFFE5CAFFFFE3C9FFFFE3C8FFFFE3C7FFFFE3C6FFFFE2C6FFFFE7CAFF
                D0A07FFF5D1B00FF571700FF5B1500FFAB6D49FFFFE4C4FFFFDFBFFFFFDFBFFF
                FFDEBDFFFFDEBDFFFFDEBCFFFDDCB9FFEBCCACFFD9BB9EFFCAAF93FFB5916EF6
                17120DB40303035700000013BD9B7A3CBEA993FDCAB8A6FFE0CAB4FFF7DFC7FF
                FFE7CFFFFFE6CCFFFFE5CCFFFFE5CAFFFFE4CAFFFFE3C9FFFFE3C8FFFFE4C9FF
                FFE6CBFFDBAF90FFBF8A6AFFD2A384FFFCDDBEFFFFE3C5FFFFE0C3FFFFE1C2FF
                FFE0C1FFFFE0C0FFFFDFBFFFFFDFBFFFFCDCBCFFEACCAEFFD7BBA0FFC8AC8EFE
                725A44D81211108400000028C7A98B92C3B3A2FFD7C3B1FFEFDAC4FFFFE8D2FF
                FFE8D1FFFFE7CFFFFFE7CFFFFFE7CFFFFFE7CEFFFFE6CCFFFFE5CDFFFFE5CBFF
                FFE5CCFFFFE8CDFFFCDBBFFFFFE4C9FFFFE6CCFFFFE3C7FFFFE3C7FFFFE3C5FF
                FFE2C5FFFFE2C5FFFFE0C4FFFFE1C3FFFFE2C3FFF8D9BBFFE3C7AAFFCFB79EFF
                A3876DEC2E2A26A808080842C6B09AEECEBFB0FFE3D0BEFFF9E5D0FFFFEBD6FF
                FFEAD5FFFFEAD4FFFFE9D3FFFFE9D2FFFFE8D1FFFFE8D1FFFFE8D0FFFFE7CFFF
                FFEBD2FFF2CFB3FFA64E20FFDEAC8AFFFFEFD7FFFFE5CBFFFFE5CAFFFFE3C9FF
                FFE3C8FFFFE3C8FFFFE3C7FFFFE2C6FFFFE3C6FFFEE2C5FFEDD2B6FFDBC3AAFF
                C1A78BF84D463FBF0E0E0D65CAB7A7F8D5C6B8FFECDACAFFFEECD9FFFFECD9FF
                FFECD9FFFFEBD7FFFFEBD6FFFFEAD6FFFFEAD4FFFFEAD4FFFFE9D3FFFFE8D2FF
                FFECD6FFF2D2B7FF943000FFC88762FFFFF4DEFFFFE8D0FFFFE6CDFFFFE6CDFF
                FFE5CBFFFFE5CBFFFFE4CBFFFFE4CAFFFFE4C9FFFFE5CAFFF6DBC1FFE2CAB2FF
                CEB49CFB74675CD42B28268CCCBFB2F7D7C9BCFFEEDFD0FFFFEFDEFFFFEEDDFF
                FFEDDCFFFFEDDCFFFFEDDBFFFFECDAFFFFECD9FFFFECD8FFFFEBD7FFFFEBD6FF
                FFEBD6FFFDECD6FF9F4A1FFF9C3B0CFFE7B797FFFEECD6FFFFEBD5FFFFE7D0FF
                FFE7CFFFFFE7CEFFFFE7CEFFFFE6CDFFFFE6CCFFFFE8CEFFF9E0C8FFE5CCB5FF
                D5C1ACFD9D8D7EE543403CA1CDC2B7F7D8CCBFFFEFE1D4FFFFF1E3FFFFF0E1FF
                FFEFDFFFFFEEDFFFFFEFDFFFFFEEDEFFFFEEDDFFFFEDDBFFFFEDDBFFFFECDAFF
                FFECD9FFFFF3E1FFCFA185FF7F1F00FFC26231FFF7B58FFFFAE0C9FFFFEDD8FF
                FFE8D3FFFFE8D2FFFFE8D1FFFFE8D1FFFFE7D0FFFFEBD2FFF9E3CCFFE5D0B8FF
                D9C4B0FEAA9B8CE84743409ACDC2B7F8D9CFC4FFF0E4D8FFFFF4E7FFFFF2E5FF
                FFF2E4FFFFF0E2FFFFF1E2FFFFEFE1FFFFF0E0FFFFEFDFFFFFF1E1FFFFF4E5FF
                FFF3E3FFFFF4E4FFF3DDC9FF883E1AFF8D2D03FFCE6A39FFD0835AFFF6DCC5FF
                FFEEDAFFFFEAD5FFFFEAD5FFFFEAD5FFFFE9D3FFFFEDD7FFF9E7D0FFE7D2BDFF
                D6C3ADFCA79A88DE43403D7DD0C4B8F5DCD4CBFFF1E5DCFFFFF7ECFFFFF5EAFF
                FFF2E7FFFFF3E6FFFFF3E6FFFFF2E4FFFFF2E4FFFFF3E5FFFCEBDDFFF3D4BFFF
                F9DBC6FFFDEDDDFFFFFAECFFAC7C5FFF741A00FF9B3907FF943306FFBA7D5AFF
                FFF5E4FFFFEDDAFFFFECD9FFFFEBD8FFFFEBD7FFFFF5E0FFFAE9D6FFE9D5C1FF
                D1BEA9FC9A8C7EC43F3D3B47DACBB9D1DDD7D0FFEDE3DBFFFCF7EDFFFFFAF0FF
                FFF4EBFFFFF5EAFFFFF4E9FFFFF3E8FFFFF4E8FFFFF5E9FFBC8668FFAB5224FF
                C96D3EFFCB9678FFFFFEF4FFCAA58DFF722100FF943000FF802400FF994E28FF
                F8E1CDFFFFF3E3FFFFEEDCFFFFECDBFFFFF0DDFFFFFBEAFFF8E6D3FFDAC7B3FE
                D2BEA9FD615B56892B2B2A1EE4CBB359DBD5D0FFE8E1DAFFF8F0E9FFFFFFF8FF
                FFF8F0FFFFF7EDFFFFF6EEFFFFF6ECFFFFF7ECFFF9ECE2FF772903FF8F2D00FF
                882800FFA65F3AFFFFFBEEFFD2B09AFF742500FF943000FF7D2400FF924722FF
                F4DCCAFFFFF5E8FFFFEFE0FFFFF0DFFFFFFBEFFFFEF8E9FFF2E1D1FFD6C2AEFF
                BFAC98EE2726254800000007ECD1B51CDDD2C7E2E1DEDAFFF0EAE4FFFDFAF7FF
                FFFEFCFFFFF9F3FFFFF7F0FFFFF8F0FFFFF8F0FFFBF1E8FF783514FF852900FF
                802400FFBC8A70FFFFFFFFFFBD9580FF6E1B00FF943100FF741D00FF965230FF
                FBECDEFFFFF5E8FFFFF1E3FFFFFBEFFFFFFFFBFFF9ECDFFFEDDFD3FFDECEBBFE
                6E5E4E97000000160000000000000000E5D2BF6FE0DDD8FFE9E5E1FFF6F0ECFF
                FFFDFBFFFFFFFEFFFFFAF5FFFFF9F2FFFFF9F3FFFFFCF6FFAE8169FF661200FF
                903D14FFF0DACCFFFAEDE4FF955435FF732000FF782400FF691C00FFC8A087FF
                FFFDF4FFFFF5E9FFFFFCF3FFFFFFFFFFFCF5EBFFF3E6D9FFEADFD2FFB6A38FD5
                0000002800000001000000000000000000000000E7D9CAA3E3E1DFFFEBE8E5FF
                F6F3EFFFFFFFFDFFFFFFFEFFFFFDFAFFFFFBF6FFFFFDFAFFF8F0EBFFAA775CFF
                812700FFA6522AFFA8552BFF761C00FF5F1700FF6D2C0FFFBF9780FFFFFCF3FF
                FFFAF1FFFFFDFAFFFFFFFFFFFCF7F1FFF3E8DFFFECE3DAFFD2C1AFEC27221D43
                0000000500000000000000000000000000000000F0D6BD0EE8DBCFBBE4E3E2FF
                EBE9E8FFF8F5F2FFFFFEFCFFFFFFFFFFFFFFFEFFFFFEFCFFFFFFFEFFFFFDF9FF
                E9D4C8FFCB9980FFC58E71FFC39379FFCDAE9EFFEFE3DBFFFFFFFEFFFFFFFFFF
                FFFFFFFFFFFFFEFFFCF8F3FFF4ECE4FFEDE5DFFFDBCDBFF178695A5F00000009
                000000000000000000000000000000000000000000000000EFD8C114E8DACB9F
                E7E5E4FFEDEDEDFFF5F3F2FFFBFAF9FFFFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FEFCFAFFFAF5EFFFF5EEE9FFEEE8E2FFD4C6B6DE92806F500000000600000000
                0000000000000000000000000000000000000000000000000000000000000000
                E9DFD474EAE5DFEEEDECECFFF1F1F0FFF6F5F5FFFAF9F9FFFEFDFDFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFBF9FFFAF7F4FF
                F6F3EFFFF2EEEAFFEBE3DCFACFC3B6B363594F1F000000010000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000F1DAC110ECE4DD94EBE7E3E4EEEDECFFEFF0F1FFF4F4F4FFF9F8F8FF
                FBFAF9FFFBFBF9FFFBFBF9FFFCFBF9FFFBFAF8FFF8F6F5FFF4F3F3FFF2EFEDFF
                EEE8E1F9D8D0C8B5B3A18E3F0000000400000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000EEE4D922E7DFD34EE8DCCEA6EAE5DFECECEAE9F6
                ECECECF7ECECECF7ECECECF7EDECECF7EDEBEAF7EDE8E3F0E8DBCEC4D3C7B962
                D7CBBF3A00000005000000000000000000000000000000000000000000000000
                000000000000000000000000FFFF83FFFFFF03FFFFFE03FFFFFC03FFFFE003FF
                FF0000FFFC00003FF800001FF0000007E0000003C00000038000000180000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000180000001C0000003C0000007E000000F
                F800001FFC00007FFF0001FF2800000010000000200000000100200000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000002D1F122B3A2918A10000006F
                0000001000000000000000000000000000000000000000000000000000000000
                0000000000000000000000050000000C0000001CBE9266EA9F744BE00000006E
                0000001400000000000000000000000000000000000000000000000000000000
                000000060000001A0000003A0000005E987858C1DCB792FF907356DF00000094
                0000004A0000001D00000008000000000000000000000000000000000000000F
                00000044453526A47E644BD5987F67E6C6A989FFEAC49FFFBB9A77F5463625D1
                000000AD0000008F0000004E0000001400000000000000000000000D634D377E
                A68A6DF2C1A48AFFCFAF92FFDEBF9DFFF3CEAAFFFFE7C0FFE4C3A0FFC4A685FF
                AF8D6BF9513D28D3000000A300000060000000130000000495785A85B9A289FF
                DCC3A9FFFCDCBDFFFFEFCEFFE3B693FF9D3A11FFC87547FFFFDDB8FFFFDEBAFF
                E4C5A5FFC3A486FF74583BDF000000A20000004EA686673BB8A590FFE3CDB7FF
                FFEACDFFFFE8CBFFFFF4D7FFD3A988FF490000FF701F00FFFFE1BCFFFFE8C7FF
                FFE3BFFFEDCDAFFFC2A587FF4B3A29CE0000009AC4A98DBFD9C7B5FFFFECD4FF
                FFEBD1FFFFE6CDFFFFE9CFFFFFEFD6FFDCB699FFF1D1B6FFFFEFD2FFFFE3C5FF
                FFE3C5FFFFE5C6FFE5CAADFFB29476F4000000BBCAB8A9FFF6E2D1FFFFF1DDFF
                FFEBD6FFFFEAD5FFFFEBD4FFFFFBE6FFCB8960FFE8BF9FFFFFFFE9FFFFE7CDFF
                FFE4CAFFFFE8CBFFFBE1C4FFD6BBA0FF33302CCACFC5B9FFFBECDDFFFFF3E3FF
                FFEEDEFFFFEEDCFFFFF1DFFFFFFFF8FFCEA082FFA54619FFFFEBCFFFFFF8E4FF
                FFE9D3FFFFEAD0FFFFE8CEFFDEC6B0FF6F675EDAD2C9BFFFFCF1E6FFFFF7EBFF
                FFF2E5FFFFF4E7FFFFF6E7FFFFF2DEFFFFFEEFFF88340FFFA73B0FFFEDD2B8FF
                FFF8E7FFFFEDD9FFFFF0DAFFDDC7B2FF605A54CCDDCFC2D6F4EFE9FFFFFFF6FF
                FFF7EDFFFFFFFFFFC5997FFF8D1D00FFEBD3BEFFAB7A5EFF640000FFBD886AFF
                FFFFF8FFFFF9E9FFFAF0E1FFD6C0ABFF1514146FE5D0BA56E3E2E0FFFFFEFCFF
                FFFFFBFFFFFFFFFFBD9885FF5C0000FFE2C5B2FF853E21FF570000FFD2B39DFF
                FFFFFFFFFFFFFDFFF0E5DAFF998673B90000001D00000000E6D9CC9DEBEBECFF
                FFFFFFFFFFFFFFFFFFFFFFFFC59A84FFB9714DFF904E36FFC2A797FFFFFFFFFF
                FFFFFFFFF5F1EDFFCDBCABD900000021000000000000000000000000E7DDD386
                EFEDECFFFAFCFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                F5F0ECFFCFC1B3B5000000130000000000000000000000000000000000000000
                EDDFCE26E9E3DD9AEEEAE6EBF5F5F6FFF6F9FAFFF8F9F9FFF3EEE9F2E5DDD5AE
                BEB2A54100000005000000000000000000000000FF0F0000F80F0000E0030000
                C00100008000000B00001C47000044B800006EFA00007FFF000085FF000085FF
                000083FF000086FF80018CFFC00394FFE0079FFF}
              OnClick = imgAjudaClick
            end
            object dbCustoOperacional: TDBCheckBox
              Left = 16
              Top = 24
              Width = 225
              Height = 17
              Caption = 'Custo Operacional por Percentual'
              DataField = 'CUSTO_OPER_PERCENTUAL'
              DataSource = DtSrcTabela
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object dbFrete: TDBEdit
              Left = 16
              Top = 64
              Width = 97
              Height = 21
              CharCase = ecUpperCase
              DataField = 'CUSTO_OPER_FRETE'
              DataSource = DtSrcTabela
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
            object dbOutros: TDBEdit
              Left = 120
              Top = 64
              Width = 97
              Height = 21
              CharCase = ecUpperCase
              DataField = 'CUSTO_OPER_OUTROS'
              DataSource = DtSrcTabela
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
            end
          end
          object dbEntregaFracionada: TDBCheckBox
            Left = 12
            Top = 138
            Width = 260
            Height = 17
            Caption = 'Entrega fracionada de produtos vendidos'
            DataField = 'ENTREGA_FRACIONADA_VENDA'
            DataSource = DtSrcTabela
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            ValueChecked = '1'
            ValueUnchecked = '0'
            OnKeyPress = ProximoCampoKeyPress
          end
          object dbCadastroAtivo: TDBCheckBox
            Left = 12
            Top = 161
            Width = 121
            Height = 17
            Caption = 'Cadastro Ativo'
            DataField = 'ATIVO'
            DataSource = DtSrcTabela
            TabOrder = 3
            ValueChecked = '1'
            ValueUnchecked = '0'
            OnKeyPress = ProximoCampoKeyPress
          end
        end
        object tbsDadoFinanceiro: TTabSheet
          Caption = '&3. Dados Financeiro'
          ImageIndex = 3
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object dbgContaCorrente: TcxDBVerticalGrid
            Left = 0
            Top = 0
            Width = 828
            Height = 198
            Align = alClient
            OptionsView.CellEndEllipsis = True
            OptionsView.RowHeaderWidth = 142
            OptionsBehavior.GoToNextCellOnEnter = True
            OptionsData.CancelOnExit = False
            OptionsData.Appending = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Inserting = False
            OptionsData.MultiThreadedFiltering = bFalse
            Navigator.Buttons.CustomButtons = <>
            TabOrder = 0
            OnEnter = dbgContaCorrenteEnter
            OnExit = dbgContaCorrenteExit
            DataController.DataSource = DtSrcTabela
            Version = 1
            object dbCtgrConta1: TcxCategoryRow
              Options.Focusing = False
              Options.Moving = False
              Properties.Caption = 'Poupan'#231'a / Conta Corrente (1)'
              ID = 0
              ParentID = -1
              Index = 0
              Version = 1
            end
            object dbBanco1: TcxDBEditorRow
              Options.Moving = False
              Properties.Caption = 'Banco'
              Properties.EditPropertiesClassName = 'TcxLookupComboBoxProperties'
              Properties.EditProperties.KeyFieldNames = 'CODIGO'
              Properties.EditProperties.ListColumns = <
                item
                  FieldName = 'NOME_CODIGO'
                end>
              Properties.EditProperties.ListOptions.ShowHeader = False
              Properties.EditProperties.ListSource = dtsBancoFebraban
              Properties.DataBinding.FieldName = 'BANCO'
              ID = 1
              ParentID = -1
              Index = 1
              Version = 1
            end
            object dbAgencia1: TcxDBEditorRow
              Options.Moving = False
              Properties.Caption = 'Ag'#234'ncia'
              Properties.DataBinding.FieldName = 'AGENCIA'
              ID = 2
              ParentID = -1
              Index = 2
              Version = 1
            end
            object dbContaCorrente1: TcxDBEditorRow
              Options.Moving = False
              Properties.Caption = 'N'#250'mero da Conta'
              Properties.DataBinding.FieldName = 'CC'
              ID = 3
              ParentID = -1
              Index = 3
              Version = 1
            end
            object dbPracaCobranca1: TcxDBEditorRow
              Options.Moving = False
              Properties.DataBinding.FieldName = 'PRACA'
              ID = 4
              ParentID = -1
              Index = 4
              Version = 1
            end
            object dbCtgrConta2: TcxCategoryRow
              Options.Focusing = False
              Options.Moving = False
              Properties.Caption = 'Poupan'#231'a / Conta Corrente (2)'
              ID = 5
              ParentID = -1
              Index = 5
              Version = 1
            end
            object dbBanco2: TcxDBEditorRow
              Options.Moving = False
              Properties.Caption = 'Banco'
              Properties.EditPropertiesClassName = 'TcxLookupComboBoxProperties'
              Properties.EditProperties.KeyFieldNames = 'CODIGO'
              Properties.EditProperties.ListColumns = <
                item
                  FieldName = 'NOME_CODIGO'
                end>
              Properties.EditProperties.ListOptions.ShowHeader = False
              Properties.EditProperties.ListSource = dtsBancoFebraban
              Properties.DataBinding.FieldName = 'BANCO_2'
              ID = 6
              ParentID = -1
              Index = 6
              Version = 1
            end
            object dbAgencia2: TcxDBEditorRow
              Options.Moving = False
              Properties.Caption = 'Ag'#234'ncia'
              Properties.DataBinding.FieldName = 'AGENCIA_2'
              ID = 7
              ParentID = -1
              Index = 7
              Version = 1
            end
            object dbContaCorrente2: TcxDBEditorRow
              Options.Moving = False
              Properties.Caption = 'N'#250'mero da Conta'
              Properties.DataBinding.FieldName = 'CC_2'
              ID = 8
              ParentID = -1
              Index = 8
              Version = 1
            end
            object dbPracaCobranca2: TcxDBEditorRow
              Options.Moving = False
              Properties.Caption = 'Pra'#231'a de Cobran'#231'a'
              Properties.DataBinding.FieldName = 'PRACA_2'
              ID = 9
              ParentID = -1
              Index = 9
              Version = 1
            end
            object dbCtgrConta3: TcxCategoryRow
              Options.Focusing = False
              Options.Moving = False
              Properties.Caption = 'Poupan'#231'a / Conta Corrente (3)'
              ID = 10
              ParentID = -1
              Index = 10
              Version = 1
            end
            object dbBanco3: TcxDBEditorRow
              Options.Moving = False
              Properties.Caption = 'Banco'
              Properties.EditPropertiesClassName = 'TcxLookupComboBoxProperties'
              Properties.EditProperties.KeyFieldNames = 'CODIGO'
              Properties.EditProperties.ListColumns = <
                item
                  FieldName = 'NOME_CODIGO'
                end>
              Properties.EditProperties.ListOptions.ShowHeader = False
              Properties.EditProperties.ListSource = dtsBancoFebraban
              Properties.DataBinding.FieldName = 'BANCO_3'
              ID = 11
              ParentID = -1
              Index = 11
              Version = 1
            end
            object dbAgencia3: TcxDBEditorRow
              Options.Moving = False
              Properties.Caption = 'Ag'#234'ncia'
              Properties.DataBinding.FieldName = 'AGENCIA_3'
              ID = 12
              ParentID = -1
              Index = 12
              Version = 1
            end
            object dbContaCorrente3: TcxDBEditorRow
              Options.Moving = False
              Properties.Caption = 'N'#250'mero da Conta'
              Properties.DataBinding.FieldName = 'CC_3'
              ID = 13
              ParentID = -1
              Index = 13
              Version = 1
            end
            object dbPracaCobranca3: TcxDBEditorRow
              Options.Moving = False
              Properties.Caption = 'Pra'#231'a de Cobran'#231'a'
              Properties.DataBinding.FieldName = 'PRACA_3'
              ID = 14
              ParentID = -1
              Index = 14
              Version = 1
            end
          end
        end
        object tbsObservacao: TTabSheet
          Caption = '&4. Observa'#231#245'es'
          ImageIndex = 4
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object dbObservacao: TDBMemo
            Left = 0
            Top = 0
            Width = 828
            Height = 198
            Align = alClient
            DataField = 'OBSERVACAO'
            DataSource = DtSrcTabela
            TabOrder = 0
          end
        end
        object tbsCompra: TTabSheet
          Caption = '&5. Compras'
          ImageIndex = 1
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          DesignSize = (
            828
            198)
          object lblValorLimiteCompra: TLabel
            Left = 9
            Top = 8
            Width = 111
            Height = 13
            Caption = 'Limte p/ Compras (R$):'
            FocusControl = dbValorLimiteCompra
          end
          object lblTotalCompras: TLabel
            Left = 9
            Top = 48
            Width = 138
            Height = 13
            Caption = 'Total Compras Abertas (R$):'
            FocusControl = dbTotalCompras
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblLimiteDisponivel: TLabel
            Left = 9
            Top = 88
            Width = 127
            Height = 13
            Caption = 'Limite Dispon'#237'vel (R$):'
            FocusControl = dbLimiteDisponivel
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblTituloEmAberto: TLabel
            Left = 8
            Top = 175
            Width = 110
            Height = 13
            Anchors = [akLeft, akBottom]
            Caption = '* T'#237'tulos em aberto'
            Font.Charset = ANSI_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblTituloPagando: TLabel
            Left = 8
            Top = 159
            Width = 122
            Height = 13
            Anchors = [akLeft, akBottom]
            Caption = '* T'#237'tulos sendo pagos'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitTop = 121
          end
          object dbValorLimiteCompra: TDBEdit
            Left = 9
            Top = 24
            Width = 153
            Height = 21
            CharCase = ecUpperCase
            DataField = 'VALOR_LIMITE_COMPRA'
            DataSource = DtSrcTabela
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object dbTotalCompras: TDBEdit
            Left = 9
            Top = 64
            Width = 153
            Height = 21
            Color = clMoneyGreen
            DataField = 'VALOR_COMPRAS_ABERTAS'
            DataSource = dtsTotalComprasAbertas
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object dbLimiteDisponivel: TDBEdit
            Left = 9
            Top = 104
            Width = 153
            Height = 21
            Color = clMoneyGreen
            DataField = 'VALOR_LIMITE_DISPONIVEL'
            DataSource = dtsTotalComprasAbertas
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
          end
          object pnlTitulos: TPanel
            Left = 168
            Top = 0
            Width = 660
            Height = 198
            Align = alRight
            Anchors = [akLeft, akTop, akRight, akBottom]
            BevelOuter = bvNone
            TabOrder = 4
            object dbgTitulos: TDBGrid
              Left = 0
              Top = 0
              Width = 660
              Height = 198
              Align = alClient
              DataSource = dtsTitulos
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
                  FieldName = 'VENDA'
                  Title.Caption = 'Venda'
                  Width = 90
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'LANCAMENTO'
                  Title.Caption = 'Lan'#231'amento'
                  Width = 90
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DTEMISS'
                  Title.Caption = 'Emiss'#227'o'
                  Width = 75
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DTVENC'
                  Title.Caption = 'Vencimento'
                  Width = 75
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'FORMA_PAGTO_DESC'
                  Title.Caption = 'Forma de Pagamento'
                  Width = 130
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VALORREC'
                  Title.Caption = 'Valor (R$)'
                  Width = 80
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VALOR_PAGO'
                  Title.Caption = 'Pago (R$)'
                  Width = 80
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VALORSALDO'
                  Title.Caption = 'A Pagar (R$)'
                  Width = 80
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NFE_SERIE'
                  Title.Caption = 'NF-e'
                  Width = 90
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SITUACAO'
                  Title.Caption = 'Situa'#231#227'o'
                  Visible = False
                end>
            end
          end
          object dbcBloqueio: TDBCheckBox
            Left = 9
            Top = 131
            Width = 153
            Height = 17
            Hint = 'O cliente encontra-se bloqueado por haver t'#237'tulos em atraso.'
            TabStop = False
            Caption = 'Cliente Bloqueado'
            DataField = 'BLOQUEADO'
            DataSource = DtSrcTabela
            Font.Charset = ANSI_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ReadOnly = True
            ShowHint = True
            TabOrder = 3
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
      end
    end
    object tbsConsultarCNPJ: TTabSheet
      Caption = 'Consultar CNPJ'
      ImageIndex = 12
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object BvlConsultar: TBevel
        Left = 377
        Top = 0
        Width = 4
        Height = 463
        Align = alLeft
        Shape = bsSpacer
        ExplicitHeight = 426
      end
      object pnlConsultarCNPJ: TPanel
        Left = 0
        Top = 0
        Width = 377
        Height = 463
        Align = alLeft
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object lblCNPJX: TLabel
          Left = 9
          Top = 172
          Width = 85
          Height = 16
          Caption = 'Digite o CNPJ:'
          FocusControl = edCNPJ
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object lblCaptchaX: TLabel
          Left = 9
          Top = 309
          Width = 96
          Height = 16
          Caption = 'Digite o Captcha'
          FocusControl = edCaptcha
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object edCaptcha: TEdit
          Left = 9
          Top = 328
          Width = 232
          Height = 41
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -27
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnKeyPress = edCaptchaKeyPress
        end
        object edCNPJ: TMaskEdit
          Left = 9
          Top = 191
          Width = 352
          Height = 41
          EditMask = '00.000.000/0000-00;1;_'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -27
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 18
          ParentFont = False
          TabOrder = 2
          Text = '  .   .   /    -  '
          OnKeyPress = edCNPJKeyPress
        end
        object pnlCaptcha: TPanel
          Left = 9
          Top = 11
          Width = 346
          Height = 127
          BevelOuter = bvLowered
          Color = clWhite
          ParentBackground = False
          TabOrder = 0
          object ImgCaptcha: TImage
            Left = 1
            Top = 1
            Width = 344
            Height = 106
            Align = alClient
            Center = True
            Proportional = True
          end
          object LabAtualizarCaptcha: TLabel
            Left = 1
            Top = 107
            Width = 344
            Height = 19
            Cursor = crHandPoint
            Align = alBottom
            Alignment = taCenter
            AutoSize = False
            Caption = 'Atualizar Captcha'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold, fsUnderline]
            ParentFont = False
            Transparent = False
            OnClick = LabAtualizarCaptchaClick
          end
        end
        object ckRemoverEspacosDuplos: TCheckBox
          Left = 10
          Top = 150
          Width = 359
          Height = 17
          Caption = 'Remover espa'#231'os duplos dos dados retornados'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object btnConsultarCNPJ: TcxButton
          Left = 248
          Top = 327
          Width = 115
          Height = 41
          Caption = 'Consultar'
          TabOrder = 4
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = btnConsultarCNPJClick
        end
      end
      object pnlRetornoCNPJ: TPanel
        Left = 381
        Top = 0
        Width = 455
        Height = 463
        Align = alClient
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object lblTipoX: TLabel
          Left = 8
          Top = 11
          Width = 97
          Height = 16
          Caption = 'Tipo de Empresa'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblRazaoSocialX: TLabel
          Left = 8
          Top = 59
          Width = 73
          Height = 16
          Caption = 'Raz'#227'o Social'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblAberturaX: TLabel
          Left = 112
          Top = 11
          Width = 80
          Height = 16
          Caption = 'Data Abertura'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblEnderecoX: TLabel
          Left = 176
          Top = 107
          Width = 58
          Height = 16
          Caption = 'Endere'#231'o:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblNumeroX: TLabel
          Left = 390
          Top = 107
          Width = 45
          Height = 16
          Caption = 'N'#250'mero'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblComplementoX: TLabel
          Left = 8
          Top = 153
          Width = 79
          Height = 16
          Caption = 'Complemento'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblBairroX: TLabel
          Left = 224
          Top = 153
          Width = 34
          Height = 16
          Caption = 'Bairro'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblCidadeX: TLabel
          Left = 8
          Top = 201
          Width = 39
          Height = 16
          Caption = 'Cidade'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblUFX: TLabel
          Left = 289
          Top = 201
          Width = 15
          Height = 16
          Caption = 'UF'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblCEPX: TLabel
          Left = 328
          Top = 201
          Width = 22
          Height = 16
          Caption = 'CEP'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblSituacaoX: TLabel
          Left = 208
          Top = 11
          Width = 49
          Height = 16
          Caption = 'Situa'#231#227'o'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblFantasiaX: TLabel
          Left = 8
          Top = 107
          Width = 48
          Height = 16
          Caption = 'Fantasia'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label15: TLabel
          Left = 8
          Top = 249
          Width = 83
          Height = 16
          Caption = 'CNAE Principal'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label16: TLabel
          Left = 10
          Top = 298
          Width = 115
          Height = 16
          Caption = 'CNAE Secund'#225'rio(s)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object EditTipo: TEdit
          Left = 8
          Top = 29
          Width = 98
          Height = 24
          TabStop = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object EditRazaoSocial: TEdit
          Left = 8
          Top = 77
          Width = 433
          Height = 24
          TabStop = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object EditAbertura: TEdit
          Left = 112
          Top = 29
          Width = 88
          Height = 24
          TabStop = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object EditEndereco: TEdit
          Left = 176
          Top = 125
          Width = 209
          Height = 24
          TabStop = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
        end
        object EditNumero: TEdit
          Left = 390
          Top = 125
          Width = 51
          Height = 24
          TabStop = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
        end
        object EditComplemento: TEdit
          Left = 8
          Top = 171
          Width = 209
          Height = 24
          TabStop = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 7
        end
        object EditBairro: TEdit
          Left = 224
          Top = 171
          Width = 217
          Height = 24
          TabStop = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 8
        end
        object EditCidade: TEdit
          Left = 8
          Top = 219
          Width = 273
          Height = 24
          TabStop = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 9
        end
        object EditUF: TEdit
          Left = 289
          Top = 219
          Width = 33
          Height = 24
          TabStop = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 10
        end
        object EditCEP: TEdit
          Left = 328
          Top = 219
          Width = 114
          Height = 24
          TabStop = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 11
        end
        object EditSituacao: TEdit
          Left = 208
          Top = 29
          Width = 160
          Height = 24
          TabStop = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object EditFantasia: TEdit
          Left = 8
          Top = 125
          Width = 161
          Height = 24
          TabStop = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
        object btnVoltar: TcxButton
          Left = 8
          Top = 376
          Width = 115
          Height = 41
          Caption = '&Voltar ao Cadastro'
          TabOrder = 14
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = btnVoltarClick
        end
        object btnRecuperarCNPJ: TcxButton
          Left = 328
          Top = 376
          Width = 115
          Height = 41
          Caption = '&Recuperar Dados'
          Enabled = False
          TabOrder = 15
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = btnRecuperarCNPJClick
        end
        object EditCNAE1: TEdit
          Left = 8
          Top = 268
          Width = 433
          Height = 24
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 12
        end
        object ListCNAE2: TListBox
          Left = 8
          Top = 317
          Width = 433
          Height = 52
          TabOrder = 13
        end
      end
    end
    object tbsConsultarCPF: TTabSheet
      Caption = 'Consultar CPF'
      ImageIndex = 12
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object pnlConsultarCPF: TPanel
        Left = 0
        Top = 0
        Width = 377
        Height = 463
        Align = alLeft
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object lblCPFX: TLabel
          Left = 9
          Top = 172
          Width = 78
          Height = 16
          Caption = 'Digite o CPF:'
          FocusControl = edCPF
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object lblDataNasc: TLabel
          Left = 9
          Top = 237
          Width = 122
          Height = 16
          Caption = 'Data de Nascimento:'
          FocusControl = edDataNasc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object edCPF: TMaskEdit
          Left = 9
          Top = 190
          Width = 350
          Height = 41
          EditMask = '000.000.000-00;1;_'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -27
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 14
          ParentFont = False
          TabOrder = 0
          Text = '   .   .   -  '
          OnKeyPress = edCNPJKeyPress
        end
        object btnConsultarCPF: TcxButton
          Left = 248
          Top = 327
          Width = 115
          Height = 41
          Caption = 'Consultar'
          TabOrder = 2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = btnConsultarCPFClick
        end
        object edDataNasc: TMaskEdit
          Left = 9
          Top = 256
          Width = 216
          Height = 41
          EditMask = '!99/99/0000;1;_'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -27
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 10
          ParentFont = False
          TabOrder = 1
          Text = '  /  /    '
          OnKeyPress = edCNPJKeyPress
        end
      end
    end
    object tbsEstoqueSatelite: TTabSheet
      Tag = 12
      Caption = 'Estoque &Sat'#233'lite'
      ImageIndex = 30
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Bevel11: TBevel
        Left = 0
        Top = 62
        Width = 836
        Height = 4
        Align = alTop
        Shape = bsSpacer
      end
      object Bevel12: TBevel
        Left = 0
        Top = 428
        Width = 836
        Height = 4
        Align = alBottom
        Shape = bsSpacer
        Visible = False
        ExplicitTop = 391
      end
      object pnlPesquisarEstoqueSatelite: TPanel
        Left = 0
        Top = 0
        Width = 836
        Height = 62
        Align = alTop
        BevelOuter = bvNone
        BorderWidth = 4
        TabOrder = 0
        object lblInformeSatelite: TLabel
          Left = 4
          Top = 4
          Width = 269
          Height = 54
          Align = alLeft
          Alignment = taCenter
          AutoSize = False
          Caption = 
            '* Este estoque de produtos '#233' alimentado de forma autom'#225'tica a pa' +
            'rtir de vendas finalizadas que n'#227'o tiveram seus produtos entregu' +
            'es na sua totalizada, pois o cliente trabalha com recebimento fr' +
            'acionado.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object GroupBox2: TGroupBox
          Left = 275
          Top = 4
          Width = 557
          Height = 54
          Align = alRight
          Caption = 'Pesquisar    '
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object btnPesquisarEstoqueSatelite: TSpeedButton
            AlignWithMargins = True
            Left = 516
            Top = 18
            Width = 29
            Height = 26
            Hint = 'Clique aqui para executar a pesquisa ...'
            Margins.Right = 10
            Margins.Bottom = 8
            Align = alRight
            Flat = True
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              18000000000000060000C40E0000C40E00000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC29365BC8856FFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7D
              8A98707F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC08F60AC6B2CBA8552F3E8DDCA9765C690
              5BE1C4A8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF78
              86954D5F736D7B8CE3E6E9808D9C778595B7BFC7FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFCFCFC6E6E6EFEFEFEFFFFFFBF8D5CAC6B2CAC6B2CAC6B2CAD6E
              30AC6B2CAC6B2CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFCFC5C6E82FEFEFEFF
              FFFF7684934D5F734D5F734D5F735162764D5F734D5F73FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFCFCFC6E6E6ED9D9D9FFFFFFF1E6DCAC6B2CD4B292FFFFFFFFFF
              FFF3EBE2AC6B2CCDA279FFFFFFFFFFFFFFFFFFFFFFFFFBFCFC5C6E82D4D9DEFF
              FFFFE2E4E84D5F73A3ACB7FFFFFFFFFFFFE7E9EC4D5F738F9BA8FFFFFFFFFFFF
              FFFFFFFFFFFFFCFCFC6E6E6EEDEDEDFFFFFFC69564AC6B2CFFFFFFFFFFFFFFFF
              FFFFFFFFC79C73AF6D2DFFFFFFFFFFFFFFFFFFFFFFFFFBFCFC5C6E82EBEDF0FF
              FFFF7E8C9A4D5F73FFFFFFFFFFFFFFFFFFFFFFFF8994A24F6175FFFFFFFFFFFF
              FFFFFFFFFFFFFCFCFC6E6E6EF1F1F1FFFFFFC28E59AC6B2CFFFFFFFFFFFFFFFF
              FFFFFFFFCFAA85AF6D2DFFFFFFFFFFFFFFFFFFFFFFFFFBFCFC5C6E82F0F1F3FF
              FFFF7584944D5F73FFFFFFFFFFFFFFFFFFFFFFFF98A3AE4F6175FFFFFFFFFFFF
              FFFFFFFFFFFFFCFCFC6E6E6ED5D5D5FFFFFFE0C3A8AC6B2CEFE2D6FFFFFFFFFF
              FFFFFFFFAC6B2CC08A57FFFFFFFFFFFFFFFFFFFFFFFFFBFCFC5C6E82D0D5DBFF
              FFFFB7BEC64D5F73DCE0E4FFFFFFFFFFFFFFFFFF4D5F73728191FFFFFFFFFFFF
              FFFFFFFFFFFFF2F2F26E6E6E9C9C9CFFFFFFFFFFFFAC6C2EAC6B2CC49567CDA5
              7EAC6B2CAC6B2CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0F2F45C6E828F9CA9FF
              FFFFFFFFFF4F60744D5F737F8C9B939EAA4D5F734D5F73FFFFFFFFFFFFFFFFFF
              FFFFFFFCFCFC9494946E6E6E6E6E6EE8E8E8FFFFFFFFFFFFCDA57EAC6B2CAC6B
              2CBE8A57FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFD8694A25C6E825C6E82E4
              E8ECFFFFFFFFFFFF939EAA4D5F734D5F73728190FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFABABAB6E6E6E6E6E6E6E6E6E858585F2F2F2EFEFEFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA1ABB75C6E825C6E825C6E8274
              8597EFF2F4EDEFF1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              C6C6C66E6E6E6E6E6E6E6E6E6E6E6E6E6E6EC9C9C9DFDFDF727272CACACAFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFC6CE5C6E825C6E825C6E825C6E825C
              6E82BFC9D2D9DFE5617285C4CAD1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDDDDDD
              7171716E6E6E6E6E6E6E6E6E6E6E6E6E6E6E808080FCFCFCCECECE737373E0E0
              E0FFFFFFFFFFFFFFFFFFFFFFFFD9DDE26071855C6E825C6E825C6E825C6E825C
              6E826F8092FBFCFCC5CED6617386DDE0E5FFFFFFFFFFFFFFFFFFEEEEEE7B7B7B
              6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6EC3C3C3FFFFFFB9B9B97D7D
              7DF1F1F1FFFFFFFFFFFFECEEF06A7B8D5C6E825C6E825C6E825C6E825C6E825C
              6E825C6E82B8C3CDFFFFFFADB9C56D7D8FEFF1F3FFFFFFFFFFFF8B8B8B6E6E6E
              6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E7C7C7CFAFAFAFEFEFE9F9F
              9F8E8E8EFBFBFBFFFFFF7C8B9B5C6E825C6E825C6E825C6E825C6E825C6E825C
              6E825C6E826B7C8FF9FAFAFDFEFE909FAE808E9DFAFBFBFFFFFF6E6E6E6E6E6E
              6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E7070707070706E6E
              6E6E6E6EB7B7B7FFFFFF5C6E825C6E825C6E825C6E825C6E825C6E825C6E825C
              6E825C6E825C6E825F70845F70845C6E825C6E82AFB7C1FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = btnPesquisarEstoqueSateliteClick
            ExplicitLeft = 512
            ExplicitTop = 16
            ExplicitHeight = 27
          end
          object edFiltrarEstoqueSatelite: TEdit
            AlignWithMargins = True
            Left = 234
            Top = 20
            Width = 276
            Height = 23
            Hint = 'Digite aqui a palavra-chave da pesquisa'
            Margins.Top = 5
            Margins.Bottom = 9
            Align = alRight
            Anchors = [akLeft, akTop, akRight, akBottom]
            CharCase = ecUpperCase
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            OnKeyDown = edFiltrarEstoqueSateliteKeyDown
            ExplicitHeight = 21
          end
          object edFiltrarTipoEstoqueSatelite: TComboBox
            Left = 19
            Top = 21
            Width = 209
            Height = 21
            Margins.Left = 10
            Margins.Top = 5
            Margins.Bottom = 9
            Style = csDropDownList
            ItemIndex = 0
            TabOrder = 1
            Text = 'por Produto (C'#243'digo / Descri'#231#227'o)'
            Items.Strings = (
              'por Produto (C'#243'digo / Descri'#231#227'o)'
              'por Refer'#234'ncia'
              'por Fabricante'
              'por Grupo')
          end
          object chkProdutoComEstoque: TCheckBox
            Left = 68
            Top = -1
            Width = 194
            Height = 17
            TabStop = False
            Caption = 'A&penas produtos com estoque'
            Checked = True
            State = cbChecked
            TabOrder = 0
          end
        end
      end
      object dbgEstoqueSatelite: TDBGrid
        Left = 0
        Top = 66
        Width = 836
        Height = 362
        Align = alClient
        DataSource = DtsEstoqueSatelite
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
        OnKeyDown = dbgDadosKeyDown
        OnKeyPress = dbgEstoqueSateliteKeyPress
        Columns = <
          item
            Expanded = False
            FieldName = 'COD_PRODUTO'
            Title.Caption = 'C'#243'digo '
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRI'
            Title.Caption = 'Descri'#231#227'o '
            Width = 280
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
            FieldName = 'QUANTIDADE'
            Title.Caption = 'Estoque '
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UNP_SIGLA'
            Title.Alignment = taCenter
            Title.Caption = 'Und. '
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LOTE'
            Title.Caption = 'Lote '
            Width = 130
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
            FieldName = 'VALOR_MEDIO'
            Title.Caption = 'Valor M'#233'dio (R$) '
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_FABRICANTE'
            Title.Caption = 'Fabricante '
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO_GRUPO'
            Title.Caption = 'Grupo '
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'USUARIO'
            Title.Caption = 'Usu'#225'rio '
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COD_VENDA_ULT'
            Title.Caption = 'Venda ('#218'lt.) '
            Width = 80
            Visible = True
          end>
      end
      object pnlControleRequisicao: TPanel
        Left = 0
        Top = 432
        Width = 836
        Height = 31
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        Visible = False
        object BtnRequisicoes: TcxButton
          Left = 1
          Top = 0
          Width = 223
          Height = 31
          Caption = 'Controle de Requisi'#231#245'es (F5)'
          OptionsImage.Glyph.SourceDPI = 96
          OptionsImage.Glyph.Data = {
            424D360800000000000036000000280000002000000010000000010020000000
            000000000000C40E0000C40E00000000000000000000FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00B0A090FF604830FF604830FF604830FF604830FF6048
            30FF604830FF604830FF604830FF604830FF705040FFFF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF009C9C9CFF434343FF434343FF434343FF434343FF4343
            43FF434343FF434343FF434343FF434343FF4E4E4EFFFF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00C0A8A0FFFFF0F0FFE0E0E0FFE0E0D0FF905840FFF0F0
            E0FFE0C8C0FFE0C8B0FFE0C0B0FFE0B8A0FF705040FFFF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00A8A8A8FFF1F1F1FFE0E0E0FFDBDBDBFF565656FFEBEB
            EBFFC8C8C8FFC3C3C3FFBEBEBEFFB4B4B4FF4E4E4EFF708890FF608090FF6078
            80FF608890FF6090A0FFC0B0A0FFFFFFFFFFFFF8F0FFE0D8D0FFA06040FFFFF0
            F0FFFFE8E0FFFFE8D0FFF0E0D0FFD0B8A0FF705040FF888888FF818181FF7878
            78FF868686FF909090FFACACACFFFFFFFFFFF6F6F6FFD6D6D6FF5C5C5CFFF1F1
            F1FFE7E7E7FFE3E3E3FFDCDCDCFFB3B3B3FF4E4E4EFF708890FF90A0B0FF70B0
            D0FF0090D0FF30B0E0FFD0B8A0FFFFFFFFFFB08870FFE0E0E0FFA07050FFFFF8
            F0FFC09080FFC08870FFB07860FFD0B8A0FF705040FF888888FFA3A3A3FFB3B3
            B3FF949494FFB1B1B1FFB3B3B3FFFFFFFFFF848484FFE0E0E0FF6B6B6BFFF6F6
            F6FF909090FF868686FF767676FFB3B3B3FF4E4E4EFF808890FF80C0D0FF90A8
            B0FF80E0FFFF50B8E0FFD0B8A0FFFFFFFFFFFFFFFFFFE0E0E0FFA07860FFFFF8
            F0FFFFF0F0FFFFF0E0FFFFE8E0FFD0B8A0FF705040FF898989FFBEBEBEFFA8A8
            A8FFDFDFDFFFB9B9B9FFB3B3B3FFFFFFFFFFFFFFFFFFE0E0E0FF747474FFF6F6
            F6FFF1F1F1FFECECECFFE7E7E7FFB3B3B3FF4E4E4EFF8090A0FF80D0F0FF90A8
            B0FF90C0D0FF60C0E0FFD0B8A0FFFFFFFFFFB09890FFE0E0E0FFB08060FFFFF8
            FFFFC0A090FFC09880FFC08870FFD0B8B0FF705040FF939393FFD1D1D1FFA8A8
            A8FFC0C0C0FFC0C0C0FFB3B3B3FFFFFFFFFF989898FFE0E0E0FF7B7B7BFFFAFA
            FAFF9E9E9EFF949494FF868686FFB8B8B8FF4E4E4EFF8090A0FF80D8F0FF80C8
            E0FF90A8B0FF60C0E0FFD0B8A0FFFFFFFFFFFFFFFFFFFFFFFFFFB08060FFFFFF
            FFFFFFF8FFFFFFF8F0FFFFF8F0FFFFF0F0FF705040FF939393FFD6D6D6FFC8C8
            C8FFA8A8A8FFC0C0C0FFB3B3B3FFFFFFFFFFFFFFFFFFFFFFFFFF7B7B7BFFFFFF
            FFFFFAFAFAFFF6F6F6FFF6F6F6FFF1F1F1FF4E4E4EFF8098A0FF90E0F0FF90E0
            FFFF90A8B0FF90C0D0FFE0A080FFF0A890FFF0A080FFF09870FFE09060FFE088
            50FFE07840FFE07840FFE07040FFE07040FFD06030FF989898FFDCDCDCFFE1E1
            E1FFA8A8A8FFC0C0C0FF9C9C9CFFA8A8A8FF9E9E9EFF949494FF898989FF8080
            80FF717171FF717171FF6C6C6CFF6C6C6CFF5C5C5CFF8098A0FF90E0F0FFA0E8
            FFFF80C8E0FF80C0D0FFD09870FFFFC0A0FFFFB8A0FFFFB890FFFFB090FFFFA8
            80FFFFA880FFF0A070FFF09870FFF09870FFD07040FF989898FFDCDCDCFFE7E7
            E7FFC8C8C8FFBEBEBEFF919191FFBCBCBCFFB7B7B7FFB3B3B3FFAEAEAEFFA4A4
            A4FFA4A4A4FF999999FF949494FF949494FF6B6B6BFF90A0A0FFA0E8F0FFA0E8
            FFFFA0E8FFFF90C8D0FFC09070FFD09070FFD09070FFE09870FFD09070FFE098
            70FFE09060FFE08850FFE08050FFE07840FFE07040FF9E9E9EFFE3E3E3FFE7E7
            E7FFE7E7E7FFC4C4C4FF8B8B8BFF8C8C8CFF8C8C8CFF939393FF8C8C8CFF9393
            93FF898989FF808080FF7B7B7BFF717171FF6C6C6CFF90A0B0FFA0E8F0FFA0F0
            FFFFA0E8FFFFA0E8FFFF80D0F0FF70C8F0FF70C8F0FF70C8F0FF70C8F0FF70C8
            F0FF70C8F0FF90B0C0FFFF00FF00FF00FF00FF00FF00A3A3A3FFE3E3E3FFECEC
            ECFFE7E7E7FFE7E7E7FFD1D1D1FFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
            CBFFCBCBCBFFB1B1B1FFFF00FF00FF00FF00FF00FF0090A0B0FFA0F0F0FFB0F0
            F0FFA0F0FFFFA0E8FFFFA0E8FFFF70D8FFFF90A0A0FF8098A0FF8098A0FF8090
            A0FF809090FF708890FFFF00FF00FF00FF00FF00FF00A3A3A3FFE8E8E8FFE9E9
            E9FFECECECFFE7E7E7FFE7E7E7FFD9D9D9FF9E9E9EFF989898FF989898FF9393
            93FF8E8E8EFF888888FFFF00FF00FF00FF00FF00FF0090A8B0FFA0D0E0FFB0F0
            F0FFB0F0F0FFA0F0FFFFA0E8FFFF90A0B0FFB1C3C7FFFF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00906850FF906850FF906850FFA8A8A8FFD0D0D0FFE9E9
            E9FFE9E9E9FFECECECFFE7E7E7FFA3A3A3FFC2C2C2FFFF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00646464FF646464FF646464FFC8CDD0FF90A8B0FF90A8
            B0FF90A8B0FF90A8B0FF90A8B0FFB4BFC4FFFF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00CDBEBCFF906850FF906850FFCDCDCDFFA8A8A8FFA8A8
            A8FFA8A8A8FFA8A8A8FFA8A8A8FFBFBFBFFFFF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00BEBEBEFF646464FF646464FFFF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00907860FFC3B2
            A9FFFF00FF00DED8D8FFA09080FFCDC3BCFF907860FFFF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00737373FFB1B1
            B1FFFF00FF00D8D8D8FF8C8C8CFFC1C1C1FF737373FFFF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D2CDC7FFA090
            80FFA08880FFB09880FFC1B7AFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00CBCBCBFF8C8C
            8CFF888888FF939393FFB5B5B5FFFF00FF00FF00FF00}
          OptionsImage.NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
        end
      end
    end
  end
  inherited tlbBotoes: TPanel
    Top = 496
    Width = 844
    ExplicitTop = 496
    ExplicitWidth = 844
    inherited bvlTool3: TBevel
      Left = 761
      ExplicitLeft = 761
    end
    inherited bvlTool4: TBevel
      Left = 840
      ExplicitLeft = 840
    end
    object Bevel10: TBevel [5]
      Left = 813
      Top = 2
      Width = 4
      Height = 31
      Shape = bsSpacer
    end
    inherited btbtnFechar: TcxButton
      Left = 765
      TabOrder = 8
      ExplicitLeft = 765
    end
    inherited btbtnSelecionar: TcxButton
      Left = 641
      TabOrder = 7
      ExplicitLeft = 641
    end
    object BtBtnProcesso: TcxButton
      Tag = 11
      Left = 521
      Top = 0
      Width = 120
      Height = 35
      Hint = 'Bloqueio e Desbloqueio de Cliente'
      Align = alRight
      Caption = '&Bloqueio / Desbloq.'
      Enabled = False
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        424D360800000000000036000000280000002000000010000000010020000000
        000000000000C40E0000C40E0000000000000000000000FF000000FF000000FF
        0000666666FF666666FF666666FF666666FF666666FF666666FF666666FF6666
        66FF00FF000000FF000000FF000000FF000000FF0000C0C0C0FFC0C0C0FFC0C0
        C0FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
        80FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF00FF000000FF000000FF
        0000666666FFDFFBFDFFDFFBFDFFDFFBFDFFDFFBFDFFDFFBFDFFDFFBFDFF6666
        66FF00FF000000FF000000FF000000FF000000FF0000C0C0C0FFC0C0C0FFC0C0
        C0FF808080FFDBDBDBFFDBDBDBFFDBDBDBFFDBDBDBFFDBDBDBFFDBDBDBFF8080
        80FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF00FF000000FF000000FF
        0000666666FFDFFBFDFF838383FF838383FF838383FF838383FFDFFBFDFF6666
        66FF00FF000000FF000000FF000000FF000000FF0000C0C0C0FFC0C0C0FFC0C0
        C0FF808080FFDBDBDBFF838383FF838383FF838383FF838383FFDBDBDBFF8080
        80FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF00FF000000FF000000FF
        0000666666FF0000F7FF0000F7FF0000F7FF0000F7FF0000F7FF0000F7FF6666
        66FF00FF000000FF000000FF000000FF000000FF0000C0C0C0FFC0C0C0FFC0C0
        C0FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
        80FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF00FF000000FF000000FF
        0000666666FF0000F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000F7FF6666
        66FF00FF0000666666FF666666FF666666FF666666FFC0C0C0FFC0C0C0FFC0C0
        C0FF808080FF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FF8080
        80FFC0C0C0FF808080FF808080FF808080FF808080FF00FF000000FF000000FF
        0000666666FF0000F7FF0000F7FF0000F7FF0000F7FF0000F7FF0000F7FF6666
        66FF00FF000000FF000000FF000000FF000000FF0000C0C0C0FFC0C0C0FFC0C0
        C0FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
        80FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF00FF000000FF000000FF
        0000666666FFDFFBFDFF838383FF838383FFDFFBFDFFDFFBFDFFDFFBFDFF6666
        66FF00FF000000FF00004D4D4DFF4D4D4DFF00FF0000C0C0C0FFC0C0C0FFC0C0
        C0FF808080FFDBDBDBFF838383FF838383FFDBDBDBFFDBDBDBFFDBDBDBFF8080
        80FFC0C0C0FFC0C0C0FF808080FF808080FFC0C0C0FF00FF000000FF000000FF
        0000666666FFDFFBFDFFDFFBFDFFDFFBFDFFDFFBFDFF666666FF666666FF6666
        66FF00FF00004D4D4DFF4D4D4DFF4D4D4DFF4D4D4DFFC0C0C0FFC0C0C0FFC0C0
        C0FF808080FFDBDBDBFFDBDBDBFFDBDBDBFFDBDBDBFF808080FF808080FF8080
        80FFC0C0C0FF808080FF808080FF808080FF808080FF00FF000000FF000000FF
        0000666666FFDFFBFDFFDFFBFDFFDFFBFDFFDFFBFDFF666666FF666666FF00FF
        000000FF000000FF00004D4D4DFF4D4D4DFF00FF0000C0C0C0FFC0C0C0FFC0C0
        C0FF808080FFDBDBDBFFDBDBDBFFDBDBDBFFDBDBDBFF808080FF808080FFC0C0
        C0FFC0C0C0FFC0C0C0FF808080FF808080FFC0C0C0FF00FF000000FF000000FF
        0000666666FF666666FF666666FF666666FF666666FF666666FF00FF000000FF
        000000FF000000FF00004D4D4DFF4D4D4DFF00FF0000C0C0C0FFC0C0C0FFC0C0
        C0FF808080FF808080FF808080FF808080FF808080FF808080FFC0C0C0FFC0C0
        C0FFC0C0C0FFC0C0C0FF808080FF808080FFC0C0C0FF00FF0000830000FF00FF
        000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
        000000FF000000FF00004D4D4DFF4D4D4DFF00FF0000C0C0C0FF808080FFC0C0
        C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
        C0FFC0C0C0FFC0C0C0FF808080FF808080FFC0C0C0FF00FF0000830000FF8300
        00FF00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF0000C0C0C0FF808080FF8080
        80FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
        C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF00FF0000830000FF8300
        00FF830000FF00FF000000FF000000FF000000FF000000FF000000FF000000FF
        000000FF000000FF00004D4D4DFF4D4D4DFF00FF0000C0C0C0FF808080FF8080
        80FF808080FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
        C0FFC0C0C0FFC0C0C0FF808080FF808080FFC0C0C0FF00FF0000830000FF8300
        00FF00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF0000C0C0C0FF808080FF8080
        80FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
        C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF00FF0000830000FF00FF
        000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
        000000FF000000FF00004D4D4DFF4D4D4DFF00FF0000C0C0C0FF808080FFC0C0
        C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
        C0FFC0C0C0FFC0C0C0FF808080FF808080FFC0C0C0FF00FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF0000C0C0C0FFC0C0C0FFC0C0
        C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
        C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF}
      OptionsImage.NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      TabStop = False
      OnClick = BtBtnProcessoClick
    end
  end
  inherited DtSrcTabela: TDataSource
    OnDataChange = DtSrcTabelaDataChange
    Left = 528
    Top = 0
  end
  inherited ImgList: TImageList
    Left = 496
    Top = 0
  end
  object dtsTotalComprasAbertas: TDataSource
    Left = 624
    Top = 1
  end
  object dtsTitulos: TDataSource
    Left = 656
    Top = 1
  end
  object dtsVendedor: TDataSource
    Left = 560
  end
  object popProcesso: TPopupMenu
    Images = ImgList
    Left = 776
    Top = 398
    object mpClienteBloquear: TMenuItem
      Caption = '&Bloquear'
      ImageIndex = 37
      OnClick = mpClienteBloquearClick
    end
    object mpClienteDesbloquear: TMenuItem
      Caption = '&Desbloquear '
      ImageIndex = 39
      OnClick = mpClienteDesbloquearClick
    end
  end
  object ACBrConsultaCNPJ: TACBrConsultaCNPJ
    ProxyPort = '8080'
    PesquisarIBGE = False
    Left = 776
    Top = 352
  end
  object ACBrConsultaCPF: TACBrConsultaCPF
    ProxyPort = '8080'
    Left = 776
    Top = 304
  end
  object DtsEstoqueSatelite: TDataSource
    AutoEdit = False
    Left = 688
  end
  object dtsTipoCnpj: TDataSource
    Left = 592
  end
  object dtsBancoFebraban: TDataSource
    Left = 720
  end
end
