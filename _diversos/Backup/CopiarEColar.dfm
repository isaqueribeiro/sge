object frmCopiarEColar: TfrmCopiarEColar
  Left = 359
  Top = 229
  AutoSize = True
  BorderStyle = bsDialog
  ClientHeight = 100
  ClientWidth = 553
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 553
    Height = 48
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 6
      Top = 4
      Width = 128
      Height = 16
      Caption = 'Selecione um arquivo:'
    end
    object btnPesquisar: TSpeedButton
      Left = 514
      Top = 21
      Width = 29
      Height = 26
      Caption = '...'
      OnClick = btnPesquisarClick
    end
    object ButtonEditArquivo: TEdit
      Left = 8
      Top = 22
      Width = 502
      Height = 24
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 48
    Width = 553
    Height = 23
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    Visible = False
    object ProgressBar1: TProgressBar
      Left = 7
      Top = 3
      Width = 537
      Height = 16
      TabOrder = 0
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 71
    Width = 553
    Height = 29
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object btnOk: TBitBtn
      Left = 207
      Top = 1
      Width = 85
      Height = 25
      Caption = '&Ok'
      TabOrder = 0
      OnClick = btnOkClick
    end
    object BitBtn1: TBitBtn
      Left = 297
      Top = 0
      Width = 77
      Height = 26
      Cancel = True
      Caption = '&Cancelar'
      TabOrder = 1
      OnClick = BitBtn1Click
    end
  end
  object OpenDialogArquivo: TOpenDialog
    OnShow = OpenDialogArquivoShow
    DefaultExt = 'ZLB'
    Filter = 'Arquivo ZLB|*.ZLB'
    Left = 120
    Top = 45
  end
end
