object frmVenda: TfrmVenda
  Left = 644
  Top = 202
  Width = 633
  Height = 515
  AutoSize = True
  BorderIcons = []
  Caption = 'Venda'
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
  object Bevel1: TBevel
    Left = 0
    Top = 73
    Width = 617
    Height = 369
    Align = alClient
  end
  object Bevel2: TBevel
    Left = 0
    Top = 73
    Width = 617
    Height = 369
    Align = alClient
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 617
    Height = 73
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      617
      73)
    object Label1: TLabel
      Left = 6
      Top = 16
      Width = 53
      Height = 13
      Caption = 'Empresa:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 500
      Top = 9
      Width = 41
      Height = 13
      Caption = 'Venda:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 6
      Top = 46
      Width = 44
      Height = 13
      Caption = 'Cliente:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBEdit4: TDBEdit
      Left = 544
      Top = 9
      Width = 56
      Height = 15
      Anchors = [akTop, akRight]
      BiDiMode = bdRightToLeft
      BorderStyle = bsNone
      Color = clBtnFace
      DataField = 'CODCONTROL'
      DataSource = frmGrVendas.dtsrcVendas
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 360
      Top = 40
      Width = 73
      Height = 21
      DataField = 'DTVENDA'
      DataSource = frmGrVendas.dtsrcVendas
      TabOrder = 1
      Visible = False
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 64
      Top = 8
      Width = 274
      Height = 21
      DataField = 'Lookemp'
      DataSource = frmGrVendas.dtsrcVendas
      TabOrder = 2
    end
    object DBLookupComboBox3: TDBLookupComboBox
      Left = 456
      Top = 40
      Width = 97
      Height = 21
      DataField = 'LookProdPreco'
      DataSource = frmGrVendas.dtsrcVendasItens
      TabOrder = 3
      Visible = False
    end
    object DBLookupComboBox2: TDBLookupComboBox
      Left = 64
      Top = 40
      Width = 273
      Height = 21
      DataField = 'LookClient'
      DataSource = frmGrVendas.dtsrcVendas
      TabOrder = 4
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 73
    Width = 617
    Height = 369
    ActivePage = TabSheetItens
    Align = alClient
    HotTrack = True
    TabOrder = 1
    object TabSheetItens: TTabSheet
      Caption = 'Itens'
      ImageIndex = 1
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 609
        Height = 57
        Align = alTop
        BorderStyle = bsSingle
        TabOrder = 0
        object Label19: TLabel
          Left = 8
          Top = 8
          Width = 36
          Height = 13
          Caption = 'C'#243'digo:'
          FocusControl = DBEdit20
        end
        object Label20: TLabel
          Left = 120
          Top = 8
          Width = 26
          Height = 13
          Caption = 'Qtde:'
          FocusControl = DBEdit21
        end
        object Label21: TLabel
          Left = 184
          Top = 8
          Width = 70
          Height = 13
          Caption = 'Pre'#231'o Unit'#225'rio:'
          FocusControl = DBEdit22
        end
        object Label22: TLabel
          Left = 304
          Top = 8
          Width = 45
          Height = 13
          Caption = 'R$ Desc:'
        end
        object SpeedButton1: TSpeedButton
          Left = 536
          Top = 24
          Width = 19
          Height = 22
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
            333333333337F33333333333333033333333333333373F333333333333090333
            33333333337F7F33333333333309033333333333337373F33333333330999033
            3333333337F337F33333333330999033333333333733373F3333333309999903
            333333337F33337F33333333099999033333333373333373F333333099999990
            33333337FFFF3FF7F33333300009000033333337777F77773333333333090333
            33333333337F7F33333333333309033333333333337F7F333333333333090333
            33333333337F7F33333333333309033333333333337F7F333333333333090333
            33333333337F7F33333333333300033333333333337773333333}
          NumGlyphs = 2
          OnClick = SpeedButton1Click
        end
        object SpeedButton2: TSpeedButton
          Left = 560
          Top = 24
          Width = 23
          Height = 22
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
            3333333777777777F3333330F777777033333337F3F3F3F7F3333330F0808070
            33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
            33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
            333333F7F7F7F7F7F3F33030F080707030333737F7F7F7F7F7333300F0808070
            03333377F7F7F7F773333330F080707033333337F7F7F7F7F333333070707070
            33333337F7F7F7F7FF3333000000000003333377777777777F33330F88877777
            0333337FFFFFFFFF7F3333000000000003333377777777777333333330777033
            3333333337FFF7F3333333333000003333333333377777333333}
          NumGlyphs = 2
        end
        object Label4: TLabel
          Left = 400
          Top = 8
          Width = 70
          Height = 13
          Caption = 'Pre'#231'o L'#237'quido:'
        end
        object DBEdit20: TDBEdit
          Left = 8
          Top = 24
          Width = 85
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CODPROD'
          DataSource = frmGrVendas.dtsrcVendasItens
          TabOrder = 0
          OnExit = DBEdit20Exit
        end
        object DBEdit21: TDBEdit
          Left = 120
          Top = 24
          Width = 41
          Height = 21
          CharCase = ecUpperCase
          DataField = 'QTDE'
          DataSource = frmGrVendas.dtsrcVendasItens
          TabOrder = 1
          OnExit = DBEdit21Exit
        end
        object DBEdit22: TDBEdit
          Left = 184
          Top = 24
          Width = 97
          Height = 21
          CharCase = ecUpperCase
          DataField = 'PUNIT'
          DataSource = frmGrVendas.dtsrcVendasItens
          Enabled = False
          TabOrder = 2
        end
        object DBEdit23: TDBEdit
          Left = 302
          Top = 24
          Width = 80
          Height = 21
          CharCase = ecUpperCase
          DataField = 'DESCONTO'
          DataSource = frmGrVendas.dtsrcVendasItens
          TabOrder = 3
          OnExit = DBEdit23Exit
        end
        object DBEdit8: TDBEdit
          Left = 400
          Top = 24
          Width = 106
          Height = 21
          CharCase = ecUpperCase
          DataField = 'PFINAL'
          DataSource = frmGrVendas.dtsrcVendasItens
          Enabled = False
          TabOrder = 4
        end
      end
      object GroupBox4: TGroupBox
        Left = 0
        Top = 57
        Width = 609
        Height = 284
        Align = alClient
        Caption = 'Itens Lan'#231'ados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object Label7: TLabel
          Left = 576
          Top = 56
          Width = 30
          Height = 13
          Caption = 'QTDE'
          FocusControl = DBEdit3
        end
        object Label8: TLabel
          Left = 576
          Top = 128
          Width = 60
          Height = 13
          Caption = 'QTDEFINAL'
          FocusControl = DBEdit5
        end
        object Label9: TLabel
          Left = 576
          Top = 200
          Width = 47
          Height = 13
          Caption = 'qtdeantes'
        end
        object RxDBGrid1: TRxDBGrid
          Left = 2
          Top = 15
          Width = 605
          Height = 175
          Align = alClient
          DataSource = frmGrVendas.dtsrcVendasItens
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clRed
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnKeyDown = RxDBGrid1KeyDown
          FixedCols = 2
          Columns = <
            item
              Expanded = False
              FieldName = 'CODPROD'
              Title.Caption = 'C'#243'digo'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 77
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LookProd'
              Title.Caption = 'Produto'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 191
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODCONTROL'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'CODEMP'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'CODCLI'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'QTDE'
              Title.Caption = 'Qtde.'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 38
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PUNIT'
              Title.Caption = 'Pre'#231'o Unit.'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 91
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCONTO'
              Title.Caption = 'R$ Desc.'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 56
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PFINAL'
              Title.Caption = 'Pre'#231'o L'#237'quido'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 107
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'REF'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'DTVENDA'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Visible = False
            end>
        end
        object Panel3: TPanel
          Left = 2
          Top = 229
          Width = 605
          Height = 53
          Align = alBottom
          BevelInner = bvLowered
          TabOrder = 1
          object Label5: TLabel
            Left = 4
            Top = 5
            Width = 25
            Height = 13
            Caption = 'OBS:'
          end
          object DBMemo1: TDBMemo
            Left = 32
            Top = 6
            Width = 569
            Height = 43
            DataField = 'OBS'
            DataSource = frmGrVendas.dtsrcVendas
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
        end
        object Panel4: TPanel
          Left = 2
          Top = 190
          Width = 605
          Height = 39
          Align = alBottom
          BevelInner = bvLowered
          TabOrder = 2
          object Label6: TLabel
            Left = 425
            Top = 9
            Width = 64
            Height = 16
            Caption = 'Total R$:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label10: TLabel
            Left = 8
            Top = 7
            Width = 51
            Height = 13
            Caption = 'Estoque:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText1: TDBText
            Left = 64
            Top = 6
            Width = 65
            Height = 17
            DataField = 'LookProdQtde'
            DataSource = frmGrVendas.dtsrcVendasItens
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBLookupComboBox4: TDBLookupComboBox
            Left = 160
            Top = 7
            Width = 73
            Height = 21
            DataField = 'LookProdQtde'
            DataSource = frmGrVendas.dtsrcVendasItens
            TabOrder = 0
            Visible = False
          end
          object dbdtTotalVenda: TDBEdit
            Left = 488
            Top = 9
            Width = 84
            Height = 16
            BorderStyle = bsNone
            Color = clBtnFace
            DataField = 'TOTALVENDA'
            DataSource = frmGrVendas.dtsrcVendas
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
        end
        object DBEdit3: TDBEdit
          Left = 96
          Top = 112
          Width = 134
          Height = 21
          DataField = 'QTDE'
          DataSource = frmGrVendas.dtsrcVendasItens
          TabOrder = 3
          Visible = False
        end
        object DBEdit5: TDBEdit
          Left = 248
          Top = 112
          Width = 134
          Height = 21
          DataField = 'QTDEFINAL'
          DataSource = frmGrVendas.dtsrcVendasItens
          TabOrder = 4
          Visible = False
        end
      end
    end
    object TabSheetFatura: TTabSheet
      Caption = 'Forma de Recebimento'
      ImageIndex = 2
      object Label11: TLabel
        Left = 8
        Top = 23
        Width = 32
        Height = 13
        Caption = 'Forma:'
      end
      object Label12: TLabel
        Left = 280
        Top = 23
        Width = 57
        Height = 13
        Caption = 'Fatura Dias:'
      end
      object dbcmbbxFormRec: TDBComboBox
        Left = 48
        Top = 16
        Width = 209
        Height = 21
        Style = csDropDownList
        CharCase = ecUpperCase
        DataField = 'FORMAPAG'
        DataSource = frmGrVendas.dtsrcVendas
        ItemHeight = 13
        Items.Strings = (
          'CARTEIRA'
          'CHEQUE'
          'CART'#195'O'
          'DEP'#211'SITO'
          'A PRAZO')
        TabOrder = 0
        OnChange = dbcmbbxFormRecChange
      end
      object DBEdit1: TDBEdit
        Left = 344
        Top = 16
        Width = 33
        Height = 21
        DataField = 'FATDIAS'
        DataSource = frmGrVendas.dtsrcVendas
        TabOrder = 1
      end
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 442
    Width = 617
    Height = 35
    Align = alBottom
    TabOrder = 2
    object tlbarForn: TToolBar
      Left = 2
      Top = -2
      Width = 613
      Height = 35
      Align = alBottom
      ButtonHeight = 30
      Caption = 'tlbarForn'
      TabOrder = 0
      object ToolButton2: TToolButton
        Left = 0
        Top = 2
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 0
        Style = tbsSeparator
      end
      object btnGravar: TBitBtn
        Left = 8
        Top = 2
        Width = 75
        Height = 30
        Caption = 'Gravar'
        TabOrder = 0
        OnClick = btnGravarClick
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
      object ToolButton1: TToolButton
        Left = 83
        Top = 2
        Width = 8
        Caption = 'ToolButton1'
        Style = tbsSeparator
      end
      object ToolButton4: TToolButton
        Left = 91
        Top = 2
        Width = 8
        Caption = 'ToolButton4'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object ToolButton6: TToolButton
        Left = 99
        Top = 2
        Width = 8
        Caption = 'ToolButton6'
        ImageIndex = 4
        Style = tbsSeparator
      end
      object ToolButton3: TToolButton
        Left = 107
        Top = 2
        Width = 8
        Caption = 'ToolButton3'
        ImageIndex = 1
        Style = tbsSeparator
      end
      object ToolButton7: TToolButton
        Left = 115
        Top = 2
        Width = 8
        Caption = 'ToolButton7'
        ImageIndex = 5
        Style = tbsSeparator
      end
      object btbtnCancel: TBitBtn
        Left = 123
        Top = 2
        Width = 71
        Height = 30
        Caption = 'Cancelar'
        TabOrder = 1
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
    end
  end
  object ibdtstCR: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from TBCONTREC'
      'where'
      '  NUMLANC = :OLD_NUMLANC')
    InsertSQL.Strings = (
      'insert into TBCONTREC'
      '  (NUMLANC, CNPJ, DOCNF, TIPPAG, VALORREC, DTVENC, DTEMISS)'
      'values'
      
        '  (:NUMLANC, :CNPJ, :DOCNF, :TIPPAG, :VALORREC, :DTVENC, :DTEMIS' +
        'S)')
    RefreshSQL.Strings = (
      'Select '
      '  NUMLANC,'
      '  CNPJ,'
      '  TIPPAG,'
      '  HISTORIC,'
      '  NUMREC,'
      '  DOCNF,'
      '  PARC,'
      '  DTEMISS,'
      '  DTVENC,'
      '  DTREC,'
      '  DOCBAIX,'
      '  VALORREC,'
      '  VALORMULTA,'
      '  VALORRECTOT'
      'from TBCONTREC '
      'where'
      '  NUMLANC = :NUMLANC')
    SelectSQL.Strings = (
      
        'select NUMLANC, CNPJ, DOCNF, TIPPAG, VALORREC, DTVENC, DTEMISS f' +
        'rom TBCONTREC')
    ModifySQL.Strings = (
      'update TBCONTREC'
      'set'
      '  NUMLANC = :NUMLANC,'
      '  CNPJ = :CNPJ,'
      '  DOCNF = :DOCNF,'
      '  TIPPAG = :TIPPAG,'
      '  VALORREC = :VALORREC,'
      '  DTVENC = :DTVENC,'
      '  DTEMISS = :DTEMISS'
      'where'
      '  NUMLANC = :OLD_NUMLANC')
    GeneratorField.Field = 'NUMLANC'
    GeneratorField.Generator = 'GEN_TBCONTREC_ID'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 32
    Top = 232
    object ibdtstCRCNPJ: TIBStringField
      FieldName = 'CNPJ'
      Origin = 'TBCONTREC.CNPJ'
      Size = 18
    end
    object ibdtstCRDOCNF: TIBStringField
      FieldName = 'DOCNF'
      Origin = 'TBCONTREC.DOCNF'
      Size = 8
    end
    object ibdtstCRTIPPAG: TIBStringField
      FieldName = 'TIPPAG'
      Origin = 'TBCONTREC.TIPPAG'
      Size = 35
    end
    object ibdtstCRVALORREC: TIBBCDField
      FieldName = 'VALORREC'
      Origin = 'TBCONTREC.VALORREC'
      Precision = 18
      Size = 2
    end
    object ibdtstCRDTVENC: TDateField
      FieldName = 'DTVENC'
      Origin = 'TBCONTREC.DTVENC'
    end
    object ibdtstCRDTEMISS: TDateField
      FieldName = 'DTEMISS'
      Origin = 'TBCONTREC.DTEMISS'
    end
    object ibdtstCRNUMLANC: TLargeintField
      FieldName = 'NUMLANC'
      Origin = 'TBCONTREC.NUMLANC'
      Required = True
    end
  end
end
