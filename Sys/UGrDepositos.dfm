object frmGrDepositos: TfrmGrDepositos
  Left = 207
  Top = 130
  Width = 629
  Height = 375
  Caption = 'Dep'#243'sitos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 613
    Height = 304
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 352
      Top = 216
      Width = 50
      Height = 13
      Caption = 'FiadoLook'
    end
    object dbgrdLocat: TDBGrid
      Left = 1
      Top = 1
      Width = 611
      Height = 283
      Align = alClient
      DataSource = dtsrcLancDepos
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
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
          Width = 83
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COMPRDEP'
          Title.Alignment = taCenter
          Title.Caption = 'Comprovante de Dep'#243'sito'
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
          FieldName = 'DATADEP'
          Title.Alignment = taCenter
          Title.Caption = 'Data de Dep'#243'sito'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 119
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ESPECIE'
          Title.Alignment = taCenter
          Title.Caption = 'Esp'#233'cie'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALORDEP'
          Title.Alignment = taCenter
          Title.Caption = 'Valor Depositado'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 135
          Visible = True
        end>
    end
    object pnlBotaoGrid: TPanel
      Left = 1
      Top = 284
      Width = 611
      Height = 19
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
    end
  end
  object tlbrGridLocat: TToolBar
    Left = 0
    Top = 304
    Width = 613
    Height = 35
    Align = alBottom
    ButtonHeight = 31
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
    object btbtnLocalizar: TBitBtn
      Left = 225
      Top = 2
      Width = 75
      Height = 31
      Caption = 'Localizar'
      TabOrder = 3
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
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
    end
    object ToolButton1: TToolButton
      Left = 300
      Top = 2
      Width = 8
      Caption = 'ToolButton1'
      Style = tbsSeparator
    end
    object btbtnFechar: TBitBtn
      Left = 308
      Top = 2
      Width = 75
      Height = 31
      Caption = 'Fechar'
      TabOrder = 4
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
  end
  object ibdtstLancDepos: TIBDataSet
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from TBLANCDEPOS'
      'where'
      '  NUMLANC = :OLD_NUMLANC')
    InsertSQL.Strings = (
      'insert into TBLANCDEPOS'
      '  (NUMLANC, CODBANCO, ESPECIE, VALORDEP, DATADEP, COMPRDEP)'
      'values'
      
        '  (:NUMLANC, :CODBANCO, :ESPECIE, :VALORDEP, :DATADEP, :COMPRDEP' +
        ')')
    RefreshSQL.Strings = (
      'Select '
      '  NUMLANC,'
      '  CODBANCO,'
      '  ESPECIE,'
      '  VALORDEP,'
      '  DATADEP,'
      '  COMPRDEP'
      'from TBLANCDEPOS '
      'where'
      '  NUMLANC = :NUMLANC')
    SelectSQL.Strings = (
      'select * from TBLANCDEPOS')
    ModifySQL.Strings = (
      'update TBLANCDEPOS'
      'set'
      '  NUMLANC = :NUMLANC,'
      '  CODBANCO = :CODBANCO,'
      '  ESPECIE = :ESPECIE,'
      '  VALORDEP = :VALORDEP,'
      '  DATADEP = :DATADEP,'
      '  COMPRDEP = :COMPRDEP'
      'where'
      '  NUMLANC = :OLD_NUMLANC')
    GeneratorField.Field = 'NUMLANC'
    GeneratorField.Generator = 'GEN_TBLANCDEPOS_ID'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 144
    Top = 120
    object ibdtstLancDeposNUMLANC: TIntegerField
      FieldName = 'NUMLANC'
      Origin = 'TBLANCDEPOS.NUMLANC'
      Required = True
    end
    object ibdtstLancDeposCODBANCO: TSmallintField
      FieldName = 'CODBANCO'
      Origin = 'TBLANCDEPOS.CODBANCO'
    end
    object ibdtstLancDeposESPECIE: TIBStringField
      FieldName = 'ESPECIE'
      Origin = 'TBLANCDEPOS.ESPECIE'
      Size = 15
    end
    object ibdtstLancDeposVALORDEP: TIBBCDField
      FieldName = 'VALORDEP'
      Origin = 'TBLANCDEPOS.VALORDEP'
      Required = True
      currency = True
      Precision = 18
      Size = 2
    end
    object ibdtstLancDeposDATADEP: TDateField
      FieldName = 'DATADEP'
      Origin = 'TBLANCDEPOS.DATADEP'
      EditMask = '99/99/00;1;_'
    end
    object ibdtstLancDeposCOMPRDEP: TIBStringField
      FieldName = 'COMPRDEP'
      Origin = 'TBLANCDEPOS.COMPRDEP'
      Size = 15
    end
    object ibdtstLancDeposBancoLook: TStringField
      FieldKind = fkLookup
      FieldName = 'BancoLook'
      LookupDataSet = ibdtstBanco
      LookupKeyFields = 'COD'
      LookupResultField = 'NOME'
      KeyFields = 'CODBANCO'
      Size = 30
      Lookup = True
    end
  end
  object dtsrcLancDepos: TDataSource
    DataSet = ibdtstLancDepos
    Left = 144
    Top = 176
  end
  object ibdtstBanco: TIBDataSet
    BufferChunks = 1000
    CachedUpdates = False
    SelectSQL.Strings = (
      'select COD, NOME, AGENCIA, CONTA from TBBANCO')
    Left = 240
    Top = 176
  end
  object DataSource1: TDataSource
    DataSet = ibdtstBanco
    Left = 320
    Top = 176
  end
end
