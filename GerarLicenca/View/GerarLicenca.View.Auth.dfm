object ViewAuth: TViewAuth
  Left = 0
  Top = 0
  ActiveControl = edtEmail
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Autenticar'
  ClientHeight = 192
  ClientWidth = 442
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PanelView: TPanel
    Left = 0
    Top = 0
    Width = 442
    Height = 192
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object PanelBody: TPanel
      Left = 0
      Top = 57
      Width = 442
      Height = 78
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        442
        78)
      object lblEmail: TLabel
        Left = 67
        Top = 27
        Width = 38
        Height = 13
        Alignment = taRightJustify
        Caption = '&E-mail:'
        FocusControl = edtEmail
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblSenha: TLabel
        Left = 67
        Top = 54
        Width = 38
        Height = 13
        Alignment = taRightJustify
        Caption = '&Senha:'
        FocusControl = edtSenha
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtEmail: TEdit
        Left = 112
        Top = 24
        Width = 265
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Text = 'isaque.ribeiro@outlook.com'
      end
      object edtSenha: TEdit
        Left = 112
        Top = 51
        Width = 265
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        PasswordChar = '*'
        TabOrder = 1
      end
    end
    object PanelHeader: TPanel
      Left = 0
      Top = 0
      Width = 442
      Height = 57
      Align = alTop
      BevelOuter = bvNone
      Caption = 'Autentique seu acesso a aplica'#231#227'o!'
      Color = 16384
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
    end
    object PanelFooter: TPanel
      Left = 0
      Top = 135
      Width = 442
      Height = 57
      Align = alBottom
      BevelOuter = bvNone
      Padding.Right = 60
      TabOrder = 2
      object btnConfirmar: TButton
        AlignWithMargins = True
        Left = 193
        Top = 5
        Width = 90
        Height = 42
        Margins.Top = 5
        Margins.Bottom = 10
        Align = alRight
        Caption = 'Confirmar'
        Default = True
        TabOrder = 0
        OnClick = btnConfirmarClick
      end
      object btnCancelar: TButton
        AlignWithMargins = True
        Left = 289
        Top = 5
        Width = 90
        Height = 42
        Margins.Top = 5
        Margins.Bottom = 10
        Align = alRight
        Cancel = True
        Caption = 'Cancelar'
        TabOrder = 1
        OnClick = btnCancelarClick
      end
    end
  end
end
