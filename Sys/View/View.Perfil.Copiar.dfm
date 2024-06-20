inherited ViewPerfilCopiar: TViewPerfilCopiar
  Left = 407
  Top = 230
  BorderStyle = bsToolWindow
  Caption = 'Copiar Perfil de . . .'
  ClientHeight = 93
  ClientWidth = 471
  ExplicitWidth = 479
  ExplicitHeight = 120
  DesignSize = (
    471
    93)
  TextHeight = 13
  object lblPerfil: TLabel
    Left = 16
    Top = 16
    Width = 128
    Height = 13
    Caption = 'Selecionar Perfil de Acesso'
    FocusControl = edPerfil
  end
  object edPerfil: TComboBox
    Left = 16
    Top = 32
    Width = 433
    Height = 21
    Style = csDropDownList
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    ExplicitWidth = 425
  end
  object btnSelecionar: TcxButton
    Left = 16
    Top = 56
    Width = 99
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Selecionar'
    OptionsImage.ImageIndex = 10
    OptionsImage.Images = DMRecursos.ImgBotoes16x16
    TabOrder = 1
    OnClick = btnSelecionarClick
    ExplicitTop = 44
  end
  object dspPerfil: TDataSetProvider
    Left = 264
    Top = 8
  end
  object cdsPerfil: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftSmallint
        Name = 'PERFIL1'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'PERFIL2'
        ParamType = ptInput
      end>
    ProviderName = 'dspPerfil'
    Left = 296
    Top = 8
  end
end
