inherited frmGrUsuarioCopiarPerfil: TfrmGrUsuarioCopiarPerfil
  Left = 407
  Top = 230
  BorderStyle = bsToolWindow
  Caption = 'Copiar Perfil de . . .'
  ClientHeight = 93
  ClientWidth = 471
  ExplicitWidth = 477
  ExplicitHeight = 122
  DesignSize = (
    471
    93)
  PixelsPerInch = 96
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
    Width = 441
    Height = 21
    Style = csDropDownList
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
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
  end
  object qryPerfil: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'Select'
      '    f.cod'
      '  , f.funcao'
      'from TBFUNCAO f'
      'where f.cod not in (:perfil1, :perfil2)'
      ''
      'order by'
      '    f.cod')
    Left = 232
    Top = 8
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'perfil1'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftSmallint
        Name = 'perfil2'
        ParamType = ptInput
        Value = 0
      end>
  end
  object dspPerfil: TDataSetProvider
    DataSet = qryPerfil
    Left = 264
    Top = 8
  end
  object cdsPerfil: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftSmallint
        Name = 'perfil1'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftSmallint
        Name = 'perfil2'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspPerfil'
    Left = 296
    Top = 8
  end
end
