inherited frmGePlanoContas: TfrmGePlanoContas
  Left = 427
  Top = 240
  Width = 812
  Height = 521
  ActiveControl = nil
  Caption = 'Tabela de Planos de Contas'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 479
    Width = 796
  end
  inherited Bevel3: TBevel
    Top = 440
    Width = 796
  end
  inherited pgcGuias: TPageControl
    Width = 796
    Height = 440
    inherited tbsTabela: TTabSheet
      inherited Bevel4: TBevel
        Top = 345
        Width = 788
      end
      inherited dbgDados: TDBGrid
        Width = 788
        Height = 345
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO_RESUMIDA'
            Width = 400
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO_DESCRICAO'
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EXERCICIO'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Ativo'
            Title.Alignment = taCenter
            Width = 45
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        Top = 349
        Width = 788
        inherited grpBxFiltro: TGroupBox
          Left = 384
          Width = 400
          inherited lbltFiltrar: TLabel
            Width = 58
            Caption = 'Descri'#231#227'o:'
          end
          inherited edtFiltrar: TEdit
            Left = 72
            Width = 279
          end
          inherited btnFiltrar: TcxButton
            Left = 355
          end
        end
      end
    end
    inherited tbsCadastro: TTabSheet
      inherited Bevel8: TBevel
        Top = 225
        Width = 788
      end
      inherited GrpBxDadosNominais: TGroupBox
        Width = 788
        Height = 225
        object lblDescricaoResumida: TLabel [1]
          Left = 16
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
          Left = 360
          Top = 24
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
          Left = 496
          Top = 24
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
        inherited dbCodigo: TDBEdit
          TabStop = False
          Color = clMoneyGreen
          DataField = 'CODIGO'
        end
        object dbDescricaoResumida: TDBEdit
          Left = 16
          Top = 80
          Width = 753
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
          TabOrder = 5
        end
        object dbSituacao: TDBCheckBox
          Left = 16
          Top = 192
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
          TabOrder = 9
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
          TabOrder = 7
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
          Left = 360
          Top = 40
          Width = 129
          Height = 21
          DataField = 'CODIGO_CONTABIL'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object dbCodigoResumido: TDBEdit
          Left = 496
          Top = 40
          Width = 129
          Height = 21
          DataField = 'CODIGO_RESUMIDO'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
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
          TabOrder = 8
        end
        object dbTipo: TDBLookupComboBox
          Left = 16
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
          TabOrder = 6
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
      end
    end
  end
  inherited tlbBotoes: TPanel
    Top = 444
    Width = 796
    inherited bvlTool3: TBevel
      Left = 713
    end
    inherited bvlTool4: TBevel
      Left = 792
    end
    inherited btbtnFechar: TcxButton
      Left = 717
    end
    inherited btbtnSelecionar: TcxButton
      Left = 593
    end
  end
  inherited IbDtstTabela: TIBDataSet
    OnCalcFields = IbDtstTabelaCalcFields
    OnNewRecord = IbDtstTabelaNewRecord
    SelectSQL.Strings = (
      'Select'
      '    p.codigo'
      '  , p.exercicio'
      '  , p.grupo'
      '  , p.nivel'
      '  , p.tipo'
      '  , p.codigo_contabil'
      '  , p.codigo_resumido'
      '  , p.descricao_resumida'
      '  , p.descricao_completa'
      '  , p.situacao'
      '  , t.descricao as tipo_descricao'
      'from TBPLANO_CONTA p'
      '  left join VW_TIPO_PLANO_CONTA t on (t.codigo = p.tipo)')
    GeneratorField.Field = 'CODIGO'
    GeneratorField.Generator = 'GEN_PLANO_CONTA'
    GeneratorField.ApplyEvent = gamOnNewRecord
    Left = 56
    Top = 376
    object IbDtstTabelaCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Origin = '"TBPLANO_CONTA"."CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '0000'
    end
    object IbDtstTabelaEXERCICIO: TSmallintField
      DisplayLabel = 'Exerc'#237'cio'
      FieldName = 'EXERCICIO'
      Origin = '"TBPLANO_CONTA"."EXERCICIO"'
      ProviderFlags = [pfInUpdate]
      ReadOnly = True
    end
    object IbDtstTabelaGRUPO: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO'
      Origin = '"TBPLANO_CONTA"."GRUPO"'
      ProviderFlags = [pfInUpdate]
    end
    object IbDtstTabelaNIVEL: TSmallintField
      DisplayLabel = 'N'#237'vel'
      FieldName = 'NIVEL'
      Origin = '"TBPLANO_CONTA"."NIVEL"'
      ProviderFlags = [pfInUpdate]
      ReadOnly = True
    end
    object IbDtstTabelaTIPO: TSmallintField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Origin = '"TBPLANO_CONTA"."TIPO"'
      ProviderFlags = [pfInUpdate]
      ReadOnly = True
    end
    object IbDtstTabelaCODIGO_CONTABIL: TIBStringField
      DisplayLabel = 'C'#243'digo Cont'#225'bil'
      FieldName = 'CODIGO_CONTABIL'
      Origin = '"TBPLANO_CONTA"."CODIGO_CONTABIL"'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object IbDtstTabelaCODIGO_RESUMIDO: TIBStringField
      DisplayLabel = 'C'#243'digo Resumido'
      FieldName = 'CODIGO_RESUMIDO'
      Origin = '"TBPLANO_CONTA"."CODIGO_RESUMIDO"'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object IbDtstTabelaDESCRICAO_RESUMIDA: TIBStringField
      DisplayLabel = 'Descri'#231#227'o resumida'
      FieldName = 'DESCRICAO_RESUMIDA'
      Origin = '"TBPLANO_CONTA"."DESCRICAO_RESUMIDA"'
      ProviderFlags = [pfInUpdate]
      ReadOnly = True
      Size = 100
    end
    object IbDtstTabelaDESCRICAO_COMPLETA: TIBStringField
      DisplayLabel = 'Descri'#231#227'o completa'
      FieldName = 'DESCRICAO_COMPLETA'
      Origin = '"TBPLANO_CONTA"."DESCRICAO_COMPLETA"'
      ProviderFlags = [pfInUpdate]
      Size = 250
    end
    object IbDtstTabelaSITUACAO: TSmallintField
      Alignment = taLeftJustify
      DisplayLabel = 'Ativo'
      FieldName = 'SITUACAO'
      Origin = '"TBPLANO_CONTA"."SITUACAO"'
      ProviderFlags = [pfInUpdate]
    end
    object IbDtstTabelaTIPO_DESCRICAO: TIBStringField
      DisplayLabel = 'Tipo'
      FieldKind = fkInternalCalc
      FieldName = 'TIPO_DESCRICAO'
      Origin = '"VW_TIPO_PLANO_CONTA"."DESCRICAO"'
      ProviderFlags = []
      FixedChar = True
      Size = 10
    end
    object IbDtstTabelaAtivo: TStringField
      Alignment = taCenter
      DisplayLabel = 'Ativo?'
      FieldKind = fkCalculated
      FieldName = 'Ativo'
      ProviderFlags = []
      Size = 1
      Calculated = True
    end
  end
  inherited DtSrcTabela: TDataSource
    OnDataChange = DtSrcTabelaDataChange
    Left = 120
    Top = 376
  end
  inherited IbUpdTabela: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO,'
      '  EXERCICIO,'
      '  GRUPO,'
      '  NIVEL,'
      '  TIPO,'
      '  CODIGO_CONTABIL,'
      '  CODIGO_RESUMIDO,'
      '  DESCRICAO_RESUMIDA,'
      '  DESCRICAO_COMPLETA,'
      '  SITUACAO'
      'from TBPLANO_CONTA '
      'where'
      '  CODIGO = :CODIGO')
    ModifySQL.Strings = (
      'update TBPLANO_CONTA'
      'set'
      '  CODIGO = :CODIGO,'
      '  CODIGO_CONTABIL = :CODIGO_CONTABIL,'
      '  CODIGO_RESUMIDO = :CODIGO_RESUMIDO,'
      '  DESCRICAO_COMPLETA = :DESCRICAO_COMPLETA,'
      '  DESCRICAO_RESUMIDA = :DESCRICAO_RESUMIDA,'
      '  EXERCICIO = :EXERCICIO,'
      '  GRUPO = :GRUPO,'
      '  NIVEL = :NIVEL,'
      '  SITUACAO = :SITUACAO,'
      '  TIPO = :TIPO'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into TBPLANO_CONTA'
      
        '  (CODIGO, CODIGO_CONTABIL, CODIGO_RESUMIDO, DESCRICAO_COMPLETA,' +
        ' DESCRICAO_RESUMIDA, '
      '   EXERCICIO, GRUPO, NIVEL, SITUACAO, TIPO)'
      'values'
      
        '  (:CODIGO, :CODIGO_CONTABIL, :CODIGO_RESUMIDO, :DESCRICAO_COMPL' +
        'ETA, :DESCRICAO_RESUMIDA, '
      '   :EXERCICIO, :GRUPO, :NIVEL, :SITUACAO, :TIPO)')
    DeleteSQL.Strings = (
      'delete from TBPLANO_CONTA'
      'where'
      '  CODIGO = :OLD_CODIGO')
    Left = 88
    Top = 376
  end
  inherited ImgList: TImageList
    Left = 24
    Top = 376
  end
  object dtsGrupo: TDataSource
    DataSet = qryGrupo
    Left = 344
    Top = 304
  end
  object qryGrupo: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    SQL.Strings = (
      'Select'
      '    p.codigo'
      '  , p.descricao_resumida'
      '  , p.codigo_contabil'
      
        '  , coalesce(nullif(trim(p.codigo_contabil), '#39#39') || '#39' - '#39', '#39#39') |' +
        '| p.descricao_resumida as descricao_resumida_geral'
      '  , p.nivel'
      'from TBPLANO_CONTA p'
      ''
      'order by'
      '    4')
    Left = 312
    Top = 304
  end
  object qryTipo: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    SQL.Strings = (
      'Select'
      '    t.codigo'
      '  , t.descricao'
      'from VW_TIPO_PLANO_CONTA t')
    Left = 312
    Top = 240
  end
  object dtsTipo: TDataSource
    DataSet = qryTipo
    Left = 344
    Top = 240
  end
  object qryNivel: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    SQL.Strings = (
      'Select'
      '    n.codigo'
      '  , n.descricao'
      'from VW_NIVEL_PLANO_CONTA n')
    Left = 312
    Top = 272
  end
  object dtsNivel: TDataSource
    DataSet = qryNivel
    Left = 344
    Top = 272
  end
end
