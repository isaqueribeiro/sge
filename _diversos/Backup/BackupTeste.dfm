object frmBackupTeste: TfrmBackupTeste
  Left = 268
  Top = 149
  Caption = 'TESTA A COMPACTA'#199#195'O/DESCOMPACTA'#199#195'O DE ARQUIVOS .ZLIB ...'
  ClientHeight = 502
  ClientWidth = 767
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 184
    Width = 41
    Height = 18
    Caption = 'Label1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 32
    Top = 256
    Width = 41
    Height = 18
    Caption = 'Label2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object btnCompact: TButton
    Left = 184
    Top = 432
    Width = 75
    Height = 25
    Caption = 'Compactar'
    TabOrder = 0
    OnClick = btnCompactClick
  end
  object btnDescompact: TButton
    Left = 288
    Top = 432
    Width = 89
    Height = 25
    Caption = 'Descompactar'
    TabOrder = 1
    OnClick = btnDescompactClick
  end
  object OpenDialog1: TOpenDialog
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofEnableSizing]
    Left = 336
    Top = 192
  end
end
