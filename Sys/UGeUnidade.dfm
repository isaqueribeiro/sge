inherited frmGeUnidade: TfrmGeUnidade
  Left = 394
  Top = 212
  Caption = 'Tabela de Unidades'
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
            FieldName = 'UNP_COD'
            Title.Caption = 'C'#243'digo '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UNP_DESCRICAO'
            Title.Caption = 'Descri'#231#227'o '
            Width = 350
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'UNP_SIGLA'
            Title.Alignment = taCenter
            Title.Caption = 'Sigla '
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        inherited grpBxFiltro: TGroupBox
          inherited lbltFiltrar: TLabel
            Width = 49
            Caption = 'Unidade:'
            ExplicitWidth = 49
          end
          inherited edtFiltrar: TEdit
            Left = 64
            Width = 139
            ExplicitLeft = 64
            ExplicitWidth = 139
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
        Top = 81
        ExplicitTop = 81
      end
      inherited GrpBxDadosNominais: TGroupBox
        Height = 81
        ExplicitHeight = 81
        object lblNome: TLabel [1]
          Left = 88
          Top = 24
          Width = 50
          Height = 13
          Caption = 'Descri'#231#227'o:'
        end
        object lblSigla: TLabel [2]
          Left = 432
          Top = 24
          Width = 26
          Height = 13
          Caption = 'Sigla:'
        end
        inherited dbCodigo: TDBEdit
          Color = clMoneyGreen
          DataField = 'UNP_COD'
        end
        object dbNome: TDBEdit
          Left = 88
          Top = 40
          Width = 337
          Height = 21
          DataField = 'UNP_DESCRICAO'
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
          Width = 81
          Height = 21
          CharCase = ecUpperCase
          DataField = 'UNP_SIGLA'
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
    end
  end
  inherited IbDtstTabela: TIBDataSet
    SelectSQL.Strings = (
      'Select'
      '    u.Unp_cod'
      '  , u.Unp_descricao'
      '  , u.Unp_sigla'
      'from TBUNIDADEPROD u')
    GeneratorField.Field = 'UNP_COD'
    GeneratorField.Generator = 'GEN_UNIDADEPRODUTO_ID'
  end
  inherited DtSrcTabela: TDataSource
    DataSet = fdQryTabela
  end
  inherited IbUpdTabela: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  UNP_COD,'
      '  UNP_DESCRICAO,'
      '  UNP_SIGLA'
      'from TBUNIDADEPROD '
      'where'
      '  UNP_COD = :UNP_COD')
    ModifySQL.Strings = (
      'update TBUNIDADEPROD'
      'set'
      '  UNP_COD = :UNP_COD,'
      '  UNP_DESCRICAO = :UNP_DESCRICAO,'
      '  UNP_SIGLA = :UNP_SIGLA'
      'where'
      '  UNP_COD = :OLD_UNP_COD')
    InsertSQL.Strings = (
      'insert into TBUNIDADEPROD'
      '  (UNP_COD, UNP_DESCRICAO, UNP_SIGLA)'
      'values'
      '  (:UNP_COD, :UNP_DESCRICAO, :UNP_SIGLA)')
    DeleteSQL.Strings = (
      'delete from TBUNIDADEPROD'
      'where'
      '  UNP_COD = :OLD_UNP_COD')
  end
  inherited fdQryTabela: TFDQuery
    UpdateOptions.AssignedValues = [uvFetchGeneratorsPoint, uvGeneratorName]
    UpdateOptions.FetchGeneratorsPoint = gpImmediate
    UpdateOptions.GeneratorName = 'GEN_UNIDADEPRODUTO_ID'
    UpdateOptions.KeyFields = 'UNP_COD'
    UpdateOptions.AutoIncFields = 'UNP_COD'
    SQL.Strings = (
      'Select'
      '    u.Unp_cod'
      '  , u.Unp_descricao'
      '  , u.Unp_sigla'
      'from TBUNIDADEPROD u')
    object fdQryTabelaUNP_COD: TSmallintField
      AutoGenerateValue = arAutoInc
      DisplayLabel = 'C'#243'digo'
      FieldName = 'UNP_COD'
      Origin = 'UNP_COD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object fdQryTabelaUNP_DESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'UNP_DESCRICAO'
      Origin = 'UNP_DESCRICAO'
      Required = True
      Size = 50
    end
    object fdQryTabelaUNP_SIGLA: TStringField
      DisplayLabel = 'Sigla'
      FieldName = 'UNP_SIGLA'
      Origin = 'UNP_SIGLA'
      Size = 5
    end
  end
  inherited fdUpdTabela: TFDUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO TBUNIDADEPROD'
      '(UNP_COD, UNP_DESCRICAO, UNP_SIGLA)'
      'VALUES (:NEW_UNP_COD, :NEW_UNP_DESCRICAO, :NEW_UNP_SIGLA)'
      'RETURNING UNP_COD, UNP_SIGLA')
    ModifySQL.Strings = (
      'UPDATE TBUNIDADEPROD'
      'SET UNP_COD = :NEW_UNP_COD, UNP_DESCRICAO = :NEW_UNP_DESCRICAO, '
      '  UNP_SIGLA = :NEW_UNP_SIGLA'
      'WHERE UNP_COD = :OLD_UNP_COD'
      'RETURNING UNP_COD, UNP_SIGLA')
    DeleteSQL.Strings = (
      'DELETE FROM TBUNIDADEPROD'
      'WHERE UNP_COD = :OLD_UNP_COD')
    FetchRowSQL.Strings = (
      'SELECT UNP_COD, UNP_DESCRICAO, UNP_SIGLA'
      'FROM TBUNIDADEPROD'
      'WHERE UNP_COD = :UNP_COD')
  end
end
