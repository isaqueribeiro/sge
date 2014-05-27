inherited frmGeTipoLogradouro: TfrmGeTipoLogradouro
  Left = 552
  Top = 272
  Caption = 'Tabela de Tipos de Logradouros'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcGuias: TPageControl
    inherited tbsTabela: TTabSheet
      inherited dbgDados: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'TLG_COD'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TLG_DESCRICAO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TLG_SIGLA'
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        inherited grpBxFiltro: TGroupBox
          Left = 425
          Width = 298
          inherited lbltFiltrar: TLabel
            Width = 95
            Caption = 'Tipo Logradouro:'
          end
          inherited btnFiltrar: TSpeedButton
            Left = 255
          end
          inherited edtFiltrar: TEdit
            Left = 111
            Width = 140
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
        inherited dbCodigo: TDBEdit
          Color = clMoneyGreen
          DataField = 'TLG_COD'
        end
        object dbNome: TDBEdit
          Left = 88
          Top = 40
          Width = 337
          Height = 21
          CharCase = ecUpperCase
          DataField = 'TLG_DESCRICAO'
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
          DataField = 'TLG_SIGLA'
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
      '    t.Tlg_cod'
      '  , t.Tlg_descricao'
      '  , t.Tlg_sigla'
      'from TBTIPO_LOGRADOURO t')
    GeneratorField.Field = 'TLG_COD'
    GeneratorField.Generator = 'GEN_TIPO_LOGRADOURO_ID'
    object IbDtstTabelaTLG_COD: TSmallintField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'TLG_COD'
      Origin = 'TBTIPO_LOGRADOURO.TLG_COD'
      Required = True
    end
    object IbDtstTabelaTLG_DESCRICAO: TIBStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'TLG_DESCRICAO'
      Origin = 'TBTIPO_LOGRADOURO.TLG_DESCRICAO'
      Size = 50
    end
    object IbDtstTabelaTLG_SIGLA: TIBStringField
      DisplayLabel = 'SIGLA'
      FieldName = 'TLG_SIGLA'
      Origin = 'TBTIPO_LOGRADOURO.TLG_SIGLA'
      Size = 10
    end
  end
  inherited IbUpdTabela: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  TLG_COD,'
      '  TLG_DESCRICAO,'
      '  TLG_SIGLA'
      'from TBTIPO_LOGRADOURO '
      'where'
      '  TLG_COD = :TLG_COD')
    ModifySQL.Strings = (
      'update TBTIPO_LOGRADOURO'
      'set'
      '  TLG_COD = :TLG_COD,'
      '  TLG_DESCRICAO = :TLG_DESCRICAO,'
      '  TLG_SIGLA = :TLG_SIGLA'
      'where'
      '  TLG_COD = :OLD_TLG_COD')
    InsertSQL.Strings = (
      'insert into TBTIPO_LOGRADOURO'
      '  (TLG_COD, TLG_DESCRICAO, TLG_SIGLA)'
      'values'
      '  (:TLG_COD, :TLG_DESCRICAO, :TLG_SIGLA)')
    DeleteSQL.Strings = (
      'delete from TBTIPO_LOGRADOURO'
      'where'
      '  TLG_COD = :OLD_TLG_COD')
  end
end
