inherited ViewEstado: TViewEstado
  Left = 388
  Top = 215
  Caption = 'Tabela de Estados (UF)'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcGuias: TPageControl
    inherited tbsTabela: TTabSheet
      inherited dbgDados: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'EST_COD'
            Title.Caption = 'C'#243'digo '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EST_NOME'
            Title.Caption = 'Nome '
            Width = 350
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EST_SIGLA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ALIQUOTA_ICMS'
            Title.Alignment = taCenter
            Title.Caption = '% Aliq. ICMS'
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ALIQUOTA_FCP'
            Title.Caption = '% Aliq. FCP'
            Width = 85
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        inherited grpBxFiltro: TGroupBox
          inherited lbltFiltrar: TLabel
            Caption = 'Estado:'
          end
          inherited edtFiltrar: TEdit
            ExplicitLeft = 64
            ExplicitTop = 20
          end
          inherited btnFiltrar: TcxButton
            ExplicitLeft = 218
            ExplicitTop = 18
            ExplicitHeight = 26
          end
        end
      end
    end
    inherited tbsCadastro: TTabSheet
      inherited Bevel8: TBevel
        Top = 75
        ExplicitTop = 81
      end
      inherited GrpBxDadosNominais: TGroupBox
        Height = 75
        ExplicitHeight = 75
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
      object GrpBxTributacoes: TGroupBox
        Left = 0
        Top = 79
        Width = 727
        Height = 75
        Align = alTop
        Caption = 'Tributa'#231#245'es'
        TabOrder = 1
        object lblAliquotaICMS: TLabel
          Left = 16
          Top = 24
          Width = 85
          Height = 13
          Caption = '% Aliquota ICMS:'
          FocusControl = dbAliquotaICMS
        end
        object lblAliquotaFCP: TLabel
          Left = 119
          Top = 24
          Width = 79
          Height = 13
          Caption = '% Aliquota FCP:'
          FocusControl = dbAliquotaFCP
        end
        object dbAliquotaICMS: TDBEdit
          Left = 16
          Top = 40
          Width = 97
          Height = 21
          DataField = 'ALIQUOTA_ICMS'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object dbAliquotaFCP: TDBEdit
          Left = 119
          Top = 40
          Width = 97
          Height = 21
          DataField = 'ALIQUOTA_FCP'
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
