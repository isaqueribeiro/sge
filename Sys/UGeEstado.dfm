inherited frmGeEstado: TfrmGeEstado
  Left = 547
  Top = 262
  ActiveControl = dbCodigo
  Caption = 'Tabela de Estados (UF)'
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
            FieldName = 'EST_COD'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EST_NOME'
            Width = 350
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EST_SIGLA'
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
    end
  end
  inherited IbDtstTabela: TIBDataSet
    SelectSQL.Strings = (
      'Select'
      '    e.Est_cod'
      '  , e.Est_nome'
      '  , e.Est_sigla'
      '  , e.Est_siafi'
      'from TBESTADO e')
    object IbDtstTabelaEST_COD: TSmallintField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'EST_COD'
      Origin = 'TBESTADO.EST_COD'
      Required = True
    end
    object IbDtstTabelaEST_NOME: TIBStringField
      DisplayLabel = 'Nome'
      FieldName = 'EST_NOME'
      Origin = 'TBESTADO.EST_NOME'
      Size = 100
    end
    object IbDtstTabelaEST_SIGLA: TIBStringField
      DisplayLabel = 'SIGLA'
      FieldName = 'EST_SIGLA'
      Origin = 'TBESTADO.EST_SIGLA'
      Size = 2
    end
    object IbDtstTabelaEST_SIAFI: TIntegerField
      DisplayLabel = 'SIAFI'
      FieldName = 'EST_SIAFI'
      Origin = 'TBESTADO.EST_SIAFI'
    end
  end
  inherited IbUpdTabela: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  EST_COD,'
      '  EST_NOME,'
      '  EST_SIGLA,'
      '  EST_SIAFI'
      'from TBESTADO '
      'where'
      '  EST_COD = :EST_COD')
    ModifySQL.Strings = (
      'update TBESTADO'
      'set'
      '  EST_COD = :EST_COD,'
      '  EST_NOME = :EST_NOME,'
      '  EST_SIGLA = :EST_SIGLA,'
      '  EST_SIAFI = :EST_SIAFI'
      'where'
      '  EST_COD = :OLD_EST_COD')
    InsertSQL.Strings = (
      'insert into TBESTADO'
      '  (EST_COD, EST_NOME, EST_SIGLA, EST_SIAFI)'
      'values'
      '  (:EST_COD, :EST_NOME, :EST_SIGLA, :EST_SIAFI)')
    DeleteSQL.Strings = (
      'delete from TBESTADO'
      'where'
      '  EST_COD = :OLD_EST_COD')
  end
end
