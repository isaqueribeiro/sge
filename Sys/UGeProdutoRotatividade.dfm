inherited FrmGeProdutoRotatividade: TFrmGeProdutoRotatividade
  Left = 436
  Top = 192
  Width = 1131
  Height = 717
  Caption = 'Consultar Rotatividade'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlPesquisa: TPanel
    Width = 1115
    inherited GrpBxTipoPesquisa: TGroupBox
      Caption = 'Tipo'
      inherited lblTipoPesquisa: TLabel
        Width = 117
        Caption = '&Tipo de rotatividade:'
      end
      inherited edTipoPesquisa: TComboBox
        Text = 'Por Produto'
        Items.Strings = (
          'Por Produto'
          'Por Grupo'
          'Por Fornecedor')
      end
    end
    inherited GrpBxPesquisar: TGroupBox
      Width = 887
      inherited BrnPesquisar: TSpeedButton
        Left = 850
      end
      inherited lblPesquisar: TLabel
        Left = 240
      end
      object lblData: TLabel [2]
        Left = 16
        Top = 24
        Width = 105
        Height = 13
        Caption = 'Per'#237'odo inicial fixo:'
        FocusControl = e1Data
      end
      inherited edPesquisar: TEdit
        Left = 240
        Width = 603
        TabOrder = 2
      end
      object e1Data: TDateEdit
        Left = 16
        Top = 40
        Width = 104
        Height = 21
        NumGlyphs = 2
        ReadOnly = True
        TabOrder = 0
        Text = '24/06/2013'
      end
      object e2Data: TDateEdit
        Left = 128
        Top = 40
        Width = 105
        Height = 21
        NumGlyphs = 2
        TabOrder = 1
        Text = '24/06/2013'
        OnChange = e2DataChange
      end
    end
  end
  inherited PnlTabela: TPanel
    Width = 1115
    Height = 598
    inherited dbgDados: TDBGrid
      Width = 1107
      Height = 590
    end
  end
end
