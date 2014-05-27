object FrmGrGerarLicenca: TFrmGrGerarLicenca
  Left = 475
  Top = 203
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Gerar Licen'#231'a'
  ClientHeight = 359
  ClientWidth = 776
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 17
  object lblEmpresa: TLabel
    Left = 99
    Top = 52
    Width = 54
    Height = 17
    Alignment = taRightJustify
    Caption = 'Empresa:'
    FocusControl = edEmpresa
    Transparent = True
  end
  object lblCGC: TLabel
    Left = 82
    Top = 84
    Width = 71
    Height = 17
    Alignment = taRightJustify
    Caption = 'CGC / CNPJ:'
    FocusControl = edCGC
    Transparent = True
  end
  object lblEndereco: TLabel
    Left = 95
    Top = 116
    Width = 58
    Height = 17
    Alignment = taRightJustify
    Caption = 'Endere'#231'o:'
    FocusControl = edEndereco
    Transparent = True
  end
  object lblBairro: TLabel
    Left = 115
    Top = 148
    Width = 38
    Height = 17
    Alignment = taRightJustify
    Caption = 'Bairro:'
    FocusControl = edBairro
    Transparent = True
  end
  object lblCidade: TLabel
    Left = 421
    Top = 148
    Width = 44
    Height = 17
    Alignment = taRightJustify
    Caption = 'Cidade:'
    FocusControl = edCidade
    Transparent = True
  end
  object lblUF: TLabel
    Left = 655
    Top = 148
    Width = 18
    Height = 17
    Alignment = taRightJustify
    Caption = 'UF:'
    FocusControl = edUF
    Transparent = True
  end
  object lblCEP: TLabel
    Left = 128
    Top = 180
    Width = 25
    Height = 17
    Alignment = taRightJustify
    Caption = 'CEP:'
    FocusControl = edCEP
    Transparent = True
  end
  object lblCompetencia: TLabel
    Left = 26
    Top = 212
    Width = 127
    Height = 17
    Alignment = taRightJustify
    Caption = 'Compet'#234'ncia Limite:'
    FocusControl = edCompetencia
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label7: TLabel
    Left = 288
    Top = 212
    Width = 284
    Height = 17
    Caption = 'Formato YYYYMM (Ano, M'#234's) - Exemplo: 201401'
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lblDataBloqueio: TLabel
    Left = 61
    Top = 244
    Width = 92
    Height = 17
    Alignment = taRightJustify
    Caption = 'Data Bloqueio:'
    Enabled = False
    FocusControl = edDataBloqueio
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object edEmpresa: TEdit
    Left = 160
    Top = 48
    Width = 569
    Height = 25
    CharCase = ecUpperCase
    TabOrder = 0
  end
  object edCGC: TEdit
    Left = 160
    Top = 80
    Width = 193
    Height = 25
    TabOrder = 1
  end
  object edEndereco: TEdit
    Left = 160
    Top = 112
    Width = 569
    Height = 25
    TabOrder = 2
  end
  object edBairro: TEdit
    Left = 160
    Top = 144
    Width = 249
    Height = 25
    TabOrder = 3
  end
  object edCidade: TEdit
    Left = 472
    Top = 144
    Width = 169
    Height = 25
    TabOrder = 4
  end
  object edUF: TEdit
    Left = 680
    Top = 144
    Width = 49
    Height = 25
    TabOrder = 5
  end
  object edCEP: TEdit
    Left = 160
    Top = 176
    Width = 121
    Height = 25
    TabOrder = 6
  end
  object edCompetencia: TEdit
    Left = 160
    Top = 208
    Width = 121
    Height = 25
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnChange = edCompetenciaChange
  end
  object BtnCarregarLicenca: TButton
    Left = 152
    Top = 304
    Width = 129
    Height = 41
    Caption = 'Carregar Licen'#231'a'
    TabOrder = 9
    OnClick = BtnCarregarLicencaClick
  end
  object BtnGerarLicenca: TButton
    Left = 288
    Top = 304
    Width = 129
    Height = 41
    Caption = 'Gerar Licen'#231'a'
    TabOrder = 10
    OnClick = BtnGerarLicencaClick
  end
  object edDataBloqueio: TEdit
    Left = 160
    Top = 240
    Width = 121
    Height = 25
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 8
  end
  object XPManifest: TXPManifest
    Left = 8
    Top = 8
  end
  object opdLicenca: TOpenDialog
    Filter = 'Arquivo Licen'#231'a (*.lnc)|*.lnc'
    Title = 'Carregar arquivo Licen'#231'a'
    Left = 432
    Top = 256
  end
end
