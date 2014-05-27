inherited frmGeFabricante: TfrmGeFabricante
  Width = 767
  Height = 495
  ActiveControl = dbCodigo
  Caption = 'Tabela de Fabricantes'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 453
    Width = 751
  end
  inherited Bevel3: TBevel
    Top = 414
    Width = 751
  end
  inherited tlbBotoes: TToolBar
    Top = 418
    Width = 751
  end
  inherited pgcGuias: TPageControl
    Width = 751
    Height = 414
    ActivePage = tbsCadastro
    inherited tbsTabela: TTabSheet
      inherited Bevel4: TBevel
        Top = 319
        Width = 743
      end
      inherited dbgDados: TDBGrid
        Width = 743
        Height = 319
        Columns = <
          item
            Expanded = False
            FieldName = 'COD'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Width = 350
            Visible = True
          end
          item
            Expanded = False
            Visible = False
          end
          item
            Expanded = False
            Visible = False
          end>
      end
      inherited pnlFiltros: TPanel
        Top = 323
        Width = 743
        inherited grpBxFiltro: TGroupBox
          Left = 417
          Width = 322
          inherited lbltFiltrar: TLabel
            Left = 14
            Width = 63
            Caption = 'Fabricante:'
          end
          inherited btnFiltrar: TSpeedButton
            Left = 277
          end
          inherited edtFiltrar: TEdit
            Left = 88
            Width = 185
          end
        end
      end
    end
    inherited tbsCadastro: TTabSheet
      inherited Bevel8: TBevel
        Top = 81
        Width = 743
      end
      inherited GrpBxDadosNominais: TGroupBox
        Width = 743
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
          DataField = 'COD'
        end
        object dbNome: TDBEdit
          Left = 88
          Top = 40
          Width = 337
          Height = 21
          CharCase = ecUpperCase
          DataField = 'NOME'
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
      '    f.Cod'
      '  , f.Nome'
      'from TBFABRICANTE f')
    GeneratorField.Field = 'COD'
    GeneratorField.Generator = 'GEN_FABRICANTE_ID'
    object IbDtstTabelaCOD: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD'
      Origin = 'TBFABRICANTE.COD'
    end
    object IbDtstTabelaNOME: TIBStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Origin = 'TBFABRICANTE.NOME'
      Required = True
      Size = 50
    end
  end
  inherited IbUpdTabela: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  COD,'
      '  NOME'
      'from TBFABRICANTE '
      'where'
      '  COD = :COD')
    ModifySQL.Strings = (
      'update TBFABRICANTE'
      'set'
      '  COD = :COD,'
      '  NOME = :NOME'
      'where'
      '  COD = :OLD_COD')
    InsertSQL.Strings = (
      'insert into TBFABRICANTE'
      '  (COD, NOME)'
      'values'
      '  (:COD, :NOME)')
    DeleteSQL.Strings = (
      'delete from TBFABRICANTE'
      'where'
      '  COD = :OLD_COD')
  end
end
