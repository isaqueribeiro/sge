inherited ViewVendaMobileVendedor: TViewVendaMobileVendedor
  Caption = 'ViewVendaMobileVendedor'
  ClientHeight = 447
  ClientWidth = 811
  Color = 16515018
  ExplicitWidth = 827
  ExplicitHeight = 486
  PixelsPerInch = 96
  TextHeight = 13
  object pnlContent: TPanel
    Left = 0
    Top = 0
    Width = 811
    Height = 447
    Align = alClient
    BevelOuter = bvNone
    FullRepaint = False
    ParentBackground = False
    ParentColor = True
    TabOrder = 0
    StyleElements = []
    object pnlHeader: TPanel
      Left = 0
      Top = 0
      Width = 811
      Height = 50
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object lblMenu: TLabel
        AlignWithMargins = True
        Left = 15
        Top = 12
        Width = 88
        Height = 26
        Margins.Left = 15
        Margins.Top = 12
        Margins.Bottom = 12
        Align = alLeft
        Caption = 'Sincronizar /'
        Font.Charset = ANSI_CHARSET
        Font.Color = 1848330
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        StyleElements = []
        ExplicitHeight = 21
      end
      object lblEtata: TLabel
        AlignWithMargins = True
        Left = 201
        Top = 12
        Width = 64
        Height = 26
        Margins.Left = 0
        Margins.Top = 12
        Margins.Bottom = 12
        Align = alLeft
        Caption = 'Etapa . . .'
        Font.Charset = ANSI_CHARSET
        Font.Color = 1848330
        Font.Height = -16
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
        StyleElements = []
        ExplicitLeft = 211
        ExplicitHeight = 21
      end
      object lblRotina: TLabel
        AlignWithMargins = True
        Left = 106
        Top = 12
        Width = 92
        Height = 26
        Margins.Left = 0
        Margins.Top = 12
        Margins.Bottom = 12
        Align = alLeft
        Caption = 'Vendedores /'
        Font.Charset = ANSI_CHARSET
        Font.Color = 1848330
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        StyleElements = []
        ExplicitHeight = 21
      end
    end
    object pnlFooter: TPanel
      Left = 0
      Top = 397
      Width = 811
      Height = 50
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
    end
    object pnlBody: TPanel
      Left = 0
      Top = 50
      Width = 811
      Height = 347
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      ExplicitLeft = 120
      ExplicitTop = 152
      ExplicitWidth = 281
      ExplicitHeight = 121
      object pnlMessage: TPanel
        Left = 0
        Top = 0
        Width = 811
        Height = 81
        Align = alTop
        BevelOuter = bvNone
        Color = 11503390
        ParentBackground = False
        TabOrder = 0
        ExplicitTop = 3
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 81
          Height = 81
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
        end
        object Panel3: TPanel
          Left = 773
          Top = 0
          Width = 38
          Height = 81
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 1
          object pnlBtnClose: TPanel
            AlignWithMargins = True
            Left = 3
            Top = 5
            Width = 32
            Height = 32
            Margins.Top = 5
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            ExplicitTop = 8
          end
        end
        object Panel4: TPanel
          Left = 81
          Top = 0
          Width = 692
          Height = 81
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 2
          ExplicitLeft = 8
          ExplicitWidth = 81
          object Label1: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 5
            Width = 686
            Height = 66
            Margins.Top = 5
            Margins.Bottom = 10
            Align = alClient
            Caption = 
              'Lorem ipsum interdum nunc tortor nibh porttitor vehicula, vivamu' +
              's vestibulum egestas elementum mi duis egestas donec, metus netu' +
              's nam ipsum ut suscipit. velit suscipit luctus diam netus, ipsum' +
              ' inceptos interdum.'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            WordWrap = True
            StyleElements = []
            ExplicitTop = 10
            ExplicitWidth = 625
            ExplicitHeight = 63
          end
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 81
        Width = 811
        Height = 266
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        ExplicitLeft = 72
        ExplicitTop = 104
        ExplicitWidth = 281
        ExplicitHeight = 121
      end
    end
  end
end
