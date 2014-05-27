inherited frmGeDistrito: TfrmGeDistrito
  Left = 531
  Top = 273
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
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DIS_NOME'
            Width = 350
            Visible = True
          end>
      end
    end
    inherited tbsCadastro: TTabSheet
      inherited Bevel8: TBevel
        Top = 81
      end
      inherited GrpBxDadosNominais: TGroupBox
        Height = 81
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
    object IbDtstTabelaDIS_COD: TSmallintField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'DIS_COD'
      Origin = 'TBDISTRITO.DIS_COD'
      Required = True
    end
    object IbDtstTabelaDIS_NOME: TIBStringField
      DisplayLabel = 'Nome'
      FieldName = 'DIS_NOME'
      Origin = 'TBDISTRITO.DIS_NOME'
      Size = 100
    end
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
end
