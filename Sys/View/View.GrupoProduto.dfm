inherited ViewGrupoProduto: TViewGrupoProduto
  Left = 394
  Top = 220
  ActiveControl = dbCodigo
  Caption = 'Tabela de Grupos de Produtos'
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
            FieldName = 'COD'
            Title.Caption = 'C'#243'digo '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRI'
            Title.Caption = 'Descri'#231#227'o '
            Width = 350
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PERC_VENDA_COMISSAO'
            Title.Caption = '% Comiss'#227'o '
            Width = 75
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
            Width = 37
            Caption = 'Grupo:'
            ExplicitWidth = 37
          end
          inherited edtFiltrar: TEdit
            Left = 60
            Width = 233
            ExplicitLeft = 60
            ExplicitWidth = 233
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
        object lblComissao: TLabel [2]
          Left = 431
          Top = 24
          Width = 71
          Height = 13
          Caption = 'Comiss'#227'o (%):'
          FocusControl = dbComissao
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
          DataField = 'DESCRI'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object dbComissao: TDBEdit
          Left = 431
          Top = 40
          Width = 81
          Height = 21
          CharCase = ecUpperCase
          DataField = 'PERC_VENDA_COMISSAO'
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
