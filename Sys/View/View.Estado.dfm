inherited ViewEstado: TViewEstado
  Left = 388
  Top = 215
  Caption = 'Tabela de Estados (UF)'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcGuias: TPageControl
    inherited tbsTabela: TTabSheet
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      inherited dbgDados: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'EST_COD'
            Title.Caption = 'C'#243'digo '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EST_NOME'
            Title.Caption = 'Nome '
            Width = 350
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EST_SIGLA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ALIQUOTA_ICMS'
            Title.Alignment = taCenter
            Title.Caption = '% Aliq. ICMS'
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ALIQUOTA_FCP'
            Title.Caption = '% Aliq. FCP'
            Width = 85
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        inherited grpBxFiltro: TGroupBox
          inherited lbltFiltrar: TLabel
            Caption = 'Estado:'
          end
        end
      end
    end
    inherited tbsCadastro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 727
      ExplicitHeight = 329
      inherited Bevel8: TBevel
        Top = 75
        ExplicitTop = 81
      end
      inherited GrpBxDadosNominais: TGroupBox
        Height = 75
        ExplicitHeight = 75
        object lblNome: TLabel [1]
          Left = 88
          Top = 24
          Width = 31
          Height = 13
          Caption = 'Nome:'
        end
        object lblSigla: TLabel [2]
          Left = 432
          Top = 24
          Width = 33
          Height = 13
          Caption = 'SIGLA:'
        end
        object lblSiafi: TLabel [3]
          Left = 536
          Top = 24
          Width = 31
          Height = 13
          Caption = 'SIAFI:'
        end
        inherited dbCodigo: TDBEdit
          DataField = 'EST_COD'
          ReadOnly = False
        end
        object dbNome: TDBEdit
          Left = 88
          Top = 40
          Width = 337
          Height = 21
          CharCase = ecUpperCase
          DataField = 'EST_NOME'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object dbSigla: TDBEdit
          Left = 432
          Top = 40
          Width = 97
          Height = 21
          CharCase = ecUpperCase
          DataField = 'EST_SIGLA'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object dbSiafi: TDBEdit
          Left = 536
          Top = 40
          Width = 97
          Height = 21
          CharCase = ecUpperCase
          DataField = 'EST_SIAFI'
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
      object GrpBxTributacoes: TGroupBox
        Left = 0
        Top = 79
        Width = 727
        Height = 75
        Align = alTop
        Caption = 'Tributa'#231#245'es'
        TabOrder = 1
        object lblAliquotaICMS: TLabel
          Left = 16
          Top = 24
          Width = 85
          Height = 13
          Caption = '% Aliquota ICMS:'
          FocusControl = dbAliquotaICMS
        end
        object lblAliquotaFCP: TLabel
          Left = 119
          Top = 24
          Width = 79
          Height = 13
          Caption = '% Aliquota FCP:'
          FocusControl = dbAliquotaFCP
        end
        object dbAliquotaICMS: TDBEdit
          Left = 16
          Top = 40
          Width = 97
          Height = 21
          DataField = 'ALIQUOTA_ICMS'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object dbAliquotaFCP: TDBEdit
          Left = 119
          Top = 40
          Width = 97
          Height = 21
          DataField = 'ALIQUOTA_FCP'
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
  end
  inherited IbDtstTabela: TIBDataSet
    SelectSQL.Strings = ()
  end
  inherited DtSrcTabela: TDataSource
    DataSet = fdQryTabela
  end
  inherited IbUpdTabela: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  EST_COD,'
      '  EST_NOME,'
      '  EST_SIGLA,'
      '  EST_SIAFI,'
      '  ALIQUOTA_ICMS'
      'from TBESTADO '
      'where'
      '  EST_COD = :EST_COD')
    ModifySQL.Strings = (
      'update TBESTADO'
      'set'
      '  ALIQUOTA_ICMS = :ALIQUOTA_ICMS,'
      '  EST_COD = :EST_COD,'
      '  EST_NOME = :EST_NOME,'
      '  EST_SIAFI = :EST_SIAFI,'
      '  EST_SIGLA = :EST_SIGLA'
      'where'
      '  EST_COD = :OLD_EST_COD')
    InsertSQL.Strings = (
      'insert into TBESTADO'
      '  (ALIQUOTA_ICMS, EST_COD, EST_NOME, EST_SIAFI, EST_SIGLA)'
      'values'
      '  (:ALIQUOTA_ICMS, :EST_COD, :EST_NOME, :EST_SIAFI, :EST_SIGLA)')
    DeleteSQL.Strings = (
      'delete from TBESTADO'
      'where'
      '  EST_COD = :OLD_EST_COD')
  end
  inherited fdQryTabela: TFDQuery
    SQL.Strings = (
      'Select'
      '    e.Est_cod'
      '  , e.Est_nome'
      '  , e.Est_sigla'
      '  , e.Est_siafi'
      '  , e.Aliquota_icms'
      '  , e.Aliquota_fcp'
      'from TBESTADO e')
    object fdQryTabelaEST_COD: TSmallintField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'EST_COD'
      Origin = 'EST_COD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object fdQryTabelaEST_NOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'EST_NOME'
      Origin = 'EST_NOME'
      Size = 100
    end
    object fdQryTabelaEST_SIGLA: TStringField
      DisplayLabel = 'Sigla'
      FieldName = 'EST_SIGLA'
      Origin = 'EST_SIGLA'
      Size = 2
    end
    object fdQryTabelaEST_SIAFI: TIntegerField
      DisplayLabel = 'SIAFI'
      FieldName = 'EST_SIAFI'
      Origin = 'EST_SIAFI'
    end
    object fdQryTabelaALIQUOTA_ICMS: TFMTBCDField
      FieldName = 'ALIQUOTA_ICMS'
      Origin = 'ALIQUOTA_ICMS'
      Precision = 18
      Size = 2
    end
    object fdQryTabelaALIQUOTA_FCP: TFMTBCDField
      FieldName = 'ALIQUOTA_FCP'
      Origin = 'ALIQUOTA_FCP'
      Precision = 18
      Size = 2
    end
  end
  inherited fdUpdTabela: TFDUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO TBESTADO'
      '(EST_COD, EST_NOME, EST_SIGLA, EST_SIAFI, '
      '  ALIQUOTA_ICMS, ALIQUOTA_FCP)'
      
        'VALUES (:NEW_EST_COD, :NEW_EST_NOME, :NEW_EST_SIGLA, :NEW_EST_SI' +
        'AFI, '
      '  :NEW_ALIQUOTA_ICMS, :NEW_ALIQUOTA_FCP)')
    ModifySQL.Strings = (
      'UPDATE TBESTADO'
      
        'SET EST_COD = :NEW_EST_COD, EST_NOME = :NEW_EST_NOME, EST_SIGLA ' +
        '= :NEW_EST_SIGLA, '
      
        '  EST_SIAFI = :NEW_EST_SIAFI, ALIQUOTA_ICMS = :NEW_ALIQUOTA_ICMS' +
        ', '
      '  ALIQUOTA_FCP = :NEW_ALIQUOTA_FCP'
      'WHERE EST_COD = :OLD_EST_COD')
    DeleteSQL.Strings = (
      'DELETE FROM TBESTADO'
      'WHERE EST_COD = :OLD_EST_COD')
    FetchRowSQL.Strings = (
      
        'SELECT EST_COD, EST_NOME, EST_SIGLA, EST_SIAFI, ALIQUOTA_ICMS, A' +
        'LIQUOTA_FCP'
      'FROM TBESTADO'
      'WHERE EST_COD = :EST_COD')
  end
end
