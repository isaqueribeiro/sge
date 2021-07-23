inherited frmGeEmpresa: TfrmGeEmpresa
  Left = 396
  Top = 227
  Caption = 'Cadastro da Empresa(s)'
  ClientHeight = 426
  ClientWidth = 747
  OldCreateOrder = True
  OnClose = FormClose
  ExplicitWidth = 763
  ExplicitHeight = 465
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 422
    Width = 747
    ExplicitTop = 423
    ExplicitWidth = 747
  end
  inherited Bevel3: TBevel
    Top = 383
    Width = 747
    ExplicitTop = 384
    ExplicitWidth = 747
  end
  inherited pgcGuias: TPageControl
    Width = 747
    Height = 383
    ExplicitWidth = 747
    ExplicitHeight = 383
    inherited tbsTabela: TTabSheet
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 739
      ExplicitHeight = 354
      inherited Bevel4: TBevel
        Top = 288
        Width = 739
        ExplicitTop = 289
        ExplicitWidth = 739
      end
      inherited dbgDados: TDBGrid
        Width = 739
        Height = 288
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Title.Caption = 'C'#243'digo '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RZSOC'
            Title.Caption = 'Raz'#227'o Social '
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CNPJ'
            Title.Caption = 'CPF/CNPJ '
            Width = 140
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IE'
            Title.Caption = 'Inscri'#231#227'o Estadual '
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IM'
            Title.Caption = 'Inscri'#231#227'o Municipal '
            Width = 120
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        Top = 292
        Width = 739
        ExplicitTop = 292
        ExplicitWidth = 739
        object lblRegistroDesativado: TLabel [0]
          Left = 2
          Top = 44
          Width = 125
          Height = 13
          Caption = '* Empresa desativada'
          Font.Charset = ANSI_CHARSET
          Font.Color = 7303023
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        inherited grpBxFiltro: TGroupBox
          Left = 453
          Width = 282
          ExplicitLeft = 453
          ExplicitWidth = 282
          DesignSize = (
            282
            54)
          inherited lbltFiltrar: TLabel
            Width = 52
            Caption = 'Empresa:'
            ExplicitWidth = 52
          end
          inherited edtFiltrar: TEdit
            Left = 64
            Width = 169
            ExplicitLeft = 64
            ExplicitWidth = 169
          end
          inherited btnFiltrar: TcxButton
            Left = 237
            ExplicitLeft = 237
          end
        end
      end
    end
    inherited tbsCadastro: TTabSheet
      ExplicitWidth = 739
      ExplicitHeight = 354
      inherited Bevel8: TBevel
        Top = 113
        Width = 739
        ExplicitTop = 113
        ExplicitWidth = 739
      end
      object Bevel5: TBevel [1]
        Left = 0
        Top = 233
        Width = 739
        Height = 4
        Align = alTop
        Shape = bsSpacer
      end
      inherited GrpBxDadosNominais: TGroupBox
        Width = 739
        Height = 113
        ExplicitWidth = 739
        ExplicitHeight = 113
        object lblCNPJ: TLabel [1]
          Left = 192
          Top = 24
          Width = 52
          Height = 13
          Caption = 'CPF/CNPJ:'
          FocusControl = dbCNPJ
        end
        object lblRazao: TLabel [2]
          Left = 352
          Top = 24
          Width = 64
          Height = 13
          Caption = 'Raz'#227'o Social:'
          FocusControl = dbRazao
        end
        object lblFantasia: TLabel [3]
          Left = 16
          Top = 64
          Width = 45
          Height = 13
          Caption = 'Fantasia:'
          FocusControl = dbFantasia
        end
        object lblIE: TLabel [4]
          Left = 352
          Top = 64
          Width = 91
          Height = 13
          Caption = 'Inscri'#231#227'o Estadual:'
          FocusControl = dbIE
        end
        object lblIM: TLabel [5]
          Left = 488
          Top = 64
          Width = 93
          Height = 13
          Caption = 'Inscri'#231#227'o Municipal:'
          FocusControl = dbIM
        end
        object lblCNAE: TLabel [6]
          Left = 624
          Top = 64
          Width = 73
          Height = 13
          Caption = 'CNAE Principal:'
          FocusControl = dbCNAE
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
          TabOrder = 1
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbCNPJ: TDBEdit
          Left = 192
          Top = 40
          Width = 153
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CNPJ'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object dbRazao: TDBEdit
          Left = 352
          Top = 40
          Width = 369
          Height = 21
          CharCase = ecUpperCase
          DataField = 'RZSOC'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object dbFantasia: TDBEdit
          Left = 16
          Top = 80
          Width = 330
          Height = 21
          CharCase = ecUpperCase
          DataField = 'NMFANT'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
        object dbIE: TDBEdit
          Left = 352
          Top = 80
          Width = 129
          Height = 21
          CharCase = ecUpperCase
          DataField = 'IE'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
        object dbIM: TDBEdit
          Left = 488
          Top = 80
          Width = 129
          Height = 21
          CharCase = ecUpperCase
          DataField = 'IM'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
        end
        object dbCNAE: TDBEdit
          Left = 624
          Top = 80
          Width = 97
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CNAE'
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
      object GroupBox1: TGroupBox
        Left = 0
        Top = 117
        Width = 739
        Height = 116
        Align = alTop
        Caption = 'Endere'#231'o'
        TabOrder = 1
        object lblCidade: TLabel
          Left = 160
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
          Left = 416
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
          Left = 616
          Top = 24
          Width = 23
          Height = 13
          Caption = 'CEP:'
        end
        object lblNumero: TLabel
          Left = 416
          Top = 64
          Width = 41
          Height = 13
          Caption = 'N'#250'mero:'
          FocusControl = dbNumero
        end
        object lblComplemento: TLabel
          Left = 488
          Top = 64
          Width = 69
          Height = 13
          Caption = 'Complemento:'
          FocusControl = dbComplemento
        end
        object dbNumero: TDBEdit
          Left = 416
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
          Left = 488
          Top = 80
          Width = 233
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
          Width = 137
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
          Left = 160
          Top = 40
          Width = 249
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
          Left = 416
          Top = 40
          Width = 193
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
          Width = 393
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
        object dbCEP: TJvDBMaskEdit
          Left = 616
          Top = 40
          Width = 105
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
        Width = 739
        Height = 117
        ActivePage = tbsContato
        Align = alClient
        TabOrder = 2
        object tbsContato: TTabSheet
          Caption = 'Contato'
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object lblFone1: TLabel
            Left = 8
            Top = 0
            Width = 37
            Height = 13
            Caption = 'Fone 1:'
            FocusControl = dbFone1
          end
          object lblEmail: TLabel
            Left = 328
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
          object lblFone2: TLabel
            Left = 168
            Top = 0
            Width = 37
            Height = 13
            Caption = 'Fone 2:'
            FocusControl = dbFone2
          end
          object dbFone1: TDBEdit
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
            Left = 328
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
            TabOrder = 2
          end
          object dbHome: TDBEdit
            Left = 8
            Top = 56
            Width = 313
            Height = 21
            CharCase = ecLowerCase
            DataField = 'HOME_PAGE'
            DataSource = DtSrcTabela
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            OnKeyPress = ProximoCampoKeyPress
          end
          object dbLogo: TDBImage
            Left = 640
            Top = 0
            Width = 91
            Height = 89
            Align = alRight
            DataField = 'LOGO'
            DataSource = DtSrcTabela
            PopupMenu = ppmLogo
            Stretch = True
            TabOrder = 5
          end
          object dbFone2: TDBEdit
            Left = 168
            Top = 16
            Width = 153
            Height = 21
            CharCase = ecUpperCase
            DataField = 'FONE2'
            DataSource = DtSrcTabela
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object dbAtiva: TDBCheckBox
            Left = 328
            Top = 58
            Width = 116
            Height = 17
            Caption = 'Empresa Ativa'
            DataField = 'ATIVA'
            DataSource = DtSrcTabela
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
        object tbsInforme: TTabSheet
          Caption = 'Outras informa'#231#245'es'
          ImageIndex = 1
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object lblPais: TLabel
            Left = 8
            Top = 0
            Width = 23
            Height = 13
            Caption = 'Pa'#237's:'
          end
          object lblTipoRegime: TLabel
            Left = 151
            Top = 0
            Width = 62
            Height = 13
            Caption = 'Tipo Regime:'
            FocusControl = dbTipoRegime
          end
          object lblSegmento: TLabel
            Left = 456
            Top = 0
            Width = 52
            Height = 13
            Caption = 'Segmento:'
            FocusControl = dbSegmento
          end
          object dbTipoRegime: TDBLookupComboBox
            Left = 151
            Top = 16
            Width = 299
            Height = 21
            DataField = 'TIPO_REGIME_NFE'
            DataSource = DtSrcTabela
            DropDownRows = 10
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            KeyField = 'CODIGO'
            ListField = 'DESCRICAO'
            ListSource = dtsTipoRegimeNFe
            ParentFont = False
            TabOrder = 1
          end
          object dbPais: TJvDBComboEdit
            Left = 8
            Top = 16
            Width = 137
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
            TabOrder = 0
          end
          object dbSegmento: TDBLookupComboBox
            Left = 456
            Top = 16
            Width = 261
            Height = 21
            DataField = 'SEGMENTO'
            DataSource = DtSrcTabela
            DropDownRows = 10
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            KeyField = 'SEG_ID'
            ListField = 'SEG_DESCRICAO'
            ListSource = dtsSegmento
            ParentFont = False
            TabOrder = 2
          end
        end
      end
    end
  end
  inherited tlbBotoes: TPanel
    Top = 387
    Width = 747
    ExplicitTop = 387
    ExplicitWidth = 747
    inherited bvlTool3: TBevel
      Left = 664
      ExplicitLeft = 664
    end
    inherited bvlTool4: TBevel
      Left = 743
      ExplicitLeft = 743
    end
    inherited btbtnFechar: TcxButton
      Left = 668
      ExplicitLeft = 668
    end
    inherited btbtnSelecionar: TcxButton
      Left = 544
      ExplicitLeft = 544
    end
  end
  inherited IbDtstTabela: TIBDataSet
    SelectSQL.Strings = (
      'Select'
      '    e.Codigo'
      '  , e.Pessoa_fisica'
      '  , e.Cnpj'
      '  , e.Rzsoc'
      '  , e.Nmfant'
      '  , e.Ie'
      '  , e.Im'
      '  , e.Cnae'
      '  , e.Segmento'
      '  , e.Ender'
      '  , e.Complemento'
      '  , e.Numero_end'
      '  , e.Bairro'
      '  , e.Cep'
      '  , e.Cidade'
      '  , e.Uf'
      '  , e.Fone'
      '  , e.Fone2'
      '  , e.Logo'
      '  , e.Tlg_tipo'
      '  , e.Log_cod'
      '  , e.Bai_cod'
      '  , e.Cid_cod'
      '  , e.Est_cod'
      '  , e.Email'
      '  , e.Home_page'
      '  , e.Chave_acesso_nfe'
      '  , e.Tipo_Regime_nfe'
      '  , e.Serie_nfe'
      '  , e.Numero_nfe'
      '  , e.Lote_Ano_nfe'
      '  , e.Lote_Num_nfe'
      '  , e.Carta_correcao_nfe'
      '  , e.Serie_nfce'
      '  , e.Numero_nfce'
      '  , e.Pais_id'
      '  , e.Usuario'
      '  , e.Ativa'
      
        '  , cast(coalesce(coalesce(t.Tlg_sigla, t.Tlg_descricao) || '#39' '#39',' +
        ' '#39#39') || l.Log_nome as varchar(250)) as Logradouro'
      '  , c.Cid_nome'
      '  , u.Est_nome'
      '  , p.Pais_nome'
      'from TBEMPRESA e'
      '  left join TBTIPO_LOGRADOURO t on (t.Tlg_cod = e.Tlg_tipo)'
      '  left join TBLOGRADOURO l on (l.Log_cod = e.Log_cod)'
      '  left join TBCIDADE c on (c.Cid_cod = e.Cid_cod)'
      '  left join TBESTADO u on (u.Est_cod = e.Est_cod)'
      '  left join TBPAIS p on (p.Pais_id = e.Pais_id)')
    GeneratorField.Field = 'CODIGO'
    GeneratorField.Generator = 'GEN_EMPRESA_ID'
    Top = 8
  end
  inherited DtSrcTabela: TDataSource
    DataSet = fdQryTabela
    OnDataChange = DtSrcTabelaDataChange
    Top = 72
  end
  inherited IbUpdTabela: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO,'
      '  PESSOA_FISICA,'
      '  CNPJ,'
      '  RZSOC,'
      '  NMFANT,'
      '  IE,'
      '  IM,'
      '  SEGMENTO,'
      '  CNAE,'
      '  ENDER,'
      '  COMPLEMENTO,'
      '  BAIRRO,'
      '  CEP,'
      '  CIDADE,'
      '  UF,'
      '  FONE,'
      '  FONE2,'
      '  LOGO,'
      '  TLG_TIPO,'
      '  LOG_COD,'
      '  BAI_COD,'
      '  CID_COD,'
      '  EST_COD,'
      '  NUMERO_END,'
      '  EMAIL,'
      '  HOME_PAGE,'
      '  CHAVE_ACESSO_NFE,'
      '  PAIS_ID,'
      '  TIPO_REGIME_NFE,'
      '  SERIE_NFE,'
      '  NUMERO_NFE,'
      '  LOTE_ANO_NFE,'
      '  LOTE_NUM_NFE,'
      '  CARTA_CORRECAO_NFE,'
      '  SERIE_NFCE,'
      '  NUMERO_NFCE,'
      '  USUARIO,'
      '  ATIVA'
      'from TBEMPRESA '
      'where'
      '  CNPJ = :CNPJ')
    ModifySQL.Strings = (
      'update TBEMPRESA'
      'set'
      '  ATIVA = :ATIVA,'
      '  BAI_COD = :BAI_COD,'
      '  BAIRRO = :BAIRRO,'
      '  CARTA_CORRECAO_NFE = :CARTA_CORRECAO_NFE,'
      '  CEP = :CEP,'
      '  CHAVE_ACESSO_NFE = :CHAVE_ACESSO_NFE,'
      '  CID_COD = :CID_COD,'
      '  CIDADE = :CIDADE,'
      '  CNAE = :CNAE,'
      '  CNPJ = :CNPJ,'
      '  CODIGO = :CODIGO,'
      '  COMPLEMENTO = :COMPLEMENTO,'
      '  EMAIL = :EMAIL,'
      '  ENDER = :ENDER,'
      '  EST_COD = :EST_COD,'
      '  FONE = :FONE,'
      '  FONE2 = :FONE2,'
      '  HOME_PAGE = :HOME_PAGE,'
      '  IE = :IE,'
      '  IM = :IM,'
      '  LOG_COD = :LOG_COD,'
      '  LOGO = :LOGO,'
      '  LOTE_ANO_NFE = :LOTE_ANO_NFE,'
      '  LOTE_NUM_NFE = :LOTE_NUM_NFE,'
      '  NMFANT = :NMFANT,'
      '  NUMERO_END = :NUMERO_END,'
      '  NUMERO_NFCE = :NUMERO_NFCE,'
      '  NUMERO_NFE = :NUMERO_NFE,'
      '  PAIS_ID = :PAIS_ID,'
      '  PESSOA_FISICA = :PESSOA_FISICA,'
      '  RZSOC = :RZSOC,'
      '  SEGMENTO = :SEGMENTO,'
      '  SERIE_NFCE = :SERIE_NFCE,'
      '  SERIE_NFE = :SERIE_NFE,'
      '  TIPO_REGIME_NFE = :TIPO_REGIME_NFE,'
      '  TLG_TIPO = :TLG_TIPO,'
      '  UF = :UF,'
      '  USUARIO = :USUARIO'
      'where'
      '  CNPJ = :OLD_CNPJ')
    InsertSQL.Strings = (
      'insert into TBEMPRESA'
      
        '  (ATIVA, BAI_COD, BAIRRO, CARTA_CORRECAO_NFE, CEP, CHAVE_ACESSO' +
        '_NFE, CID_COD, '
      
        '   CIDADE, CNAE, CNPJ, CODIGO, COMPLEMENTO, EMAIL, ENDER, EST_CO' +
        'D, FONE, '
      
        '   FONE2, HOME_PAGE, IE, IM, LOG_COD, LOGO, LOTE_ANO_NFE, LOTE_N' +
        'UM_NFE, '
      
        '   NMFANT, NUMERO_END, NUMERO_NFCE, NUMERO_NFE, PAIS_ID, PESSOA_' +
        'FISICA, '
      
        '   RZSOC, SEGMENTO, SERIE_NFCE, SERIE_NFE, TIPO_REGIME_NFE, TLG_' +
        'TIPO, UF, '
      '   USUARIO)'
      'values'
      
        '  (:ATIVA, :BAI_COD, :BAIRRO, :CARTA_CORRECAO_NFE, :CEP, :CHAVE_' +
        'ACESSO_NFE, '
      
        '   :CID_COD, :CIDADE, :CNAE, :CNPJ, :CODIGO, :COMPLEMENTO, :EMAI' +
        'L, :ENDER, '
      
        '   :EST_COD, :FONE, :FONE2, :HOME_PAGE, :IE, :IM, :LOG_COD, :LOG' +
        'O, :LOTE_ANO_NFE, '
      
        '   :LOTE_NUM_NFE, :NMFANT, :NUMERO_END, :NUMERO_NFCE, :NUMERO_NF' +
        'E, :PAIS_ID, '
      
        '   :PESSOA_FISICA, :RZSOC, :SEGMENTO, :SERIE_NFCE, :SERIE_NFE, :' +
        'TIPO_REGIME_NFE, '
      '   :TLG_TIPO, :UF, :USUARIO)')
    DeleteSQL.Strings = (
      'delete from TBEMPRESA'
      'where'
      '  CNPJ = :OLD_CNPJ')
    Top = 8
  end
  inherited ImgList: TImageList
    Left = 608
  end
  inherited fdQryTabela: TFDQuery
    UpdateOptions.AssignedValues = [uvFetchGeneratorsPoint, uvGeneratorName]
    UpdateOptions.FetchGeneratorsPoint = gpImmediate
    UpdateOptions.GeneratorName = 'GEN_EMPRESA_ID'
    UpdateOptions.KeyFields = 'CNPJ'
    UpdateOptions.AutoIncFields = 'CODIGO'
    SQL.Strings = (
      'Select'
      '    e.Codigo'
      '  , e.Pessoa_fisica'
      '  , e.Cnpj'
      '  , e.Rzsoc'
      '  , e.Nmfant'
      '  , e.Ie'
      '  , e.Im'
      '  , e.Cnae'
      '  , e.Segmento'
      '  , e.Ender'
      '  , e.Complemento'
      '  , e.Numero_end'
      '  , e.Bairro'
      '  , e.Cep'
      '  , e.Cidade'
      '  , e.Uf'
      '  , e.Fone'
      '  , e.Fone2'
      '  , e.Logo'
      '  , e.Tlg_tipo'
      '  , e.Log_cod'
      '  , e.Bai_cod'
      '  , e.Cid_cod'
      '  , e.Est_cod'
      '  , e.Email'
      '  , e.Home_page'
      '  , e.Chave_acesso_nfe'
      '  , e.Tipo_Regime_nfe'
      '  , e.Serie_nfe'
      '  , e.Numero_nfe'
      '  , e.Lote_Ano_nfe'
      '  , e.Lote_Num_nfe'
      '  , e.Carta_correcao_nfe'
      '  , e.Serie_nfce'
      '  , e.Numero_nfce'
      '  , e.Pais_id'
      '  , e.Usuario'
      '  , e.Ativa'
      
        '  , cast(coalesce(coalesce(t.Tlg_sigla, t.Tlg_descricao) || '#39' '#39',' +
        ' '#39#39') || l.Log_nome as varchar(250)) as Logradouro'
      '  , c.Cid_nome'
      '  , u.Est_nome'
      '  , p.Pais_nome'
      'from TBEMPRESA e'
      '  left join TBTIPO_LOGRADOURO t on (t.Tlg_cod = e.Tlg_tipo)'
      '  left join TBLOGRADOURO l on (l.Log_cod = e.Log_cod)'
      '  left join TBCIDADE c on (c.Cid_cod = e.Cid_cod)'
      '  left join TBESTADO u on (u.Est_cod = e.Est_cod)'
      '  left join TBPAIS p on (p.Pais_id = e.Pais_id)')
    Top = 40
    object fdQryTabelaCODIGO: TIntegerField
      AutoGenerateValue = arAutoInc
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      Required = True
    end
    object fdQryTabelaPESSOA_FISICA: TSmallintField
      Alignment = taLeftJustify
      DisplayLabel = 'Pessoa F'#237'sica'
      FieldName = 'PESSOA_FISICA'
      Origin = 'PESSOA_FISICA'
      Required = True
    end
    object fdQryTabelaCNPJ: TStringField
      DisplayLabel = 'CPF/CNPJ'
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 18
    end
    object fdQryTabelaRZSOC: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      FieldName = 'RZSOC'
      Origin = 'RZSOC'
      Required = True
      Size = 60
    end
    object fdQryTabelaNMFANT: TStringField
      DisplayLabel = 'Nome Fantasia'
      FieldName = 'NMFANT'
      Origin = 'NMFANT'
      Size = 25
    end
    object fdQryTabelaSEGMENTO: TSmallintField
      DisplayLabel = 'Segmento'
      FieldName = 'SEGMENTO'
      Origin = 'SEGMENTO'
      Required = True
      Visible = False
    end
    object fdQryTabelaIE: TStringField
      DisplayLabel = 'Inscri'#231#227'o Estadual'
      FieldName = 'IE'
      Origin = 'IE'
      Size = 11
    end
    object fdQryTabelaIM: TStringField
      DisplayLabel = 'Inscri'#231#227'o Municipal'
      FieldName = 'IM'
      Origin = 'IM'
      Size = 12
    end
    object fdQryTabelaCNAE: TStringField
      DisplayLabel = 'CNAE Principal'
      FieldName = 'CNAE'
      Origin = 'CNAE'
      Required = True
      Size = 11
    end
    object fdQryTabelaENDER: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'ENDER'
      Origin = 'ENDER'
      Size = 250
    end
    object fdQryTabelaCOMPLEMENTO: TStringField
      DisplayLabel = 'Complemento'
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
      Size = 50
    end
    object fdQryTabelaNUMERO_END: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUMERO_END'
      Origin = 'NUMERO_END'
      Size = 10
    end
    object fdQryTabelaBAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 100
    end
    object fdQryTabelaCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Size = 8
    end
    object fdQryTabelaCIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Size = 30
    end
    object fdQryTabelaUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      FixedChar = True
      Size = 2
    end
    object fdQryTabelaFONE: TStringField
      DisplayLabel = 'Fone 1'
      FieldName = 'FONE'
      Origin = 'FONE'
      EditMask = '!\(00\)0000-0000;0; '
      Size = 11
    end
    object fdQryTabelaFONE2: TStringField
      DisplayLabel = 'Fone 2'
      FieldName = 'FONE2'
      Origin = 'FONE2'
      EditMask = '!\(00\)0000-0000;0; '
      Size = 11
    end
    object fdQryTabelaLOGO: TBlobField
      DisplayLabel = 'Logotipo'
      FieldName = 'LOGO'
      Origin = 'LOGO'
    end
    object fdQryTabelaTLG_TIPO: TSmallintField
      DisplayLabel = 'Tipo End.'
      FieldName = 'TLG_TIPO'
      Origin = 'TLG_TIPO'
    end
    object fdQryTabelaLOG_COD: TIntegerField
      DisplayLabel = 'Logradouro'
      FieldName = 'LOG_COD'
      Origin = 'LOG_COD'
    end
    object fdQryTabelaBAI_COD: TIntegerField
      DisplayLabel = 'Bairro'
      FieldName = 'BAI_COD'
      Origin = 'BAI_COD'
    end
    object fdQryTabelaCID_COD: TIntegerField
      DisplayLabel = 'Cidade'
      FieldName = 'CID_COD'
      Origin = 'CID_COD'
    end
    object fdQryTabelaEST_COD: TSmallintField
      DisplayLabel = 'Estado'
      FieldName = 'EST_COD'
      Origin = 'EST_COD'
    end
    object fdQryTabelaEMAIL: TStringField
      DisplayLabel = 'E-mail'
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 100
    end
    object fdQryTabelaHOME_PAGE: TStringField
      DisplayLabel = 'Home page'
      FieldName = 'HOME_PAGE'
      Origin = 'HOME_PAGE'
      Size = 100
    end
    object fdQryTabelaCHAVE_ACESSO_NFE: TStringField
      DisplayLabel = 'Chave de acesso NF-e'
      FieldName = 'CHAVE_ACESSO_NFE'
      Origin = 'CHAVE_ACESSO_NFE'
      Size = 250
    end
    object fdQryTabelaTIPO_REGIME_NFE: TSmallintField
      DisplayLabel = 'Tipo Regime'
      FieldName = 'TIPO_REGIME_NFE'
      Origin = 'TIPO_REGIME_NFE'
      Required = True
      Visible = False
    end
    object fdQryTabelaSERIE_NFE: TSmallintField
      FieldName = 'SERIE_NFE'
      Origin = 'SERIE_NFE'
    end
    object fdQryTabelaNUMERO_NFE: TIntegerField
      FieldName = 'NUMERO_NFE'
      Origin = 'NUMERO_NFE'
    end
    object fdQryTabelaLOTE_ANO_NFE: TSmallintField
      FieldName = 'LOTE_ANO_NFE'
      Origin = 'LOTE_ANO_NFE'
    end
    object fdQryTabelaLOTE_NUM_NFE: TIntegerField
      FieldName = 'LOTE_NUM_NFE'
      Origin = 'LOTE_NUM_NFE'
    end
    object fdQryTabelaCARTA_CORRECAO_NFE: TIntegerField
      FieldName = 'CARTA_CORRECAO_NFE'
      Origin = 'CARTA_CORRECAO_NFE'
    end
    object fdQryTabelaSERIE_NFCE: TSmallintField
      FieldName = 'SERIE_NFCE'
      Origin = 'SERIE_NFCE'
    end
    object fdQryTabelaNUMERO_NFCE: TIntegerField
      FieldName = 'NUMERO_NFCE'
      Origin = 'NUMERO_NFCE'
    end
    object fdQryTabelaPAIS_ID: TStringField
      DisplayLabel = 'Pa'#237's'
      FieldName = 'PAIS_ID'
      Origin = 'PAIS_ID'
      Size = 5
    end
    object fdQryTabelaUSUARIO: TStringField
      FieldName = 'USUARIO'
      Origin = 'USUARIO'
      Size = 50
    end
    object fdQryTabelaATIVA: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'ATIVA'
      Origin = 'ATIVA'
      Required = True
    end
    object fdQryTabelaLOGRADOURO: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Logradouro'
      FieldName = 'LOGRADOURO'
      Origin = 'LOGRADOURO'
      ProviderFlags = []
      Size = 250
    end
    object fdQryTabelaCID_NOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CID_NOME'
      Origin = 'CID_NOME'
      ProviderFlags = []
      Size = 100
    end
    object fdQryTabelaEST_NOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'EST_NOME'
      Origin = 'EST_NOME'
      ProviderFlags = []
      Size = 100
    end
    object fdQryTabelaPAIS_NOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PAIS_NOME'
      Origin = 'PAIS_NOME'
      ProviderFlags = []
      Size = 150
    end
  end
  inherited fdUpdTabela: TFDUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO TBEMPRESA'
      '(CODIGO, PESSOA_FISICA, CNPJ, RZSOC, NMFANT, '
      '  IE, IM, SEGMENTO, CNAE, ENDER, '
      '  COMPLEMENTO, BAIRRO, CEP, CIDADE, UF, '
      '  FONE, FONE2, LOGO, TLG_TIPO, LOG_COD, '
      '  BAI_COD, CID_COD, EST_COD, NUMERO_END, '
      '  EMAIL, HOME_PAGE, CHAVE_ACESSO_NFE, PAIS_ID, '
      '  TIPO_REGIME_NFE, SERIE_NFE, NUMERO_NFE, LOTE_ANO_NFE, '
      '  LOTE_NUM_NFE, CARTA_CORRECAO_NFE, SERIE_NFCE, '
      '  NUMERO_NFCE, USUARIO, ATIVA)'
      
        'VALUES (:NEW_CODIGO, :NEW_PESSOA_FISICA, :NEW_CNPJ, :NEW_RZSOC, ' +
        ':NEW_NMFANT, '
      '  :NEW_IE, :NEW_IM, :NEW_SEGMENTO, :NEW_CNAE, :NEW_ENDER, '
      
        '  :NEW_COMPLEMENTO, :NEW_BAIRRO, :NEW_CEP, :NEW_CIDADE, :NEW_UF,' +
        ' '
      
        '  :NEW_FONE, :NEW_FONE2, :NEW_LOGO, :NEW_TLG_TIPO, :NEW_LOG_COD,' +
        ' '
      '  :NEW_BAI_COD, :NEW_CID_COD, :NEW_EST_COD, :NEW_NUMERO_END, '
      
        '  :NEW_EMAIL, :NEW_HOME_PAGE, :NEW_CHAVE_ACESSO_NFE, :NEW_PAIS_I' +
        'D, '
      
        '  :NEW_TIPO_REGIME_NFE, :NEW_SERIE_NFE, :NEW_NUMERO_NFE, :NEW_LO' +
        'TE_ANO_NFE, '
      '  :NEW_LOTE_NUM_NFE, :NEW_CARTA_CORRECAO_NFE, :NEW_SERIE_NFCE, '
      '  :NEW_NUMERO_NFCE, :NEW_USUARIO, :NEW_ATIVA)'
      
        'RETURNING CODIGO, CHAVE_ACESSO_NFE, SERIE_NFE, NUMERO_NFE, LOTE_' +
        'ANO_NFE, LOTE_NUM_NFE, CARTA_CORRECAO_NFE, SERIE_NFCE, NUMERO_NF' +
        'CE')
    ModifySQL.Strings = (
      'UPDATE TBEMPRESA'
      
        'SET CODIGO = :NEW_CODIGO, PESSOA_FISICA = :NEW_PESSOA_FISICA, CN' +
        'PJ = :NEW_CNPJ, '
      '  RZSOC = :NEW_RZSOC, NMFANT = :NEW_NMFANT, IE = :NEW_IE, '
      '  IM = :NEW_IM, SEGMENTO = :NEW_SEGMENTO, CNAE = :NEW_CNAE, '
      
        '  ENDER = :NEW_ENDER, COMPLEMENTO = :NEW_COMPLEMENTO, BAIRRO = :' +
        'NEW_BAIRRO, '
      
        '  CEP = :NEW_CEP, CIDADE = :NEW_CIDADE, UF = :NEW_UF, FONE = :NE' +
        'W_FONE, '
      
        '  FONE2 = :NEW_FONE2, LOGO = :NEW_LOGO, TLG_TIPO = :NEW_TLG_TIPO' +
        ', '
      
        '  LOG_COD = :NEW_LOG_COD, BAI_COD = :NEW_BAI_COD, CID_COD = :NEW' +
        '_CID_COD, '
      
        '  EST_COD = :NEW_EST_COD, NUMERO_END = :NEW_NUMERO_END, EMAIL = ' +
        ':NEW_EMAIL, '
      
        '  HOME_PAGE = :NEW_HOME_PAGE, CHAVE_ACESSO_NFE = :NEW_CHAVE_ACES' +
        'SO_NFE, '
      
        '  PAIS_ID = :NEW_PAIS_ID, TIPO_REGIME_NFE = :NEW_TIPO_REGIME_NFE' +
        ', '
      '  SERIE_NFE = :NEW_SERIE_NFE, NUMERO_NFE = :NEW_NUMERO_NFE, '
      
        '  LOTE_ANO_NFE = :NEW_LOTE_ANO_NFE, LOTE_NUM_NFE = :NEW_LOTE_NUM' +
        '_NFE, '
      
        '  CARTA_CORRECAO_NFE = :NEW_CARTA_CORRECAO_NFE, SERIE_NFCE = :NE' +
        'W_SERIE_NFCE, '
      '  NUMERO_NFCE = :NEW_NUMERO_NFCE, USUARIO = :NEW_USUARIO, '
      '  ATIVA = :NEW_ATIVA'
      'WHERE CNPJ = :OLD_CNPJ'
      
        'RETURNING CODIGO, CHAVE_ACESSO_NFE, SERIE_NFE, NUMERO_NFE, LOTE_' +
        'ANO_NFE, LOTE_NUM_NFE, CARTA_CORRECAO_NFE, SERIE_NFCE, NUMERO_NF' +
        'CE')
    DeleteSQL.Strings = (
      'DELETE FROM TBEMPRESA'
      'WHERE CNPJ = :OLD_CNPJ')
    FetchRowSQL.Strings = (
      'Select'
      '    e.Codigo'
      '  , e.Pessoa_fisica'
      '  , e.Cnpj'
      '  , e.Rzsoc'
      '  , e.Nmfant'
      '  , e.Ie'
      '  , e.Im'
      '  , e.Cnae'
      '  , e.Segmento'
      '  , e.Ender'
      '  , e.Complemento'
      '  , e.Numero_end'
      '  , e.Bairro'
      '  , e.Cep'
      '  , e.Cidade'
      '  , e.Uf'
      '  , e.Fone'
      '  , e.Fone2'
      '  , e.Logo'
      '  , e.Tlg_tipo'
      '  , e.Log_cod'
      '  , e.Bai_cod'
      '  , e.Cid_cod'
      '  , e.Est_cod'
      '  , e.Email'
      '  , e.Home_page'
      '  , e.Chave_acesso_nfe'
      '  , e.Tipo_Regime_nfe'
      '  , e.Serie_nfe'
      '  , e.Numero_nfe'
      '  , e.Lote_Ano_nfe'
      '  , e.Lote_Num_nfe'
      '  , e.Carta_correcao_nfe'
      '  , e.Serie_nfce'
      '  , e.Numero_nfce'
      '  , e.Pais_id'
      '  , e.Usuario'
      '  , e.Ativa'
      
        '  , cast(coalesce(coalesce(t.Tlg_sigla, t.Tlg_descricao) || '#39' '#39',' +
        ' '#39#39') || l.Log_nome as varchar(250)) as Logradouro'
      '  , c.Cid_nome'
      '  , u.Est_nome'
      '  , p.Pais_nome'
      'from TBEMPRESA e'
      '  left join TBTIPO_LOGRADOURO t on (t.Tlg_cod = e.Tlg_tipo)'
      '  left join TBLOGRADOURO l on (l.Log_cod = e.Log_cod)'
      '  left join TBCIDADE c on (c.Cid_cod = e.Cid_cod)'
      '  left join TBESTADO u on (u.Est_cod = e.Est_cod)'
      '  left join TBPAIS p on (p.Pais_id = e.Pais_id)'
      'WHERE e.CNPJ = :CNPJ')
    Top = 40
  end
  object ppmLogo: TPopupMenu
    Images = ImgList
    Left = 664
    Top = 257
    object ppmCarregarImagem: TMenuItem
      Caption = 'Carregar Imagem'
      OnClick = ppmCarregarImagemClick
    end
    object ppmLimparImagem: TMenuItem
      Caption = 'Limpar Imagem'
      OnClick = ppmLimparImagemClick
    end
  end
  object opnDialogImage: TOpenPictureDialog
    Filter = 'Imagens BMP (*.bmp)|*.bmp'
    Title = 'Selecionar Arquivo de Imagem'
    Left = 696
    Top = 257
  end
  object dtsTipoRegimeNFe: TDataSource
    DataSet = fdQryTipoRegimeNFe
    Left = 576
    Top = 8
  end
  object dtsSegmento: TDataSource
    DataSet = fdQrySegmento
    Left = 576
    Top = 40
  end
  object fdQrySegmento: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select '
      '    s.seg_id'
      '  , s.seg_descricao'
      'from TBSEGMENTO s')
    Left = 544
    Top = 40
  end
  object fdQryTipoRegimeNFe: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select '
      '    t.codigo'
      '  , t.descricao'
      'from VW_TIPO_REGIME_NFE t')
    Left = 544
    Top = 8
  end
end
