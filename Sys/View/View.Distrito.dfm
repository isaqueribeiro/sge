inherited ViewDistrito: TViewDistrito
  Left = 394
  Top = 222
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
            Title.Caption = 'C'#243'digo '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DIS_NOME'
            Title.Caption = 'Nome '
            Width = 350
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        inherited grpBxFiltro: TGroupBox
          Left = 464
          Width = 259
          ExplicitLeft = 464
          ExplicitWidth = 259
          inherited lbltFiltrar: TLabel
            Left = 13
            Width = 45
            Caption = 'Distrito:'
            ExplicitLeft = 13
            ExplicitWidth = 45
          end
          inherited edtFiltrar: TEdit
            Left = 64
            ExplicitLeft = 64
          end
          inherited btnFiltrar: TcxButton
            Left = 218
            ExplicitLeft = 211
          end
        end
      end
    end
    inherited tbsCadastro: TTabSheet
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
end
