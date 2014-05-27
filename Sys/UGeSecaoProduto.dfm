inherited frmGeSecaoProduto: TfrmGeSecaoProduto
  Left = 549
  Top = 277
  Caption = 'Tabela de Se'#231#245'es de Produtos'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcGuias: TPageControl
    inherited tbsTabela: TTabSheet
      inherited dbgDados: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'SCP_COD'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SCP_DESCRICAO'
            Width = 350
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        inherited grpBxFiltro: TGroupBox
          inherited lbltFiltrar: TLabel
            Width = 37
            Caption = 'Se'#231#227'o:'
          end
          inherited edtFiltrar: TEdit
            Left = 56
            Width = 147
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
          DataField = 'SCP_COD'
        end
        object dbNome: TDBEdit
          Left = 88
          Top = 40
          Width = 337
          Height = 21
          CharCase = ecUpperCase
          DataField = 'SCP_DESCRICAO'
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
      '    s.Scp_cod'
      '  , s.Scp_descricao'
      'from TBSECAOPROD s')
    GeneratorField.Field = 'SCP_COD'
    GeneratorField.Generator = 'GEN_SECAOPRODUTO_ID'
    object IbDtstTabelaSCP_COD: TSmallintField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'SCP_COD'
      Origin = 'TBSECAOPROD.SCP_COD'
      Required = True
    end
    object IbDtstTabelaSCP_DESCRICAO: TIBStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'SCP_DESCRICAO'
      Origin = 'TBSECAOPROD.SCP_DESCRICAO'
      Size = 50
    end
  end
  inherited IbUpdTabela: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  SCP_COD,'
      '  SCP_DESCRICAO'
      'from TBSECAOPROD '
      'where'
      '  SCP_COD = :SCP_COD')
    ModifySQL.Strings = (
      'update TBSECAOPROD'
      'set'
      '  SCP_COD = :SCP_COD,'
      '  SCP_DESCRICAO = :SCP_DESCRICAO'
      'where'
      '  SCP_COD = :OLD_SCP_COD')
    InsertSQL.Strings = (
      'insert into TBSECAOPROD'
      '  (SCP_COD, SCP_DESCRICAO)'
      'values'
      '  (:SCP_COD, :SCP_DESCRICAO)')
    DeleteSQL.Strings = (
      'delete from TBSECAOPROD'
      'where'
      '  SCP_COD = :OLD_SCP_COD')
  end
end
