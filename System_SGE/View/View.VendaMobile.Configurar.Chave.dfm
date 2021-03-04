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
        Top = 14
        Width = 205
        Height = 25
        Margins.Left = 10
        Caption = 'Chave de acesso da API'
        Font.Charset = ANSI_CHARSET
        Font.Color = 1848330
        Font.Height = -19
        Font.Name = 'Segoe UI'
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
          Top = 5
          Width = 91
          Height = 22
          Margins.Top = 5
          Align = alClient
          Alignment = taCenter
          Caption = 'Salvar'
          Color = 1848330
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          StyleElements = []
          OnClick = lblSalvarClick
          OnMouseEnter = LabelMouseEnter
          OnMouseLeave = LabelMouseLeave
          ExplicitWidth = 35
          ExplicitHeight = 17
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
          Top = 5
          Width = 91
          Height = 22
          Margins.Top = 5
          Align = alClient
          Alignment = taCenter
          Caption = 'Fechar'
          Color = 1848330
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          StyleElements = []
          OnClick = lblFecharClick
          OnMouseEnter = LabelMouseEnter
          OnMouseLeave = LabelMouseLeave
          ExplicitWidth = 38
          ExplicitHeight = 17
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
        Width = 26
        Height = 17
        Caption = 'Tipo'
        Font.Charset = ANSI_CHARSET
        Font.Color = 1848330
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        StyleElements = []
      end
      object lblValorChave: TLabel
        Left = 10
        Top = 60
        Width = 86
        Height = 17
        Caption = 'Valor da chave'
        Font.Charset = ANSI_CHARSET
        Font.Color = 1848330
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        StyleElements = []
      end
      object cmbTipoChave: TComboBox
        Left = 10
        Top = 29
        Width = 527
        Height = 25
        Style = csDropDownList
        Font.Charset = ANSI_CHARSET
        Font.Color = 1848330
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        StyleElements = []
      end
      object edtValorChave: TEdit
        Left = 10
        Top = 83
        Width = 527
        Height = 25
        Font.Charset = ANSI_CHARSET
        Font.Color = 1848330
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        StyleElements = []
      end
    end
  end
end
