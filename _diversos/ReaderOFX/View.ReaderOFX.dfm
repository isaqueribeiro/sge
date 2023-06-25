object ViewReaderOFX: TViewReaderOFX
  Left = 0
  Top = 0
  Caption = 'Leitor de Arquivos OFX'
  ClientHeight = 301
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Roboto Cn'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    635
    301)
  PixelsPerInch = 96
  TextHeight = 15
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 629
    Height = 54
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Panel2: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 519
      Height = 48
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 465
      ExplicitHeight = 65
      object Label1: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 513
        Height = 15
        Align = alTop
        Caption = 'Arquivo'
        ExplicitWidth = 38
      end
      object edtArquivoOFX: TEdit
        AlignWithMargins = True
        Left = 3
        Top = 24
        Width = 513
        Height = 23
        Hint = 'Informe o nome do arquivo OFX...'
        Align = alTop
        TabOrder = 0
        ExplicitWidth = 459
      end
    end
    object btnSelecionar: TButton
      AlignWithMargins = True
      Left = 525
      Top = 25
      Width = 98
      Height = 27
      Margins.Left = 0
      Margins.Top = 25
      Margins.Right = 6
      Margins.Bottom = 2
      Align = alRight
      Caption = 'Selecionar'
      TabOrder = 1
      OnClick = btnSelecionarClick
      ExplicitLeft = 528
    end
  end
  object mmConteudo: TMemo
    Left = 8
    Top = 63
    Width = 619
    Height = 202
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Lucida Sans Typewriter'
    Font.Style = []
    Lines.Strings = (
      'mmConteudo')
    ParentFont = False
    TabOrder = 1
  end
  object btnProcessar: TButton
    Left = 8
    Top = 271
    Width = 97
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Processar'
    TabOrder = 2
    OnClick = btnProcessarClick
  end
  object opdArquivoOFX: TOpenDialog
    DefaultExt = 'ofx'
    Filter = 'Arquivos OFX|*.ofx'
    Options = [ofReadOnly, ofHideReadOnly, ofEnableSizing]
    Title = 'Selecione o arquivo desejado'
    Left = 456
  end
end
