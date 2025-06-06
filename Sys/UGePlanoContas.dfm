inherited frmGePlanoContas: TfrmGePlanoContas
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
            Left = 72
            Width = 279
            ExplicitLeft = 72
            ExplicitWidth = 279
          end
          inherited btnFiltrar: TcxButton
            Left = 355
            ExplicitLeft = 355
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
          Top = 117
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
  inherited IbDtstTabela: TIBDataSet
    SelectSQL.Strings = (
      'Select'
      '    p.codigo'
      '  , p.exercicio'
      '  , p.empresa'
      '  , p.grupo'
      '  , p.nivel'
      '  , p.tipo'
      '  , p.codigo_contabil'
      '  , p.codigo_resumido'
      '  , p.descricao_resumida'
      '  , p.descricao_completa'
      '  , p.situacao'
      '  , t.descricao as tipo_descricao'
      '  , coalesce(e.rzsoc,  '#39'Todas'#39') as razao'
      '  , coalesce(e.nmfant, '#39'Todas'#39') as fantasia'
      'from TBPLANO_CONTA p'
      '  left join VW_TIPO_PLANO_CONTA t on (t.codigo = p.tipo)'
      '  left join TBEMPRESA e on (e.cnpj = p.empresa)')
    GeneratorField.Field = 'CODIGO'
    GeneratorField.Generator = 'GEN_PLANO_CONTA'
    GeneratorField.ApplyEvent = gamOnNewRecord
  end
  inherited DtSrcTabela: TDataSource
    DataSet = fdQryTabela
    OnDataChange = DtSrcTabelaDataChange
  end
  inherited IbUpdTabela: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO,'
      '  EXERCICIO,'
      '  EMPRESA,'
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
      '  EMPRESA = :EMPRESA,'
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
      '   EMPRESA, EXERCICIO, GRUPO, NIVEL, SITUACAO, TIPO)'
      'values'
      
        '  (:CODIGO, :CODIGO_CONTABIL, :CODIGO_RESUMIDO, :DESCRICAO_COMPL' +
        'ETA, :DESCRICAO_RESUMIDA, '
      '   :EMPRESA, :EXERCICIO, :GRUPO, :NIVEL, :SITUACAO, :TIPO)')
    DeleteSQL.Strings = (
      'delete from TBPLANO_CONTA'
      'where'
      '  CODIGO = :OLD_CODIGO')
  end
  inherited ImgList: TImageList
    Left = 24
    Top = 296
  end
  inherited fdQryTabela: TFDQuery
    BeforePost = fdQryTabelaBeforePost
    OnCalcFields = fdQryTabelaCalcFields
    UpdateOptions.AssignedValues = [uvFetchGeneratorsPoint, uvGeneratorName]
    UpdateOptions.FetchGeneratorsPoint = gpImmediate
    UpdateOptions.GeneratorName = 'GEN_PLANO_CONTA'
    UpdateOptions.KeyFields = 'CODIGO'
    UpdateOptions.AutoIncFields = 'CODIGO'
    SQL.Strings = (
      'Select'
      '    p.codigo'
      '  , p.exercicio'
      '  , p.empresa'
      '  , p.grupo'
      '  , p.nivel'
      '  , p.tipo'
      '  , p.codigo_contabil'
      '  , p.codigo_resumido'
      '  , p.descricao_resumida'
      '  , p.descricao_completa'
      '  , p.situacao'
      '  , t.descricao as tipo_descricao'
      '  , coalesce(e.rzsoc,  '#39'Todas'#39') as razao'
      '  , coalesce(e.nmfant, '#39'Todas'#39') as fantasia'
      'from TBPLANO_CONTA p'
      '  left join VW_TIPO_PLANO_CONTA t on (t.codigo = p.tipo)'
      '  left join TBEMPRESA e on (e.cnpj = p.empresa)')
    object fdQryTabelaCODIGO: TIntegerField
      AutoGenerateValue = arAutoInc
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object fdQryTabelaEXERCICIO: TSmallintField
      DisplayLabel = 'Exerc'#237'cio'
      FieldName = 'EXERCICIO'
      Origin = 'EXERCICIO'
    end
    object fdQryTabelaEMPRESA: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      Origin = 'EMPRESA'
      Size = 18
    end
    object fdQryTabelaGRUPO: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO'
      Origin = 'GRUPO'
    end
    object fdQryTabelaNIVEL: TSmallintField
      DisplayLabel = 'N'#237'vel'
      FieldName = 'NIVEL'
      Origin = 'NIVEL'
      Required = True
    end
    object fdQryTabelaTIPO: TSmallintField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Required = True
    end
    object fdQryTabelaCODIGO_CONTABIL: TStringField
      DisplayLabel = 'C'#243'digo Cont'#225'bil'
      FieldName = 'CODIGO_CONTABIL'
      Origin = 'CODIGO_CONTABIL'
      Size = 30
    end
    object fdQryTabelaCODIGO_RESUMIDO: TStringField
      DisplayLabel = 'C'#243'digo Resumido'
      FieldName = 'CODIGO_RESUMIDO'
      Origin = 'CODIGO_RESUMIDO'
      Size = 10
    end
    object fdQryTabelaDESCRICAO_RESUMIDA: TStringField
      DisplayLabel = 'Descri'#231#227'o resumida'
      FieldName = 'DESCRICAO_RESUMIDA'
      Origin = 'DESCRICAO_RESUMIDA'
      Required = True
      Size = 100
    end
    object fdQryTabelaDESCRICAO_COMPLETA: TStringField
      DisplayLabel = 'Descri'#231#227'o completa'
      FieldName = 'DESCRICAO_COMPLETA'
      Origin = 'DESCRICAO_COMPLETA'
      Required = True
      Size = 250
    end
    object fdQryTabelaSITUACAO: TSmallintField
      Alignment = taLeftJustify
      DisplayLabel = 'Ativo'
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      Required = True
    end
    object fdQryTabelaTIPO_DESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TIPO_DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      FixedChar = True
      Size = 22
    end
    object fdQryTabelaRAZAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'RAZAO'
      Origin = 'RAZAO'
      ProviderFlags = []
      Size = 60
    end
    object fdQryTabelaFANTASIA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'FANTASIA'
      Origin = 'FANTASIA'
      ProviderFlags = []
      Size = 25
    end
    object fdQryTabelaAtivo: TStringField
      Alignment = taCenter
      DisplayLabel = 'Ativo?'
      FieldKind = fkInternalCalc
      FieldName = 'Ativo'
      Size = 1
    end
  end
  inherited fdUpdTabela: TFDUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO TBPLANO_CONTA'
      '(CODIGO, EXERCICIO, EMPRESA, GRUPO, NIVEL, '
      '  TIPO, CODIGO_CONTABIL, CODIGO_RESUMIDO, DESCRICAO_RESUMIDA, '
      '  DESCRICAO_COMPLETA, SITUACAO)'
      
        'VALUES (:NEW_CODIGO, :NEW_EXERCICIO, :NEW_EMPRESA, :NEW_GRUPO, :' +
        'NEW_NIVEL, '
      
        '  :NEW_TIPO, :NEW_CODIGO_CONTABIL, :NEW_CODIGO_RESUMIDO, :NEW_DE' +
        'SCRICAO_RESUMIDA, '
      '  :NEW_DESCRICAO_COMPLETA, :NEW_SITUACAO)'
      'RETURNING CODIGO')
    ModifySQL.Strings = (
      'UPDATE TBPLANO_CONTA'
      
        'SET CODIGO = :NEW_CODIGO, EXERCICIO = :NEW_EXERCICIO, EMPRESA = ' +
        ':NEW_EMPRESA, '
      '  GRUPO = :NEW_GRUPO, NIVEL = :NEW_NIVEL, TIPO = :NEW_TIPO, '
      
        '  CODIGO_CONTABIL = :NEW_CODIGO_CONTABIL, CODIGO_RESUMIDO = :NEW' +
        '_CODIGO_RESUMIDO, '
      
        '  DESCRICAO_RESUMIDA = :NEW_DESCRICAO_RESUMIDA, DESCRICAO_COMPLE' +
        'TA = :NEW_DESCRICAO_COMPLETA, '
      '  SITUACAO = :NEW_SITUACAO'
      'WHERE CODIGO = :OLD_CODIGO'
      'RETURNING CODIGO')
    DeleteSQL.Strings = (
      'DELETE FROM TBPLANO_CONTA'
      'WHERE CODIGO = :OLD_CODIGO')
    FetchRowSQL.Strings = (
      'Select'
      '    p.codigo'
      '  , p.exercicio'
      '  , p.empresa'
      '  , p.grupo'
      '  , p.nivel'
      '  , p.tipo'
      '  , p.codigo_contabil'
      '  , p.codigo_resumido'
      '  , p.descricao_resumida'
      '  , p.descricao_completa'
      '  , p.situacao'
      '  , t.descricao as tipo_descricao'
      '  , coalesce(e.rzsoc,  '#39'Todas'#39') as razao'
      '  , coalesce(e.nmfant, '#39'Todas'#39') as fantasia'
      'from TBPLANO_CONTA p'
      '  left join VW_TIPO_PLANO_CONTA t on (t.codigo = p.tipo)'
      '  left join TBEMPRESA e on (e.cnpj = p.empresa)'
      'WHERE p.CODIGO = :CODIGO')
  end
  object dtsGrupo: TDataSource
    DataSet = fdQryGrupo
    Left = 696
    Top = 288
  end
  object dtsTipo: TDataSource
    DataSet = fdQryTipo
    Left = 224
    Top = 280
  end
  object dtsNivel: TDataSource
    DataSet = fdQryNivel
    Left = 552
    Top = 288
  end
  object fdQryEmpresa: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    null as cnpj'
      '  , 0 as codigo'
      '  , '#39'(Todas)'#39' as razao'
      '  , '#39'(Todas)'#39' as fantasia'
      'from RDB$DATABASE'
      ''
      'union'
      ''
      'Select'
      '    e.cnpj'
      '  , e.codigo'
      '  , e.razao'
      '  , e.fantasia'
      'from VW_EMPRESA e'
      ''
      'order by'
      '    3')
    Left = 328
    Top = 280
  end
  object dtsEmpresa: TDataSource
    DataSet = fdQryEmpresa
    Left = 392
    Top = 280
  end
  object fdQryTipo: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    t.codigo'
      '  , t.descricao'
      'from VW_TIPO_PLANO_CONTA t')
    Left = 168
    Top = 280
  end
  object fdQryNivel: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    n.codigo'
      '  , n.descricao'
      'from VW_NIVEL_PLANO_CONTA n')
    Left = 504
    Top = 288
  end
  object fdQryGrupo: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    p.codigo'
      '  , p.descricao_resumida'
      '  , p.codigo_contabil'
      
        '  , coalesce(nullif(trim(p.codigo_contabil), '#39#39') || '#39' - '#39', '#39#39') |' +
        '| p.descricao_resumida as descricao_resumida_geral'
      '  , p.nivel'
      '  , p.empresa'
      'from TBPLANO_CONTA p'
      ''
      'order by'
      '    4')
    Left = 640
    Top = 288
  end
end
