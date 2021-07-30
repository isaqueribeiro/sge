inherited ViewFormaPagto: TViewFormaPagto
  Left = 393
  Top = 215
  ActiveControl = dbCodigo
  Caption = 'Tabela de Formas de Pagamento'
  ClientHeight = 411
  OldCreateOrder = True
  ExplicitHeight = 450
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 407
    ExplicitTop = 407
  end
  inherited Bevel3: TBevel
    Top = 368
    ExplicitTop = 368
  end
  inherited pgcGuias: TPageControl
    Height = 368
    ActivePage = tbsCadastro
    ExplicitHeight = 368
    inherited tbsTabela: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 727
      ExplicitHeight = 339
      inherited Bevel4: TBevel
        Top = 273
        ExplicitTop = 273
      end
      inherited dbgDados: TDBGrid
        Height = 273
        Columns = <
          item
            Expanded = False
            FieldName = 'COD'
            Title.Caption = 'C'#243'digo '
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRI'
            Title.Caption = 'Descri'#231#227'o '
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ACRESCIMO'
            Title.Alignment = taCenter
            Title.Caption = '% Acr'#233'scimo '
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            Visible = False
          end>
      end
      inherited pnlFiltros: TPanel
        Top = 277
        ExplicitTop = 277
        object lblRegistroDesativado: TLabel [0]
          Left = 2
          Top = 44
          Width = 197
          Height = 13
          Caption = '* Forma de Pagamento desativada'
          Font.Charset = ANSI_CHARSET
          Font.Color = 7303023
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        inherited grpBxFiltro: TGroupBox
          Left = 383
          Width = 340
          ExplicitLeft = 383
          ExplicitWidth = 340
          inherited lbltFiltrar: TLabel
            Width = 95
            Caption = 'Forma de Pagto.:'
            ExplicitWidth = 95
          end
          inherited edtFiltrar: TEdit
            Left = 118
            Width = 175
            ExplicitLeft = 118
            ExplicitWidth = 175
            ExplicitHeight = 21
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
      ExplicitHeight = 339
      inherited Bevel8: TBevel
        Top = 153
        ExplicitTop = 153
      end
      inherited GrpBxDadosNominais: TGroupBox
        Height = 153
        ExplicitHeight = 153
        object lblNome: TLabel [1]
          Left = 88
          Top = 24
          Width = 50
          Height = 13
          Caption = 'Descri'#231#227'o:'
        end
        object lblAcrescimo: TLabel [2]
          Left = 344
          Top = 24
          Width = 66
          Height = 13
          Caption = '% Acr'#233'scimo:'
        end
        object lblFormaPagtoNCFe: TLabel [3]
          Left = 448
          Top = 24
          Width = 139
          Height = 13
          Caption = 'Forma de Pagamento NFC-e:'
          FocusControl = dbFormaPagtoNCFe
        end
        inherited dbCodigo: TDBEdit
          Color = clMoneyGreen
          DataField = 'COD'
        end
        object dbNome: TDBEdit
          Left = 88
          Top = 40
          Width = 249
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
        object dbAcrescimo: TDBEdit
          Left = 344
          Top = 40
          Width = 97
          Height = 21
          CharCase = ecUpperCase
          DataField = 'ACRESCIMO'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object dbDecrementarLimite: TDBCheckBox
          Left = 16
          Top = 72
          Width = 377
          Height = 17
          Caption = 'Forma de Pagamento DECREMENTA Limite de Cr'#233'dito do Cliente'
          DataField = 'DEBITAR_LIMITE_CLIENTE'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbFormaPagtoNCFe: TDBLookupComboBox
          Left = 448
          Top = 40
          Width = 265
          Height = 21
          DataField = 'FORMAPAGTO_NFCE'
          DataSource = DtSrcTabela
          DropDownRows = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'CODIGO'
          ListField = 'DESCRICAO'
          ListSource = dtsFormaPagtoNCFe
          ParentFont = False
          TabOrder = 3
        end
        object dbFormaPagtoPDV: TDBCheckBox
          Left = 16
          Top = 96
          Width = 225
          Height = 17
          Caption = 'Usar Forma de Pagamento no PDV'
          DataField = 'FORMAPAGTO_PDV'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbFormaPagtoPDVRelatorio: TDBCheckBox
          Left = 16
          Top = 120
          Width = 265
          Height = 17
          Caption = 'Emitir Relat'#243'rio Gerencial no PDV (P'#243's Venda)'
          DataField = 'FORMAPAGTO_PDV_CUPOM_EXTRA'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbAtiva: TDBCheckBox
          Left = 448
          Top = 72
          Width = 81
          Height = 17
          Caption = 'Ativa'
          DataField = 'ATIVA'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
      object pnlContaCorrente: TPanel
        Left = 0
        Top = 157
        Width = 727
        Height = 182
        Align = alClient
        BevelOuter = bvNone
        Caption = 'pnlContaCorrente'
        TabOrder = 1
        object pnlDicas: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 130
          Width = 721
          Height = 49
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 0
          object lblDicasTitulo: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 33
            Height = 43
            Align = alLeft
            Caption = 'Dica : '
            Font.Charset = ANSI_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
            ExplicitHeight = 13
          end
          object lblDicasTexto: TLabel
            AlignWithMargins = True
            Left = 42
            Top = 3
            Width = 676
            Height = 43
            Align = alClient
            Caption = 
              'Pressione a tecla "Espa'#231'o" para marcar ou desmarcar a Conta Corr' +
              'ente selecionada. E atente para o fato de que a conta corrente m' +
              'arcada est'#225' relacionada a forma de pagamento em quest'#227'o para tod' +
              'as as movimenta'#231#245'es financeiras no sistema.'
            Font.Charset = ANSI_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
            WordWrap = True
            ExplicitWidth = 675
            ExplicitHeight = 39
          end
        end
        object dbgContaCorrente: TDBGrid
          Left = 0
          Top = 0
          Width = 727
          Height = 127
          Hint = 
            'Dica:'#13#10#13#10'Pressione a tecla "Espa'#231'o" para marcar o desmarcar a Co' +
            'nta Corrente'#13#10'selecionada. E atente para o fato de que a conta c' +
            'orrente marcada est'#225#13#10'relacionada a forma de pagamento em quest'#227 +
            'o.'
          Align = alClient
          DataSource = dtsContaCorrente
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 1
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = [fsBold]
          OnDrawColumnCell = dbgDadosDrawColumnCell
          OnDblClick = dbgContaCorrenteDblClick
          OnKeyDown = dbgContaCorrenteKeyDown
          Columns = <
            item
              Expanded = False
              FieldName = 'selecionar'
              Title.Alignment = taCenter
              Title.Caption = 'S'
              Width = 30
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'codigo'
              Title.Caption = 'C'#243'digo'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'descricao'
              Title.Caption = 'Conta Corrente'
              Width = 250
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'tipo'
              Title.Caption = 'Tipo'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'empresa'
              Title.Caption = 'Empresa'
              Width = 300
              Visible = True
            end>
        end
      end
    end
  end
  inherited tlbBotoes: TPanel
    Top = 372
    ExplicitTop = 372
  end
  inherited ImgList: TImageList
    Left = 320
  end
  object dtsFormaPagtoNCFe: TDataSource
    Left = 624
    Top = 56
  end
  object dtsContaCorrente: TDataSource
    DataSet = cdsContaCorrente
    Left = 392
    Top = 8
  end
  object cdsContaCorrente: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'selecionar'
        DataType = ftSmallint
      end
      item
        Name = 'codigo'
        DataType = ftInteger
      end
      item
        Name = 'descricao'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'tipo'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'empresa'
        DataType = ftString
        Size = 60
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 356
    Top = 9
  end
end
