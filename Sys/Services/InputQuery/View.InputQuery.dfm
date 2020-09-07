object ViewInputQuery: TViewInputQuery
  Left = 0
  Top = 0
  ActiveControl = edtPrompt
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'InputQuery Form'
  ClientHeight = 133
  ClientWidth = 491
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  Padding.Left = 10
  Padding.Top = 10
  Padding.Right = 10
  Padding.Bottom = 10
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object lblPrompt: TLabel
    Left = 10
    Top = 10
    Width = 471
    Height = 54
    Align = alClient
    Caption = 
      'Texto do prompt.... texto do prompt... texto do prompt... texto ' +
      'do prompt... texto do prompt... texto do prompt... texto do prom' +
      'pt... texto do prompt... texto do prompt... texto do prompt... t' +
      'exto do prompt... texto do prompt... '
    WordWrap = True
    ExplicitWidth = 468
    ExplicitHeight = 48
  end
  object edtPrompt: TEdit
    Left = 10
    Top = 64
    Width = 471
    Height = 24
    Align = alBottom
    TabOrder = 0
    OnChange = edtPromptChange
    OnKeyPress = edtPromptKeyPress
  end
  object PanelButton: TPanel
    Left = 10
    Top = 88
    Width = 471
    Height = 35
    Align = alBottom
    BevelOuter = bvNone
    Padding.Top = 5
    TabOrder = 1
    object Bevel: TBevel
      Left = 388
      Top = 5
      Width = 3
      Height = 30
      Align = alRight
      Shape = bsSpacer
      ExplicitLeft = 389
    end
    object btnOk: TButton
      Left = 308
      Top = 5
      Width = 80
      Height = 30
      Align = alRight
      Caption = 'Ok'
      TabOrder = 0
      OnClick = btnOkClick
      ExplicitLeft = 199
      ExplicitTop = 6
    end
    object btnCancel: TButton
      Left = 391
      Top = 5
      Width = 80
      Height = 30
      Align = alRight
      Cancel = True
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = btnCancelClick
    end
  end
end
