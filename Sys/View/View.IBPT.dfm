inherited ViewIBPT: TViewIBPT
  Left = 393
  Top = 212
  Caption = 'Tabela de Tributa'#231#245'es IBPT'
  ClientHeight = 472
  ClientWidth = 809
  OldCreateOrder = True
  ExplicitWidth = 825
  ExplicitHeight = 511
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 468
    Width = 809
    ExplicitTop = 436
    ExplicitWidth = 743
  end
  inherited Bevel3: TBevel
    Top = 429
    Width = 809
    ExplicitTop = 397
    ExplicitWidth = 743
  end
  inherited pgcGuias: TPageControl
    Width = 809
    Height = 429
    ExplicitWidth = 809
    ExplicitHeight = 429
    inherited tbsTabela: TTabSheet
      ExplicitWidth = 801
      ExplicitHeight = 400
      inherited Bevel4: TBevel
        Top = 334
        Width = 801
        ExplicitTop = 302
        ExplicitWidth = 735
      end
      inherited dbgDados: TDBGrid
        Width = 801
        Height = 334
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
            Width = 350
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ALIQNACIONAL_IBPT'
            Title.Caption = 'Nacional '
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ALIQINTERNACIONAL_IBPT'
            Title.Caption = 'Tax. Int. '
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'ALIQESTADUAL_IBPT'
            Title.Caption = 'Estadual '
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ALIQMUNICIPAL_IBPT'
            Title.Caption = 'Municipal '
            Width = 60
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        Top = 338
        Width = 801
        ExplicitTop = 338
        ExplicitWidth = 801
        object lblNCMDesativado: TLabel [0]
          Left = 0
          Top = 6
          Width = 117
          Height = 13
          Caption = 'C'#243'digos Desativados'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        inherited grpBxFiltro: TGroupBox
          Left = 462
          Width = 335
          ExplicitLeft = 462
          ExplicitWidth = 335
          inherited lbltFiltrar: TLabel
            Left = 14
            Width = 58
            Caption = 'Descri'#231#227'o:'
            ExplicitLeft = 14
            ExplicitWidth = 58
          end
          inherited edtFiltrar: TEdit
            Left = 78
            Width = 210
            ExplicitLeft = 78
            ExplicitTop = 20
            ExplicitWidth = 210
            ExplicitHeight = 23
          end
          inherited btnFiltrar: TcxButton
            Left = 294
            ExplicitLeft = 281
          end
        end
      end
    end
    inherited tbsCadastro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 801
      ExplicitHeight = 400
      inherited Bevel8: TBevel
        Top = 201
        Width = 801
        ExplicitTop = 161
        ExplicitWidth = 735
      end
      inherited GrpBxDadosNominais: TGroupBox
        Width = 801
        Height = 201
        ExplicitWidth = 801
        ExplicitHeight = 201
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
          Top = 64
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
          Top = 83
          Width = 773
          Height = 101
          Anchors = [akLeft, akTop, akRight]
          DataField = 'DESCRICAO_IBPT'
          DataSource = DtSrcTabela
          ScrollBars = ssVertical
          TabOrder = 5
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
          Left = 539
          Top = 42
          Width = 57
          Height = 17
          Caption = 'Ativo'
          DataField = 'ATIVO'
          DataSource = DtSrcTabela
          TabOrder = 4
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
      object GrpBxAliquotas: TGroupBox
        Left = 0
        Top = 205
        Width = 801
        Height = 76
        Align = alTop
        Caption = 
          'Percentuais de tributa'#231#245'es IBPT (Instituto Brasileiro de Planeja' +
          'mento e Tributa'#231#227'o)'
        TabOrder = 1
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
      end
    end
  end
  inherited tlbBotoes: TPanel
    Top = 433
    Width = 809
    ExplicitTop = 433
    ExplicitWidth = 809
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
      Left = 726
      ExplicitLeft = 660
    end
    inherited bvlTool4: TBevel
      Left = 805
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
      Left = 730
      ExplicitLeft = 730
    end
    inherited btbtnSelecionar: TcxButton
      Left = 606
      ExplicitLeft = 606
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
end
