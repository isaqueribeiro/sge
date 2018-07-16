object frmPesquisaEAN: TfrmPesquisaEAN
  Left = 0
  Top = 0
  Caption = 'Consultar Produto/NCM'
  ClientHeight = 462
  ClientWidth = 895
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    895
    462)
  PixelsPerInch = 96
  TextHeight = 13
  object lblNumero: TLabel
    Left = 159
    Top = 7
    Width = 52
    Height = 13
    Caption = 'NCM / EAN'
    FocusControl = edtNumero
  end
  object edtNumero: TEdit
    Left = 159
    Top = 26
    Width = 121
    Height = 21
    TabOrder = 0
    Text = '7891910000197'
  end
  object cmbTipo: TComboBox
    Left = 8
    Top = 26
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemIndex = 1
    TabOrder = 1
    Text = 'EAN'
    OnChange = cmbTipoChange
    Items.Strings = (
      'NCM'
      'EAN')
  end
  object Button1: TButton
    Left = 286
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Pesquisar'
    TabOrder = 2
    OnClick = Button1Click
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 53
    Width = 879
    Height = 401
    ActivePage = TabSheet1
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 3
    object TabSheet1: TTabSheet
      Caption = 'Resposta'
      object mmResposta: TMemo
        Left = 0
        Top = 0
        Width = 871
        Height = 373
        Align = alClient
        ScrollBars = ssBoth
        TabOrder = 0
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Objeto JSON'
      ImageIndex = 1
    end
  end
  object restClient: TRESTClient
    Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Params = <>
    HandleRedirects = True
    Left = 444
    Top = 237
  end
  object restRequest: TRESTRequest
    Client = restClient
    Params = <>
    Response = restResponse
    SynchronizedEvents = False
    Left = 444
    Top = 285
  end
  object restResponse: TRESTResponse
    Left = 444
    Top = 333
  end
end
