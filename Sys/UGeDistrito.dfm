inherited frmGeDistrito: TfrmGeDistrito
  Left = 394
  Top = 222
  Caption = 'Tabela de Distritos'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcGuias: TPageControl
    inherited tbsTabela: TTabSheet
      inherited dbgDados: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'DIS_COD'
            Title.Caption = 'C'#243'digo '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DIS_NOME'
            Title.Caption = 'Nome '
            Width = 350
            Visible = True
          end>
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
          Width = 31
          Height = 13
          Caption = 'Nome:'
        end
        inherited dbCodigo: TDBEdit
          Color = clMoneyGreen
          DataField = 'DIS_COD'
        end
        object dbNome: TDBEdit
          Left = 88
          Top = 40
          Width = 337
          Height = 21
          CharCase = ecUpperCase
          DataField = 'DIS_NOME'
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
    SelectSQL.Strings = (
      'Select'
      '    d.Dis_cod'
      '  , d.Dis_nome'
      'from TBDISTRITO d')
    GeneratorField.Field = 'DIS_COD'
    GeneratorField.Generator = 'GEN_DISTRITO_ID'
  end
  inherited DtSrcTabela: TDataSource
    DataSet = fdQryTabela
  end
  inherited IbUpdTabela: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  DIS_COD,'
      '  DIS_NOME'
      'from TBDISTRITO '
      'where'
      '  DIS_COD = :DIS_COD')
    ModifySQL.Strings = (
      'update TBDISTRITO'
      'set'
      '  DIS_COD = :DIS_COD,'
      '  DIS_NOME = :DIS_NOME'
      'where'
      '  DIS_COD = :OLD_DIS_COD')
    InsertSQL.Strings = (
      'insert into TBDISTRITO'
      '  (DIS_COD, DIS_NOME)'
      'values'
      '  (:DIS_COD, :DIS_NOME)')
    DeleteSQL.Strings = (
      'delete from TBDISTRITO'
      'where'
      '  DIS_COD = :OLD_DIS_COD')
  end
  inherited fdQryTabela: TFDQuery
    UpdateOptions.AssignedValues = [uvFetchGeneratorsPoint, uvGeneratorName]
    UpdateOptions.FetchGeneratorsPoint = gpImmediate
    UpdateOptions.GeneratorName = 'GEN_DISTRITO_ID'
    UpdateOptions.KeyFields = 'DIS_COD'
    UpdateOptions.AutoIncFields = 'DIS_COD'
    SQL.Strings = (
      'Select'
      '    d.Dis_cod'
      '  , d.Dis_nome'
      'from TBDISTRITO d')
    object fdQryTabelaDIS_COD: TSmallintField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'DIS_COD'
      Origin = 'DIS_COD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object fdQryTabelaDIS_NOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'DIS_NOME'
      Origin = 'DIS_NOME'
      Required = True
      Size = 100
    end
  end
  inherited fdUpdTabela: TFDUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO TBDISTRITO'
      '(DIS_COD, DIS_NOME)'
      'VALUES (:NEW_DIS_COD, :NEW_DIS_NOME)')
    ModifySQL.Strings = (
      'UPDATE TBDISTRITO'
      'SET DIS_COD = :NEW_DIS_COD, DIS_NOME = :NEW_DIS_NOME'
      'WHERE DIS_COD = :OLD_DIS_COD')
    DeleteSQL.Strings = (
      'DELETE FROM TBDISTRITO'
      'WHERE DIS_COD = :OLD_DIS_COD')
    FetchRowSQL.Strings = (
      'SELECT DIS_COD, DIS_NOME'
      'FROM TBDISTRITO'
      'WHERE DIS_COD = :DIS_COD')
  end
end
