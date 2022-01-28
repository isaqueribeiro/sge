inherited ViewMemoData: TViewMemoData
  ActiveControl = edData
  Caption = '  Observa'#231#227'o'
  PixelsPerInch = 96
  TextHeight = 13
  object lblObservacao: TLabel [2]
    AlignWithMargins = True
    Left = 10
    Top = 40
    Width = 536
    Height = 13
    Margins.Left = 10
    Margins.Top = 0
    Align = alTop
    Caption = 'Observa'#231#245'es'
    FocusControl = edData
    Visible = False
    ExplicitWidth = 63
  end
  inherited edObservacao: TMemo
    Left = 10
    Top = 60
    Width = 529
    Height = 200
    Margins.Left = 10
    Margins.Right = 10
    TabOrder = 1
    ExplicitLeft = 10
    ExplicitTop = 60
    ExplicitWidth = 529
    ExplicitHeight = 200
  end
  inherited tlbBotoes: TPanel
    TabOrder = 2
    inherited Bevel2: TBevel
      Left = 442
      ExplicitLeft = 442
    end
    inherited bvlTool4: TBevel
      Left = 539
      Width = 10
      ExplicitLeft = 545
      ExplicitWidth = 10
    end
    inherited BtnConfirmar: TcxButton
      Left = 349
      ExplicitLeft = 349
    end
    inherited BtnCancelar: TcxButton
      Left = 446
      ExplicitLeft = 446
    end
  end
  object pnlData: TPanel
    Left = 0
    Top = 0
    Width = 549
    Height = 40
    Align = alTop
    BevelOuter = bvNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object lblData: TLabel
      AlignWithMargins = True
      Left = 10
      Top = 9
      Width = 105
      Height = 21
      Margins.Left = 10
      Margins.Top = 9
      Margins.Bottom = 10
      Align = alLeft
      Caption = 'Data . . . . . . . . . . . . :'
      FocusControl = edData
      Layout = tlCenter
      ExplicitHeight = 13
    end
    object edData: TJvDateEdit
      AlignWithMargins = True
      Left = 121
      Top = 9
      Width = 113
      Height = 21
      Margins.Top = 9
      Margins.Bottom = 10
      Align = alLeft
      ShowNullDate = False
      TabOrder = 0
    end
  end
end
