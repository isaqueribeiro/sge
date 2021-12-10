object ViewNFEDistribuicao: TViewNFEDistribuicao
  Left = 0
  Top = 0
  ActiveControl = GrdDocumentos
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Distribui'#231#227'o DF-e'
  ClientHeight = 577
  ClientWidth = 1073
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 79
    Width = 1073
    Height = 4
    Align = alTop
    Shape = bsSpacer
    ExplicitTop = 121
    ExplicitWidth = 593
  end
  object GrpBxEmpresa: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 1067
    Height = 73
    Align = alTop
    Caption = 'Empresa'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    DesignSize = (
      1067
      73)
    object lblCNPJEmpresa: TLabel
      Left = 16
      Top = 24
      Width = 30
      Height = 13
      Caption = 'CNPJ:'
      FocusControl = dbCNPJEmpresa
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblRazaoSocialEmpresa: TLabel
      Left = 184
      Top = 24
      Width = 74
      Height = 13
      Caption = 'Raz'#227'o Social:'
      FocusControl = dbRazaoSocialEmpresa
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbCNPJEmpresa: TDBEdit
      Left = 16
      Top = 40
      Width = 161
      Height = 21
      TabStop = False
      Color = clMoneyGreen
      DataField = 'CNPJ'
      DataSource = dtsEmpresa
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object dbRazaoSocialEmpresa: TDBEdit
      Left = 184
      Top = 40
      Width = 867
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clMoneyGreen
      DataField = 'RAZAO'
      DataSource = dtsEmpresa
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
  end
  object PanelBotoes: TPanel
    Left = 0
    Top = 534
    Width = 1073
    Height = 43
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object Bevel3: TBevel
      Left = 0
      Top = 0
      Width = 1073
      Height = 4
      Align = alTop
      Shape = bsSpacer
      ExplicitTop = 161
      ExplicitWidth = 593
    end
    object lblUltimoNSU: TLabel
      AlignWithMargins = True
      Left = 16
      Top = 7
      Width = 73
      Height = 33
      Margins.Left = 16
      Align = alLeft
      AutoSize = False
      Caption = #218'ltimo NSU:'
      FocusControl = edtUltimoNSU
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
    object lblQtdeNotas: TLabel
      AlignWithMargins = True
      Left = 616
      Top = 7
      Width = 258
      Height = 33
      Align = alRight
      Alignment = taRightJustify
      AutoSize = False
      Caption = '%d NOTA(S) NO LOTE DE DISTRIBUI'#199#195'O'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
    object lblProximoNSU: TLabel
      AlignWithMargins = True
      Left = 228
      Top = 7
      Width = 109
      Height = 33
      Align = alLeft
      AutoSize = False
      Caption = 'Pr'#243'ximo Lote NSU:'
      FocusControl = edtProximoNSU
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
    object btnConfirmar: TcxButton
      AlignWithMargins = True
      Left = 880
      Top = 7
      Width = 92
      Height = 33
      Align = alRight
      Caption = '&Confirmar'
      OptionsImage.ImageIndex = 20
      OptionsImage.Images = DMRecursos.ImgPrincipal16x16
      TabOrder = 2
      OnClick = btnConfirmarClick
    end
    object btFechar: TcxButton
      AlignWithMargins = True
      Left = 978
      Top = 7
      Width = 92
      Height = 33
      Align = alRight
      Cancel = True
      Caption = 'Fechar'
      ModalResult = 2
      OptionsImage.ImageIndex = 15
      OptionsImage.Images = DMRecursos.ImgBotoes16x16
      TabOrder = 3
    end
    object edtUltimoNSU: TEdit
      AlignWithMargins = True
      Left = 92
      Top = 13
      Width = 130
      Height = 21
      Margins.Left = 0
      Margins.Top = 9
      Margins.Bottom = 9
      TabStop = False
      Align = alLeft
      Alignment = taCenter
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      Text = '000000000000000'
    end
    object edtProximoNSU: TEdit
      AlignWithMargins = True
      Left = 340
      Top = 13
      Width = 130
      Height = 21
      Margins.Left = 0
      Margins.Top = 9
      Margins.Bottom = 9
      TabStop = False
      Align = alLeft
      Alignment = taCenter
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      Text = '000000000000000'
    end
    object btnProximo: TcxButton
      AlignWithMargins = True
      Left = 476
      Top = 7
      Width = 101
      Height = 33
      Cursor = crHandPoint
      Align = alLeft
      Caption = 'Pr'#243'ximo Lote'
      OptionsImage.ImageIndex = 31
      OptionsImage.Images = DMRecursos.ImgBotoes16x16
      SpeedButtonOptions.CanBeFocused = False
      TabOrder = 4
      OnClick = btnProximoClick
    end
  end
  object GrdDocumentos: TcxGrid
    Left = 0
    Top = 83
    Width = 1073
    Height = 451
    Align = alClient
    TabOrder = 1
    object GrdDocumentosDBTableView: TcxGridDBBandedTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dtsDocumentos
      DataController.KeyFieldNames = 'NSU'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      EditForm.UseDefaultLayout = False
      OptionsBehavior.CellHints = True
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsCustomize.BandMoving = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.CellEndEllipsis = True
      OptionsView.NoDataToDisplayInfoText = '<Nenhum documento encontrado>'
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      Styles.Content = StyleContent
      Styles.ContentEven = StyleContentEven
      Styles.Selection = StyleSelecao
      Bands = <
        item
          Caption = 'Emissor do Documento'
        end
        item
          Caption = 'Documento'
        end
        item
          Caption = 'Detalhes do Documento'
        end>
      object GrdDocumentosDBTableViewCNPJ: TcxGridDBBandedColumn
        DataBinding.FieldName = 'CNPJ'
        LayoutItem = GrdDocumentosDBTableViewLayoutItem5.Owner
        Width = 120
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object GrdDocumentosDBTableViewNome: TcxGridDBBandedColumn
        DataBinding.FieldName = 'Nome'
        LayoutItem = GrdDocumentosDBTableViewLayoutItem6.Owner
        Options.Moving = False
        Width = 250
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object GrdDocumentosDBTableViewIEstadual: TcxGridDBBandedColumn
        Caption = 'IE'
        DataBinding.FieldName = 'IEstadual'
        LayoutItem = GrdDocumentosDBTableViewLayoutItem7.Owner
        Width = 80
        Position.BandIndex = 0
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object GrdDocumentosDBTableViewChave: TcxGridDBBandedColumn
        DataBinding.FieldName = 'Chave'
        LayoutItem = GrdDocumentosDBTableViewLayoutItem1.Owner
        Options.Filtering = False
        Width = 330
        Position.BandIndex = 2
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object GrdDocumentosDBTableViewSerie: TcxGridDBBandedColumn
        DataBinding.FieldName = 'Serie'
        LayoutItem = GrdDocumentosDBTableViewLayoutItem2.Owner
        Options.Filtering = False
        Options.Moving = False
        Options.Sorting = False
        Width = 35
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object GrdDocumentosDBTableViewNumero: TcxGridDBBandedColumn
        DataBinding.FieldName = 'Numero'
        LayoutItem = GrdDocumentosDBTableViewLayoutItem3.Owner
        Options.Filtering = False
        Options.Moving = False
        Options.Sorting = False
        Width = 70
        Position.BandIndex = 1
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object GrdDocumentosDBTableViewProtocolo: TcxGridDBBandedColumn
        DataBinding.FieldName = 'Protocolo'
        LayoutItem = GrdDocumentosDBTableViewLayoutItem4.Owner
        Options.Filtering = False
        Width = 120
        Position.BandIndex = 2
        Position.ColIndex = 4
        Position.RowIndex = 0
      end
      object GrdDocumentosDBTableViewNSU: TcxGridDBBandedColumn
        DataBinding.FieldName = 'NSU'
        LayoutItem = GrdDocumentosDBTableViewLayoutItem8.Owner
        Options.Filtering = False
        Width = 150
        Position.BandIndex = 2
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object GrdDocumentosDBTableViewEmissao: TcxGridDBBandedColumn
        Caption = 'Emiss'#227'o'
        DataBinding.FieldName = 'Emissao'
        LayoutItem = GrdDocumentosDBTableViewLayoutItem9.Owner
        Options.Filtering = False
        Options.Moving = False
        Width = 80
        Position.BandIndex = 1
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object GrdDocumentosDBTableViewValor: TcxGridDBBandedColumn
        Caption = 'Valor (R$)'
        DataBinding.FieldName = 'Valor'
        LayoutItem = GrdDocumentosDBTableViewLayoutItem10.Owner
        Options.Filtering = False
        Options.Moving = False
        Options.Sorting = False
        Styles.Header = cxStyleHeader
        Width = 80
        Position.BandIndex = 1
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object GrdDocumentosDBTableViewTipoNFe: TcxGridDBBandedColumn
        Caption = 'Tipo'
        DataBinding.FieldName = 'TipoNFe'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.Images = DMRecursos.ImgPrincipal16x16
        Properties.Items = <
          item
            Description = 'Entrada'
            ImageIndex = 20
            Value = 0
          end
          item
            Description = 'Sa'#237'da'
            ImageIndex = 16
            Value = 1
          end>
        LayoutItem = GrdDocumentosDBTableViewLayoutItem11.Owner
        Width = 70
        Position.BandIndex = 2
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object GrdDocumentosDBTableViewSituacao: TcxGridDBBandedColumn
        Caption = 'Situa'#231#227'o'
        DataBinding.FieldName = 'Situacao'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.Images = DMRecursos.ImgBotoes16x16
        Properties.Items = <
          item
            Description = 'Autorizada'
            ImageIndex = 10
            Value = 0
          end
          item
            Description = 'Denegada'
            ImageIndex = 2
            Value = 1
          end
          item
            Description = 'Cancelada'
            ImageIndex = 13
            Value = 2
          end>
        LayoutItem = GrdDocumentosDBTableViewLayoutItem12.Owner
        Width = 100
        Position.BandIndex = 2
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object GrdDocumentosDBTableViewRootGroup: TcxGridInplaceEditFormGroup
        AlignHorz = ahLeft
        AlignVert = avTop
        ButtonOptions.Buttons = <>
        Hidden = True
        LayoutDirection = ldHorizontal
        ShowBorder = False
        Index = -1
      end
      object GrdDocumentosDBTableViewGroup1: TdxLayoutAutoCreatedGroup
        Parent = GrdDocumentosDBTableViewRootGroup
        AlignHorz = ahLeft
        AlignVert = avTop
        Index = 0
        AutoCreated = True
      end
      object GrdDocumentosDBTableViewGroup2: TdxLayoutAutoCreatedGroup
        Parent = GrdDocumentosDBTableViewRootGroup
        AlignHorz = ahLeft
        AlignVert = avTop
        Index = 1
        AutoCreated = True
      end
      object GrdDocumentosDBTableViewLayoutItem1: TcxGridInplaceEditFormLayoutItem
        Index = -1
      end
      object GrdDocumentosDBTableViewLayoutItem2: TcxGridInplaceEditFormLayoutItem
        Index = -1
      end
      object GrdDocumentosDBTableViewLayoutItem3: TcxGridInplaceEditFormLayoutItem
        Index = -1
      end
      object GrdDocumentosDBTableViewLayoutItem4: TcxGridInplaceEditFormLayoutItem
        Index = -1
      end
      object GrdDocumentosDBTableViewLayoutItem5: TcxGridInplaceEditFormLayoutItem
        Index = -1
      end
      object GrdDocumentosDBTableViewLayoutItem6: TcxGridInplaceEditFormLayoutItem
        Index = -1
      end
      object GrdDocumentosDBTableViewLayoutItem7: TcxGridInplaceEditFormLayoutItem
        Index = -1
      end
      object GrdDocumentosDBTableViewLayoutItem8: TcxGridInplaceEditFormLayoutItem
        Index = -1
      end
      object GrdDocumentosDBTableViewLayoutItem9: TcxGridInplaceEditFormLayoutItem
        Index = -1
      end
      object GrdDocumentosDBTableViewLayoutItem10: TcxGridInplaceEditFormLayoutItem
        Index = -1
      end
      object GrdDocumentosDBTableViewLayoutItem11: TcxGridInplaceEditFormLayoutItem
        Index = -1
      end
      object GrdDocumentosDBTableViewLayoutItem12: TcxGridInplaceEditFormLayoutItem
        Index = -1
      end
    end
    object GrdDocumentosLvl: TcxGridLevel
      GridView = GrdDocumentosDBTableView
    end
  end
  object dtsEmpresa: TDataSource
    Left = 384
    Top = 8
  end
  object cdsDocumentos: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Chave'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Serie'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Numero'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Protocolo'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'CNPJ'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Nome'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'IEstadual'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'UF'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NSU'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Emissao'
        DataType = ftDateTime
      end
      item
        Name = 'Valor'
        DataType = ftCurrency
      end
      item
        Name = 'TipoNFe'
        DataType = ftSmallint
      end
      item
        Name = 'Situacao'
        DataType = ftSmallint
      end>
    IndexDefs = <
      item
        Name = 'cdsDocumentosIndexNSU'
        Fields = 'NSU'
        Options = [ixPrimary]
      end
      item
        Name = 'cdsDocumentosIndexNSU_Desc'
        Fields = 'NSU'
        Options = [ixPrimary, ixDescending]
      end>
    IndexName = 'cdsDocumentosIndexNSU'
    Params = <>
    StoreDefs = True
    Left = 392
    Top = 200
    object cdsDocumentosChave: TStringField
      FieldName = 'Chave'
      Size = 100
    end
    object cdsDocumentosSerie: TStringField
      FieldName = 'Serie'
    end
    object cdsDocumentosNumero: TStringField
      FieldName = 'Numero'
    end
    object cdsDocumentosProtocolo: TStringField
      FieldName = 'Protocolo'
      Size = 50
    end
    object cdsDocumentosCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 40
    end
    object cdsDocumentosNome: TStringField
      FieldName = 'Nome'
      Size = 250
    end
    object cdsDocumentosIEstadual: TStringField
      FieldName = 'IEstadual'
    end
    object cdsDocumentosUF: TStringField
      FieldName = 'UF'
    end
    object cdsDocumentosNSU: TStringField
      FieldName = 'NSU'
    end
    object cdsDocumentosEmissao: TDateTimeField
      FieldName = 'Emissao'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsDocumentosValor: TCurrencyField
      FieldName = 'Valor'
      DisplayFormat = ',0.00'
    end
    object cdsDocumentosTipoNFe: TSmallintField
      FieldName = 'TipoNFe'
    end
    object cdsDocumentosSituacao: TSmallintField
      FieldName = 'Situacao'
    end
  end
  object dtsDocumentos: TDataSource
    DataSet = cdsDocumentos
    Left = 392
    Top = 248
  end
  object StyleRepository: TcxStyleRepository
    Left = 392
    Top = 296
    PixelsPerInch = 96
    object StyleSelecao: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clMoneyGreen
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object StyleContent: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clMenuBar
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object StyleContentEven: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 10930928
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyleHeader: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
  end
end
