inherited ViewIBPT: TViewIBPT
  Left = 393
  Top = 212
  ActiveControl = dbCodigo
  Caption = 'Tabela de Tributa'#231#245'es IBPT'
  ClientHeight = 470
  ClientWidth = 839
  ExplicitWidth = 851
  ExplicitHeight = 508
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 466
    Width = 839
    ExplicitTop = 436
    ExplicitWidth = 743
  end
  inherited Bevel3: TBevel
    Top = 427
    Width = 839
    ExplicitTop = 397
    ExplicitWidth = 743
  end
  inherited pgcGuias: TPageControl
    Width = 839
    Height = 427
    ActivePage = tbsCadastro
    ExplicitWidth = 835
    ExplicitHeight = 426
    inherited tbsTabela: TTabSheet
      ExplicitWidth = 831
      ExplicitHeight = 398
      inherited Bevel4: TBevel
        Top = 324
        Width = 831
        ExplicitTop = 302
        ExplicitWidth = 735
      end
      inherited dbgDados: TDBGrid
        Width = 831
        Height = 324
        Columns = <
          item
            Expanded = False
            FieldName = 'ID_IBPT'
            Title.Caption = 'C'#243'digo '
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NCM_IBPT'
            Title.Caption = 'C'#243'digo NCM '
            Width = 110
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EX_IBPT'
            Title.Alignment = taCenter
            Title.Caption = '# '
            Width = 25
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TABELA_IBPT'
            Title.Alignment = taCenter
            Title.Caption = 'Tab. '
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descricao'
            Title.Caption = 'Descri'#231#227'o '
            Width = 273
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ALIQINTERNACIONAL_IBPT'
            Title.Caption = 'Tax. Int. '
            Visible = False
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'ALIQNACIONAL_IBPT'
            Title.Alignment = taRightJustify
            Title.Caption = '% Nac.'
            Width = 60
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'ALIQESTADUAL_IBPT'
            Title.Alignment = taRightJustify
            Title.Caption = '% Est.'
            Width = 60
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'ALIQMUNICIPAL_IBPT'
            Title.Alignment = taRightJustify
            Title.Caption = '% Mun.'
            Width = 60
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'ALIQUOTA_IS'
            Title.Alignment = taRightJustify
            Title.Caption = '% IS'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOCIVO'
            Title.Alignment = taCenter
            Title.Caption = 'Nocivo'
            Width = 50
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        Top = 328
        Width = 831
        ExplicitTop = 328
        ExplicitWidth = 831
        object lblRegistroDesativado: TLabel [0]
          Left = 2
          Top = 44
          Width = 141
          Height = 13
          Caption = '* C'#243'digo NCM desativado'
          Font.Charset = ANSI_CHARSET
          Font.Color = 7303023
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        inherited grpBxFiltro: TGroupBox
          Left = 492
          Width = 335
          ExplicitLeft = 492
          ExplicitWidth = 335
          inherited lbltFiltrar: TLabel
            Left = 14
            Width = 58
            Caption = 'Descri'#231#227'o:'
            ExplicitLeft = 14
            ExplicitWidth = 58
          end
          inherited edtFiltrar: TEdit
            Left = 81
            Width = 210
            ExplicitLeft = 81
            ExplicitWidth = 210
          end
          inherited btnFiltrar: TcxButton
            Left = 297
            ExplicitLeft = 297
          end
        end
      end
    end
    inherited tbsCadastro: TTabSheet
      ExplicitWidth = 831
      ExplicitHeight = 398
      inherited Bevel8: TBevel
        Top = 249
        Width = 831
        ExplicitTop = 161
        ExplicitWidth = 735
      end
      inherited GrpBxDadosNominais: TGroupBox
        Width = 831
        Height = 249
        ExplicitWidth = 827
        ExplicitHeight = 249
        object lblCodigoNCM: TLabel [1]
          Left = 104
          Top = 24
          Width = 62
          Height = 13
          Caption = 'C'#243'digo NCM:'
          FocusControl = dbCodigoNCM
        end
        object lblDescricao: TLabel [2]
          Left = 16
          Top = 68
          Width = 50
          Height = 13
          Caption = 'Descri'#231#227'o:'
          FocusControl = dbDescricao
        end
        object lblExcecao: TLabel [3]
          Left = 231
          Top = 24
          Width = 44
          Height = 13
          Caption = 'Exce'#231#227'o:'
          FocusControl = dbExcecao
        end
        object lblTabela: TLabel [4]
          Left = 359
          Top = 24
          Width = 36
          Height = 13
          Caption = 'Tabela:'
          FocusControl = dbTabela
        end
        inherited dbCodigo: TDBEdit
          Width = 82
          Color = clMoneyGreen
          DataField = 'ID_IBPT'
          ExplicitWidth = 82
        end
        object dbCodigoNCM: TDBEdit
          Left = 104
          Top = 40
          Width = 121
          Height = 21
          CharCase = ecUpperCase
          DataField = 'NCM_IBPT'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object dbDescricao: TDBMemo
          Left = 16
          Top = 87
          Width = 799
          Height = 101
          Anchors = [akLeft, akTop, akRight]
          DataField = 'DESCRICAO_IBPT'
          DataSource = DtSrcTabela
          ScrollBars = ssVertical
          TabOrder = 4
          ExplicitWidth = 795
        end
        object dbExcecao: TDBLookupComboBox
          Left = 231
          Top = 40
          Width = 122
          Height = 21
          DataField = 'EX_IBPT'
          DataSource = DtSrcTabela
          DropDownRows = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'CODIGO'
          ListField = 'DESCRICAO'
          ListSource = dtsNivelIBPT
          ParentFont = False
          TabOrder = 2
        end
        object dbTabela: TDBLookupComboBox
          Left = 359
          Top = 40
          Width = 174
          Height = 21
          DataField = 'TABELA_IBPT'
          DataSource = DtSrcTabela
          DropDownRows = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'CODIGO'
          ListField = 'DESCRICAO'
          ListSource = dtsTabelaIBPT
          ParentFont = False
          TabOrder = 3
        end
        object dbAtivo: TDBCheckBox
          Left = 16
          Top = 217
          Width = 113
          Height = 17
          Caption = 'Registro ativo'
          DataField = 'ATIVO'
          DataSource = DtSrcTabela
          TabOrder = 6
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbNocivo: TDBCheckBox
          Left = 16
          Top = 194
          Width = 293
          Height = 17
          Caption = 'Produtos nocivos ao Meio Ambiente e '#224' Sa'#250'de'
          DataField = 'NOCIVO'
          DataSource = DtSrcTabela
          TabOrder = 5
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
      object GrpBxAliquotas: TGroupBox
        Left = 0
        Top = 253
        Width = 831
        Height = 76
        Align = alTop
        Caption = 
          'Percentuais de tributa'#231#245'es IBPT (Instituto Brasileiro de Planeja' +
          'mento e Tributa'#231#227'o)'
        TabOrder = 1
        ExplicitWidth = 827
        object lblAliquotaNAC: TLabel
          Left = 16
          Top = 24
          Width = 44
          Height = 13
          Caption = 'Nacional:'
          FocusControl = dbAliquotaNAC
        end
        object lblAliquotaINT: TLabel
          Left = 98
          Top = 24
          Width = 67
          Height = 13
          Caption = 'Internacional:'
          FocusControl = dbAliquotaINT
        end
        object lblAliquotaEST: TLabel
          Left = 180
          Top = 24
          Width = 45
          Height = 13
          Caption = 'Estadual:'
          FocusControl = dbAliquotaEST
        end
        object lblAliquotaMUN: TLabel
          Left = 262
          Top = 24
          Width = 47
          Height = 13
          Caption = 'Municipal:'
          FocusControl = dbAliquotaMUN
        end
        object lblAliquotaIS: TLabel
          Left = 344
          Top = 24
          Width = 56
          Height = 13
          Caption = 'Al'#237'quota IS:'
          FocusControl = dbAliquotaIS
        end
        object dbAliquotaNAC: TDBEdit
          Left = 16
          Top = 40
          Width = 76
          Height = 21
          CharCase = ecUpperCase
          DataField = 'ALIQINTERNACIONAL_IBPT'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object dbAliquotaINT: TDBEdit
          Left = 98
          Top = 40
          Width = 76
          Height = 21
          CharCase = ecUpperCase
          DataField = 'ALIQINTERNACIONAL_IBPT'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object dbAliquotaEST: TDBEdit
          Left = 180
          Top = 40
          Width = 76
          Height = 21
          CharCase = ecUpperCase
          DataField = 'ALIQESTADUAL_IBPT'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object dbAliquotaMUN: TDBEdit
          Left = 262
          Top = 40
          Width = 76
          Height = 21
          CharCase = ecUpperCase
          DataField = 'ALIQMUNICIPAL_IBPT'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object dbAliquotaIS: TDBEdit
          Left = 344
          Top = 40
          Width = 76
          Height = 21
          CharCase = ecUpperCase
          DataField = 'ALIQUOTA_IS'
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
  end
  inherited tlbBotoes: TPanel
    Top = 431
    Width = 839
    ExplicitTop = 430
    ExplicitWidth = 835
    inherited Bevel2: TBevel
      Left = 79
      ExplicitLeft = 75
      ExplicitTop = -2
    end
    inherited bvlTool1: TBevel
      Left = 308
      ExplicitLeft = 304
    end
    inherited bvlTool2: TBevel
      Left = 462
      ExplicitLeft = 458
    end
    inherited bvlTool3: TBevel
      Left = 756
      ExplicitLeft = 660
    end
    inherited bvlTool4: TBevel
      Left = 835
      ExplicitLeft = 739
    end
    object Bevel5: TBevel [5]
      Left = 0
      Top = 0
      Width = 4
      Height = 35
      Align = alLeft
      Shape = bsSpacer
      ExplicitLeft = -6
      ExplicitTop = -6
    end
    inherited btbtnIncluir: TcxButton
      Left = 83
      ExplicitLeft = 83
    end
    inherited btbtnAlterar: TcxButton
      Left = 158
      ExplicitLeft = 158
    end
    inherited btbtnExcluir: TcxButton
      Left = 233
      ExplicitLeft = 233
    end
    inherited btbtnCancelar: TcxButton
      Left = 312
      ExplicitLeft = 312
    end
    inherited btbtnSalvar: TcxButton
      Left = 387
      ExplicitLeft = 387
    end
    inherited btbtnLista: TcxButton
      Left = 466
      ExplicitLeft = 466
    end
    inherited btbtnFechar: TcxButton
      Left = 760
      ExplicitLeft = 756
    end
    inherited btbtnSelecionar: TcxButton
      Left = 636
      ExplicitLeft = 632
    end
    object btnImportar: TcxButton
      Tag = 1
      Left = 4
      Top = 0
      Width = 75
      Height = 35
      Hint = 'Importar Tributa'#231#245'es IBPT'
      Align = alLeft
      Caption = 'Importar'
      OptionsImage.ImageIndex = 28
      OptionsImage.Images = DMRecursos.ImgBotoes16x16
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnClick = btnImportarClick
    end
  end
  inherited ImgList: TImageList
    Left = 168
    Top = 128
  end
  object dtsNivelIBPT: TDataSource
    Left = 676
    Top = 113
  end
  object dtsTabelaIBPT: TDataSource
    Left = 676
    Top = 145
  end
  object imgGrid: TImageList
    DrawingStyle = dsTransparent
    Left = 203
    Top = 128
    Bitmap = {
      494C010102000800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      000000000000000000000000000000000000F1F1F1FFDFDFDFFFDBDBDBFFDADA
      DAFFDCDCDCFFDEDEDEFFDDDDDDFFDFDFDFFFE0E0E0FFDEDEDEFFDFDFDFFFDEDE
      DEFFF2F2F2FFFFFFFFFFFDFDFDFFFFFFFFFFF1F1F1FFDCDCDCFFE2E2E2FFDFDF
      DFFFDEDEDEFFE1E1E1FFDEDEDEFFE2E2E2FFDDDDDDFFE0E0E0FFDFDFDFFFE0E0
      E0FFF2F2F2FFFFFFFFFFFEFEFEFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000121212FF000000FF030303FF0000
      00FF020202FF020202FF000000FF010101FF000000FF020202FF010101FF0101
      01FF282828FFFAFAFAFFFFFFFFFFFFFFFFFF121212FF000000FF000000FF0404
      04FF000000FF000000FF000000FF000000FF010101FF010101FF000000FF0000
      00FF2D2D2DFFFFFFFFFFFEFEFEFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000010101FF363636FF888888FF8888
      88FF868686FF858585FF868686FF8A8A8AFF898989FF7E7E7EFF828282FF2828
      28FF121212FFFFFFFFFFFEFEFEFFFFFFFFFF020202FF383838FF888888FF8484
      84FF858585FF878787FF888888FF868686FF858585FF858585FF858585FF2A2A
      2AFF1C1C1CFFFBFBFBFFFDFDFDFFFEFEFEFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF6C6C6CFFFCFCFCFFFFFF
      FFFFFEFEFEFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFF5252
      52FF121212FFFFFFFFFFFFFFFFFFFEFEFEFF000000FF686868FFFFFFFFFFFEFE
      FEFFFFFFFFFFFCFCFCFFFFFFFFFFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFF4D4D
      4DFF181818FFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF676767FFFDFDFDFFFEFE
      FEFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFEFEFEFFFEFEFEFFFCFCFCFF5050
      50FF151515FFFFFFFFFFFDFDFDFFFFFFFFFF020202FF676767FFFDFDFDFFFFFF
      FFFFFFFFFFFFFFFFFFFFE9E9E9FFF5F5F5FFFFFFFFFFFFFFFFFFFEFEFEFF5050
      50FF181818FFFAFAFAFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000020202FF686868FFFFFFFFFFFFFF
      FFFFFFFFFFFFFEFEFEFFFEFEFEFFFFFFFFFFFFFFFFFFFDFDFDFFFFFFFFFF4F4F
      4FFF131313FFFEFEFEFFFFFFFFFFFFFFFFFF000000FF6A6A6AFFFFFFFFFFFEFE
      FEFFFCFCFCFFBCBCBCFF0B0B0BFF141414FFD0D0D0FFFCFCFCFFFCFCFCFF4D4D
      4DFF1E1E1EFFFFFFFFFFFDFDFDFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF686868FFFFFFFFFFFDFD
      FDFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFEFEFEFFFEFEFEFFFFFFFFFF5555
      55FF151515FFFFFFFFFFFEFEFEFFFEFEFEFF000000FF6B6B6BFFFBFBFBFFFFFF
      FFFFBCBCBCFF0A0A0AFF000000FF000000FF141414FFD1D1D1FFFFFFFFFF6363
      63FF151515FFFFFFFFFFFBFBFBFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF686868FFFFFFFFFFFEFE
      FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFCFCFCFF4D4D
      4DFF1B1B1BFFFCFCFCFFFFFFFFFFFFFFFFFF000000FF686868FFFFFFFFFFBDBD
      BDFF080808FF000000FF090909FF040404FF010101FF131313FFCFCFCFFFF3F3
      F3FF595959FFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF6A6A6AFFFEFEFEFFFFFF
      FFFFFEFEFEFFFFFFFFFFFEFEFEFFFFFFFFFFFEFEFEFFFFFFFFFFFDFDFDFF5151
      51FF1B1B1BFFFFFFFFFFFEFEFEFFFEFEFEFF000000FF696969FFFDFDFDFF3333
      33FF000000FF0A0A0AFFBBBBBBFFA2A2A2FF010101FF030303FF141414FFD2D2
      D2FFFAFAFAFFFDFDFDFFFFFFFFFFFEFEFEFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF656565FFFFFFFFFFFEFE
      FEFFFDFDFDFFFFFFFFFFFDFDFDFFFCFCFCFFFFFFFFFFFFFFFFFFFEFEFEFF4C4C
      4CFF1E1E1EFFFDFDFDFFFDFDFDFFFFFFFFFF000000FF6A6A6AFFFFFFFFFF9595
      95FF2E2E2EFFBCBCBCFFFDFDFDFFFFFFFFFFA4A4A4FF030303FF000000FF0F0F
      0FFFD0D0D0FFFFFFFFFFFDFDFDFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF6C6C6CFFFDFDFDFFFEFE
      FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFFFFFFFFFEFEFEFF4D4D
      4DFF1D1D1DFFFEFEFEFFFFFFFFFFFCFCFCFF000000FF666666FFFEFEFEFFFFFF
      FFFFFFFFFFFFFFFFFFFFFDFDFDFFFEFEFEFFFBFBFBFFA4A4A4FF070707FF0000
      00FF141414FFD3D3D3FFFCFCFCFFFEFEFEFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF666666FFFEFEFEFFFFFF
      FFFFFBFBFBFFFFFFFFFFFEFEFEFFFDFDFDFFFFFFFFFFFBFBFBFFFFFFFFFF4C4C
      4CFF1D1D1DFFFEFEFEFFFFFFFFFFFFFFFFFF000000FF6B6B6BFFFFFFFFFFFBFB
      FBFFFEFEFEFFFFFFFFFFFEFEFEFFFEFEFEFFFFFFFFFFFFFFFFFF9D9D9DFF0404
      04FF010101FF141414FFCECECEFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF121212FF2C2C2CFF2A2A
      2AFF303030FF303030FF313131FF303030FF2F2F2FFF353535FF353535FF1010
      10FF222222FFFFFFFFFFFEFEFEFFFFFFFFFF000000FF131313FF2B2B2BFF3333
      33FF333333FF2D2D2DFF333333FF2E2E2EFF313131FF7D7D7DFFFFFFFFFFA2A2
      A2FF080808FF020202FF121212FFD0D0D0FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005E5E5EFF3C3C3CFF363636FF3838
      38FF373737FF373737FF343434FF383838FF353535FF353535FF333333FF2F2F
      2FFF6F6F6FFFFDFDFDFFFFFFFFFFFEFEFEFF5A5A5AFF383838FF3A3A3AFF3A3A
      3AFF333333FF393939FF383838FF383838FF373737FF373737FFA9A9A9FFFFFF
      FFFF9A9A9AFF040404FF000000FF1D1D1DFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FDFDFDFFFEFEFEFFFEFEFEFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFEFEFEFFFFFF
      FFFFFFFFFFFFFFFFFFFFFCFCFCFFFFFFFFFFFFFFFFFFF9F9F9FFFFFFFFFFFFFF
      FFFFFEFEFEFFFFFFFFFFFFFFFFFFFDFDFDFFFFFFFFFFFEFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFFA2A2A2FF080808FF383838FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFAFAFAFFFFFFFFFFFFFF
      FFFFFEFEFEFFFFFFFFFFFEFEFEFFFEFEFEFFFFFFFFFFFCFCFCFFFFFFFFFFFFFF
      FFFFFDFDFDFFFFFFFFFFFFFFFFFFFDFDFDFFFDFDFDFFFFFFFFFFFFFFFFFFFDFD
      FDFFFFFFFFFFFFFFFFFFFDFDFDFFFEFEFEFFFFFFFFFFFFFFFFFFFEFEFEFFFEFE
      FEFFFFFFFFFFFDFDFDFFEEEEEEFFFAFAFAFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
end
