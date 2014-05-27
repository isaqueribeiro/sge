inherited frmGrCidade: TfrmGrCidade
  ActiveControl = dbCodigo
  Caption = 'Tabela de Cidades (Munic'#237'pios)'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcGuias: TPageControl
    ActivePage = tbsCadastro
    inherited tbsTabela: TTabSheet
      inherited dbgDados: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'CID_COD'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CID_NOME'
            Width = 350
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EST_NOME'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EST_SIGLA'
            Width = 40
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        inherited grpBxFiltro: TGroupBox
          inherited Label1: TLabel
            Caption = 'Cidade:'
          end
        end
      end
    end
    inherited tbsCadastro: TTabSheet
      inherited GrpBxDadosNominais: TGroupBox
        inherited dbCodigo: TDBEdit
          DataField = 'CID_COD'
        end
      end
    end
  end
  inherited IbDtstTabela: TIBDataSet
    SelectSQL.Strings = (
      'Select'
      '    c.Cid_cod'
      '  , c.Cid_nome'
      '  , c.Est_cod'
      '  , c.Cid_siafi'
      '  , c.Cid_ibge'
      '  , e.Est_nome'
      '  , e.Est_sigla'
      'from TBCIDADE c'
      '  inner join TBESTADO e on (e.Est_cod = c.Est_cod)'
      '')
    GeneratorField.Field = 'CID_COD'
    GeneratorField.Generator = 'GEN_CIDADE_ID'
    object IbDtstTabelaCID_COD: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CID_COD'
      Origin = 'TBCIDADE.CID_COD'
      Required = True
    end
    object IbDtstTabelaCID_NOME: TIBStringField
      DisplayLabel = 'Nome'
      FieldName = 'CID_NOME'
      Origin = 'TBCIDADE.CID_NOME'
      Size = 100
    end
    object IbDtstTabelaEST_COD: TSmallintField
      DisplayLabel = 'Estado'
      FieldName = 'EST_COD'
      Origin = 'TBCIDADE.EST_COD'
      Required = True
    end
    object IbDtstTabelaCID_SIAFI: TIntegerField
      DisplayLabel = 'SIAFI'
      FieldName = 'CID_SIAFI'
      Origin = 'TBCIDADE.CID_SIAFI'
    end
    object IbDtstTabelaCID_IBGE: TIntegerField
      DisplayLabel = 'IBGE'
      FieldName = 'CID_IBGE'
      Origin = 'TBCIDADE.CID_IBGE'
    end
    object IbDtstTabelaEST_NOME: TIBStringField
      DisplayLabel = 'Estado'
      FieldName = 'EST_NOME'
      Origin = 'TBESTADO.EST_NOME'
      Size = 100
    end
    object IbDtstTabelaEST_SIGLA: TIBStringField
      DisplayLabel = 'UF'
      FieldName = 'EST_SIGLA'
      Origin = 'TBESTADO.EST_SIGLA'
      Size = 2
    end
  end
  inherited IbUpdTabela: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  CID_COD,'
      '  CID_NOME,'
      '  EST_COD,'
      '  CID_SIAFI,'
      '  CID_IBGE'
      'from TBCIDADE '
      'where'
      '  CID_COD = :CID_COD')
    ModifySQL.Strings = (
      'update TBCIDADE'
      'set'
      '  CID_COD = :CID_COD,'
      '  CID_NOME = :CID_NOME,'
      '  EST_COD = :EST_COD,'
      '  CID_SIAFI = :CID_SIAFI,'
      '  CID_IBGE = :CID_IBGE'
      'where'
      '  CID_COD = :OLD_CID_COD')
    InsertSQL.Strings = (
      'insert into TBCIDADE'
      '  (CID_COD, CID_NOME, EST_COD, CID_SIAFI, CID_IBGE)'
      'values'
      '  (:CID_COD, :CID_NOME, :EST_COD, :CID_SIAFI, :CID_IBGE)')
    DeleteSQL.Strings = (
      'delete from TBCIDADE'
      'where'
      '  CID_COD = :OLD_CID_COD')
  end
end
