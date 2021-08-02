inherited ViewPlanoConta: TViewPlanoConta
  Left = 427
  Top = 240
  ActiveControl = nil
  Caption = 'Tabela de Planos de Contas'
  ClientHeight = 482
  ClientWidth = 796
  OldCreateOrder = True
  ExplicitWidth = 812
  ExplicitHeight = 521
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 478
    Width = 796
    ExplicitTop = 479
    ExplicitWidth = 796
  end
  inherited Bevel3: TBevel
    Top = 439
    Width = 796
    ExplicitTop = 440
    ExplicitWidth = 796
  end
  inherited pgcGuias: TPageControl
    Width = 796
    Height = 439
    ActivePage = tbsCadastro
    ExplicitWidth = 796
    ExplicitHeight = 439
    inherited tbsTabela: TTabSheet
      ExplicitWidth = 788
      ExplicitHeight = 410
      inherited Bevel4: TBevel
        Top = 344
        Width = 788
        ExplicitTop = 345
        ExplicitWidth = 788
      end
      inherited dbgDados: TDBGrid
        Width = 788
        Height = 344
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
            FieldName = 'CODIGO_CONTABIL'
            Title.Caption = 'C'#243'digo Cont'#225'bil '
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO_RESUMIDA'
            Title.Caption = 'Descri'#231#227'o resumida '
            Width = 400
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO_DESCRICAO'
            Title.Caption = 'Tipo '
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RAZAO'
            Title.Caption = 'Empresa '
            Width = 320
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EXERCICIO'
            Title.Caption = 'Exerc'#237'cio '
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Ativo'
            Title.Alignment = taCenter
            Title.Caption = 'Ativo? '
            Width = 45
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        Top = 348
        Width = 788
        ExplicitTop = 348
        ExplicitWidth = 788
        object lblRegistroDesativado: TLabel [0]
          Left = 2
          Top = 44
          Width = 166
          Height = 13
          Caption = '* Plano de Contas desativado'
          Font.Charset = ANSI_CHARSET
          Font.Color = 7303023
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        inherited grpBxFiltro: TGroupBox
          Left = 384
          Width = 400
          Caption = 'Pesquisar '
          ExplicitLeft = 384
          ExplicitWidth = 400
          inherited lbltFiltrar: TLabel
            Width = 58
            Caption = 'Descri'#231#227'o:'
            ExplicitWidth = 58
          end
          inherited edtFiltrar: TEdit
            Left = 81
            Width = 272
            ExplicitLeft = 81
            ExplicitWidth = 272
            ExplicitHeight = 23
          end
          inherited btnFiltrar: TcxButton
            Left = 359
            ExplicitLeft = 359
          end
          object chkPlanoContaAtivo: TCheckBox
            Left = 68
            Top = -1
            Width = 213
            Height = 17
            TabStop = False
            Caption = '&0 - Apenas planos de contas ativos'
            TabOrder = 2
          end
        end
      end
    end
    inherited tbsCadastro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 788
      ExplicitHeight = 410
      inherited Bevel8: TBevel
        Top = 219
        Width = 788
        ExplicitTop = 225
        ExplicitWidth = 788
      end
      inherited GrpBxDadosNominais: TGroupBox
        Width = 788
        Height = 219
        ExplicitWidth = 788
        ExplicitHeight = 219
        object lblDescricaoResumida: TLabel [1]
          Left = 288
          Top = 64
          Width = 99
          Height = 13
          Caption = 'Descri'#231#227'o Resumida:'
        end
        object lblGrupo: TLabel [2]
          Left = 288
          Top = 104
          Width = 33
          Height = 13
          Caption = 'Grupo:'
          FocusControl = dbGrupo
        end
        object lblExercicio: TLabel [3]
          Left = 288
          Top = 24
          Width = 46
          Height = 13
          Caption = 'Exerc'#237'cio:'
          Enabled = False
          FocusControl = dbExercicio
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblCodigoContabil: TLabel [4]
          Left = 16
          Top = 64
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
        object lblCodigoResumido: TLabel [5]
          Left = 182
          Top = 64
          Width = 86
          Height = 13
          Caption = 'C'#243'digo Resumido:'
          FocusControl = dbCodigoResumido
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblDescricaoCompleta: TLabel [6]
          Left = 16
          Top = 144
          Width = 98
          Height = 13
          Caption = 'Descri'#231#227'o Completa:'
        end
        object lblTipo: TLabel [7]
          Left = 16
          Top = 104
          Width = 24
          Height = 13
          Caption = 'Tipo:'
          FocusControl = dbTipo
        end
        object lblNivel: TLabel [8]
          Left = 88
          Top = 24
          Width = 105
          Height = 13
          Caption = 'N'#237'vel de agrupamento'
          FocusControl = dbNivel
        end
        object lblEmpresa: TLabel [9]
          Left = 359
          Top = 24
          Width = 45
          Height = 13
          Caption = 'Empresa:'
          FocusControl = dbEmpresa
        end
        inherited dbCodigo: TDBEdit
          TabStop = False
          Color = clMoneyGreen
          DataField = 'CODIGO'
        end
        object dbDescricaoResumida: TDBEdit
          Left = 288
          Top = 80
          Width = 481
          Height = 21
          CharCase = ecUpperCase
          DataField = 'DESCRICAO_RESUMIDA'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
        end
        object dbSituacao: TDBCheckBox
          Left = 16
          Top = 187
          Width = 65
          Height = 17
          Caption = 'Ativo'
          DataField = 'SITUACAO'
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
        object dbGrupo: TDBLookupComboBox
          Left = 288
          Top = 120
          Width = 481
          Height = 21
          Hint = 'Limpar Campo (Ctrl + L)'
          DataField = 'GRUPO'
          DataSource = DtSrcTabela
          DropDownRows = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'CODIGO'
          ListField = 'DESCRICAO_RESUMIDA_GERAL'
          ListSource = dtsGrupo
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 8
        end
        object dbExercicio: TDBEdit
          Left = 288
          Top = 40
          Width = 65
          Height = 21
          DataField = 'EXERCICIO'
          DataSource = DtSrcTabela
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object dbCodigoContabil: TDBEdit
          Left = 16
          Top = 80
          Width = 160
          Height = 21
          DataField = 'CODIGO_CONTABIL'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
        object dbCodigoResumido: TDBEdit
          Left = 182
          Top = 80
          Width = 100
          Height = 21
          DataField = 'CODIGO_RESUMIDO'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
        object dbDescricaoCompleta: TDBEdit
          Left = 16
          Top = 160
          Width = 753
          Height = 21
          CharCase = ecUpperCase
          DataField = 'DESCRICAO_COMPLETA'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
        end
        object dbTipo: TDBLookupComboBox
          Left = 17
          Top = 120
          Width = 265
          Height = 21
          Hint = 'Limpar Campo (Ctrl + L)'
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
          ListSource = dtsTipo
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 7
        end
        object dbNivel: TDBLookupComboBox
          Left = 88
          Top = 40
          Width = 193
          Height = 21
          Hint = 'Limpar Campo (Ctrl + L)'
          DataField = 'NIVEL'
          DataSource = DtSrcTabela
          DropDownRows = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'CODIGO'
          ListField = 'DESCRICAO'
          ListSource = dtsNivel
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
        end
        object dbEmpresa: TDBLookupComboBox
          Left = 359
          Top = 40
          Width = 410
          Height = 21
          Hint = 'Limpar Campo (Ctrl + L)'
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
          TabOrder = 3
        end
      end
    end
  end
  inherited tlbBotoes: TPanel
    Top = 443
    Width = 796
    ExplicitTop = 443
    ExplicitWidth = 796
    inherited bvlTool3: TBevel
      Left = 713
      ExplicitLeft = 713
    end
    inherited bvlTool4: TBevel
      Left = 792
      ExplicitLeft = 792
    end
    inherited btbtnFechar: TcxButton
      Left = 717
      ExplicitLeft = 717
    end
    inherited btbtnSelecionar: TcxButton
      Left = 593
      ExplicitLeft = 593
    end
  end
  inherited DtSrcTabela: TDataSource
    OnDataChange = DtSrcTabelaDataChange
    Left = 472
  end
  inherited ImgList: TImageList
    Left = 408
  end
  object dtsGrupo: TDataSource
    Left = 680
    Top = 8
  end
  object dtsTipo: TDataSource
    Left = 528
    Top = 8
  end
  object dtsNivel: TDataSource
    Left = 632
    Top = 8
  end
  object dtsEmpresa: TDataSource
    Left = 576
    Top = 8
  end
end
