inherited ViewVendaMobileConfigurarChave: TViewVendaMobileConfigurarChave
  Caption = 'ViewVendaMobileConfigurarChave'
  ClientHeight = 286
  ClientWidth = 549
  Color = clWhite
  Font.Color = 1848330
  Font.Height = -16
  Font.Name = 'Segoe UI'
  ExplicitWidth = 565
  ExplicitHeight = 325
  PixelsPerInch = 96
  TextHeight = 21
  object pnlContent: TPanel
    Left = 0
    Top = 0
    Width = 549
    Height = 286
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object pnlHeader: TPanel
      Left = 0
      Top = 0
      Width = 549
      Height = 60
      Align = alTop
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      object lblTitle: TLabel
        AlignWithMargins = True
        Left = 10
        Top = 12
        Width = 225
        Height = 30
        Margins.Left = 10
        Caption = 'Chave de acesso da API'
        Font.Charset = ANSI_CHARSET
        Font.Color = 1848330
        Font.Height = -21
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
        StyleElements = []
      end
      object pnlSalvar: TPanel
        AlignWithMargins = True
        Left = 340
        Top = 15
        Width = 97
        Height = 30
        BevelOuter = bvNone
        Color = 1848330
        ParentBackground = False
        TabOrder = 0
        object shpSalvar: TShape
          Left = 0
          Top = 0
          Width = 97
          Height = 30
          Brush.Color = 1848330
          Pen.Color = 1848330
        end
        object lblSalvar: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 91
          Height = 24
          Align = alClient
          Alignment = taCenter
          Caption = 'Salvar'
          Color = 1848330
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          StyleElements = []
          OnClick = lblSalvarClick
          OnMouseEnter = LabelMouseEnter
          OnMouseLeave = LabelMouseLeave
          ExplicitWidth = 43
          ExplicitHeight = 21
        end
      end
      object pnlFechar: TPanel
        AlignWithMargins = True
        Left = 440
        Top = 15
        Width = 97
        Height = 30
        BevelOuter = bvNone
        Color = 1848330
        ParentBackground = False
        TabOrder = 1
        object shpFechar: TShape
          Left = 0
          Top = 0
          Width = 97
          Height = 30
          Brush.Color = 1848330
          Pen.Color = 1848330
        end
        object lblFechar: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 91
          Height = 24
          Align = alClient
          Alignment = taCenter
          Caption = 'Fechar'
          Color = 1848330
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          StyleElements = []
          OnClick = lblFecharClick
          OnMouseEnter = LabelMouseEnter
          OnMouseLeave = LabelMouseLeave
          ExplicitWidth = 46
          ExplicitHeight = 21
        end
      end
    end
    object pnlBody: TPanel
      Left = 0
      Top = 60
      Width = 549
      Height = 226
      Align = alClient
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
      object lblTipoChave: TLabel
        Left = 10
        Top = 6
        Width = 30
        Height = 21
        Caption = 'Tipo'
        StyleElements = []
      end
      object lblValorChave: TLabel
        Left = 10
        Top = 68
        Width = 101
        Height = 21
        Caption = 'Valor da chave'
        StyleElements = []
      end
      object cmbTipoChave: TComboBox
        Left = 10
        Top = 33
        Width = 527
        Height = 29
        TabOrder = 0
        StyleElements = []
      end
      object edtValorChave: TEdit
        Left = 10
        Top = 95
        Width = 527
        Height = 29
        TabOrder = 1
        StyleElements = []
      end
    end
  end
end
