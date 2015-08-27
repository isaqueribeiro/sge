inherited frmGeApropriacaoEstoquePesquisa: TfrmGeApropriacaoEstoquePesquisa
  Left = 386
  Top = 208
  ActiveControl = edPesquisar
  Caption = 'Consultar Apropria'#231#227'o de Estoque Atual'
  ClientHeight = 648
  ClientWidth = 1116
  ExplicitWidth = 1132
  ExplicitHeight = 687
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 644
    Width = 1116
    Height = 4
    Align = alBottom
    Shape = bsSpacer
    ExplicitTop = 645
  end
  object Bevel3: TBevel
    Left = 0
    Top = 605
    Width = 1116
    Height = 4
    Align = alBottom
    Shape = bsSpacer
    ExplicitTop = 606
  end
  object pnlPesquisa: TPanel
    Left = 0
    Top = 0
    Width = 1116
    Height = 81
    Align = alTop
    BevelOuter = bvNone
    BorderWidth = 4
    TabOrder = 0
    object GrpBxFiltro: TGroupBox
      Left = 4
      Top = 4
      Width = 1108
      Height = 73
      Align = alClient
      Caption = 'Filtrar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      DesignSize = (
        1108
        73)
      object lblPesquisar: TLabel
        Left = 560
        Top = 24
        Width = 55
        Height = 13
        Caption = '&Pesquisar'
        FocusControl = edPesquisar
      end
      object lblTipoFiltro: TLabel
        Left = 16
        Top = 24
        Width = 67
        Height = 13
        Caption = '&Definir filtro'
        FocusControl = edTipoFiltro
      end
      object lblCentroCusto: TLabel
        Left = 216
        Top = 24
        Width = 90
        Height = 13
        Caption = '&Centro de Custo'
        FocusControl = edCentroCusto
      end
      object edPesquisar: TEdit
        Left = 560
        Top = 40
        Width = 297
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        CharCase = ecUpperCase
        TabOrder = 2
      end
      object edTipoFiltro: TComboBox
        Left = 16
        Top = 40
        Width = 193
        Height = 21
        Style = csDropDownList
        TabOrder = 0
        OnChange = edTipoFiltroChange
        Items.Strings = (
          'Por Grupo'
          'Por Fabricante'
          'Por Produto')
      end
      object chkProdutoComEstoque: TCheckBox
        Left = 864
        Top = 42
        Width = 201
        Height = 17
        Anchors = [akTop, akRight]
        Caption = 'Apenas Produtos com Estoque'
        TabOrder = 3
      end
      object edCentroCusto: TJvComboEdit
        Left = 216
        Top = 40
        Width = 337
        Height = 21
        ButtonHint = 'Pesquisar Centro de Custo (Ctrl+P)'#13#10'Limpar Campo (Ctrl+L)'
        ClickKey = 16464
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000000000000000000000000000000000001DE6B51DE6B5
          1DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B5B1AD
          AC203040ACA5A21DE6B5C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FACA5A2C3C3C31DE6B5B0A090
          6048306048306048306048306048306048306048306048306048305048403050
          604078C0304860B1ACA6C3C3C37F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3B1ACA61DE6B5B0A090
          FFFFFFB0A090B0A090B0A090B0A090B0A090B0A090B0A0909088803050703080
          D04098E050B0F0506870C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C39088807F7F7FC3C3C3C3C3C3C3C3C37F7F7F1DE6B5B0A090
          FFFFFFFFFFFFFFF8FFF0F0F0D0D8D090989070686060686050586040709040A0
          E060C8FF7090A0C5BEB5C3C3C37F7F7FFFFFFFFFFFFFFFF8FFF0F0F0D0D8D07F
          7F7F7F7F7F7F7F7F505860C3C3C3C3C3C3C3C3C37090A0C5BEB51DE6B5B0A090
          FFFFFFFFFFFFFFFFFFE0E0E0909090B0A8A0D0C0B0D0B0A08078705058506090
          B07098B0AEAEAA1DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFE0E0E07F7F7F7F
          7F7FD0C0B0D0B0A0807870505850C3C3C37098B0AEAEAAC3C3C31DE6B5B0A090
          FFFFFFFFFFFFFFFFFFB0B0B0C0B8B0FFF0E0FFE8E0F0D8C0F0D0B08078709D8F
          8CAEAFAA1DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFF
          F0E0FFE8E0F0D8C0F0D0B08078709D8F8CAEAFAAC3C3C3C3C3C31DE6B5C0A890
          FFFFFFFFFFFFFFFFFFA09890F0E8E0FFF8F0FFF0F0FFE8E0F0D8D0D0B0A06367
          5E1DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFF
          F8F0FFF0F0FFE8E0F0D8D0D0B0A063675EC3C3C3C3C3C3C3C3C31DE6B5C0A8A0
          FFFFFFFFFFFFFFFFFFA0A090F0E8E0FFFFFFFFF8F0FFF0F0FFE8E0E0C0B0716E
          6C1DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFF
          FFFFFFF8F0FFF0F0FFE8E0E0C0B0716E6CC3C3C3C3C3C3C3C3C31DE6B5C0B0A0
          FFFFFFFFFFFFFFFFFFC0C8C0C0C0C0FFFFFFFFFFFFFFF8F0FFF0E0B0A090A69C
          951DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFF
          FFFFFFFFFFFFF8F0FFF0E0B0A090A69C95C3C3C3C3C3C3C3C3C31DE6B5D0B0A0
          FFFFFFFFFFFFFFFFFFF0F8FFC0B8B0C0C0C0F0E8E0F0E8E0B0B0A07070601DE6
          B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFF0F8FF7F7F7F7F
          7F7FF0E8E0F0E8E0B0B0A0707060C3C3C3C3C3C3C3C3C3C3C3C31DE6B5D0B8A0
          FFFFFFFFFFFFFFFFFFFFFFFFF0F8FFC0C8C0A0A0909090809090906050401DE6
          B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFF0F8FF7F
          7F7FA0A0907F7F7F909090605040C3C3C3C3C3C3C3C3C3C3C3C31DE6B5D0B8B0
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0A0906048306048306048301DE6
          B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF7F7F7F604830604830604830C3C3C3C3C3C3C3C3C3C3C3C31DE6B5D0C0B0
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A890D0C8C06048301DE6B51DE6
          B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF7F7F7FC3C3C3604830C3C3C3C3C3C3C3C3C3C3C3C3C3C3C31DE6B5E0C0B0
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A8A0604830E0C6B71DE6B51DE6
          B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C31DE6B5E0C0B0
          E0C0B0E0C0B0E0C0B0E0C0B0D0C0B0D0B8B0D0B0A0E0C7B91DE6B51DE6B51DE6
          B51DE6B51DE6B51DE6B5C3C3C37F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C31DE6B51DE6B5
          1DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6
          B51DE6B51DE6B51DE6B5C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3}
        NumGlyphs = 2
        TabOrder = 1
        Text = '(Todos)'
        OnButtonClick = edCentroCustoButtonClick
        OnKeyPress = edCentroCustoKeyPress
      end
      object BtnPesquisar: TcxButton
        Left = 1071
        Top = 40
        Width = 23
        Height = 22
        Hint = 'Executar Pesquisa'
        Anchors = [akTop, akRight]
        OptionsImage.Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          20000000000000040000C30E0000C30E00000000000000000000000000000000
          00000000000000000000000000000000000000000000AC6B2CBAAC6B2CCC0000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000AC6B2CC0AC6B2CFFAC6B
          2CD1B5712F29B87330BDB87330CAB974306B0000000000000000000000000000
          000000000000000000006E6E6E056E6E6EFF6E6E6E0100000000AC6B2CC4AC6B
          2CFFAC6B2CFFAC6B2CFFAC6B2CF9AC6B2CFFAC6B2CFF00000000000000000000
          000000000000000000006E6E6E056E6E6EFF6E6E6E4200000000B06D2D2AAC6B
          2CFFAC6B2C830000000000000000AC6B2C22AC6B2CFFB16F2EA3000000000000
          000000000000000000006E6E6E056E6E6EFF6E6E6E1E00000000B3712EBDAC6B
          2CFF00000000000000000000000000000000AC6B2CA9AF6D2DFF000000000000
          000000000000000000006E6E6E056E6E6EFF6E6E6E1700000000B3712ECAAC6B
          2CFF00000000000000000000000000000000AD6C2C93AF6D2DFF000000000000
          000000000000000000006E6E6E056E6E6EFF6E6E6E4900000000B5712E6AAC6B
          2CFFAD6C2C31000000000000000000000000AC6B2CFFB06D2DCB000000000000
          000000000000000000006E6E6E166E6E6EFF6E6E6EAE0000000000000000AC6B
          2CFCAC6B2CFFAD6C2CB7AE6D2D9CAC6B2CFFAC6B2CFF00000000000000000000
          0000000000006E6E6E046E6E6EBC6E6E6EFF6E6E6EFFC6C6C666000000000000
          0000AE6C2C9BAC6B2CFFAC6B2CFFAD6C2CCA0000000000000000000000000000
          0000000000006E6E6E926E6E6EFF6E6E6EFF6E6E6EFF858585FEE9E9E9967A7A
          7A1E000000000000000000000000000000000000000000000000000000000000
          00006E6E6E636E6E6EFE6E6E6EFF6E6E6EFF6E6E6EFF6E6E6EFFC9C9C9FFDFDF
          DFFF727272FE6E6E6E5C00000000000000000000000000000000000000006E6E
          6E3B6E6E6EF86E6E6EFF6E6E6EFF6E6E6EFF6E6E6EFF6E6E6EFF808080FFFCFC
          FCFFCECECEFF6E6E6EF66E6E6E350000000000000000000000006E6E6E1D6E6E
          6EE86E6E6EFF6E6E6EFF6E6E6EFF6E6E6EFF6E6E6EFF6E6E6EFF6E6E6EFFC3C3
          C3FFFFFFFFFFB9B9B9FF6E6E6EE36E6E6E1800000000000000006E6E6ECC6E6E
          6EFF6E6E6EFF6E6E6EFF6E6E6EFF6E6E6EFF6E6E6EFF6E6E6EFF6E6E6EFF7C7C
          7CFFFAFAFAFFFEFEFEFF9F9F9FFF6E6E6EC66E6E6E07000000006E6E6EFF6E6E
          6EFF6E6E6EFF6E6E6EFF6E6E6EFF6E6E6EFF6E6E6EFF6E6E6EFF6E6E6EFF6E6E
          6EFF707070FF707070FF6E6E6EFF6E6E6EFF6E6E6E7D00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        ParentShowHint = False
        ShowHint = True
        SpeedButtonOptions.CanBeFocused = False
        SpeedButtonOptions.Flat = True
        SpeedButtonOptions.Transparent = True
        TabOrder = 4
        OnClick = BtnPesquisarClick
      end
    end
  end
  object PgcTabelas: TPageControl
    Left = 0
    Top = 81
    Width = 1116
    Height = 524
    ActivePage = TbsProduto
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object TbsGrupo: TTabSheet
      Caption = 'TbsGrupo'
      ImageIndex = 1
      object dbgGrupo: TcxGrid
        Left = 0
        Top = 0
        Width = 1108
        Height = 496
        Hint = 
          'Para carregar os produtos do grupo, basta'#13#10'executar "dois clique' +
          's" no registro.'
        Align = alClient
        TabOrder = 0
        object dbgGrupoTbl: TcxGridDBBandedTableView
          OnDblClick = dbgGrupoTblDblClick
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = dsGrupo
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0'
              Kind = skSum
              FieldName = 'ITENS'
              Column = dbgGrupoTblITENS
            end
            item
              Format = ',0.00'
              Kind = skSum
              FieldName = 'CUSTO_TOTAL'
              Column = dbgGrupoTblCUSTO_TOTAL
            end
            item
              Format = ',0.00'
              Kind = skSum
              FieldName = 'CUSTO_DISPONIVEL'
              Column = dbgGrupoTblCUSTO_DISPONIVEL
            end
            item
              Format = ',0.##'
              Kind = skSum
              FieldName = 'PERCENTUAL'
              Column = dbgGrupoTblPERCENTUAL
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.CellHints = True
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsView.CellEndEllipsis = True
          OptionsView.NoDataToDisplayInfoText = '<Sem dados para visualiza'#231#227'o>'
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          Styles.Content = StyleContent
          Styles.ContentEven = StyleContentEven
          Styles.Inactive = StyleSelecao
          Styles.Selection = StyleSelecao
          Bands = <
            item
              Caption = 'Grupo'
              Options.Moving = False
              Width = 450
            end
            item
              Caption = 'Estoque'
              Options.Moving = False
              Width = 200
            end
            item
              Caption = 'Custo (R$)'
              Options.Moving = False
              Width = 250
            end>
          object dbgGrupoTblGRUPO_COD: TcxGridDBBandedColumn
            Caption = 'C'#243'digo'
            DataBinding.FieldName = 'GRUPO_COD'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taLeftJustify
            Properties.DisplayFormat = '###00000'
            MinWidth = 70
            Options.Filtering = False
            Options.HorzSizing = False
            Options.Moving = False
            Width = 70
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object dbgGrupoTblGRUPO_DESC: TcxGridDBBandedColumn
            Caption = 'Descri'#231#227'o'
            DataBinding.FieldName = 'GRUPO_DES'
            Options.Filtering = False
            Options.Moving = False
            Width = 178
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object dbgGrupoTblITENS: TcxGridDBBandedColumn
            Caption = 'Lotes'
            DataBinding.FieldName = 'ITENS'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.##'
            MinWidth = 50
            Options.Filtering = False
            Options.HorzSizing = False
            Options.Moving = False
            Options.Sorting = False
            Width = 50
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object dbgGrupoTblESTOQUE: TcxGridDBBandedColumn
            Caption = 'Quantidade'
            DataBinding.FieldName = 'ESTOQUE'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.##'
            MinWidth = 100
            Options.Filtering = False
            Options.Moving = False
            Options.Sorting = False
            Width = 100
            Position.BandIndex = 1
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object dbgGrupoTblDISPONIVEL: TcxGridDBBandedColumn
            Caption = 'Dispon'#237'vel'
            DataBinding.FieldName = 'DISPONIVEL'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.##'
            MinWidth = 100
            Options.Filtering = False
            Options.Moving = False
            Options.Sorting = False
            Width = 100
            Position.BandIndex = 1
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object dbgGrupoTblCUSTO_TOTAL: TcxGridDBBandedColumn
            Caption = 'Total'
            DataBinding.FieldName = 'CUSTO_TOTAL'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00#'
            HeaderAlignmentHorz = taCenter
            MinWidth = 100
            Options.Filtering = False
            Options.HorzSizing = False
            Options.Sorting = False
            Width = 100
            Position.BandIndex = 2
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object dbgGrupoTblCUSTO_DISPONIVEL: TcxGridDBBandedColumn
            Caption = 'Dispon'#237'vel'
            DataBinding.FieldName = 'CUSTO_DISPONIVEL'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00#'
            HeaderAlignmentHorz = taCenter
            MinWidth = 100
            Options.Filtering = False
            Options.HorzSizing = False
            Options.Sorting = False
            Width = 100
            Position.BandIndex = 2
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object dbgGrupoTblPERCENTUAL: TcxGridDBBandedColumn
            Caption = '%'
            DataBinding.FieldName = 'PERCENTUAL'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.##'
            HeaderAlignmentHorz = taCenter
            MinWidth = 50
            Options.Filtering = False
            Options.HorzSizing = False
            Width = 50
            Position.BandIndex = 2
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
        end
        object dbgGrupoLvl: TcxGridLevel
          GridView = dbgGrupoTbl
        end
      end
    end
    object TbsFabricante: TTabSheet
      Caption = 'TbsFabricante'
      ImageIndex = 2
      object dbgFab: TcxGrid
        Left = 0
        Top = 0
        Width = 1108
        Height = 496
        Hint = 
          'Para carregar os produtos do grupo, basta'#13#10'executar "dois clique' +
          's" no registro.'
        Align = alClient
        TabOrder = 0
        object dbgFabTbl: TcxGridDBBandedTableView
          OnDblClick = dbgFabTblDblClick
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = dsFabricante
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0'
              Kind = skSum
              FieldName = 'ITENS'
              Column = dbgFabTblITENS
            end
            item
              Format = ',0.00'
              Kind = skSum
              FieldName = 'CUSTO_TOTAL'
              Column = dbgFabTblCUSTO_TOTAL
            end
            item
              Format = ',0.00'
              Kind = skSum
              FieldName = 'CUSTO_DISPONIVEL'
              Column = dbgFabTblCUSTO_DISPONIVEL
            end
            item
              Format = ',0.##'
              Kind = skSum
              FieldName = 'PERCENTUAL'
              Column = dbgFabTblPERCENTUAL
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.CellHints = True
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsView.CellEndEllipsis = True
          OptionsView.NoDataToDisplayInfoText = '<Sem dados para visualiza'#231#227'o>'
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          Styles.Content = StyleContent
          Styles.ContentEven = StyleContentEven
          Styles.Inactive = StyleSelecao
          Styles.Selection = StyleSelecao
          Bands = <
            item
              Caption = 'Fabricante'
              Options.Moving = False
              Width = 450
            end
            item
              Caption = 'Estoque'
              Options.Moving = False
              Width = 160
            end
            item
              Caption = 'Custos (R$)'
              Options.Moving = False
              Width = 200
            end>
          object dbgFabTblFABRICANTE_COD: TcxGridDBBandedColumn
            Caption = 'C'#243'digo'
            DataBinding.FieldName = 'FABRICANTE_COD'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taLeftJustify
            Properties.DisplayFormat = '###00000'
            MinWidth = 70
            Options.Filtering = False
            Options.HorzSizing = False
            Options.Moving = False
            Width = 70
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object dbgFabTblFABRICANTE_NOME: TcxGridDBBandedColumn
            Caption = 'Nome'
            DataBinding.FieldName = 'FABRICANTE_NOME'
            Options.Filtering = False
            Options.Moving = False
            Width = 178
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object dbgFabTblITENS: TcxGridDBBandedColumn
            Caption = 'Lotes'
            DataBinding.FieldName = 'ITENS'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.###'
            MinWidth = 50
            Options.Filtering = False
            Options.HorzSizing = False
            Options.Moving = False
            Options.Sorting = False
            Width = 50
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object dbgFabTblESTOQUE: TcxGridDBBandedColumn
            Caption = 'Quantidade'
            DataBinding.FieldName = 'ESTOQUE'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00#'
            MinWidth = 80
            Options.Filtering = False
            Options.Moving = False
            Options.Sorting = False
            Width = 80
            Position.BandIndex = 1
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object dbgFabTblDISPONIVEL: TcxGridDBBandedColumn
            Caption = 'Dispon'#237'vel'
            DataBinding.FieldName = 'DISPONIVEL'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00#'
            MinWidth = 80
            Options.Filtering = False
            Options.Moving = False
            Options.Sorting = False
            Width = 80
            Position.BandIndex = 1
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object dbgFabTblCUSTO_TOTAL: TcxGridDBBandedColumn
            Caption = 'Total'
            DataBinding.FieldName = 'CUSTO_TOTAL'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00#'
            HeaderAlignmentHorz = taCenter
            MinWidth = 100
            Options.Editing = False
            Options.Filtering = False
            Options.HorzSizing = False
            Options.Moving = False
            Width = 100
            Position.BandIndex = 2
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object dbgFabTblCUSTO_DISPONIVEL: TcxGridDBBandedColumn
            Caption = 'Dispon'#237'vel'
            DataBinding.FieldName = 'CUSTO_DISPONIVEL'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00#'
            HeaderAlignmentHorz = taCenter
            MinWidth = 100
            Options.Editing = False
            Options.Filtering = False
            Options.HorzSizing = False
            Options.Moving = False
            Width = 100
            Position.BandIndex = 2
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object dbgFabTblPERCENTUAL: TcxGridDBBandedColumn
            Caption = '%'
            DataBinding.FieldName = 'PERCENTUAL'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.##'
            HeaderAlignmentHorz = taCenter
            MinWidth = 50
            Options.Editing = False
            Options.Filtering = False
            Options.HorzSizing = False
            Options.Moving = False
            Width = 50
            Position.BandIndex = 2
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
        end
        object dbgFabLvl: TcxGridLevel
          GridView = dbgFabTbl
        end
      end
    end
    object TbsProduto: TTabSheet
      Caption = 'TbsProduto'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      object dbgProduto: TcxGrid
        Left = 0
        Top = 0
        Width = 1108
        Height = 496
        Align = alClient
        TabOrder = 0
        object dbgProdutoTbl: TcxGridDBBandedTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = dsProduto
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0'
              Kind = skCount
              FieldName = 'LOTE_ID'
              Column = dbgProdutoTblPRODUTO
            end
            item
              Format = ',0.00'
              Kind = skSum
              FieldName = 'CUSTO_TOTAL'
              Column = dbgProdutoTblCUSTO_TOTAL
            end
            item
              Format = ',0.00'
              Kind = skSum
              FieldName = 'CUSTO_DISPONIVEL'
              Column = dbgProdutoTblCUSTO_DISPONIVEL
            end
            item
              Format = ',0.##'
              Kind = skSum
              FieldName = 'PERCENTUAL'
              Column = dbgProdutoTblPERCENTUAL
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.CellHints = True
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsView.CellEndEllipsis = True
          OptionsView.NoDataToDisplayInfoText = '<Sem dados para visualiza'#231#227'o>'
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          Styles.Content = StyleContent
          Styles.ContentEven = StyleContentEven
          Styles.Inactive = StyleSelecao
          Styles.Selection = StyleSelecao
          Bands = <
            item
              Caption = 'Produto'
              Options.Moving = False
              Width = 700
            end
            item
              Caption = 'Estoque'
              Options.Moving = False
              Width = 180
            end
            item
              Caption = 'Custos (R$)'
              Options.Moving = False
              Width = 220
            end>
          object dbgProdutoTblPRODUTO: TcxGridDBBandedColumn
            Caption = 'C'#243'digo'
            DataBinding.FieldName = 'PRODUTO'
            Options.Filtering = False
            Options.Moving = False
            Width = 60
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object dbgProdutoTblDESCRI_APRESENTACAO: TcxGridDBBandedColumn
            Caption = 'Nome Amigo ou Descri'#231#227'o + Apresenta'#231#227'o'
            DataBinding.FieldName = 'DESCRI_APRESENTACAO'
            Options.Filtering = False
            Options.Moving = False
            Width = 247
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object dbgProdutoTblGRUPO_DES: TcxGridDBBandedColumn
            Caption = 'Grupo'
            DataBinding.FieldName = 'GRUPO_DES'
            MinWidth = 150
            Options.HorzSizing = False
            Options.Moving = False
            Width = 150
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object dbgProdutoTblFABRICANTE_NOME: TcxGridDBBandedColumn
            Caption = 'Fabricante'
            DataBinding.FieldName = 'FABRICANTE_NOME'
            MinWidth = 150
            Options.HorzSizing = False
            Options.Moving = False
            Width = 150
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object dbgProdutoTblESTOQUE: TcxGridDBBandedColumn
            Caption = 'Quantidade'
            DataBinding.FieldName = 'ESTOQUE'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.###'
            MinWidth = 70
            Options.Filtering = False
            Options.Moving = False
            Options.Sorting = False
            Width = 70
            Position.BandIndex = 1
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object dbgProdutoTblDISPONIVEL: TcxGridDBBandedColumn
            Caption = 'Dispon'#237'vel'
            DataBinding.FieldName = 'DISPONIVEL'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.###'
            MinWidth = 70
            Options.Filtering = False
            Options.Moving = False
            Options.Sorting = False
            Styles.Content = StyleContentEven
            Styles.Header = StyleSelecao
            Width = 70
            Position.BandIndex = 1
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object dbgProdutoTblUND: TcxGridDBBandedColumn
            Caption = 'Und.'
            DataBinding.FieldName = 'UND'
            HeaderAlignmentHorz = taCenter
            MinWidth = 40
            Options.Filtering = False
            Options.Moving = False
            Options.Sorting = False
            Width = 40
            Position.BandIndex = 1
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object dbgProdutoTblCUSTO_TOTAL: TcxGridDBBandedColumn
            Caption = 'Total'
            DataBinding.FieldName = 'CUSTO_TOTAL'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00#'
            HeaderAlignmentHorz = taCenter
            MinWidth = 90
            Options.Filtering = False
            Options.Moving = False
            Options.Sorting = False
            Width = 100
            Position.BandIndex = 2
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object dbgProdutoTblCUSTO_DISPONIVEL: TcxGridDBBandedColumn
            Caption = 'Dispon'#237'vel'
            DataBinding.FieldName = 'CUSTO_DISPONIVEL'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00#'
            HeaderAlignmentHorz = taCenter
            MinWidth = 90
            Options.Filtering = False
            Options.Moving = False
            Options.Sorting = False
            Styles.Content = StyleContentEven
            Styles.Header = StyleSelecao
            Width = 100
            Position.BandIndex = 2
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object dbgProdutoTblPERCENTUAL: TcxGridDBBandedColumn
            Caption = '%'
            DataBinding.FieldName = 'PERCENTUAL'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.##'
            HeaderAlignmentHorz = taCenter
            MinWidth = 40
            Options.Filtering = False
            Options.Moving = False
            Position.BandIndex = 2
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
        end
        object dbgProdutoLvl: TcxGridLevel
          GridView = dbgProdutoTbl
        end
      end
    end
  end
  object tlbBotoes: TPanel
    Left = 0
    Top = 609
    Width = 1116
    Height = 35
    Align = alBottom
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 2
    object Bevel2: TBevel
      Left = 0
      Top = 0
      Width = 4
      Height = 35
      Align = alLeft
      Shape = bsSpacer
    end
    object Bevel4: TBevel
      Left = 1112
      Top = 0
      Width = 4
      Height = 35
      Align = alRight
      Shape = bsSpacer
    end
    object btBtnExportar: TcxButton
      Tag = 1
      Left = 4
      Top = 0
      Width = 75
      Height = 35
      Hint = 'Exportar dados para planilha'
      Align = alLeft
      Caption = 'Exportar'
      OptionsImage.ImageIndex = 23
      OptionsImage.Images = DMRecursos.ImgBotoes16x16
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TabStop = False
      OnClick = btBtnExportarClick
    end
    object btBtnEnviarEmail: TcxButton
      Tag = 2
      Left = 79
      Top = 0
      Width = 75
      Height = 35
      Hint = 'Exportar/Enviar e-mail'
      Align = alLeft
      Caption = 'E-mail'
      OptionsImage.ImageIndex = 25
      OptionsImage.Images = DMRecursos.ImgBotoes16x16
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TabStop = False
      OnClick = btBtnEnviarEmailClick
    end
    object btBtnAtualizarCusto: TcxButton
      Tag = 3
      Left = 872
      Top = 0
      Width = 120
      Height = 35
      Hint = 'Atualizar Valor de Custo (R$)'
      Align = alRight
      Caption = '&Atualizar Custo'
      OptionsImage.ImageIndex = 16
      OptionsImage.Images = DMRecursos.ImgPrincipal16x16
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      TabStop = False
      OnClick = btBtnAtualizarCustoClick
    end
    object btbtnSelecionar: TcxButton
      Tag = 5
      Left = 992
      Top = 0
      Width = 120
      Height = 35
      Hint = 'Selecionar registro'
      Align = alRight
      Caption = 'Selecionar (F2)'
      OptionsImage.ImageIndex = 10
      OptionsImage.Images = DMRecursos.ImgBotoes16x16
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      Visible = False
      OnClick = btbtnSelecionarClick
    end
  end
  object svdArquivo: TSaveDialog
    DefaultExt = '.xls'
    Filter = 'Planilha Excel (*.xls)|*.xls'
    Title = 'Salvar arquivo'
    Left = 280
    Top = 200
  end
  object smtpEmail: TIdSMTP
    SASLMechanisms = <>
    Left = 312
    Top = 200
  end
  object msgEmail: TIdMessage
    AttachmentEncoding = 'MIME'
    BccList = <>
    CCList = <>
    Encoding = meMIME
    FromList = <
      item
      end>
    Priority = mpHigh
    Recipients = <>
    ReplyTo = <>
    ConvertPreamble = True
    Left = 344
    Top = 200
  end
  object StyleRepository: TcxStyleRepository
    Left = 408
    Top = 200
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
  end
  object QryGrupo: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'Select'
      '    p.codgrupo as grupo_cod'
      '  , coalesce(g.descri, '#39'* A Definir'#39') as grupo_des'
      ''
      '  , count(e.lote_id) as itens'
      '  , sum(r.compra_qtde_01) as compra_qtde_01'
      '  , sum(r.compra_valor_01) as compra_valor_01'
      '  , sum(r.venda_qtde_01) as venda_qtde_01'
      '  , sum(r.venda_valor_01) as venda_valor_01'
      '  , max(r.data_ultima_compra) as data_ultima_compra'
      '  , max(r.data_ultima_venda) as data_ultima_venda'
      ''
      '  , sum(e.estoque) as estoque'
      '  , sum(e.reserva) as reserva'
      '  , sum(e.disponivel) as disponivel'
      '  , sum(e.custo_total) as custo_total'
      '  , sum(e.custo_reserva) as custo_reserva'
      '  , sum(e.custo_disponivel) as custo_disponivel'
      ''
      '  , cast(0.0 as numeric(18,4)) as percentual'
      ''
      
        'from GET_ESTOQUE_ALMOX_DISPONIVEL('#39'e=e'#39', c=c, null, null, null, ' +
        'null, null) e'
      '  inner join TBPRODUTO p on (p.cod = e.produto)'
      ''
      '  left join TBGRUPOPROD g on (g.cod = p.codgrupo)'
      
        '  left join TBPRODUTO_ROTATIVIDADE r on (r.cod_produto = e.produ' +
        'to)'
      ''
      'where (1=1)'
      ''
      'group by'
      '    1'
      '  , 2')
    Left = 56
    Top = 288
  end
  object QryFabricante: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'Select'
      '    p.codfabricante as fabricante_cod'
      '  , coalesce(f.nome, '#39'* A Definir'#39') as fabricante_nome'
      ''
      '  , count(e.lote_id) as itens'
      '  , sum(r.compra_qtde_01) as compra_qtde_01'
      '  , sum(r.compra_valor_01) as compra_valor_01'
      '  , sum(r.venda_qtde_01) as venda_qtde_01'
      '  , sum(r.venda_valor_01) as venda_valor_01'
      '  , max(r.data_ultima_compra) as data_ultima_compra'
      '  , max(r.data_ultima_venda) as data_ultima_venda'
      ''
      '  , sum(e.estoque) as estoque'
      '  , sum(e.reserva) as reserva'
      '  , sum(e.disponivel) as disponivel'
      '  , sum(e.custo_total) as custo_total'
      '  , sum(e.custo_reserva) as custo_reserva'
      '  , sum(e.custo_disponivel) as custo_disponivel'
      ''
      '  , cast(0.0 as numeric(18,4)) as percentual'
      ''
      
        'from GET_ESTOQUE_ALMOX_DISPONIVEL('#39'e=e'#39', c=c, null, null, null, ' +
        'null, null) e'
      '  inner join TBPRODUTO p on (p.cod = e.produto)'
      ''
      '  left join TBFABRICANTE f on (f.cod = p.codfabricante)'
      
        '  left join TBPRODUTO_ROTATIVIDADE r on (r.cod_produto = e.produ' +
        'to)'
      ''
      'where (1=1)'
      ''
      'group by'
      '    1'
      '  , 2')
    Left = 56
    Top = 320
  end
  object QryProduto: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'Select'
      '    e.produto'
      '  , p.descri'
      '  , p.apresentacao'
      
        '  , coalesce(nullif(trim(p.nome_amigo), '#39#39'), p.descri_apresentac' +
        'ao) as descri_apresentacao'
      '  , p.nome_amigo'
      '  , p.codgrupo as grupo_cod'
      '  , g.descri   as grupo_des'
      '  , p.codfabricante as fabricante_cod'
      '  , f.nome          as fabricante_nome'
      ''
      '  , coalesce(e.unidade, p.codunidade_fracionada) as und_cod'
      '  , u.unp_descricao as und_desc'
      '  , u.unp_sigla     as und_sigla'
      
        '  , substring(coalesce(nullif(trim(u.unp_sigla), '#39#39'), u.unp_desc' +
        'ricao) from 1 for 3) as und'
      ''
      '  , sum(r.compra_qtde_01) as compra_qtde_01'
      '  , sum(r.compra_valor_01) as compra_valor_01'
      '  , sum(r.venda_qtde_01) as venda_qtde_01'
      '  , sum(r.venda_valor_01) as venda_valor_01'
      '  , max(r.data_ultima_compra) as data_ultima_compra'
      '  , max(r.data_ultima_venda) as data_ultima_venda'
      ''
      '  , e.fracionador'
      '  , sum(e.estoque) as estoque'
      '  , sum(e.reserva) as reserva'
      '  , sum(e.disponivel) as disponivel'
      '  , sum(e.custo_total) as custo_total'
      '  , sum(e.custo_reserva) as custo_reserva'
      '  , sum(e.custo_disponivel) as custo_disponivel'
      
        '  , '#39'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'#39' as lote_id--e.lot' +
        'e_id'
      ''
      '  , cast(0.0 as numeric(18,4)) as percentual'
      ''
      
        'from GET_ESTOQUE_ALMOX_DISPONIVEL('#39'e=e'#39', c=c, null, null, null, ' +
        'null, null) e'
      '  inner join TBPRODUTO p on (p.cod = e.produto)'
      ''
      
        '  left join TBUNIDADEPROD u on (u.unp_cod = coalesce(e.unidade, ' +
        'p.codunidade_fracionada))'
      '  left join TBGRUPOPROD g on (g.cod = p.codgrupo)'
      '  left join TBFABRICANTE f on (f.cod = p.codfabricante)'
      
        '  left join TBPRODUTO_ROTATIVIDADE r on (r.cod_produto = e.produ' +
        'to)'
      ''
      'where (1=1)'
      ''
      'group by'
      '    e.produto'
      '  , p.descri'
      '  , p.apresentacao'
      '  , p.descri_apresentacao'
      '  , p.nome_amigo'
      '  , p.codgrupo'
      '  , g.descri'
      '  , p.codfabricante'
      '  , f.nome'
      '  , coalesce(e.unidade, p.codunidade_fracionada)'
      '  , u.unp_descricao'
      '  , u.unp_sigla'
      
        '  , substring(coalesce(nullif(trim(u.unp_sigla), '#39#39'), u.unp_desc' +
        'ricao) from 1 for 3)'
      '  , e.fracionador'
      '  , '#39'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'#39'--e.lote_id')
    Left = 56
    Top = 352
  end
  object QryTotal: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'Select'
      '    count(e.lote_id) as lotes'
      '  , sum(e.estoque) as estoque'
      '  , sum(e.reserva) as reserva'
      '  , sum(e.disponivel) as disponivel'
      '  , sum(e.custo_total) as custo_total'
      '  , sum(e.custo_reserva) as custo_reserva'
      '  , sum(e.custo_disponivel) as custo_disponivel'
      
        'from GET_ESTOQUE_ALMOX_DISPONIVEL('#39'e=e'#39', c=c, null, null, null, ' +
        'null, null) e'
      ''
      'where (1=1)'
      '')
    Left = 56
    Top = 400
  end
  object DspTotal: TDataSetProvider
    DataSet = QryTotal
    Left = 88
    Top = 400
  end
  object DspProduto: TDataSetProvider
    DataSet = QryProduto
    Left = 88
    Top = 352
  end
  object DspFabricante: TDataSetProvider
    DataSet = QryFabricante
    Left = 88
    Top = 320
  end
  object DspGrupo: TDataSetProvider
    DataSet = QryGrupo
    Left = 88
    Top = 288
  end
  object CdsGrupo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspGrupo'
    Left = 120
    Top = 288
  end
  object CdsFabricante: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspFabricante'
    Left = 120
    Top = 320
  end
  object CdsProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspProduto'
    Left = 120
    Top = 352
  end
  object CdsTotal: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspTotal'
    Left = 120
    Top = 400
  end
  object dsTotal: TDataSource
    DataSet = CdsTotal
    Left = 152
    Top = 400
  end
  object dsProduto: TDataSource
    DataSet = CdsProduto
    Left = 152
    Top = 352
  end
  object dsFabricante: TDataSource
    DataSet = CdsFabricante
    Left = 152
    Top = 320
  end
  object dsGrupo: TDataSource
    DataSet = CdsGrupo
    Left = 152
    Top = 288
  end
end
