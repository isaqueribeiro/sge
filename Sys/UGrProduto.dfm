object frmGrProdutos: TfrmGrProdutos
  Left = 572
  Top = 268
  Width = 737
  Height = 329
  Caption = 'Produtos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object tlbrGridFornec: TToolBar
    Left = 0
    Top = 256
    Width = 721
    Height = 35
    Align = alBottom
    ButtonHeight = 31
    Caption = #39
    TabOrder = 0
    object btbtnIncluir: TBitBtn
      Left = 0
      Top = 2
      Width = 75
      Height = 31
      Caption = 'Incluir'
      TabOrder = 0
      OnClick = btbtnIncluirClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333300000000
        0000333377777777777733330FFFFFFFFFF033337F3FFF3F3FF733330F000F0F
        00F033337F777373773733330FFFFFFFFFF033337F3FF3FF3FF733330F00F00F
        00F033337F773773773733330FFFFFFFFFF033337FF3333FF3F7333300FFFF00
        F0F03333773FF377F7373330FB00F0F0FFF0333733773737F3F7330FB0BF0FB0
        F0F0337337337337373730FBFBF0FB0FFFF037F333373373333730BFBF0FB0FF
        FFF037F3337337333FF700FBFBFB0FFF000077F333337FF37777E0BFBFB000FF
        0FF077FF3337773F7F37EE0BFB0BFB0F0F03777FF3733F737F73EEE0BFBF00FF
        00337777FFFF77FF7733EEEE0000000003337777777777777333}
      NumGlyphs = 2
    end
    object btbtnAlterar: TBitBtn
      Left = 75
      Top = 2
      Width = 75
      Height = 31
      Caption = 'Alterar'
      TabOrder = 1
      OnClick = btbtnAlterarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
        000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
        00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
        F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
        0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
        FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
        FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
        0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
        00333377737FFFFF773333303300000003333337337777777333}
      NumGlyphs = 2
    end
    object btbtnExcluir: TBitBtn
      Left = 150
      Top = 2
      Width = 75
      Height = 31
      Caption = 'Excluir'
      TabOrder = 2
      OnClick = btbtnExcluirClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        55555FFFFFFF5F55FFF5777777757559995777777775755777F7555555555550
        305555555555FF57F7F555555550055BB0555555555775F777F55555550FB000
        005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
        B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
        B05555577F555557F7F5550E0BFBFB00B055557575F55577F7F550EEE0BFB0B0
        B05557FF575F5757F7F5000EEE0BFBF0B055777FF575FFF7F7F50000EEE00000
        B0557777FF577777F7F500000E055550805577777F7555575755500000555555
        05555777775555557F5555000555555505555577755555557555}
      NumGlyphs = 2
    end
    object btbtnGrav: TBitBtn
      Left = 225
      Top = 2
      Width = 75
      Height = 31
      Caption = 'Gravar'
      TabOrder = 3
      OnClick = btbtnGravClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500000000055
        555557777777775F55550FFFFFFFFF0555557F5555555F7FFF5F0FEEEEEE0000
        05007F555555777775770FFFFFF0BFBFB00E7F5F5557FFF557770F0EEEE000FB
        FB0E7F75FF57775555770FF00F0FBFBFBF0E7F57757FFFF555770FE0B00000FB
        FB0E7F575777775555770FFF0FBFBFBFBF0E7F5575FFFFFFF5770FEEE0000000
        FB0E7F555777777755770FFFFF0B00BFB0007F55557577FFF7770FEEEEE0B000
        05557F555557577775550FFFFFFF0B0555557FF5F5F57575F55500F0F0F0F0B0
        555577F7F7F7F7F75F5550707070700B055557F7F7F7F7757FF5507070707050
        9055575757575757775505050505055505557575757575557555}
      NumGlyphs = 2
    end
    object btbtnCancel: TBitBtn
      Left = 300
      Top = 2
      Width = 75
      Height = 31
      Caption = 'Cancelar'
      TabOrder = 4
      OnClick = btbtnCancelClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
        555557777F777555F55500000000555055557777777755F75555005500055055
        555577F5777F57555555005550055555555577FF577F5FF55555500550050055
        5555577FF77577FF555555005050110555555577F757777FF555555505099910
        555555FF75777777FF555005550999910555577F5F77777775F5500505509990
        3055577F75F77777575F55005055090B030555775755777575755555555550B0
        B03055555F555757575755550555550B0B335555755555757555555555555550
        BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
        50BB555555555555575F555555555555550B5555555555555575}
      NumGlyphs = 2
    end
    object ToolButton1: TToolButton
      Left = 375
      Top = 2
      Width = 8
      Caption = 'ToolButton1'
      Style = tbsSeparator
    end
    object btbtnFechar: TBitBtn
      Left = 383
      Top = 2
      Width = 75
      Height = 31
      Caption = 'Fechar'
      TabOrder = 5
      OnClick = btbtnFecharClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033BBBBBBBBBB
        BB33337777777777777F33BB00BBBBBBBB33337F77333333F37F33BB0BBBBBB0
        BB33337F73F33337FF7F33BBB0BBBB000B33337F37FF3377737F33BBB00BB00B
        BB33337F377F3773337F33BBBB0B00BBBB33337F337F7733337F33BBBB000BBB
        BB33337F33777F33337F33EEEE000EEEEE33337F3F777FFF337F33EE0E80000E
        EE33337F73F77773337F33EEE0800EEEEE33337F37377F33337F33EEEE000EEE
        EE33337F33777F33337F33EEEEE00EEEEE33337F33377FF3337F33EEEEEE00EE
        EE33337F333377F3337F33EEEEEE00EEEE33337F33337733337F33EEEEEEEEEE
        EE33337FFFFFFFFFFF7F33EEEEEEEEEEEE333377777777777773}
      NumGlyphs = 2
    end
    object ToolButton2: TToolButton
      Left = 458
      Top = 2
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 0
      Style = tbsSeparator
    end
    object ToolButton3: TToolButton
      Left = 466
      Top = 2
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 1
      Style = tbsSeparator
    end
    object ToolButton4: TToolButton
      Left = 474
      Top = 2
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object spdbtnSoma: TSpeedButton
      Left = 482
      Top = 2
      Width = 34
      Height = 31
      Hint = 'Total Cadastrados'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333333333333333333FFFFFFFFFFF33330000000000
        03333377777777777F33333003333330033333377FF333377F33333300333333
        0333333377FF33337F3333333003333303333333377FF3337333333333003333
        333333333377FF3333333333333003333333333333377FF33333333333330033
        3333333333337733333333333330033333333333333773333333333333003333
        33333333337733333F3333333003333303333333377333337F33333300333333
        03333333773333337F33333003333330033333377FFFFFF77F33330000000000
        0333337777777777733333333333333333333333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = spdbtnSomaClick
    end
  end
  object pnlBotaoGrid: TPanel
    Left = 0
    Top = 205
    Width = 721
    Height = 51
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 478
      Top = 0
      Width = 243
      Height = 51
      Align = alRight
      Caption = 'Pesquisar ...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label13: TLabel
        Left = 11
        Top = 20
        Width = 49
        Height = 13
        Caption = 'Produto:'
      end
      object SpeedButton1: TSpeedButton
        Left = 204
        Top = 16
        Width = 29
        Height = 27
        Hint = 'Clique aqui para executar a pesquisa ...'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
          300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
          330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
          333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
          339977FF777777773377000BFB03333333337773FF733333333F333000333333
          3300333777333333337733333333333333003333333333333377333333333333
          333333333333333333FF33333333333330003333333333333777333333333333
          3000333333333333377733333333333333333333333333333333}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton1Click
      end
      object edt: TEdit
        Left = 64
        Top = 21
        Width = 139
        Height = 21
        Hint = 'Digite aqui a palavra-chave da pesquisa'
        CharCase = ecUpperCase
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 721
    Height = 205
    ActivePage = TabSheetLista
    Align = alClient
    DockSite = True
    HotTrack = True
    TabOrder = 2
    object TabSheetLista: TTabSheet
      Caption = 'Lista'
      OnShow = TabSheetListaShow
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 713
        Height = 177
        Align = alClient
        Color = clWhite
        DataSource = dtsrcProd
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnKeyDown = DBGrid1KeyDown
        OnTitleClick = DBGrid1TitleClick
        Columns = <
          item
            Expanded = False
            FieldName = 'COD'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'd.'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 103
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRI'
            Title.Alignment = taCenter
            Title.Caption = 'Produto'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 233
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MODELO'
            Title.Alignment = taCenter
            Title.Caption = 'Modelo'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 131
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTDE'
            Title.Alignment = taCenter
            Title.Caption = 'Estoque'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRECO'
            Title.Alignment = taCenter
            Title.Caption = 'Pre'#231'o'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 71
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'REFERENCIA'
            Title.Alignment = taCenter
            Title.Caption = 'Refer'#234'ncia'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 167
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SECAO'
            Title.Alignment = taCenter
            Title.Caption = 'Se'#231#227'o'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LookGrupProd'
            Title.Alignment = taCenter
            Title.Caption = 'Grupo'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end>
      end
    end
    object TabSheetDados: TTabSheet
      Caption = 'Dados'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ImageIndex = 1
      ParentFont = False
      object Label1: TLabel
        Left = 16
        Top = 16
        Width = 44
        Height = 13
        Caption = 'C'#243'digo:'
      end
      object Label2: TLabel
        Left = 136
        Top = 16
        Width = 49
        Height = 13
        Caption = 'Produto:'
        FocusControl = DBEdit2
      end
      object Label3: TLabel
        Left = 520
        Top = 16
        Width = 46
        Height = 13
        Caption = 'Modelo:'
        FocusControl = DBEdit3
      end
      object Label4: TLabel
        Left = 250
        Top = 112
        Width = 38
        Height = 13
        Caption = 'Pre'#231'o:'
        FocusControl = DBEdit4
      end
      object Label5: TLabel
        Left = 16
        Top = 64
        Width = 67
        Height = 13
        Caption = 'Refer'#234'ncia:'
        FocusControl = DBEdit5
      end
      object Label6: TLabel
        Left = 230
        Top = 64
        Width = 41
        Height = 13
        Caption = 'Se'#231#227'o:'
        FocusControl = DBEdit6
      end
      object Label7: TLabel
        Left = 608
        Top = 112
        Width = 51
        Height = 13
        Caption = 'Estoque:'
        FocusControl = DBEdit7
      end
      object Label8: TLabel
        Left = 389
        Top = 64
        Width = 52
        Height = 13
        Caption = 'Unidade:'
        FocusControl = DBEdit8
      end
      object Label9: TLabel
        Left = 497
        Top = 112
        Width = 81
        Height = 13
        Caption = 'Estoque M'#237'n.:'
        FocusControl = DBEdit9
      end
      object Label11: TLabel
        Left = 376
        Top = 112
        Width = 37
        Height = 13
        Caption = 'Custo:'
        FocusControl = DBEdit11
      end
      object Label12: TLabel
        Left = 472
        Top = 64
        Width = 39
        Height = 13
        Caption = 'Grupo:'
      end
      object Label10: TLabel
        Left = 16
        Top = 112
        Width = 53
        Height = 13
        Caption = 'Empresa:'
        FocusControl = DBLookupComboBox2
      end
      object DBEdit2: TDBEdit
        Left = 136
        Top = 32
        Width = 361
        Height = 21
        CharCase = ecUpperCase
        DataField = 'DESCRI'
        DataSource = dtsrcProd
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 520
        Top = 32
        Width = 161
        Height = 21
        CharCase = ecUpperCase
        DataField = 'MODELO'
        DataSource = dtsrcProd
        TabOrder = 2
      end
      object DBEdit4: TDBEdit
        Left = 250
        Top = 128
        Width = 103
        Height = 21
        CharCase = ecUpperCase
        DataField = 'PRECO'
        DataSource = dtsrcProd
        TabOrder = 7
      end
      object DBEdit5: TDBEdit
        Left = 16
        Top = 80
        Width = 193
        Height = 21
        CharCase = ecUpperCase
        DataField = 'REFERENCIA'
        DataSource = dtsrcProd
        TabOrder = 3
      end
      object DBEdit6: TDBEdit
        Left = 230
        Top = 80
        Width = 139
        Height = 21
        CharCase = ecUpperCase
        DataField = 'SECAO'
        DataSource = dtsrcProd
        TabOrder = 4
      end
      object DBEdit7: TDBEdit
        Left = 608
        Top = 128
        Width = 75
        Height = 21
        CharCase = ecUpperCase
        DataField = 'QTDE'
        DataSource = dtsrcProd
        Enabled = False
        TabOrder = 10
      end
      object DBEdit8: TDBEdit
        Left = 389
        Top = 80
        Width = 56
        Height = 21
        CharCase = ecUpperCase
        DataField = 'UNIDADE'
        DataSource = dtsrcProd
        TabOrder = 5
      end
      object DBEdit9: TDBEdit
        Left = 497
        Top = 128
        Width = 86
        Height = 21
        CharCase = ecUpperCase
        DataField = 'ESTOQMIN'
        DataSource = dtsrcProd
        TabOrder = 9
      end
      object DBEdit11: TDBEdit
        Left = 376
        Top = 128
        Width = 94
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CUSTOMEDIO'
        DataSource = dtsrcProd
        TabOrder = 8
      end
      object DBEdit1: TDBEdit
        Left = 16
        Top = 32
        Width = 97
        Height = 21
        CharCase = ecUpperCase
        DataField = 'COD'
        DataSource = dtsrcProd
        TabOrder = 0
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 472
        Top = 80
        Width = 209
        Height = 21
        DataField = 'LookGrupProd'
        DataSource = dtsrcProd
        TabOrder = 6
      end
      object DBLookupComboBox2: TDBLookupComboBox
        Left = 16
        Top = 128
        Width = 209
        Height = 21
        DataField = 'LookEmp'
        DataSource = dtsrcProd
        TabOrder = 11
      end
    end
  end
  object ibdtstProd: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from TBPRODUTO'
      'where'
      '  COD = :OLD_COD')
    InsertSQL.Strings = (
      'insert into TBPRODUTO'
      
        '  (COD, DESCRI, MODELO, PRECO, REFERENCIA, SECAO, QTDE, UNIDADE,' +
        ' ESTOQMIN, '
      '   CODGRUPO, CUSTOMEDIO, CODEMP)'
      'values'
      
        '  (:COD, :DESCRI, :MODELO, :PRECO, :REFERENCIA, :SECAO, :QTDE, :' +
        'UNIDADE, '
      '   :ESTOQMIN, :CODGRUPO, :CUSTOMEDIO, :CODEMP)')
    RefreshSQL.Strings = (
      'Select '
      '  COD,'
      '  DESCRI,'
      '  MODELO,'
      '  PRECO,'
      '  REFERENCIA,'
      '  SECAO,'
      '  QTDE,'
      '  UNIDADE,'
      '  ESTOQMIN,'
      '  CODGRUPO,'
      '  CUSTOMEDIO,'
      '  CODEMP'
      'from TBPRODUTO '
      'where'
      '  COD = :COD')
    SelectSQL.Strings = (
      'select * from TBPRODUTO'
      'order by DESCRI')
    ModifySQL.Strings = (
      'update TBPRODUTO'
      'set'
      '  COD = :COD,'
      '  DESCRI = :DESCRI,'
      '  MODELO = :MODELO,'
      '  PRECO = :PRECO,'
      '  REFERENCIA = :REFERENCIA,'
      '  SECAO = :SECAO,'
      '  QTDE = :QTDE,'
      '  UNIDADE = :UNIDADE,'
      '  ESTOQMIN = :ESTOQMIN,'
      '  CODGRUPO = :CODGRUPO,'
      '  CUSTOMEDIO = :CUSTOMEDIO,'
      '  CODEMP = :CODEMP'
      'where'
      '  COD = :OLD_COD')
    GeneratorField.ApplyEvent = gamOnPost
    Left = 48
    Top = 176
    object ibdtstProdDESCRI: TIBStringField
      FieldName = 'DESCRI'
      Origin = 'TBPRODUTO.DESCRI'
      Size = 50
    end
    object ibdtstProdMODELO: TIBStringField
      FieldName = 'MODELO'
      Origin = 'TBPRODUTO.MODELO'
      Size = 40
    end
    object ibdtstProdPRECO: TIBBCDField
      FieldName = 'PRECO'
      Origin = 'TBPRODUTO.PRECO'
      currency = True
      Precision = 18
      Size = 2
    end
    object ibdtstProdREFERENCIA: TIBStringField
      FieldName = 'REFERENCIA'
      Origin = 'TBPRODUTO.REFERENCIA'
      Size = 15
    end
    object ibdtstProdSECAO: TIBStringField
      FieldName = 'SECAO'
      Origin = 'TBPRODUTO.SECAO'
    end
    object ibdtstProdQTDE: TSmallintField
      FieldName = 'QTDE'
      Origin = 'TBPRODUTO.QTDE'
    end
    object ibdtstProdUNIDADE: TIBStringField
      FieldName = 'UNIDADE'
      Origin = 'TBPRODUTO.UNIDADE'
      Size = 5
    end
    object ibdtstProdESTOQMIN: TSmallintField
      FieldName = 'ESTOQMIN'
      Origin = 'TBPRODUTO.ESTOQMIN'
    end
    object ibdtstProdCODGRUPO: TSmallintField
      FieldName = 'CODGRUPO'
      Origin = 'TBPRODUTO.CODGRUPO'
    end
    object ibdtstProdCUSTOMEDIO: TIBBCDField
      FieldName = 'CUSTOMEDIO'
      Origin = 'TBPRODUTO.CUSTOMEDIO'
      currency = True
      Precision = 18
      Size = 2
    end
    object ibdtstProdLookGrupProd: TStringField
      FieldKind = fkLookup
      FieldName = 'LookGrupProd'
      LookupDataSet = ibdtstGrupoProd
      LookupKeyFields = 'COD'
      LookupResultField = 'DESCRI'
      KeyFields = 'CODGRUPO'
      Lookup = True
    end
    object ibdtstProdCOD: TIBStringField
      FieldName = 'COD'
      Origin = 'TBPRODUTO.COD'
      Required = True
      Size = 10
    end
    object ibdtstProdCODEMP: TIBStringField
      FieldName = 'CODEMP'
      Origin = 'TBPRODUTO.CODEMP'
      Size = 18
    end
    object ibdtstProdLookEmp: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEmp'
      LookupDataSet = ibdtstEmp
      LookupKeyFields = 'CNPJ'
      LookupResultField = 'RZSOC'
      KeyFields = 'CODEMP'
      Lookup = True
    end
  end
  object dtsrcProd: TDataSource
    DataSet = ibdtstProd
    Left = 120
    Top = 176
  end
  object ibqryTotProd: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select count(*) from TBPRODUTO')
    Left = 352
    Top = 176
    object ibqryTotProdCOUNT: TIntegerField
      FieldName = 'COUNT'
      Required = True
    end
  end
  object ibdtstGrupoProd: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from TBGRUPOPROD'
      'where'
      '  COD = :OLD_COD')
    InsertSQL.Strings = (
      'insert into TBGRUPOPROD'
      '  (COD, DESCRI)'
      'values'
      '  (:COD, :DESCRI)')
    RefreshSQL.Strings = (
      'Select '
      '  COD,'
      '  DESCRI'
      'from TBGRUPOPROD '
      'where'
      '  COD = :COD')
    SelectSQL.Strings = (
      'select * from TBGRUPOPROD'
      'order by DESCRI')
    ModifySQL.Strings = (
      'update TBGRUPOPROD'
      'set'
      '  COD = :COD,'
      '  DESCRI = :DESCRI'
      'where'
      '  COD = :OLD_COD')
    GeneratorField.ApplyEvent = gamOnPost
    Left = 272
    Top = 176
  end
  object ibdtstEmp: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    SelectSQL.Strings = (
      'select CNPJ, RZSOC from TBEMPRESA')
    Left = 192
    Top = 184
  end
  object EvUserAccess1: TEvUserAccess
    Left = 92
    Top = 48
  end
end
