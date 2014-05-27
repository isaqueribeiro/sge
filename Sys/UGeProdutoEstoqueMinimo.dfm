inherited FrmGeProdutoEstoqueMinimo: TFrmGeProdutoEstoqueMinimo
  Left = 170
  Top = 48
  Width = 1057
  Height = 686
  Caption = 'Estoque M'#237'nimo de Produtos'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 644
    Width = 1041
    Height = 4
    Align = alBottom
    Shape = bsSpacer
  end
  object Bevel3: TBevel
    Left = 0
    Top = 605
    Width = 1041
    Height = 4
    Align = alBottom
    Shape = bsSpacer
  end
  object pnlPesquisa: TPanel
    Left = 0
    Top = 0
    Width = 1041
    Height = 81
    Align = alTop
    BevelOuter = bvNone
    BorderWidth = 4
    TabOrder = 0
    object GrpBxPesquisar: TGroupBox
      Left = 4
      Top = 4
      Width = 1033
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
        1033
        73)
      object BtnPesquisar: TSpeedButton
        Left = 996
        Top = 40
        Width = 23
        Height = 22
        Hint = 'Executar Pesquisa'
        Anchors = [akTop, akRight]
        Flat = True
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FF314B62
          AC7D7EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF5084B20F6FE1325F8CB87E7AFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF32A0FE37A1FF
          106FE2325F8BB67D79FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF37A4FE379FFF0E6DDE355F89BB7F79FF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          37A4FE359EFF0F6FDE35608BA67B7FFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF38A5FE329DFF156DCE444F5BFF
          00FF9C6B65AF887BAF887EAA8075FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF3BABFFA1CAE7AD8679A98373E0CFB1FFFFDAFFFFDDFCF8CFCCB2
          9FA1746BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC0917DFC
          E9ACFFFFCCFFFFCFFFFFD0FFFFDEFFFFFAE3D3D1996965FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFB08978FAD192FEF4C2FFFFD0FFFFDAFFFFF6FFFF
          FCFFFFFCB69384FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB08978FEDA97ED
          B478FBEEBBFFFFD3FFFFDCFFFFF4FFFFF4FFFFE2E9DDBCA67B73FF00FFFF00FF
          FF00FFFF00FFFF00FFB18A78FFDE99E9A167F4D199FEFCCCFFFFD5FFFFDAFFFF
          DCFFFFD7EFE6C5A97E75FF00FFFF00FFFF00FFFF00FFFF00FFAA7F73FAE0A4F0
          B778EEBA7BF6DDA6FEFBCCFFFFD3FFFFD1FFFFD7D9C5A7A3756CFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFCEB293FFFEDDF4D1A5EEBA7BF2C78FF8E1ABFCF0
          BAFCFACAA3776FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA1746BE1
          D4D3FFFEEEF7CC8CF0B473F7C788FCE3A5C2A088A5776CFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF986865BA9587EAD7A4EAD59EE0C097A577
          6CA5776CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFA77E70A98073A4786EFF00FFFF00FFFF00FFFF00FF}
        ParentShowHint = False
        ShowHint = True
        OnClick = BtnPesquisarClick
      end
      object lblPesquisar: TLabel
        Left = 216
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
      object edPesquisar: TEdit
        Left = 216
        Top = 40
        Width = 773
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        CharCase = ecUpperCase
        TabOrder = 1
      end
      object edTipoFiltro: TComboBox
        Left = 16
        Top = 40
        Width = 193
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        OnChange = edTipoFiltroChange
        Items.Strings = (
          'Por Grupo'
          'Por Fabricante'
          'Por Produto')
      end
    end
  end
  object tlbBotoes: TToolBar
    Left = 0
    Top = 609
    Width = 1041
    Height = 35
    Align = alBottom
    ButtonHeight = 31
    ButtonWidth = 96
    Caption = #39
    TabOrder = 1
    object Bevel2: TBevel
      Left = 0
      Top = 2
      Width = 4
      Height = 31
      Shape = bsSpacer
    end
    object btbtnIncluir: TBitBtn
      Left = 4
      Top = 2
      Width = 75
      Height = 31
      Hint = 'Exportar dados para planilha'
      Caption = 'Exportar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TabStop = False
      OnClick = btbtnIncluirClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C20E0000C20E00000000000000000000FFFFFFFFFFFF
        FFFFFF6349356349356349356349356349356349356349356349356349356349
        35634935634935634935FFFFFFFFFFFFFFFFFFB7A293FAE2D2DFB89EE0B699E2
        B495E2B191E4AF8CE5AD88E6AB84E7A77FE8A57AEBA377634935FFFFFFFFFFFF
        FFFFFFB9A495FBE6DAFBE7DAFBE6D9FAE5D8FBE4D6FBE2D3F9E0D0F8DDCCF9DB
        C9F8DAC7E9A47B634935FFFFFFFFFFFFFFFFFFBBA696FBECE2D6AE90D6AE90D6
        AE90D6AE90FAE7DAD6AE90D6AE90D6AE90F8DBCAE7A780634935FFFFFFFFFFFF
        FFFFFFBEA899FDF0E8FDF0E9FDF0E8FCEFE7FCEDE5FBEBE1D6AE90FAE5D7D6AE
        90F9DECEE6AC856349351876390C6F320D6C330E6832116333125D3314573316
        5233184C33194834FCECE2FBE8DDD6AE90FAE1D2E4AE8A634935207C3EFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF174C34FCEFE8FCECE2FBE8
        DCFAE4D6E3B18F6349352B8445FFFFFFFFFFFFFFFFFFFFFFFF85A9871D6F3819
        5D345B7D5F165133D6AE90D6AE90D6AE90FBE6DAE2B395634935388E4E8BBD90
        1E763B1D6E391A62358BBD903E92471D673A9FB3A1145733FDF4EFFDF1EAD6AE
        90FBE9DDE0B699634935469857FFFFFF8BBD90519E5791C49657A25A21703A6C
        9B6FDFE9DF135D33D6AE90D6AE90D6AE90FBEADFDEB89D63493553A260FFFFFF
        CFDDCF96C69A57A25A267C39276731C0D1C0FFFFFF106233FEF8F3FDF4EFD6AE
        90FCECE1DDBAA16349355EAA66E5ECE58DC49364AC693489416FA57357A0603A
        8846D6E2D60E6832D6AE90D6AE90D6AE90DCBCA5DDBBA4644A3666B06C8EC293
        5FA863479751FFFFFFCBDACC54985D54985D9BB09C0D6C32FDF8F4FDF5EFB7A2
        93644A36644A36644A3666B06CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF0C6F32FEF7F4FDF4EFB9A495D4C5BA644A36FAFAFA66B06C61AD68
        5AA76452A15E489A593F9352358C4C2C8546247F411D7A3DFEF7F3FDF4EDC0AB
        9C644A36FAFAFAFFFFFFFFFFFFFFFFFFFFFFFFD8C2B2D7C1B1D6C0B0D4BEAED2
        BDADD1BAABCFB9AACDB6A8CBB6A6CAB4A5FBFAFAFFFFFFFFFFFF}
    end
    object btBtnEnviarEmail: TBitBtn
      Left = 79
      Top = 2
      Width = 75
      Height = 31
      Hint = 'Enviar e-mail'
      Caption = 'E-mail'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TabStop = False
      OnClick = btBtnEnviarEmailClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        180000000000000300000000000000000000000000000000000000FF00B29B96
        604830604830605040A7908700FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF00B09A93705040B6A09BCEB9BAC2ACAA705040B0989300
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00705840C0ACA7
        B39C97605040BDAAA7C0AAA760483000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0070584000FF00705040AA9086604840AA978E604830AA
        978E60483060483060483060483060483060483060483060483080605000FF00
        705840D2BFBC705040E4D1CE604830DED1CEE0D0C0E0C8C0E0C0B0E0B8B0D0B0
        A0D0A890D0A89060483080685000FF00706050D5C6C0705840ECE4E4605040EC
        E1DEFFF0F0F0E8E0F0E0E0F0D8D0F0D0C0E0D0C0D0A89060483080706000FF00
        806850D8CAC4705850D8CAC4705040D8C7BEB0A090B09890F0E8E0F0E0E0F0D8
        D0F0D0C0D0B0A060483090786000FF00807060DBCFC8806050DBCFC8705840DB
        CCC8C0A890B0A090B0A090F0E8E0F0E0E0F0D8D0E0B8B060483090807000FF00
        907860DBCFC8806850F3ECEC806050F3ECECFFFFFFFFF8FFFFF8F0FFF0F02048
        D02040A0E0C0B0604830A0807000FF00907870DCCFC9907060F3EDEC806850F3
        EDECFFFFFFFFFFFFFFF8FFFFF8F04060F02048D0E0C8C060483000FF0000FF00
        908070DCD1CAF4EEEEF4EEEE807060F4EEEEFFFFFFFFFFFFFFFFFFFFF8FFFFF8
        F0FFF0F0F0E8E060483000FF0000FF00A08870C7B5A6F0E0DDD1BFB0908070F0
        E0DDE0D8D0E0D0C0E0C8C0E0C0B0E0B8A0D0B0A0D0A890B0989000FF0000FF00
        D2C3BAA08870A08870908070D2C9C4F6EEEAFFF0F0F0E8E0F0E8E0F0E0D0F0D8
        D0F0D8D0B09890DCCECB00FF0000FF0000FF0000FF00EEE6E4E5D7D3F1ECEBFA
        F7F6FFF8FFFFF8F0F0F0F0F0E8E0F0D8D0B0A090DDD0CD00FF0000FF0000FF00
        00FF0000FF0000FF00EDE3E1D0B8B0F0F0F0FFFFFFFFFFFFFFF8F0F0F0F0B0A0
        90DED0CE00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00EEE5E3C0
        B0A0C0B0A0C0B0A0C0B0A0C0B0A0E8DDDB00FF0000FF0000FF00}
    end
  end
  object PgcTabelas: TPageControl
    Left = 0
    Top = 81
    Width = 1041
    Height = 524
    ActivePage = TbsGrupo
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object TbsGrupo: TTabSheet
      Caption = 'TbsGrupo'
      ImageIndex = 1
      object dbgGrupo: TcxGrid
        Left = 0
        Top = 0
        Width = 1033
        Height = 496
        Hint = 
          'Para carregar os produtos do grupo, basta'#13#10'executar "dois clique' +
          's" no registro.'
        Align = alClient
        TabOrder = 0
        object dbgGrupoTbl: TcxGridDBBandedTableView
          OnDblClick = dbgGrupoTblDblClick
          OnKeyPress = NovaPesquisaKeyPress
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsGrupo
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0.00'
              Kind = skSum
              FieldName = 'COMPRA_VALOR_01'
              Column = cxGridDBBandedColumn34
            end
            item
              Format = ',0.00'
              Kind = skSum
              FieldName = 'VENDA_VALOR_01'
              Column = cxGridDBBandedColumn36
            end
            item
              Format = ',0'
              Kind = skSum
              FieldName = 'ITENS'
              Column = cxGridDBBandedColumn58
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
              Width = 336
            end
            item
              Caption = 'Estoque'
              Options.Moving = False
              Width = 140
            end
            item
              Caption = #218'ltimo Movimento'
              Options.Moving = False
              Width = 150
            end
            item
              Caption = 'Rotatividade [0 - 1]'
              Options.Moving = False
              Width = 400
            end
            item
              Caption = 'Compra'
              Options.Moving = False
              Position.BandIndex = 3
              Position.ColIndex = 0
              Width = 200
            end
            item
              Caption = 'Venda'
              Options.Moving = False
              Position.BandIndex = 3
              Position.ColIndex = 1
              Width = 200
            end>
          object cxGridDBBandedColumn1: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CODIGO'
            Options.Filtering = False
            Options.Moving = False
            Width = 50
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object cxGridDBBandedColumn2: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DESCRICAO'
            Options.Filtering = False
            Options.Moving = False
            Width = 178
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object cxGridDBBandedColumn31: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DATA_ULTIMA_COMPRA'
            HeaderAlignmentHorz = taCenter
            Options.Moving = False
            Width = 75
            Position.BandIndex = 2
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object cxGridDBBandedColumn32: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DATA_ULTIMA_VENDA'
            HeaderAlignmentHorz = taCenter
            Options.Moving = False
            Width = 75
            Position.BandIndex = 2
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object cxGridDBBandedColumn33: TcxGridDBBandedColumn
            DataBinding.FieldName = 'COMPRA_QTDE_01'
            Options.Filtering = False
            Options.Moving = False
            Options.Sorting = False
            Width = 60
            Position.BandIndex = 4
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object cxGridDBBandedColumn34: TcxGridDBBandedColumn
            DataBinding.FieldName = 'COMPRA_VALOR_01'
            Options.Filtering = False
            Options.Moving = False
            Options.Sorting = False
            Width = 90
            Position.BandIndex = 4
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object cxGridDBBandedColumn35: TcxGridDBBandedColumn
            DataBinding.FieldName = 'VENDA_QTDE_01'
            Options.Filtering = False
            Options.Moving = False
            Options.Sorting = False
            Width = 60
            Position.BandIndex = 5
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object cxGridDBBandedColumn36: TcxGridDBBandedColumn
            DataBinding.FieldName = 'VENDA_VALOR_01'
            Options.Filtering = False
            Options.Moving = False
            Options.Sorting = False
            Width = 90
            Position.BandIndex = 5
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object cxGridDBBandedColumn56: TcxGridDBBandedColumn
            DataBinding.FieldName = 'VENDA_VALOR_99'
            Options.Filtering = False
            Options.Moving = False
            Options.Sorting = False
            Width = 90
            Position.BandIndex = -1
            Position.ColIndex = -1
            Position.RowIndex = -1
          end
          object cxGridDBBandedColumn57: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ESTOQUE_MINIMO'
            Options.Filtering = False
            Options.Moving = False
            Options.Sorting = False
            Width = 70
            Position.BandIndex = 1
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object cxGridDBBandedColumn58: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ITENS'
            Options.Filtering = False
            Options.Moving = False
            Options.Sorting = False
            Width = 45
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object dbgGrupoTblColumn1: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PERCENT_CQ01'
            HeaderAlignmentHorz = taCenter
            Options.Filtering = False
            Options.Moving = False
            Options.Sorting = False
            Width = 45
            Position.BandIndex = 4
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object dbgGrupoTblColumn2: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PERCENT_CV01'
            HeaderAlignmentHorz = taCenter
            Options.Filtering = False
            Options.Moving = False
            Options.Sorting = False
            Width = 45
            Position.BandIndex = 4
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object dbgGrupoTblColumn3: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PERCENT_VQ01'
            HeaderAlignmentHorz = taCenter
            Options.Filtering = False
            Options.Moving = False
            Options.Sorting = False
            Width = 45
            Position.BandIndex = 5
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object dbgGrupoTblColumn4: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PERCENT_VV01'
            HeaderAlignmentHorz = taCenter
            Options.Filtering = False
            Options.Moving = False
            Options.Sorting = False
            Width = 45
            Position.BandIndex = 5
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object dbgGrupoTblColumn5: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ESTOQUE'
            Options.Filtering = False
            Options.Moving = False
            Options.Sorting = False
            Width = 70
            Position.BandIndex = 1
            Position.ColIndex = 0
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
        Width = 1033
        Height = 496
        Hint = 
          'Para carregar os produtos do grupo, basta'#13#10'executar "dois clique' +
          's" no registro.'
        Align = alClient
        TabOrder = 0
        object dbgFabTbl: TcxGridDBBandedTableView
          OnDblClick = dbgFabTblDblClick
          OnKeyPress = NovaPesquisaKeyPress
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsFabricante
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0.00'
              Kind = skSum
              FieldName = 'COMPRA_VALOR_01'
              Column = cxGridDBBandedColumn8
            end
            item
              Format = ',0.00'
              Kind = skSum
              FieldName = 'VENDA_VALOR_01'
              Column = cxGridDBBandedColumn10
            end
            item
              Format = ',0'
              Kind = skSum
              FieldName = 'ITENS'
              Column = cxGridDBBandedColumn13
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
              Width = 336
            end
            item
              Caption = 'Estoque'
              Options.Moving = False
              Width = 140
            end
            item
              Caption = #218'ltimo Movimento'
              Options.Moving = False
              Width = 150
            end
            item
              Caption = 'Rotatividade [0 - 1]'
              Options.Moving = False
              Width = 400
            end
            item
              Caption = 'Compra'
              Options.Moving = False
              Position.BandIndex = 3
              Position.ColIndex = 0
              Width = 200
            end
            item
              Caption = 'Venda'
              Options.Moving = False
              Position.BandIndex = 3
              Position.ColIndex = 1
              Width = 200
            end>
          object cxGridDBBandedColumn3: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CODIGO'
            Options.Filtering = False
            Options.Moving = False
            Width = 50
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object cxGridDBBandedColumn4: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DESCRICAO'
            Options.Filtering = False
            Options.Moving = False
            Width = 178
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object cxGridDBBandedColumn5: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DATA_ULTIMA_COMPRA'
            HeaderAlignmentHorz = taCenter
            Options.Moving = False
            Width = 75
            Position.BandIndex = 2
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object cxGridDBBandedColumn6: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DATA_ULTIMA_VENDA'
            HeaderAlignmentHorz = taCenter
            Options.Moving = False
            Width = 75
            Position.BandIndex = 2
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object cxGridDBBandedColumn7: TcxGridDBBandedColumn
            DataBinding.FieldName = 'COMPRA_QTDE_01'
            Options.Filtering = False
            Options.Moving = False
            Options.Sorting = False
            Width = 60
            Position.BandIndex = 4
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object cxGridDBBandedColumn8: TcxGridDBBandedColumn
            DataBinding.FieldName = 'COMPRA_VALOR_01'
            Options.Filtering = False
            Options.Moving = False
            Options.Sorting = False
            Width = 90
            Position.BandIndex = 4
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object cxGridDBBandedColumn9: TcxGridDBBandedColumn
            DataBinding.FieldName = 'VENDA_QTDE_01'
            Options.Filtering = False
            Options.Moving = False
            Options.Sorting = False
            Width = 60
            Position.BandIndex = 5
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object cxGridDBBandedColumn10: TcxGridDBBandedColumn
            DataBinding.FieldName = 'VENDA_VALOR_01'
            Options.Filtering = False
            Options.Moving = False
            Options.Sorting = False
            Width = 90
            Position.BandIndex = 5
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object cxGridDBBandedColumn11: TcxGridDBBandedColumn
            DataBinding.FieldName = 'VENDA_VALOR_99'
            Options.Filtering = False
            Options.Moving = False
            Options.Sorting = False
            Width = 90
            Position.BandIndex = -1
            Position.ColIndex = -1
            Position.RowIndex = -1
          end
          object cxGridDBBandedColumn12: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ESTOQUE_MINIMO'
            Options.Filtering = False
            Options.Moving = False
            Options.Sorting = False
            Width = 70
            Position.BandIndex = 1
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object cxGridDBBandedColumn13: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ITENS'
            Options.Filtering = False
            Options.Moving = False
            Options.Sorting = False
            Width = 45
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object cxGridDBBandedColumn14: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PERCENT_CQ01'
            HeaderAlignmentHorz = taCenter
            Options.Filtering = False
            Options.Moving = False
            Options.Sorting = False
            Width = 45
            Position.BandIndex = 4
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object cxGridDBBandedColumn15: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PERCENT_CV01'
            HeaderAlignmentHorz = taCenter
            Options.Filtering = False
            Options.Moving = False
            Options.Sorting = False
            Width = 45
            Position.BandIndex = 4
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object cxGridDBBandedColumn16: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PERCENT_VQ01'
            HeaderAlignmentHorz = taCenter
            Options.Filtering = False
            Options.Moving = False
            Options.Sorting = False
            Width = 45
            Position.BandIndex = 5
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object cxGridDBBandedColumn17: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PERCENT_VV01'
            HeaderAlignmentHorz = taCenter
            Options.Filtering = False
            Options.Moving = False
            Options.Sorting = False
            Width = 45
            Position.BandIndex = 5
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object cxGridDBBandedColumn18: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ESTOQUE'
            Options.Filtering = False
            Options.Moving = False
            Options.Sorting = False
            Width = 70
            Position.BandIndex = 1
            Position.ColIndex = 0
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
        Width = 1033
        Height = 496
        Align = alClient
        TabOrder = 0
        object dbgProdutoTbl: TcxGridDBBandedTableView
          OnKeyPress = NovaPesquisaKeyPress
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsProduto
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0.00'
              Kind = skSum
              FieldName = 'COMPRA_VALOR_01'
              Column = dbgProdutoTblColumn6
            end
            item
              Format = ',0.00'
              Kind = skSum
              FieldName = 'VENDA_VALOR_01'
              Column = dbgProdutoTblColumn8
            end
            item
              Format = ',0'
              Kind = skCount
              FieldName = 'CODEMP'
              Column = dbgProdutoTblColumn1
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
              Caption = #218'ltimo Movimento'
              Options.Moving = False
              Width = 150
            end
            item
              Caption = 'Rotatividade [0 - 1]'
              Options.Moving = False
              Width = 280
            end
            item
              Caption = 'Compra'
              Options.Moving = False
              Position.BandIndex = 3
              Position.ColIndex = 0
              Width = 140
            end
            item
              Caption = 'Venda'
              Options.Moving = False
              Position.BandIndex = 3
              Position.ColIndex = 1
              Width = 140
            end>
          object dbgProdutoTblColumn1: TcxGridDBBandedColumn
            DataBinding.FieldName = 'COD'
            Options.Filtering = False
            Options.Moving = False
            Width = 60
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object dbgProdutoTblColumn2: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DESCRI'
            Options.Filtering = False
            Options.Moving = False
            Width = 247
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object dbgProdutoTblColumn3: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DATA_ULTIMA_COMPRA'
            HeaderAlignmentHorz = taCenter
            Options.Moving = False
            Width = 75
            Position.BandIndex = 2
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object dbgProdutoTblColumn4: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DATA_ULTIMA_VENDA'
            HeaderAlignmentHorz = taCenter
            Options.Moving = False
            Width = 75
            Position.BandIndex = 2
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object dbgProdutoTblColumn5: TcxGridDBBandedColumn
            DataBinding.FieldName = 'COMPRA_QTDE_01'
            Options.Filtering = False
            Options.Moving = False
            Options.Sorting = False
            Width = 60
            Position.BandIndex = 4
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object dbgProdutoTblColumn6: TcxGridDBBandedColumn
            DataBinding.FieldName = 'COMPRA_VALOR_01'
            Options.Filtering = False
            Options.Moving = False
            Options.Sorting = False
            Width = 80
            Position.BandIndex = 4
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object dbgProdutoTblColumn7: TcxGridDBBandedColumn
            DataBinding.FieldName = 'VENDA_QTDE_01'
            Options.Filtering = False
            Options.Moving = False
            Options.Sorting = False
            Width = 60
            Position.BandIndex = 5
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object dbgProdutoTblColumn8: TcxGridDBBandedColumn
            DataBinding.FieldName = 'VENDA_VALOR_01'
            Options.Filtering = False
            Options.Moving = False
            Options.Sorting = False
            Position.BandIndex = 5
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object dbgProdutoTblColumn29: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ESTOQMIN'
            Options.Filtering = False
            Options.Moving = False
            Options.Sorting = False
            Styles.Content = StyleContentEven
            Styles.Header = StyleSelecao
            Width = 60
            Position.BandIndex = 1
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object dbgProdutoTblColumn30: TcxGridDBBandedColumn
            DataBinding.FieldName = 'UNIDADE'
            Options.Filtering = False
            Options.Moving = False
            Options.Sorting = False
            Width = 60
            Position.BandIndex = 1
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object dbgProdutoTblColumn31: TcxGridDBBandedColumn
            DataBinding.FieldName = 'GRUPO'
            MinWidth = 150
            Options.HorzSizing = False
            Options.Moving = False
            Width = 150
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object dbgProdutoTblColumn32: TcxGridDBBandedColumn
            DataBinding.FieldName = 'FABRICANTE'
            MinWidth = 150
            Options.HorzSizing = False
            Options.Moving = False
            Width = 150
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object dbgProdutoTblColumn9: TcxGridDBBandedColumn
            DataBinding.FieldName = 'QTDE'
            Options.Filtering = False
            Options.Moving = False
            Options.Sorting = False
            Width = 60
            Position.BandIndex = 1
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
        end
        object dbgProdutoLvl: TcxGridLevel
          GridView = dbgProdutoTbl
        end
      end
    end
  end
  object QryProduto: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    SQL.Strings = (
      'Select'
      '    p.codemp'
      '  , p.cod'
      '  , p.codigo'
      '  , p.descri'
      '  , p.apresentacao'
      '  , p.descri_apresentacao'
      '  , p.codgrupo'
      '  , g.descri as grupo'
      '  , p.codfabricante'
      '  , f.nome as fabricante'
      '  , p.qtde'
      '  , p.estoqmin'
      '  , p.codunidade'
      
        '  , coalesce(nullif(trim(u.unp_sigla), '#39#39'), u.unp_descricao) as ' +
        'unidade'
      '  , r.compra_qtde_01'
      '  , r.compra_valor_01'
      '  , r.venda_qtde_01'
      '  , r.venda_valor_01'
      '  , r.data_ultima_compra'
      '  , r.data_ultima_venda'
      'from TBPRODUTO p'
      '  left join TBGRUPOPROD g on (g.cod = p.codgrupo)'
      '  left join TBFABRICANTE f on (f.cod = p.codfabricante)'
      '  left join TBUNIDADEPROD u on (u.unp_cod = p.codunidade)'
      '  left join TBPRODUTO_ROTATIVIDADE r on (r.cod_produto = p.cod)'
      ''
      
        'where (coalesce(p.estoqmin, 0) > 0 and coalesce(p.qtde, 0) < coa' +
        'lesce(p.estoqmin, 0))'
      '  and (1=1)'
      ''
      'order by'
      '    p.descri_apresentacao'
      '  , g.descri'
      '  , f.nome')
    Left = 56
    Top = 352
  end
  object DspProduto: TDataSetProvider
    DataSet = QryProduto
    Left = 88
    Top = 352
  end
  object CdsProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspProduto'
    Left = 120
    Top = 352
    object CdsProdutoCODEMP: TStringField
      FieldName = 'CODEMP'
      Origin = '"TBPRODUTO"."CODEMP"'
      Size = 18
    end
    object CdsProdutoCOD: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD'
      Origin = '"TBPRODUTO"."COD"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object CdsProdutoCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Origin = '"TBPRODUTO"."CODIGO"'
    end
    object CdsProdutoDESCRI: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRI'
      Origin = '"TBPRODUTO"."DESCRI"'
      Size = 50
    end
    object CdsProdutoAPRESENTACAO: TStringField
      DisplayLabel = 'Apresenta'#231#227'o'
      FieldName = 'APRESENTACAO'
      Origin = '"TBPRODUTO"."APRESENTACAO"'
      Size = 50
    end
    object CdsProdutoDESCRI_APRESENTACAO: TStringField
      DisplayLabel = 'Descri'#231#227'o / Apresenta'#231#227'o'
      FieldName = 'DESCRI_APRESENTACAO'
      Origin = '"TBPRODUTO"."DESCRI_APRESENTACAO"'
      Size = 100
    end
    object CdsProdutoCODGRUPO: TSmallintField
      FieldName = 'CODGRUPO'
      Origin = '"TBPRODUTO"."CODGRUPO"'
    end
    object CdsProdutoGRUPO: TStringField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO'
      Origin = '"TBGRUPOPROD"."DESCRI"'
      Size = 30
    end
    object CdsProdutoCODFABRICANTE: TIntegerField
      FieldName = 'CODFABRICANTE'
      Origin = '"TBPRODUTO"."CODFABRICANTE"'
    end
    object CdsProdutoFABRICANTE: TStringField
      DisplayLabel = 'Fabricante'
      FieldName = 'FABRICANTE'
      Origin = '"TBFABRICANTE"."NOME"'
      Size = 50
    end
    object CdsProdutoQTDE: TBCDField
      DisplayLabel = 'Atual'
      FieldName = 'QTDE'
      DisplayFormat = ',0.###'
      Precision = 18
      Size = 3
    end
    object CdsProdutoESTOQMIN: TSmallintField
      DisplayLabel = 'M'#237'nimo'
      FieldName = 'ESTOQMIN'
      Origin = '"TBPRODUTO"."ESTOQMIN"'
      DisplayFormat = ',0.###'
    end
    object CdsProdutoCODUNIDADE: TSmallintField
      FieldName = 'CODUNIDADE'
      Origin = '"TBPRODUTO"."CODUNIDADE"'
    end
    object CdsProdutoUNIDADE: TStringField
      DisplayLabel = 'Und.'
      FieldName = 'UNIDADE'
      ProviderFlags = []
      Size = 50
    end
    object CdsProdutoCOMPRA_QTDE_01: TBCDField
      DisplayLabel = 'Quant.'
      FieldName = 'COMPRA_QTDE_01'
      Origin = '"TBPRODUTO_ROTATIVIDADE"."COMPRA_QTDE_01"'
      DisplayFormat = ',0.###'
      Precision = 18
    end
    object CdsProdutoCOMPRA_VALOR_01: TBCDField
      DisplayLabel = 'Valor'
      FieldName = 'COMPRA_VALOR_01'
      Origin = '"TBPRODUTO_ROTATIVIDADE"."COMPRA_VALOR_01"'
      DisplayFormat = ',0.00'
      Precision = 18
    end
    object CdsProdutoVENDA_QTDE_01: TBCDField
      DisplayLabel = 'Quant.'
      FieldName = 'VENDA_QTDE_01'
      Origin = '"TBPRODUTO_ROTATIVIDADE"."VENDA_QTDE_01"'
      DisplayFormat = ',0.###'
      Precision = 18
    end
    object CdsProdutoVENDA_VALOR_01: TBCDField
      DisplayLabel = 'Valor'
      FieldName = 'VENDA_VALOR_01'
      Origin = '"TBPRODUTO_ROTATIVIDADE"."VENDA_VALOR_01"'
      DisplayFormat = ',0.00'
      Precision = 18
    end
    object CdsProdutoDATA_ULTIMA_COMPRA: TDateField
      Alignment = taCenter
      DisplayLabel = 'Compra'
      FieldName = 'DATA_ULTIMA_COMPRA'
      Origin = '"TBPRODUTO_ROTATIVIDADE"."DATA_ULTIMA_COMPRA"'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object CdsProdutoDATA_ULTIMA_VENDA: TDateField
      Alignment = taCenter
      DisplayLabel = 'Venda'
      FieldName = 'DATA_ULTIMA_VENDA'
      Origin = '"TBPRODUTO_ROTATIVIDADE"."DATA_ULTIMA_VENDA"'
      DisplayFormat = 'dd/mm/yyyy'
    end
  end
  object dsProduto: TDataSource
    DataSet = CdsProduto
    Left = 152
    Top = 352
  end
  object QryGrupo: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    SQL.Strings = (
      'select'
      '    p.codgrupo as Codigo'
      '  , coalesce(g.descri, '#39'* A Definir'#39') as descricao'
      '  , sum( coalesce(p.qtde, 0) ) as estoque'
      '  , sum( coalesce(p.estoqmin, 0) ) as estoque_minimo'
      '  , count( p.cod ) as itens'
      '  , sum( coalesce(r.compra_qtde_01, 0) )  as compra_qtde_01'
      '  , sum( coalesce(r.compra_valor_01, 0) ) as compra_valor_01'
      '  , sum( coalesce(r.venda_qtde_01, 0) )   as venda_qtde_01'
      '  , sum( coalesce(r.venda_valor_01, 0) )  as venda_valor_01'
      '  , max( r.data_ultima_compra ) as data_ultima_compra'
      '  , max( r.data_ultima_venda ) as data_ultima_venda'
      '  , cast(0.0 as numeric(18,4)) as percent_cq01'
      '  , cast(0.0 as numeric(18,4)) as percent_cv01'
      '  , cast(0.0 as numeric(18,4)) as percent_vq01'
      '  , cast(0.0 as numeric(18,4)) as percent_vv01'
      'from TBPRODUTO p'
      '  left join TBGRUPOPROD g on (g.cod = p.codgrupo)'
      '  left join TBPRODUTO_ROTATIVIDADE r on (r.cod_produto = p.cod)'
      ''
      
        'where (coalesce(p.estoqmin, 0) > 0 and coalesce(p.qtde, 0) < coa' +
        'lesce(p.estoqmin, 0))'
      '  and (1=1)'
      ''
      'group by 1, 2'
      ''
      'order by 2')
    Left = 56
    Top = 288
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
    object CdsGrupoCODIGO: TSmallintField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      DisplayFormat = '##000'
    end
    object CdsGrupoDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Size = 30
    end
    object CdsGrupoESTOQUE: TBCDField
      DisplayLabel = 'Atual'
      FieldName = 'ESTOQUE'
      DisplayFormat = ',0.###'
      Precision = 18
      Size = 3
    end
    object CdsGrupoESTOQUE_MINIMO: TLargeintField
      DisplayLabel = 'M'#237'nimo'
      FieldName = 'ESTOQUE_MINIMO'
      DisplayFormat = ',0'
    end
    object CdsGrupoITENS: TIntegerField
      DisplayLabel = 'Itens'
      FieldName = 'ITENS'
      DisplayFormat = ',0'
    end
    object CdsGrupoCOMPRA_QTDE_01: TBCDField
      DisplayLabel = 'Quant.'
      FieldName = 'COMPRA_QTDE_01'
      DisplayFormat = ',0'
      Precision = 18
    end
    object CdsGrupoCOMPRA_VALOR_01: TBCDField
      DisplayLabel = 'Valor'
      FieldName = 'COMPRA_VALOR_01'
      DisplayFormat = ',0.00'
      Precision = 18
    end
    object CdsGrupoVENDA_QTDE_01: TBCDField
      DisplayLabel = 'Quant.'
      FieldName = 'VENDA_QTDE_01'
      DisplayFormat = ',0'
      Precision = 18
    end
    object CdsGrupoVENDA_VALOR_01: TBCDField
      DisplayLabel = 'Valor'
      FieldName = 'VENDA_VALOR_01'
      DisplayFormat = ',0.00'
      Precision = 18
    end
    object CdsGrupoDATA_ULTIMA_COMPRA: TDateField
      Alignment = taCenter
      DisplayLabel = 'Compra'
      FieldName = 'DATA_ULTIMA_COMPRA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object CdsGrupoDATA_ULTIMA_VENDA: TDateField
      Alignment = taCenter
      DisplayLabel = 'Venda'
      FieldName = 'DATA_ULTIMA_VENDA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object CdsGrupoPERCENT_CQ01: TBCDField
      DisplayLabel = '%'
      FieldName = 'PERCENT_CQ01'
      DisplayFormat = ',0.0#'
      Precision = 18
    end
    object CdsGrupoPERCENT_CV01: TBCDField
      DisplayLabel = '%'
      FieldName = 'PERCENT_CV01'
      DisplayFormat = ',0.0#'
      Precision = 18
    end
    object CdsGrupoPERCENT_VQ01: TBCDField
      DisplayLabel = '%'
      FieldName = 'PERCENT_VQ01'
      DisplayFormat = ',0.0#'
      Precision = 18
    end
    object CdsGrupoPERCENT_VV01: TBCDField
      DisplayLabel = '%'
      FieldName = 'PERCENT_VV01'
      DisplayFormat = ',0.0#'
      Precision = 18
    end
  end
  object dsGrupo: TDataSource
    DataSet = CdsGrupo
    Left = 152
    Top = 288
  end
  object QryFabricante: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    SQL.Strings = (
      'select'
      '    p.codfabricante as Codigo'
      '  , coalesce(f.nome, '#39'* A Definir'#39') as descricao'
      '  , sum( coalesce(p.qtde, 0) ) as estoque'
      '  , sum( coalesce(p.estoqmin, 0) ) as estoque_minimo'
      '  , count( p.cod ) as itens'
      '  , sum( coalesce(r.compra_qtde_01, 0) )  as compra_qtde_01'
      '  , sum( coalesce(r.compra_valor_01, 0) ) as compra_valor_01'
      '  , sum( coalesce(r.venda_qtde_01, 0) )   as venda_qtde_01'
      '  , sum( coalesce(r.venda_valor_01, 0) )  as venda_valor_01'
      '  , max( r.data_ultima_compra ) as data_ultima_compra'
      '  , max( r.data_ultima_venda ) as data_ultima_venda'
      '  , cast(0.0 as numeric(18,4)) as percent_cq01'
      '  , cast(0.0 as numeric(18,4)) as percent_cv01'
      '  , cast(0.0 as numeric(18,4)) as percent_vq01'
      '  , cast(0.0 as numeric(18,4)) as percent_vv01'
      'from TBPRODUTO p'
      '  left join TBFABRICANTE f on (f.cod = p.codfabricante)'
      '  left join TBPRODUTO_ROTATIVIDADE r on (r.cod_produto = p.cod)'
      ''
      
        'where (coalesce(p.estoqmin, 0) > 0 and coalesce(p.qtde, 0) < coa' +
        'lesce(p.estoqmin, 0))'
      '  and (1=1)'
      ''
      'group by 1, 2'
      ''
      'order by 2')
    Left = 56
    Top = 320
  end
  object DspFabricante: TDataSetProvider
    DataSet = QryFabricante
    Left = 88
    Top = 320
  end
  object CdsFabricante: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspFabricante'
    Left = 120
    Top = 320
    object CdsFabricanteCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      DisplayFormat = '###0000'
    end
    object CdsFabricanteDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object CdsFabricanteESTOQUE: TBCDField
      DisplayLabel = 'Atual'
      FieldName = 'ESTOQUE'
      DisplayFormat = ',0.###'
      Precision = 18
      Size = 3
    end
    object CdsFabricanteESTOQUE_MINIMO: TLargeintField
      DisplayLabel = 'M'#237'nimo'
      FieldName = 'ESTOQUE_MINIMO'
      DisplayFormat = ',0'
    end
    object CdsFabricanteITENS: TIntegerField
      DisplayLabel = 'Itens'
      FieldName = 'ITENS'
      DisplayFormat = ',0'
    end
    object CdsFabricanteCOMPRA_QTDE_01: TBCDField
      DisplayLabel = 'Quant.'
      FieldName = 'COMPRA_QTDE_01'
      DisplayFormat = ',0'
      Precision = 18
    end
    object CdsFabricanteCOMPRA_VALOR_01: TBCDField
      DisplayLabel = 'Valor'
      FieldName = 'COMPRA_VALOR_01'
      DisplayFormat = ',0.00'
      Precision = 18
    end
    object CdsFabricanteVENDA_QTDE_01: TBCDField
      DisplayLabel = 'Quant.'
      FieldName = 'VENDA_QTDE_01'
      DisplayFormat = ',0'
      Precision = 18
    end
    object CdsFabricanteVENDA_VALOR_01: TBCDField
      DisplayLabel = 'Valor'
      FieldName = 'VENDA_VALOR_01'
      DisplayFormat = ',0.00'
      Precision = 18
    end
    object CdsFabricanteDATA_ULTIMA_COMPRA: TDateField
      Alignment = taCenter
      DisplayLabel = 'Compra'
      FieldName = 'DATA_ULTIMA_COMPRA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object CdsFabricanteDATA_ULTIMA_VENDA: TDateField
      Alignment = taCenter
      DisplayLabel = 'Venda'
      FieldName = 'DATA_ULTIMA_VENDA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object CdsFabricantePERCENT_CQ01: TBCDField
      DisplayLabel = '%'
      FieldName = 'PERCENT_CQ01'
      DisplayFormat = ',0.0#'
      Precision = 18
    end
    object CdsFabricantePERCENT_CV01: TBCDField
      DisplayLabel = '%'
      FieldName = 'PERCENT_CV01'
      DisplayFormat = ',0.0#'
      Precision = 18
    end
    object CdsFabricantePERCENT_VQ01: TBCDField
      DisplayLabel = '%'
      FieldName = 'PERCENT_VQ01'
      DisplayFormat = ',0.0#'
      Precision = 18
    end
    object CdsFabricantePERCENT_VV01: TBCDField
      DisplayLabel = '%'
      FieldName = 'PERCENT_VV01'
      DisplayFormat = ',0.0#'
      Precision = 18
    end
  end
  object dsFabricante: TDataSource
    DataSet = CdsFabricante
    Left = 152
    Top = 320
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
  object svdArquivo: TSaveDialog
    DefaultExt = '.xls'
    Filter = 'Planilha Excel (*.xls)|*.xls'
    Title = 'Salvar arquivo'
    Left = 280
    Top = 200
  end
  object smtpEmail: TIdSMTP
    MaxLineAction = maException
    Port = 25
    AuthenticationType = atNone
    Left = 312
    Top = 200
  end
  object msgEmail: TIdMessage
    AttachmentEncoding = 'MIME'
    BccList = <>
    CCList = <>
    DeleteTempFiles = False
    Encoding = meMIME
    Priority = mpHigh
    Recipients = <>
    ReplyTo = <>
    Left = 344
    Top = 200
  end
  object IdSSLIOHandlerSocket: TIdSSLIOHandlerSocket
    SSLOptions.Method = sslvSSLv2
    SSLOptions.Mode = sslmClient
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 376
    Top = 200
  end
  object QryTotal: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    SQL.Strings = (
      'select'
      '    sum( coalesce(p.qtde, 0) ) as qtde'
      '  , count( p.cod ) as itens'
      '  , max( r.data_ultima_compra ) as data_ultima_compra'
      '  , max( r.data_ultima_venda  ) as data_ultima_venda'
      '  , sum( coalesce(r.compra_qtde_01, 0) )  as compra_qtde_01'
      '  , sum( coalesce(r.compra_valor_01, 0) ) as compra_valor_01'
      '  , sum( coalesce(r.venda_qtde_01, 0) )   as venda_qtde_01'
      '  , sum( coalesce(r.venda_valor_01, 0) )  as venda_valor_01'
      '  , sum( coalesce(r.compra_qtde_03, 0) )  as compra_qtde_03'
      '  , sum( coalesce(r.compra_valor_03, 0) ) as compra_valor_03'
      '  , sum( coalesce(r.venda_qtde_03, 0) )   as venda_qtde_03'
      '  , sum( coalesce(r.venda_valor_03, 0) )  as venda_valor_03'
      '  , sum( coalesce(r.compra_qtde_06, 0) )  as compra_qtde_06'
      '  , sum( coalesce(r.compra_valor_06, 0) ) as compra_valor_06'
      '  , sum( coalesce(r.venda_qtde_06, 0) )   as venda_qtde_06'
      '  , sum( coalesce(r.venda_valor_06, 0) )  as venda_valor_06'
      '  , sum( coalesce(r.compra_qtde_09, 0) )  as compra_qtde_09'
      '  , sum( coalesce(r.compra_valor_09, 0) ) as compra_valor_09'
      '  , sum( coalesce(r.venda_qtde_09, 0) )   as venda_qtde_09'
      '  , sum( coalesce(r.venda_valor_09, 0) )  as venda_valor_09'
      '  , sum( coalesce(r.compra_qtde_12, 0) )  as compra_qtde_12'
      '  , sum( coalesce(r.compra_valor_12, 0) ) as compra_valor_12'
      '  , sum( coalesce(r.venda_qtde_12, 0) )   as venda_qtde_12'
      '  , sum( coalesce(r.venda_valor_12, 0) )  as venda_valor_12'
      '  , sum( coalesce(r.compra_qtde_99, 0) )  as compra_qtde_99'
      '  , sum( coalesce(r.compra_valor_99, 0) ) as compra_valor_99'
      '  , sum( coalesce(r.venda_qtde_99, 0) )   as venda_qtde_99'
      '  , sum( coalesce(r.venda_valor_99, 0) )  as venda_valor_99'
      'from TBPRODUTO p'
      '  left join TBPRODUTO_ROTATIVIDADE r on (r.cod_produto = p.cod)'
      ''
      'where 1=1')
    Left = 56
    Top = 400
  end
  object DspTotal: TDataSetProvider
    DataSet = QryTotal
    Left = 88
    Top = 400
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
end
