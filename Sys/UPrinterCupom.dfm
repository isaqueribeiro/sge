object frmPrinterCupom: TfrmPrinterCupom
  Left = 0
  Top = 0
  ActiveControl = btnImprimirCupom
  BorderStyle = bsDialog
  Caption = 'Printer Cupom'
  ClientHeight = 150
  ClientWidth = 361
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblEmpresa: TLabel
    Left = 16
    Top = 8
    Width = 41
    Height = 13
    Caption = 'Empresa'
    FocusControl = edEmpresa
  end
  object lblCliente: TLabel
    Left = 143
    Top = 8
    Width = 33
    Height = 13
    Caption = 'Cliente'
    FocusControl = edCliente
  end
  object lblDataHora: TLabel
    Left = 230
    Top = 8
    Width = 50
    Height = 13
    Caption = 'Data/Hora'
    FocusControl = edDataHora
  end
  object lblAno: TLabel
    Left = 16
    Top = 56
    Width = 59
    Height = 13
    Caption = 'Venda - Ano'
    FocusControl = edAno
  end
  object lblControle: TLabel
    Left = 111
    Top = 56
    Width = 81
    Height = 13
    Caption = 'Venda - Controle'
    FocusControl = edControle
  end
  object edEmpresa: TEdit
    Left = 16
    Top = 27
    Width = 121
    Height = 21
    TabOrder = 0
    Text = '17327623000176'
  end
  object edCliente: TEdit
    Left = 143
    Top = 27
    Width = 81
    Height = 21
    TabOrder = 1
    Text = '14'
  end
  object edDataHora: TEdit
    Left = 230
    Top = 27
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object edAno: TEdit
    Left = 16
    Top = 75
    Width = 89
    Height = 21
    TabOrder = 3
    Text = '2020'
    TextHint = '2015'
  end
  object edControle: TEdit
    Left = 111
    Top = 75
    Width = 121
    Height = 21
    TabOrder = 4
    Text = '11'
    TextHint = '11838'
  end
  object btnImprimirCupom: TButton
    Left = 16
    Top = 102
    Width = 337
    Height = 40
    Caption = 'Confirmar Impress'#227'o Cupom'
    TabOrder = 5
    OnClick = btnImprimirCupomClick
  end
  object edBlocoImpressaoCupom: TComboBox
    Left = 238
    Top = 75
    Width = 115
    Height = 21
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 6
    Text = 'Cupom + RG'
    Items.Strings = (
      'Cupom + RG'
      'Cupom'
      'RG')
  end
end
