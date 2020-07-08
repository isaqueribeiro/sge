object FrmPadraoAbertura: TFrmPadraoAbertura
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'FrmPadraoAbertura'
  ClientHeight = 442
  ClientWidth = 694
  Color = 14150083
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  DesignSize = (
    694
    442)
  PixelsPerInch = 96
  TextHeight = 19
  object shapeMolduraIcone: TShape
    Left = 33
    Top = 33
    Width = 157
    Height = 182
    Pen.Color = 937000
    Pen.Width = 5
    Visible = False
  end
  object lblCopyright: TLabel
    Left = 33
    Top = 402
    Width = 498
    Height = 16
    Anchors = [akLeft, akBottom]
    Caption = 
      'Copyright '#169' 2019 '#193'gil Solu'#231#245'es em Softwares. Todos os direitos r' +
      'eservados.'
    Font.Charset = ANSI_CHARSET
    Font.Color = 937000
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
    ExplicitTop = 337
  end
  object lblVersion: TLabel
    Left = 33
    Top = 386
    Width = 314
    Height = 16
    Anchors = [akLeft, akBottom]
    Caption = 'Licenciado para ANGIOFLEX - Version 25.0.31059.3231'
    Font.Charset = ANSI_CHARSET
    Font.Color = 937000
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ExplicitTop = 321
  end
  object btnFechar: TSpeedButton
    Left = 660
    Top = 8
    Width = 26
    Height = 26
    Anchors = [akTop, akRight]
    Flat = True
    OnClick = FormFechar
  end
  object lblSystemName: TLabel
    Left = 196
    Top = 67
    Width = 174
    Height = 108
    Caption = 'SGO'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -96
    Font.Name = 'Bauhaus 93'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblSystemDescription: TLabel
    Left = 196
    Top = 157
    Width = 288
    Height = 18
    Caption = 'Sistema integrado para Gest'#227'o de OPMEs'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Bauhaus 93'
    Font.Style = []
    ParentFont = False
  end
end
