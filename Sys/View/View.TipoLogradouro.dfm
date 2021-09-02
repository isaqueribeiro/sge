inherited ViewTipoLogradouro: TViewTipoLogradouro
  Left = 387
  Top = 215
  Caption = 'Tabela de Tipos de Logradouros'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcGuias: TPageControl
    inherited tbsTabela: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 727
      ExplicitHeight = 329
      inherited dbgDados: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'TLG_COD'
            Title.Caption = 'C'#243'digo '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TLG_DESCRICAO'
            Title.Caption = 'Descri'#231#227'o '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TLG_SIGLA'
            Title.Caption = 'SIGLA '
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        inherited grpBxFiltro: TGroupBox
          Left = 416
          Width = 307
          ExplicitLeft = 416
          ExplicitWidth = 307
          inherited lbltFiltrar: TLabel
            Width = 95
            Caption = 'Tipo Logradouro:'
            ExplicitWidth = 95
          end
          inherited edtFiltrar: TEdit
            Left = 120
            Width = 140
            ExplicitLeft = 111
            ExplicitWidth = 140
          end
          inherited btnFiltrar: TcxButton
            Left = 266
            ExplicitLeft = 257
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
end
