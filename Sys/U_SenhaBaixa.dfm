object f_senhaBaixa: Tf_senhaBaixa
  Left = 447
  Top = 287
  Width = 272
  Height = 119
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSizeToolWin
  Caption = 'Seguran'#231'a - Baixas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 20
    Top = 16
    Width = 34
    Height = 13
    Caption = 'Senha:'
  end
  object BitBtn1: TBitBtn
    Left = 112
    Top = 40
    Width = 59
    Height = 25
    TabOrder = 0
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object Edit1: TEdit
    Left = 60
    Top = 10
    Width = 113
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
  end
end
