object frmBxCR: TfrmBxCR
  Left = 413
  Top = 195
  Width = 315
  Height = 261
  Caption = 'Baixa - Contas a Receber'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 8
    Top = 88
    Width = 96
    Height = 13
    Caption = 'Tipo de Pagamento:'
  end
  object Label12: TLabel
    Left = 184
    Top = 88
    Width = 52
    Height = 13
    Caption = 'N'#186' Recibo:'
  end
  object Label8: TLabel
    Left = 8
    Top = 136
    Width = 92
    Height = 13
    Caption = 'Data Recebimento:'
  end
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 27
    Height = 13
    Caption = 'Lan'#231':'
  end
  object Label2: TLabel
    Left = 72
    Top = 8
    Width = 35
    Height = 13
    Caption = 'Cliente:'
  end
  object Label10: TLabel
    Left = 8
    Top = 56
    Width = 27
    Height = 13
    Caption = 'Valor:'
  end
  object DBText1: TDBText
    Left = 8
    Top = 28
    Width = 63
    Height = 17
    DataField = 'NUMLANC'
    DataSource = frmGrContReceb.dtsrcContRec
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object DBText2: TDBText
    Left = 72
    Top = 28
    Width = 225
    Height = 17
    DataField = 'LookCliente'
    DataSource = frmGrContReceb.dtsrcContRec
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object DBText3: TDBText
    Left = 48
    Top = 56
    Width = 63
    Height = 17
    DataField = 'VALORREC'
    DataSource = frmGrContReceb.dtsrcContRec
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 184
    Top = 136
    Width = 49
    Height = 13
    Caption = 'DocBaixa:'
    FocusControl = DBEdit1
  end
  object DBText4: TDBText
    Left = 128
    Top = 56
    Width = 61
    Height = 17
    DataField = 'VALORRECTOT'
    DataSource = frmGrContReceb.dtsrcContRec
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object Label5: TLabel
    Left = 192
    Top = 56
    Width = 68
    Height = 13
    Caption = '<--- TotalRece'
    Visible = False
  end
  object btbtnFech: TBitBtn
    Left = 214
    Top = 186
    Width = 73
    Height = 31
    Caption = 'Fechar'
    TabOrder = 0
    OnClick = btbtnFechClick
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
  object btbtnCancel: TBitBtn
    Left = 131
    Top = 186
    Width = 73
    Height = 31
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
  object btbtnGrav: TBitBtn
    Left = 48
    Top = 186
    Width = 73
    Height = 31
    Caption = 'Gravar'
    TabOrder = 2
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
  object DBComboBox1: TDBComboBox
    Left = 8
    Top = 104
    Width = 159
    Height = 21
    CharCase = ecUpperCase
    DataField = 'TIPPAG'
    DataSource = frmGrContReceb.dtsrcContRec
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 13
    Items.Strings = (
      'BOLETO'
      'CARTEIRA'
      'CHEQUE'
      'DEP'#211'SITO'
      'DOC'
      'ON-LINE'
      'TED'
      'TRANSF.CC')
    ParentFont = False
    TabOrder = 3
  end
  object DBEdit3: TDBEdit
    Left = 184
    Top = 104
    Width = 105
    Height = 21
    DataField = 'NUMREC'
    DataSource = frmGrContReceb.dtsrcContRec
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object DBEdit1: TDBEdit
    Left = 184
    Top = 152
    Width = 103
    Height = 21
    CharCase = ecUpperCase
    DataField = 'DOCBAIX'
    DataSource = frmGrContReceb.dtsrcContRec
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object DBDateEdit1: TDBDateEdit
    Left = 8
    Top = 152
    Width = 161
    Height = 21
    DataField = 'DTREC'
    DataSource = frmGrContReceb.dtsrcContRec
    NumGlyphs = 2
    TabOrder = 6
  end
end
