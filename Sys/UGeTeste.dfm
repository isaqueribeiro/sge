inherited frmGeTeste: TfrmGeTeste
  ActiveControl = dbCodigo
  Caption = 'Cadastro de Teste'
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
            FieldName = 'CODIGO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
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
          DataField = 'CODIGO'
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
      'Select * from TB_TESTE')
    GeneratorField.Field = 'CODIGO'
    GeneratorField.Generator = 'GEN_TB_TESTE_CODIGO'
    GeneratorField.ApplyEvent = gamOnNewRecord
    object IbDtstTabelaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'TB_TESTE.CODIGO'
      Required = True
    end
    object IbDtstTabelaNOME: TIBStringField
      FieldName = 'NOME'
      Origin = 'TB_TESTE.NOME'
      Size = 250
    end
  end
  inherited IbUpdTabela: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO,'
      '  NOME'
      'from TB_TESTE '
      'where'
      '  CODIGO = :CODIGO')
    ModifySQL.Strings = (
      'update TB_TESTE'
      'set'
      '  CODIGO = :CODIGO,'
      '  NOME = :NOME'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into TB_TESTE'
      '  (CODIGO, NOME)'
      'values'
      '  (:CODIGO, :NOME)')
    DeleteSQL.Strings = (
      'delete from TB_TESTE'
      'where'
      '  CODIGO = :OLD_CODIGO')
  end
end
