inherited ViewCondicaoPagto: TViewCondicaoPagto
  Left = 419
  Top = 247
  ActiveControl = nil
  Caption = 'Tabela de Condi'#231#245'es de Pagamento'
  ClientHeight = 484
  OldCreateOrder = True
  ExplicitHeight = 523
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 480
  end
  inherited Bevel3: TBevel
    Top = 441
  end
  inherited pgcGuias: TPageControl
    Height = 441
    ActivePage = tbsCadastro
    inherited tbsTabela: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 727
      ExplicitHeight = 329
      inherited Bevel4: TBevel
        Top = 346
      end
      inherited dbgDados: TDBGrid
        Height = 346
        Columns = <
          item
            Expanded = False
            FieldName = 'COND_COD'
            Title.Caption = 'C'#243'digo '
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COND_DESCRICAO_FULL'
            Title.Caption = 'Descri'#231#227'o '
            Width = 550
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'APrazo'
            Title.Alignment = taCenter
            Title.Caption = 'A Prazo? '
            Width = 60
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        Top = 350
        object lblRegistroDesativado: TLabel [0]
          Left = 2
          Top = 44
          Width = 212
          Height = 13
          Caption = '* Condi'#231#227'o de Pagamento desativada'
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
            Width = 93
            Caption = 'Condi'#231#227'o Pagto.:'
            ExplicitWidth = 93
          end
          inherited edtFiltrar: TEdit
            Left = 116
            Width = 177
            ExplicitLeft = 116
            ExplicitWidth = 177
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
      ExplicitHeight = 329
      inherited Bevel8: TBevel
        Top = 185
        ExplicitTop = 185
      end
      inherited GrpBxDadosNominais: TGroupBox
        Height = 185
        ExplicitHeight = 185
        object lblNome: TLabel [1]
          Left = 88
          Top = 24
          Width = 50
          Height = 13
          Caption = 'Descri'#231#227'o:'
          FocusControl = dbNome
        end
        object lblPrazo01: TLabel [2]
          Left = 88
          Top = 64
          Width = 46
          Height = 13
          Caption = 'Prazo 01:'
          FocusControl = dbPrazo01
        end
        object lblPrazo02: TLabel [3]
          Left = 160
          Top = 64
          Width = 46
          Height = 13
          Caption = 'Prazo 02:'
          FocusControl = dbPrazo02
        end
        object lblPrazo03: TLabel [4]
          Left = 232
          Top = 64
          Width = 46
          Height = 13
          Caption = 'Prazo 03:'
          FocusControl = dbPrazo03
        end
        object lblPrazo04: TLabel [5]
          Left = 304
          Top = 64
          Width = 46
          Height = 13
          Caption = 'Prazo 04:'
          FocusControl = dbPrazo04
        end
        object lblPrazo05: TLabel [6]
          Left = 376
          Top = 64
          Width = 46
          Height = 13
          Caption = 'Prazo 05:'
          FocusControl = dbPrazo05
        end
        object lblPrazo06: TLabel [7]
          Left = 448
          Top = 64
          Width = 46
          Height = 13
          Caption = 'Prazo 06:'
          FocusControl = dbPrazo06
        end
        object lblPrazo07: TLabel [8]
          Left = 88
          Top = 104
          Width = 46
          Height = 13
          Caption = 'Prazo 07:'
          FocusControl = dbPrazo07
        end
        object lblPrazo08: TLabel [9]
          Left = 160
          Top = 104
          Width = 46
          Height = 13
          Caption = 'Prazo 08:'
          FocusControl = dbPrazo08
        end
        object lblPrazo09: TLabel [10]
          Left = 232
          Top = 104
          Width = 46
          Height = 13
          Caption = 'Prazo 09:'
          FocusControl = dbPrazo09
        end
        object lblPrazo10: TLabel [11]
          Left = 304
          Top = 104
          Width = 46
          Height = 13
          Caption = 'Prazo 10:'
          FocusControl = dbPrazo10
        end
        object lblPrazo11: TLabel [12]
          Left = 376
          Top = 104
          Width = 46
          Height = 13
          Caption = 'Prazo 11:'
          FocusControl = dbPrazo11
        end
        object lblPrazo12: TLabel [13]
          Left = 448
          Top = 104
          Width = 46
          Height = 13
          Caption = 'Prazo 12:'
          FocusControl = dbPrazo12
        end
        inherited dbCodigo: TDBEdit
          TabStop = False
          Color = clMoneyGreen
          DataField = 'COND_COD'
        end
        object dbNome: TDBEdit
          Left = 88
          Top = 40
          Width = 425
          Height = 21
          CharCase = ecUpperCase
          DataField = 'COND_DESCRICAO'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object dbPrazo: TDBCheckBox
          Left = 520
          Top = 40
          Width = 73
          Height = 17
          Caption = 'A Prazo'
          DataField = 'COND_PRAZO'
          DataSource = DtSrcTabela
          TabOrder = 2
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbPrazo01: TDBEdit
          Left = 88
          Top = 80
          Width = 65
          Height = 21
          CharCase = ecUpperCase
          DataField = 'COND_PRAZO_01'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object dbPrazo02: TDBEdit
          Left = 160
          Top = 80
          Width = 65
          Height = 21
          CharCase = ecUpperCase
          DataField = 'COND_PRAZO_02'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
        object dbPrazo03: TDBEdit
          Left = 232
          Top = 80
          Width = 65
          Height = 21
          CharCase = ecUpperCase
          DataField = 'COND_PRAZO_03'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
        object dbPrazo04: TDBEdit
          Left = 304
          Top = 80
          Width = 65
          Height = 21
          CharCase = ecUpperCase
          DataField = 'COND_PRAZO_04'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
        end
        object dbPrazo05: TDBEdit
          Left = 376
          Top = 80
          Width = 65
          Height = 21
          CharCase = ecUpperCase
          DataField = 'COND_PRAZO_05'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
        end
        object dbPrazo06: TDBEdit
          Left = 448
          Top = 80
          Width = 65
          Height = 21
          CharCase = ecUpperCase
          DataField = 'COND_PRAZO_06'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
        end
        object dbPrazo07: TDBEdit
          Left = 88
          Top = 120
          Width = 65
          Height = 21
          CharCase = ecUpperCase
          DataField = 'COND_PRAZO_07'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
        end
        object dbPrazo08: TDBEdit
          Left = 160
          Top = 120
          Width = 65
          Height = 21
          CharCase = ecUpperCase
          DataField = 'COND_PRAZO_08'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
        end
        object dbPrazo09: TDBEdit
          Left = 232
          Top = 120
          Width = 65
          Height = 21
          CharCase = ecUpperCase
          DataField = 'COND_PRAZO_09'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 11
        end
        object dbPrazo10: TDBEdit
          Left = 304
          Top = 120
          Width = 65
          Height = 21
          CharCase = ecUpperCase
          DataField = 'COND_PRAZO_10'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 12
        end
        object dbPrazo11: TDBEdit
          Left = 376
          Top = 120
          Width = 65
          Height = 21
          CharCase = ecUpperCase
          DataField = 'COND_PRAZO_11'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 13
        end
        object dbPrazo12: TDBEdit
          Left = 448
          Top = 120
          Width = 65
          Height = 21
          CharCase = ecUpperCase
          DataField = 'COND_PRAZO_12'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 14
        end
        object dbCondicaoPagtoPDV: TDBCheckBox
          Left = 88
          Top = 152
          Width = 225
          Height = 17
          Caption = 'Usar Condi'#231#227'o de Pagamento no PDV'
          DataField = 'COND_PDV'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 15
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbAtiva: TDBCheckBox
          Left = 448
          Top = 152
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
          TabOrder = 16
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
      object pnlFormaPagto: TPanel
        Left = 0
        Top = 189
        Width = 727
        Height = 223
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        ExplicitHeight = 140
        object pnlDicas: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 171
          Width = 721
          Height = 49
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 0
          ExplicitTop = 88
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
              'Pressione a tecla "Espa'#231'o" para marcar o desmarcar a Forma de Pa' +
              'gamento selecionada. E atente para o fato de que a forma de paga' +
              'mento marcada est'#225' relacionada a condi'#231#227'o de pagamento em quest'#227 +
              'o para todas as movimenta'#231#245'es financeiras no sistema.'
            Font.Charset = ANSI_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
            WordWrap = True
            ExplicitWidth = 673
            ExplicitHeight = 39
          end
        end
        object dbgFormaPagto: TDBGrid
          Left = 0
          Top = 0
          Width = 727
          Height = 168
          Hint = 
            'Dica:'#13#10#13#10'Pressione a tecla "Espa'#231'o" para marcar o desmarcar a Fo' +
            'rma de Pagamento'#13#10'selecionada. E atente para o fato de que a for' +
            'ma de pagamento marcada est'#225#13#10'relacionada a condi'#231#227'o de pagament' +
            'o em quest'#227'o.'
          Align = alClient
          DataSource = dtsFormaPagto
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
          OnDblClick = dbgFormaPagtoDblClick
          OnKeyDown = dbgFormaPagtoKeyDown
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
              Title.Alignment = taCenter
              Title.Caption = 'C'#243'digo'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'descricao'
              Title.Caption = 'Forma de Pagamento '
              Width = 400
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'pdv'
              Title.Alignment = taCenter
              Title.Caption = 'PDV'
              Width = 30
              Visible = True
            end>
        end
      end
    end
  end
  inherited tlbBotoes: TPanel
    Top = 445
  end
  inherited DtSrcTabela: TDataSource
    OnDataChange = DtSrcTabelaDataChange
    Left = 664
    Top = 16
  end
  inherited ImgList: TImageList
    Top = 16
  end
  object dtsFormaPagto: TDataSource
    DataSet = cdsFormaPagto
    Left = 592
    Top = 232
  end
  object cdsFormaPagto: TClientDataSet
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
        Name = 'pdv'
        DataType = ftString
        Size = 5
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 556
    Top = 233
  end
end
