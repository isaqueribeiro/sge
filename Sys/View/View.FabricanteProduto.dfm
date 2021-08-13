inherited ViewFabricanteProduto: TViewFabricanteProduto
  Left = 393
  Top = 227
  Caption = 'Tabela de Fabricantes'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    ExplicitTop = 453
    ExplicitWidth = 751
  end
  inherited Bevel3: TBevel
    ExplicitTop = 414
    ExplicitWidth = 751
  end
  inherited pgcGuias: TPageControl
    inherited tbsTabela: TTabSheet
      inherited Bevel4: TBevel
        ExplicitTop = 319
        ExplicitWidth = 743
      end
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
            FieldName = 'NOME'
            Title.Caption = 'Nome '
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
        inherited grpBxFiltro: TGroupBox
          Left = 401
          Width = 322
          ExplicitLeft = 401
          ExplicitWidth = 322
          inherited lbltFiltrar: TLabel
            Left = 14
            Width = 63
            Caption = 'Fabricante:'
            ExplicitLeft = 14
            ExplicitWidth = 63
          end
          inherited edtFiltrar: TEdit
            Left = 88
            Width = 185
            ExplicitLeft = 88
            ExplicitWidth = 185
          end
          inherited btnFiltrar: TcxButton
            Left = 277
            ExplicitLeft = 277
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
        ExplicitWidth = 743
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
  inherited tlbBotoes: TPanel
    inherited bvlTool3: TBevel
      ExplicitLeft = 668
    end
    inherited bvlTool4: TBevel
      ExplicitLeft = 747
    end
  end
end
