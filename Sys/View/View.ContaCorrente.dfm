inherited ViewContaCorrente: TViewContaCorrente
  Left = 393
  Top = 212
  ActiveControl = dbCodigo
  Caption = 'Controle de Conta Corrente'
  ClientHeight = 439
  ClientWidth = 743
  OldCreateOrder = True
  ExplicitWidth = 759
  ExplicitHeight = 478
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 435
    Width = 743
    ExplicitTop = 436
    ExplicitWidth = 743
  end
  inherited Bevel3: TBevel
    Top = 396
    Width = 743
    ExplicitTop = 397
    ExplicitWidth = 743
  end
  inherited pgcGuias: TPageControl
    Width = 743
    Height = 396
    ActivePage = tbsCadastro
    ExplicitWidth = 743
    ExplicitHeight = 396
    inherited tbsTabela: TTabSheet
      ExplicitWidth = 735
      ExplicitHeight = 367
      inherited Bevel4: TBevel
        Top = 301
        Width = 735
        ExplicitTop = 302
        ExplicitWidth = 735
      end
      inherited dbgDados: TDBGrid
        Width = 735
        Height = 301
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
            FieldName = 'DESCRICAO'
            Title.Caption = 'Descri'#231#227'o '
            Width = 240
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO_DESC'
            Title.Caption = 'Tipo '
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BANCO'
            Title.Caption = 'Banco '
            Width = 300
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        Top = 305
        Width = 735
        ExplicitTop = 305
        ExplicitWidth = 735
        inherited grpBxFiltro: TGroupBox
          Left = 383
          Width = 348
          ExplicitLeft = 383
          ExplicitWidth = 348
          inherited lbltFiltrar: TLabel
            Left = 14
            Width = 89
            Caption = 'Conta Corrente:'
            ExplicitLeft = 14
            ExplicitWidth = 89
          end
          inherited edtFiltrar: TEdit
            Left = 109
            Width = 192
            ExplicitLeft = 109
            ExplicitWidth = 192
            ExplicitHeight = 23
          end
          inherited btnFiltrar: TcxButton
            Left = 307
            ExplicitLeft = 281
          end
        end
      end
    end
    inherited tbsCadastro: TTabSheet
      ExplicitWidth = 735
      ExplicitHeight = 367
      inherited Bevel8: TBevel
        Top = 203
        Width = 735
        ExplicitTop = 161
        ExplicitWidth = 735
      end
      inherited GrpBxDadosNominais: TGroupBox
        Width = 735
        Height = 203
        ExplicitWidth = 735
        ExplicitHeight = 203
        object lblNome: TLabel [1]
          Left = 88
          Top = 24
          Width = 50
          Height = 13
          Caption = 'Descri'#231#227'o:'
        end
        object lblBanco: TLabel [2]
          Left = 16
          Top = 64
          Width = 33
          Height = 13
          Caption = 'Banco:'
          FocusControl = dbBanco
        end
        object lblEmpresa: TLabel [3]
          Left = 16
          Top = 104
          Width = 45
          Height = 13
          Caption = 'Empresa:'
          FocusControl = dbEmpresa
        end
        object lblCodigoContabil: TLabel [4]
          Left = 16
          Top = 150
          Width = 79
          Height = 13
          Caption = 'C'#243'digo Cont'#225'bil:'
          FocusControl = dbCodigoContabil
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        inherited dbCodigo: TDBEdit
          Color = clMoneyGreen
          DataField = 'CODIGO'
        end
        object dbNome: TDBEdit
          Left = 88
          Top = 40
          Width = 417
          Height = 21
          CharCase = ecUpperCase
          DataField = 'DESCRICAO'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object dbTipo: TDBRadioGroup
          Left = 512
          Top = 16
          Width = 209
          Height = 44
          Caption = 'Tipo'
          Columns = 2
          DataField = 'TIPO'
          DataSource = DtSrcTabela
          Items.Strings = (
            'Caixa'
            'Banco')
          TabOrder = 2
          Values.Strings = (
            '1'
            '2')
        end
        object dbEmpresa: TDBLookupComboBox
          Left = 16
          Top = 120
          Width = 705
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
          TabOrder = 4
        end
        object dbBanco: TJvDBComboEdit
          Left = 16
          Top = 80
          Width = 705
          Height = 21
          ButtonHint = 'Pesquisar Banco (Ctrl+P)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clMoneyGreen
          DataField = 'BANCO'
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
          OnButtonClick = dbBancoButtonClick
        end
        object dbCodigoContabil: TDBEdit
          Left = 16
          Top = 166
          Width = 97
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CODIGO_CONTABIL'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
      end
    end
  end
  inherited tlbBotoes: TPanel
    Top = 400
    Width = 743
    ExplicitTop = 400
    ExplicitWidth = 743
    inherited bvlTool3: TBevel
      Left = 660
      ExplicitLeft = 660
    end
    inherited bvlTool4: TBevel
      Left = 739
      ExplicitLeft = 739
    end
    inherited btbtnFechar: TcxButton
      Left = 664
      ExplicitLeft = 664
    end
    inherited btbtnSelecionar: TcxButton
      Left = 540
      ExplicitLeft = 540
    end
  end
  inherited DtSrcTabela: TDataSource
    OnDataChange = DtSrcTabelaDataChange
    Left = 608
  end
  inherited ImgList: TImageList
    Left = 568
  end
  object dtsEmpresa: TDataSource
    Left = 536
    Top = 264
  end
end
