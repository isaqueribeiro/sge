object ViewCertificado: TViewCertificado
  Left = 0
  Top = 0
  ActiveControl = stgCertificado
  BorderStyle = bsToolWindow
  BorderWidth = 4
  Caption = 'Selecionar Certificado'
  ClientHeight = 244
  ClientWidth = 668
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnlControle: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 196
    Width = 662
    Height = 45
    Margins.Top = 0
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitLeft = 0
    ExplicitTop = 199
    ExplicitWidth = 619
    object btnCancelar: TBitBtn
      AlignWithMargins = True
      Left = 574
      Top = 3
      Width = 88
      Height = 32
      Margins.Right = 0
      Margins.Bottom = 10
      Align = alRight
      Caption = 'Cancelar'
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
      ExplicitLeft = 531
      ExplicitTop = 6
      ExplicitHeight = 30
    end
    object btnOk: TBitBtn
      AlignWithMargins = True
      Left = 483
      Top = 3
      Width = 88
      Height = 32
      Margins.Right = 0
      Margins.Bottom = 10
      Align = alRight
      Kind = bkOK
      NumGlyphs = 2
      TabOrder = 0
      ExplicitLeft = 437
      ExplicitTop = 6
      ExplicitHeight = 30
    end
  end
  object stgCertificado: TStringGrid
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 662
    Height = 190
    Align = alClient
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goColSizing]
    TabOrder = 0
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 619
    ExplicitHeight = 199
    ColWidths = (
      64
      64
      64
      64
      64)
    RowHeights = (
      24
      24)
  end
end
