inherited ViewVendaMobileConfigurar: TViewVendaMobileConfigurar
  Caption = 'ViewVendaMobileConfigurar'
  ClientHeight = 464
  ClientWidth = 828
  Color = 16515018
  ExplicitWidth = 844
  ExplicitHeight = 503
  PixelsPerInch = 96
  TextHeight = 13
  object pnlContent: TPanel
    Left = 0
    Top = 0
    Width = 828
    Height = 464
    Align = alClient
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 0
    ExplicitLeft = 160
    ExplicitTop = 40
    ExplicitWidth = 281
    ExplicitHeight = 121
    object pnlHeader: TPanel
      Left = 0
      Top = 0
      Width = 828
      Height = 50
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitTop = 8
      ExplicitWidth = 539
      object lblMenu: TLabel
        AlignWithMargins = True
        Left = 15
        Top = 12
        Width = 90
        Height = 26
        Margins.Left = 15
        Margins.Top = 12
        Margins.Bottom = 12
        Align = alLeft
        Caption = 'Configurar >'
        Font.Charset = ANSI_CHARSET
        Font.Color = 1848330
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ExplicitHeight = 21
      end
      object lblEtata: TLabel
        AlignWithMargins = True
        Left = 185
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
        ExplicitLeft = 211
        ExplicitHeight = 21
      end
      object lblRotina: TLabel
        AlignWithMargins = True
        Left = 108
        Top = 12
        Width = 74
        Height = 26
        Margins.Left = 0
        Margins.Top = 12
        Margins.Bottom = 12
        Align = alLeft
        Caption = 'Servidor >'
        Font.Charset = ANSI_CHARSET
        Font.Color = 1848330
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 111
        ExplicitHeight = 21
      end
    end
    object pnlFooter: TPanel
      Left = 0
      Top = 414
      Width = 828
      Height = 50
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitTop = 397
      ExplicitWidth = 811
    end
  end
end
