object FormEncodeDecode: TFormEncodeDecode
  Left = 0
  Top = 0
  Caption = 'Encode and Decode'
  ClientHeight = 436
  ClientWidth = 902
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object edtCPF: TEdit
    Left = 136
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 0
    Text = '667.102.432-89'
  end
  object edtDataNascimento: TEdit
    Left = 263
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 1
    Text = '20/02/1980'
  end
  object edtEncode64: TEdit
    Left = 136
    Top = 67
    Width = 729
    Height = 21
    TabOrder = 2
  end
  object Button1: TButton
    Left = 55
    Top = 65
    Width = 75
    Height = 25
    Caption = 'Encode'
    TabOrder = 3
    OnClick = Button1Click
  end
  object edtHash: TEdit
    Left = 390
    Top = 40
    Width = 475
    Height = 21
    TabOrder = 4
  end
  object edtDecode64: TEdit
    Left = 136
    Top = 94
    Width = 729
    Height = 21
    TabOrder = 5
  end
  object Button2: TButton
    Left = 55
    Top = 92
    Width = 75
    Height = 25
    Caption = 'Decode'
    TabOrder = 6
    OnClick = Button2Click
  end
  object btnEncriptar: TButton
    Left = 55
    Top = 119
    Width = 75
    Height = 25
    Caption = 'Encriptar'
    TabOrder = 7
    OnClick = btnEncriptarClick
  end
  object edtEncrip: TMemo
    Left = 136
    Top = 121
    Width = 729
    Height = 89
    TabOrder = 8
  end
  object btnDecriptar: TButton
    Left = 55
    Top = 214
    Width = 75
    Height = 25
    Caption = 'Decriptar'
    TabOrder = 9
    OnClick = btnDecriptarClick
  end
  object edtDecript: TMemo
    Left = 136
    Top = 216
    Width = 729
    Height = 89
    TabOrder = 10
  end
end
