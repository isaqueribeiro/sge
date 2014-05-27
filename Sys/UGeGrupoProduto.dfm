inherited frmGeGrupoProduto: TfrmGeGrupoProduto
  Left = 548
  Top = 271
  Caption = 'Tabela de Grupos de Produtos'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcGuias: TPageControl
    inherited tbsTabela: TTabSheet
      inherited dbgDados: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'COD'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRI'
            Width = 350
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        inherited grpBxFiltro: TGroupBox
          inherited lbltFiltrar: TLabel
            Width = 37
            Caption = 'Grupo:'
          end
          inherited edtFiltrar: TEdit
            Left = 48
            Width = 155
          end
        end
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
          Width = 50
          Height = 13
          Caption = 'Descri'#231#227'o:'
        end
        inherited dbCodigo: TDBEdit
          Color = clMoneyGreen
          DataField = 'COD'
        end
        object dbNome: TDBEdit
          Left = 88
          Top = 40
          Width = 337
          Height = 21
          CharCase = ecUpperCase
          DataField = 'DESCRI'
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
      '    g.Cod'
      '  , g.Descri'
      'from TBGRUPOPROD g')
    GeneratorField.Field = 'COD'
    GeneratorField.Generator = 'GEN_GRUPOPRODUTO_COD'
    object IbDtstTabelaCOD: TSmallintField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD'
      Origin = 'TBGRUPOPROD.COD'
      Required = True
    end
    object IbDtstTabelaDESCRI: TIBStringField
      DisplayLabel = 'Descri'#231#227'o:'
      FieldName = 'DESCRI'
      Origin = 'TBGRUPOPROD.DESCRI'
      Size = 30
    end
  end
  inherited IbUpdTabela: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  COD,'
      '  DESCRI'
      'from TBGRUPOPROD '
      'where'
      '  COD = :COD')
    ModifySQL.Strings = (
      'update TBGRUPOPROD'
      'set'
      '  COD = :COD,'
      '  DESCRI = :DESCRI'
      'where'
      '  COD = :OLD_COD')
    InsertSQL.Strings = (
      'insert into TBGRUPOPROD'
      '  (COD, DESCRI)'
      'values'
      '  (:COD, :DESCRI)')
    DeleteSQL.Strings = (
      'delete from TBGRUPOPROD'
      'where'
      '  COD = :OLD_COD')
  end
end
