inherited frmGeGrupoProduto: TfrmGeGrupoProduto
  Left = 394
  Top = 220
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
            Title.Caption = 'C'#243'digo '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRI'
            Title.Caption = 'Descri'#231#227'o '
            Width = 350
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PERC_VENDA_COMISSAO'
            Title.Caption = '% Comiss'#227'o '
            Width = 75
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        inherited grpBxFiltro: TGroupBox
          inherited lbltFiltrar: TLabel
            Width = 37
            Caption = 'Grupo:'
            ExplicitWidth = 37
          end
          inherited edtFiltrar: TEdit
            Left = 48
            Width = 155
            ExplicitLeft = 48
            ExplicitWidth = 155
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
        object lblComissao: TLabel [2]
          Left = 431
          Top = 24
          Width = 71
          Height = 13
          Caption = 'Comiss'#227'o (%):'
          FocusControl = dbComissao
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
        object dbComissao: TDBEdit
          Left = 431
          Top = 40
          Width = 81
          Height = 21
          CharCase = ecUpperCase
          DataField = 'PERC_VENDA_COMISSAO'
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
      '    g.Cod'
      '  , g.Descri'
      '  , g.perc_venda_comissao'
      'from TBGRUPOPROD g')
    GeneratorField.Field = 'COD'
    GeneratorField.Generator = 'GEN_GRUPOPRODUTO_COD'
  end
  inherited DtSrcTabela: TDataSource
    DataSet = fdQryTabela
  end
  inherited IbUpdTabela: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  COD,'
      '  DESCRI,'
      '  PERC_VENDA_COMISSAO'
      'from TBGRUPOPROD '
      'where'
      '  COD = :COD')
    ModifySQL.Strings = (
      'update TBGRUPOPROD'
      'set'
      '  COD = :COD,'
      '  DESCRI = :DESCRI,'
      '  PERC_VENDA_COMISSAO = :PERC_VENDA_COMISSAO'
      'where'
      '  COD = :OLD_COD')
    InsertSQL.Strings = (
      'insert into TBGRUPOPROD'
      '  (COD, DESCRI, PERC_VENDA_COMISSAO)'
      'values'
      '  (:COD, :DESCRI, :PERC_VENDA_COMISSAO)')
    DeleteSQL.Strings = (
      'delete from TBGRUPOPROD'
      'where'
      '  COD = :OLD_COD')
  end
  inherited fdQryTabela: TFDQuery
    UpdateOptions.AssignedValues = [uvFetchGeneratorsPoint, uvGeneratorName]
    UpdateOptions.FetchGeneratorsPoint = gpImmediate
    UpdateOptions.GeneratorName = 'GEN_GRUPOPRODUTO_COD'
    UpdateOptions.KeyFields = 'COD'
    UpdateOptions.AutoIncFields = 'COD'
    SQL.Strings = (
      'Select'
      '    g.Cod'
      '  , g.Descri'
      '  , g.perc_venda_comissao'
      'from TBGRUPOPROD g')
    object fdQryTabelaCOD: TSmallintField
      AutoGenerateValue = arAutoInc
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD'
      Origin = 'COD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object fdQryTabelaDESCRI: TStringField
      DisplayLabel = 'Descri'#231#227'o:'
      FieldName = 'DESCRI'
      Origin = 'DESCRI'
      Required = True
      Size = 30
    end
    object fdQryTabelaPERC_VENDA_COMISSAO: TFMTBCDField
      FieldName = 'PERC_VENDA_COMISSAO'
      Origin = 'PERC_VENDA_COMISSAO'
      Precision = 18
      Size = 2
    end
  end
  inherited fdUpdTabela: TFDUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO TBGRUPOPROD'
      '(COD, DESCRI, PERC_VENDA_COMISSAO)'
      'VALUES (:NEW_COD, :NEW_DESCRI, :NEW_PERC_VENDA_COMISSAO)'
      'RETURNING COD')
    ModifySQL.Strings = (
      'UPDATE TBGRUPOPROD'
      
        'SET COD = :NEW_COD, DESCRI = :NEW_DESCRI, PERC_VENDA_COMISSAO = ' +
        ':NEW_PERC_VENDA_COMISSAO'
      'WHERE COD = :OLD_COD'
      'RETURNING COD')
    DeleteSQL.Strings = (
      'DELETE FROM TBGRUPOPROD'
      'WHERE COD = :OLD_COD')
    FetchRowSQL.Strings = (
      'SELECT COD, DESCRI, PERC_VENDA_COMISSAO'
      'FROM TBGRUPOPROD'
      'WHERE COD = :COD')
  end
end
