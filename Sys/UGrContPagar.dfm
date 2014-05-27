object frmGrContPagar: TfrmGrContPagar
  Left = 493
  Top = 284
  Width = 723
  Height = 382
  Caption = 'Contas a Pagar'
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 707
    Height = 309
    Align = alClient
    TabOrder = 0
    object dbgrdContPag: TDBGrid
      Left = 1
      Top = 1
      Width = 705
      Height = 288
      Align = alClient
      DataSource = dtsrcContPag
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnKeyDown = dbgrdContPagKeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'NUMLANC'
          Title.Alignment = taCenter
          Title.Caption = 'Lanc.'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 51
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FornLok'
          Title.Alignment = taCenter
          Title.Caption = 'Fornecedor'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 223
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALORPAG'
          Title.Alignment = taCenter
          Title.Caption = 'Valor'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 101
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DTPAG'
          Title.Alignment = taCenter
          Title.Caption = 'Dt.Pagamento'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DTVENC'
          Title.Alignment = taCenter
          Title.Caption = 'Dt.Vencimento'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DTEMISS'
          Title.Alignment = taCenter
          Title.Caption = 'Dt.Emiss'#227'o'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 79
          Visible = True
        end>
    end
    object pnlBotaoGrid: TPanel
      Left = 1
      Top = 289
      Width = 705
      Height = 19
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
    end
  end
  object tlbrGridFornec: TToolBar
    Left = 0
    Top = 309
    Width = 707
    Height = 35
    Align = alBottom
    ButtonHeight = 31
    Caption = #39
    TabOrder = 1
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
    object ToolButton1: TToolButton
      Left = 225
      Top = 2
      Width = 8
      Caption = 'ToolButton1'
      Style = tbsSeparator
    end
    object BitBtn1: TBitBtn
      Left = 233
      Top = 2
      Width = 75
      Height = 31
      Caption = 'Baixa'
      TabOrder = 4
      OnClick = BitBtn1Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DAD0D0D0D0DA
        DADAADADADADA00DADADDADADADAD000DADAADADADADA0B70DADDADADADAD0B8
        0ADA00000000AD0B70AD0FFFFFF0DA0B80DA0F7FF8F0ADA0B70D0FFF00000000
        B00A0F7F0FF0FFF001100FFF0FF0F7F0000A44444444FFF0ADAD44444444F7F0
        DADAADAD0FFFFFF0ADADDADA44444444DADAADAD44444444ADAD}
    end
    object ToolButton3: TToolButton
      Left = 308
      Top = 2
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 1
      Style = tbsSeparator
    end
    object btbtnFechar: TBitBtn
      Left = 316
      Top = 2
      Width = 75
      Height = 31
      Caption = 'Fechar'
      TabOrder = 3
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
    object ToolButton5: TToolButton
      Left = 391
      Top = 2
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object SpeedButton1: TSpeedButton
      Left = 399
      Top = 2
      Width = 31
      Height = 31
      Hint = 'Desbloquear cadastro...'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        5000555555555555577755555555555550B0555555555555F7F7555555555550
        00B05555555555577757555555555550B3B05555555555F7F557555555555000
        3B0555555555577755755555555500B3B0555555555577555755555555550B3B
        055555FFFF5F7F5575555700050003B05555577775777557555570BBB00B3B05
        555577555775557555550BBBBBB3B05555557F555555575555550BBBBBBB0555
        55557F55FF557F5555550BB003BB075555557F577F5575F5555577B003BBB055
        555575F7755557F5555550BB33BBB0555555575F555557F555555507BBBB0755
        55555575FFFF7755555555570000755555555557777775555555}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton1Click
    end
  end
  object IBDataSetFornec: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    SelectSQL.Strings = (
      'select CODFORN, NOMEFORN from TBFORNECEDOR'
      'order by NOMEFORN')
    Left = 320
    Top = 64
  end
  object dtsrcContPag: TDataSource
    DataSet = ibdtstContPag
    Left = 160
    Top = 48
  end
  object ibdtstContPag: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from TBCONTPAG'
      'where'
      '  NUMLANC = :OLD_NUMLANC')
    InsertSQL.Strings = (
      'insert into TBCONTPAG'
      
        '  (NUMLANC, CODFORN, TIPPAG, HISTORIC, NOTFISC, DTEMISS, DTVENC,' +
        ' DTPAG, '
      '   DOCBAIX, VALORPAG, TIPOCATEG, BANCO, NUMCHQ)'
      'values'
      
        '  (:NUMLANC, :CODFORN, :TIPPAG, :HISTORIC, :NOTFISC, :DTEMISS, :' +
        'DTVENC, '
      '   :DTPAG, :DOCBAIX, :VALORPAG, :TIPOCATEG, :BANCO, :NUMCHQ)')
    RefreshSQL.Strings = (
      'Select '
      '  NUMLANC,'
      '  CODFORN,'
      '  TIPPAG,'
      '  HISTORIC,'
      '  NOTFISC,'
      '  DTEMISS,'
      '  DTVENC,'
      '  DTPAG,'
      '  DOCBAIX,'
      '  VALORPAG,'
      '  NOMEEMP,'
      '  TIPOCATEG,'
      '  BANCO,'
      '  NUMCHQ'
      'from TBCONTPAG '
      'where'
      '  NUMLANC = :NUMLANC')
    SelectSQL.Strings = (
      
        'select CP.NUMLANC, CP.CODFORN, F.NOMEFORN, CP.VALORPAG, CP.DTPAG' +
        ', CP.DTVENC, CP.DTEMISS, CP.BANCO, CP.HISTORIC, CP.NOMEEMP, CP.N' +
        'OTFISC, CP.NUMCHQ, CP.TIPOCATEG, CP.TIPPAG, CP.DOCBAIX'
      'from TBCONTPAG CP, TBFORNECEDOR F'
      'where CP.CODFORN=F.CODFORN'
      'order by F.NOMEFORN')
    ModifySQL.Strings = (
      'update TBCONTPAG'
      'set'
      '  NUMLANC = :NUMLANC,'
      '  CODFORN = :CODFORN,'
      '  TIPPAG = :TIPPAG,'
      '  HISTORIC = :HISTORIC,'
      '  NOTFISC = :NOTFISC,'
      '  DTEMISS = :DTEMISS,'
      '  DTVENC = :DTVENC,'
      '  DTPAG = :DTPAG,'
      '  DOCBAIX = :DOCBAIX,'
      '  VALORPAG = :VALORPAG,'
      '  TIPOCATEG = :TIPOCATEG,'
      '  BANCO = :BANCO,'
      '  NUMCHQ = :NUMCHQ'
      'where'
      '  NUMLANC = :OLD_NUMLANC')
    GeneratorField.Field = 'NUMLANC'
    GeneratorField.Generator = 'GEN_TBCONTPAG_ID'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 64
    Top = 48
    object ibdtstContPagNUMLANC: TLargeintField
      FieldName = 'NUMLANC'
      Origin = 'TBCONTPAG.NUMLANC'
      Required = True
    end
    object ibdtstContPagCODFORN: TSmallintField
      FieldName = 'CODFORN'
      Origin = 'TBCONTPAG.CODFORN'
    end
    object ibdtstContPagTIPPAG: TIBStringField
      FieldName = 'TIPPAG'
      Origin = 'TBCONTPAG.TIPPAG'
      Size = 35
    end
    object ibdtstContPagHISTORIC: TMemoField
      FieldName = 'HISTORIC'
      Origin = 'TBCONTPAG.HISTORIC'
      BlobType = ftMemo
      Size = 8
    end
    object ibdtstContPagNOTFISC: TIBStringField
      FieldName = 'NOTFISC'
      Origin = 'TBCONTPAG.NOTFISC'
      Size = 15
    end
    object ibdtstContPagDTEMISS: TDateField
      FieldName = 'DTEMISS'
      Origin = 'TBCONTPAG.DTEMISS'
      EditMask = '99/99/0000;1;_'
    end
    object ibdtstContPagDTVENC: TDateField
      FieldName = 'DTVENC'
      Origin = 'TBCONTPAG.DTVENC'
      EditMask = '99/99/0000;1;_'
    end
    object ibdtstContPagDTPAG: TDateField
      FieldName = 'DTPAG'
      Origin = 'TBCONTPAG.DTPAG'
      EditMask = '99/99/0000;1;_'
    end
    object ibdtstContPagDOCBAIX: TIBStringField
      FieldName = 'DOCBAIX'
      Origin = 'TBCONTPAG.DOCBAIX'
      Size = 15
    end
    object ibdtstContPagVALORPAG: TIBBCDField
      FieldName = 'VALORPAG'
      Origin = 'TBCONTPAG.VALORPAG'
      currency = True
      Precision = 18
      Size = 2
    end
    object ibdtstContPagFornLok: TStringField
      FieldKind = fkLookup
      FieldName = 'FornLok'
      LookupDataSet = IBDataSetFornec
      LookupKeyFields = 'CODFORN'
      LookupResultField = 'NOMEFORN'
      KeyFields = 'CODFORN'
      Size = 60
      Lookup = True
    end
    object ibdtstContPagTIPOCATEG: TSmallintField
      FieldName = 'TIPOCATEG'
      Origin = 'TBCONTPAG.TIPOCATEG'
    end
    object ibdtstContPagBANCO: TSmallintField
      FieldName = 'BANCO'
      Origin = 'TBCONTPAG.BANCO'
    end
    object ibdtstContPagNUMCHQ: TIBStringField
      FieldName = 'NUMCHQ'
      Origin = 'TBCONTPAG.NUMCHQ'
      Size = 10
    end
    object ibdtstContPagBancoLok: TStringField
      FieldKind = fkLookup
      FieldName = 'BancoLok'
      LookupDataSet = ibdtstBanco
      LookupKeyFields = 'COD'
      LookupResultField = 'NOME'
      KeyFields = 'BANCO'
      Size = 30
      Lookup = True
    end
    object ibdtstContPagNOMEFORN: TIBStringField
      FieldName = 'NOMEFORN'
      Origin = 'TBFORNECEDOR.NOMEFORN'
      Size = 60
    end
  end
  object ibdtstBanco: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    SelectSQL.Strings = (
      'select COD, NOME from TBBANCO'
      'order by NOME')
    Left = 312
    Top = 144
  end
  object dsDataSetFornec: TDataSource
    DataSet = IBDataSetFornec
    Left = 408
    Top = 88
  end
  object dsBanco: TDataSource
    DataSet = ibdtstBanco
    Left = 416
    Top = 144
  end
end
