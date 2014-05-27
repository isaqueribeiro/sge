inherited frmGeUnidade: TfrmGeUnidade
  Left = 549
  Top = 268
  ActiveControl = dbCodigo
  Caption = 'Tabela de Unidades'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcGuias: TPageControl
    ActivePage = tbsCadastro
    inherited tbsTabela: TTabSheet
      inherited dbgDados: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'UNP_COD'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UNP_DESCRICAO'
            Width = 350
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'UNP_SIGLA'
            Title.Alignment = taCenter
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        inherited grpBxFiltro: TGroupBox
          inherited lbltFiltrar: TLabel
            Width = 49
            Caption = 'Unidade:'
          end
          inherited edtFiltrar: TEdit
            Left = 64
            Width = 139
          end
        end
      end
    end
    inherited tbsCadastro: TTabSheet
      inherited Bevel8: TBevel
        Top = 81
        Width = 727
      end
      inherited GrpBxDadosNominais: TGroupBox
        Width = 727
        Height = 81
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
    object IbDtstTabelaUNP_COD: TSmallintField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'UNP_COD'
      Origin = 'TBUNIDADEPROD.UNP_COD'
      Required = True
    end
    object IbDtstTabelaUNP_DESCRICAO: TIBStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'UNP_DESCRICAO'
      Origin = 'TBUNIDADEPROD.UNP_DESCRICAO'
      Required = True
      Size = 50
    end
    object IbDtstTabelaUNP_SIGLA: TIBStringField
      DisplayLabel = 'Sigla'
      FieldName = 'UNP_SIGLA'
      Origin = 'TBUNIDADEPROD.UNP_SIGLA'
      Required = True
      Size = 5
    end
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
end
