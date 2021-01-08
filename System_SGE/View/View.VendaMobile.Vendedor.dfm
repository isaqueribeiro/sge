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
        object pnlMessageIcon: TPanel
          Left = 0
          Top = 0
          Width = 81
          Height = 81
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
        end
        object pnlMessageButton: TPanel
          AlignWithMargins = True
          Left = 770
          Top = 3
          Width = 38
          Height = 75
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 1
          ExplicitLeft = 773
          ExplicitTop = 0
          ExplicitHeight = 81
          object pnlBtnClose: TPanel
            AlignWithMargins = True
            Left = 3
            Top = 5
            Width = 32
            Height = 32
            Margins.Top = 5
            Align = alTop
            BevelOuter = bvNone
            Color = 11503390
            ParentBackground = False
            TabOrder = 0
            ExplicitTop = 8
            object shpBtnClose: TShape
              Left = 2
              Top = 2
              Width = 29
              Height = 29
              Pen.Style = psClear
              Shape = stRoundRect
              Visible = False
            end
            object imgBtnClose: TImage
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 26
              Height = 26
              Align = alClient
              Center = True
              Picture.Data = {
                0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000018
                0000001808040000004A7EF5730000000467414D410000B18F0BFC6105000000
                206348524D00007A26000080840000FA00000080E8000075300000EA6000003A
                98000017709CBA513C00000002624B47440000AA8D2332000000097048597300
                000EC400000EC401952B0E1B0000000774494D4507E5010716131449747BB500
                0000E24944415438CB9D94B191C2301045BF4D24DAB802A01C32C828E3803630
                21A50045E061AE00935FE0F523008C25C0486CA699F7A4FD2B8D24316445494D
                5FD5942C7192187220B6F638B18AC6011619A57E145F6546AD4182601924E092
                F2607DD6464DBB6AB4D13920BC481523892906803193185175115F58DF369961
                575C9258BF178C69ABDCF1FB792F0568987B0D4FC217100A9EF28C43382509FD
                F7CE35D8A04D11D79275A23EE2F7842E3A93794CAC782F548CD32E0E2A8A4E0B
                46E1E3F0C5E3B324DE72FD2509A75CDB24612B1C7B626B77FD371C0B8E1FBF99
                23BF38E902F465638AD033BABA0000002574455874646174653A637265617465
                00323032312D30312D30375432323A31393A32302B30303A3030CF23F88E0000
                002574455874646174653A6D6F6469667900323032312D30312D30375432323A
                31393A32302B30303A3030BE7E40320000001974455874536F66747761726500
                7777772E696E6B73636170652E6F72679BEE3C1A0000000049454E44AE426082}
              OnMouseEnter = imgBtnCloseMouseEnter
              OnMouseLeave = imgBtnCloseMouseLeave
              ExplicitLeft = 0
              ExplicitTop = -2
            end
          end
        end
        object pnlMessageText: TPanel
          Left = 81
          Top = 0
          Width = 686
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
            Width = 680
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
        ExplicitTop = 84
      end
    end
  end
end
