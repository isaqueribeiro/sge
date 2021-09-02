inherited ViewUnidadeProduto: TViewUnidadeProduto
  Left = 394
  Top = 212
  ActiveControl = dbCodigo
  Caption = 'Tabela de Unidades'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcGuias: TPageControl
    ActivePage = tbsCadastro
    inherited tbsTabela: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 727
      ExplicitHeight = 329
      inherited dbgDados: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'UNP_COD'
            Title.Caption = 'C'#243'digo '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UNP_DESCRICAO'
            Title.Caption = 'Descri'#231#227'o '
            Width = 350
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'UNP_SIGLA'
            Title.Alignment = taCenter
            Title.Caption = 'Sigla '
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        inherited grpBxFiltro: TGroupBox
          Left = 383
          Width = 340
          ExplicitLeft = 383
          ExplicitWidth = 340
          inherited lbltFiltrar: TLabel
            Width = 49
            Caption = 'Unidade:'
            ExplicitWidth = 49
          end
          inherited edtFiltrar: TEdit
            Left = 80
            Width = 213
            ExplicitLeft = 80
            ExplicitWidth = 213
            ExplicitHeight = 23
          end
          inherited btnFiltrar: TcxButton
            Left = 299
            ExplicitLeft = 299
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
end
