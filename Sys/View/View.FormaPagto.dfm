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
    OnChange = pgcGuiasChange
    ExplicitHeight = 368
    inherited tbsTabela: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 727
      ExplicitHeight = 339
      inherited Bevel4: TBevel
        Top = 265
        ExplicitTop = 273
      end
      inherited dbgDados: TDBGrid
        Height = 265
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
        Top = 269
        ExplicitTop = 269
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
          ExplicitHeight = 62
          inherited lbltFiltrar: TLabel
            Width = 95
            Caption = 'Forma de Pagto.:'
            ExplicitWidth = 95
          end
          inherited edtFiltrar: TEdit
            Left = 121
            Width = 175
            ExplicitLeft = 121
            ExplicitTop = 24
            ExplicitWidth = 175
          end
          inherited btnFiltrar: TcxButton
            Left = 302
            ExplicitLeft = 302
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
              Width = 25
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
  inherited DtSrcTabela: TDataSource
    Left = 640
    Top = 0
  end
  inherited ImgList: TImageList
    Left = 488
    Top = 0
  end
  object dtsFormaPagtoNCFe: TDataSource
    Left = 672
  end
  object dtsContaCorrente: TDataSource
    DataSet = cdsContaCorrente
    Left = 560
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
    Left = 524
    Top = 1
  end
  object imgGrid: TImageList
    DrawingStyle = dsTransparent
    Left = 531
    Top = 224
    Bitmap = {
      494C010102000800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      000000000000000000000000000000000000F1F1F1FFDFDFDFFFDBDBDBFFDADA
      DAFFDCDCDCFFDEDEDEFFDDDDDDFFDFDFDFFFE0E0E0FFDEDEDEFFDFDFDFFFDEDE
      DEFFF2F2F2FFFFFFFFFFFDFDFDFFFFFFFFFFF1F1F1FFDCDCDCFFE2E2E2FFDFDF
      DFFFDEDEDEFFE1E1E1FFDEDEDEFFE2E2E2FFDDDDDDFFE0E0E0FFDFDFDFFFE0E0
      E0FFF2F2F2FFFFFFFFFFFEFEFEFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000121212FF000000FF030303FF0000
      00FF020202FF020202FF000000FF010101FF000000FF020202FF010101FF0101
      01FF282828FFFAFAFAFFFFFFFFFFFFFFFFFF121212FF000000FF000000FF0404
      04FF000000FF000000FF000000FF000000FF010101FF010101FF000000FF0000
      00FF2D2D2DFFFFFFFFFFFEFEFEFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000010101FF363636FF888888FF8888
      88FF868686FF858585FF868686FF8A8A8AFF898989FF7E7E7EFF828282FF2828
      28FF121212FFFFFFFFFFFEFEFEFFFFFFFFFF020202FF383838FF888888FF8484
      84FF858585FF878787FF888888FF868686FF858585FF858585FF858585FF2A2A
      2AFF1C1C1CFFFBFBFBFFFDFDFDFFFEFEFEFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF6C6C6CFFFCFCFCFFFFFF
      FFFFFEFEFEFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFF5252
      52FF121212FFFFFFFFFFFFFFFFFFFEFEFEFF000000FF686868FFFFFFFFFFFEFE
      FEFFFFFFFFFFFCFCFCFFFFFFFFFFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFF4D4D
      4DFF181818FFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF676767FFFDFDFDFFFEFE
      FEFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFEFEFEFFFEFEFEFFFCFCFCFF5050
      50FF151515FFFFFFFFFFFDFDFDFFFFFFFFFF020202FF676767FFFDFDFDFFFFFF
      FFFFFFFFFFFFFFFFFFFFE9E9E9FFF5F5F5FFFFFFFFFFFFFFFFFFFEFEFEFF5050
      50FF181818FFFAFAFAFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000020202FF686868FFFFFFFFFFFFFF
      FFFFFFFFFFFFFEFEFEFFFEFEFEFFFFFFFFFFFFFFFFFFFDFDFDFFFFFFFFFF4F4F
      4FFF131313FFFEFEFEFFFFFFFFFFFFFFFFFF000000FF6A6A6AFFFFFFFFFFFEFE
      FEFFFCFCFCFFBCBCBCFF0B0B0BFF141414FFD0D0D0FFFCFCFCFFFCFCFCFF4D4D
      4DFF1E1E1EFFFFFFFFFFFDFDFDFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF686868FFFFFFFFFFFDFD
      FDFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFEFEFEFFFEFEFEFFFFFFFFFF5555
      55FF151515FFFFFFFFFFFEFEFEFFFEFEFEFF000000FF6B6B6BFFFBFBFBFFFFFF
      FFFFBCBCBCFF0A0A0AFF000000FF000000FF141414FFD1D1D1FFFFFFFFFF6363
      63FF151515FFFFFFFFFFFBFBFBFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF686868FFFFFFFFFFFEFE
      FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFCFCFCFF4D4D
      4DFF1B1B1BFFFCFCFCFFFFFFFFFFFFFFFFFF000000FF686868FFFFFFFFFFBDBD
      BDFF080808FF000000FF090909FF040404FF010101FF131313FFCFCFCFFFF3F3
      F3FF595959FFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF6A6A6AFFFEFEFEFFFFFF
      FFFFFEFEFEFFFFFFFFFFFEFEFEFFFFFFFFFFFEFEFEFFFFFFFFFFFDFDFDFF5151
      51FF1B1B1BFFFFFFFFFFFEFEFEFFFEFEFEFF000000FF696969FFFDFDFDFF3333
      33FF000000FF0A0A0AFFBBBBBBFFA2A2A2FF010101FF030303FF141414FFD2D2
      D2FFFAFAFAFFFDFDFDFFFFFFFFFFFEFEFEFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF656565FFFFFFFFFFFEFE
      FEFFFDFDFDFFFFFFFFFFFDFDFDFFFCFCFCFFFFFFFFFFFFFFFFFFFEFEFEFF4C4C
      4CFF1E1E1EFFFDFDFDFFFDFDFDFFFFFFFFFF000000FF6A6A6AFFFFFFFFFF9595
      95FF2E2E2EFFBCBCBCFFFDFDFDFFFFFFFFFFA4A4A4FF030303FF000000FF0F0F
      0FFFD0D0D0FFFFFFFFFFFDFDFDFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF6C6C6CFFFDFDFDFFFEFE
      FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFFFFFFFFFEFEFEFF4D4D
      4DFF1D1D1DFFFEFEFEFFFFFFFFFFFCFCFCFF000000FF666666FFFEFEFEFFFFFF
      FFFFFFFFFFFFFFFFFFFFFDFDFDFFFEFEFEFFFBFBFBFFA4A4A4FF070707FF0000
      00FF141414FFD3D3D3FFFCFCFCFFFEFEFEFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF666666FFFEFEFEFFFFFF
      FFFFFBFBFBFFFFFFFFFFFEFEFEFFFDFDFDFFFFFFFFFFFBFBFBFFFFFFFFFF4C4C
      4CFF1D1D1DFFFEFEFEFFFFFFFFFFFFFFFFFF000000FF6B6B6BFFFFFFFFFFFBFB
      FBFFFEFEFEFFFFFFFFFFFEFEFEFFFEFEFEFFFFFFFFFFFFFFFFFF9D9D9DFF0404
      04FF010101FF141414FFCECECEFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF121212FF2C2C2CFF2A2A
      2AFF303030FF303030FF313131FF303030FF2F2F2FFF353535FF353535FF1010
      10FF222222FFFFFFFFFFFEFEFEFFFFFFFFFF000000FF131313FF2B2B2BFF3333
      33FF333333FF2D2D2DFF333333FF2E2E2EFF313131FF7D7D7DFFFFFFFFFFA2A2
      A2FF080808FF020202FF121212FFD0D0D0FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005E5E5EFF3C3C3CFF363636FF3838
      38FF373737FF373737FF343434FF383838FF353535FF353535FF333333FF2F2F
      2FFF6F6F6FFFFDFDFDFFFFFFFFFFFEFEFEFF5A5A5AFF383838FF3A3A3AFF3A3A
      3AFF333333FF393939FF383838FF383838FF373737FF373737FFA9A9A9FFFFFF
      FFFF9A9A9AFF040404FF000000FF1D1D1DFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FDFDFDFFFEFEFEFFFEFEFEFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFEFEFEFFFFFF
      FFFFFFFFFFFFFFFFFFFFFCFCFCFFFFFFFFFFFFFFFFFFF9F9F9FFFFFFFFFFFFFF
      FFFFFEFEFEFFFFFFFFFFFFFFFFFFFDFDFDFFFFFFFFFFFEFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFFA2A2A2FF080808FF383838FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFAFAFAFFFFFFFFFFFFFF
      FFFFFEFEFEFFFFFFFFFFFEFEFEFFFEFEFEFFFFFFFFFFFCFCFCFFFFFFFFFFFFFF
      FFFFFDFDFDFFFFFFFFFFFFFFFFFFFDFDFDFFFDFDFDFFFFFFFFFFFFFFFFFFFDFD
      FDFFFFFFFFFFFFFFFFFFFDFDFDFFFEFEFEFFFFFFFFFFFFFFFFFFFEFEFEFFFEFE
      FEFFFFFFFFFFFDFDFDFFEEEEEEFFFAFAFAFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
end
