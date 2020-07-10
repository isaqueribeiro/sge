inherited FrmPadraoLogin: TFrmPadraoLogin
  ActiveControl = edtUsuario
  Caption = 'FrmPadraoLogin'
  ClientHeight = 458
  KeyPreview = True
  Position = poScreenCenter
  OnActivate = FormActivate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  ExplicitHeight = 458
  DesignSize = (
    694
    458)
  PixelsPerInch = 96
  TextHeight = 19
  inherited lblCopyright: TLabel
    Top = 418
    ExplicitTop = 418
  end
  inherited lblVersion: TLabel
    Top = 402
    ExplicitTop = 402
  end
  object lblUsuario: TLabel
    Left = 165
    Top = 236
    Width = 62
    Height = 19
    Alignment = taRightJustify
    Caption = '&Usu'#225'rio'
    FocusControl = edtUsuario
    Font.Charset = ANSI_CHARSET
    Font.Color = 937000
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblSenha: TLabel
    Left = 171
    Top = 269
    Width = 56
    Height = 19
    Alignment = taRightJustify
    Caption = '&Senha:'
    FocusControl = edtSenha
    Font.Charset = ANSI_CHARSET
    Font.Color = 937000
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblEmpresa: TLabel
    Left = 151
    Top = 302
    Width = 76
    Height = 19
    Alignment = taRightJustify
    Caption = '&Empresa:'
    FocusControl = cmbEmpresa
    Font.Charset = ANSI_CHARSET
    Font.Color = 937000
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtUsuario: TEdit
    Left = 233
    Top = 233
    Width = 335
    Height = 27
    Ctl3D = True
    Font.Charset = ANSI_CHARSET
    Font.Color = 937000
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
  end
  object edtSenha: TEdit
    Left = 233
    Top = 266
    Width = 335
    Height = 27
    Font.Charset = ANSI_CHARSET
    Font.Color = 937000
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 1
  end
  object cmbEmpresa: TComboBox
    Left = 233
    Top = 299
    Width = 335
    Height = 27
    BevelInner = bvNone
    BevelOuter = bvNone
    Ctl3D = True
    Font.Charset = ANSI_CHARSET
    Font.Color = 937000
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 2
    Items.Strings = (
      'Empresa 1'
      'Empresa 2'
      'Empresa 3')
  end
  object btnEntrar: TButton
    Left = 437
    Top = 332
    Width = 131
    Height = 41
    Caption = 'Entrar'
    Font.Charset = ANSI_CHARSET
    Font.Color = 937000
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btnEntrarClick
  end
end
