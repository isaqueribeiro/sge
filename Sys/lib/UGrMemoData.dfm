inherited frmGrMemoData: TfrmGrMemoData
  ActiveControl = edData
  Caption = '  Observa'#231#227'o'
  ExplicitWidth = 555
  ExplicitHeight = 332
  PixelsPerInch = 96
  TextHeight = 13
  object lblObservacao: TLabel [2]
    AlignWithMargins = True
    Left = 3
    Top = 43
    Width = 543
    Height = 13
    Align = alTop
    Caption = 'Observa'#231#245'es'
    FocusControl = edData
    Visible = False
    ExplicitWidth = 63
  end
  inherited edObservacao: TMemo
    Top = 59
    Height = 201
    TabOrder = 1
    ExplicitTop = 59
    ExplicitHeight = 201
  end
  inherited tlbBotoes: TPanel
    TabOrder = 2
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
      Left = 16
      Top = 13
      Width = 105
      Height = 13
      Caption = 'Data . . . . . . . . . . . . :'
      FocusControl = edData
    end
    object edData: TJvDateEdit
      AlignWithMargins = True
      Left = 128
      Top = 10
      Width = 113
      Height = 21
      ShowNullDate = False
      TabOrder = 0
    end
  end
end
