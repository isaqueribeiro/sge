object frmCdContReceb: TfrmCdContReceb
  Left = 350
  Top = 204
  Width = 480
  Height = 368
  Caption = 'Contas a Receber'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 464
    Height = 297
    Align = alClient
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 462
      Height = 295
      Align = alClient
      Caption = 'Recebimento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        Left = 224
        Top = 16
        Width = 33
        Height = 13
        Caption = 'Lan'#231':'
        FocusControl = DBEdit1
        Visible = False
      end
      object Label2: TLabel
        Left = 16
        Top = 24
        Width = 44
        Height = 13
        Caption = 'Cliente:'
      end
      object Label3: TLabel
        Left = 16
        Top = 72
        Width = 115
        Height = 13
        Caption = 'Tipo de Pagamento:'
      end
      object Label4: TLabel
        Left = 16
        Top = 120
        Width = 55
        Height = 13
        Caption = 'Hist'#243'rico:'
        FocusControl = DBMemo1
      end
      object Label5: TLabel
        Left = 162
        Top = 72
        Width = 72
        Height = 13
        Caption = 'N'#186' Comprov.'
        FocusControl = DBEdit4
      end
      object Label6: TLabel
        Left = 16
        Top = 176
        Width = 100
        Height = 13
        Caption = 'Data de Emiss'#227'o:'
        FocusControl = DBEdit5
      end
      object Label7: TLabel
        Left = 168
        Top = 176
        Width = 120
        Height = 13
        Caption = 'Data de Vencimento:'
        FocusControl = DBEdit6
      end
      object Label8: TLabel
        Left = 328
        Top = 176
        Width = 110
        Height = 13
        Caption = 'Data Recebimento:'
        FocusControl = DBEdit7
      end
      object Label10: TLabel
        Left = 152
        Top = 224
        Width = 34
        Height = 13
        Caption = 'Valor:'
        FocusControl = DBEdit9
      end
      object Label15: TLabel
        Left = 16
        Top = 224
        Width = 59
        Height = 13
        Caption = 'Desconto:'
        FocusControl = DBEdit12
      end
      object Label9: TLabel
        Left = 280
        Top = 224
        Width = 125
        Height = 13
        Caption = 'Valor Total Recebido:'
      end
      object Label11: TLabel
        Left = 264
        Top = 72
        Width = 41
        Height = 13
        Caption = 'Venda:'
      end
      object Label12: TLabel
        Left = 368
        Top = 72
        Width = 31
        Height = 13
        Caption = 'Parc:'
      end
      object DBEdit1: TDBEdit
        Left = 264
        Top = 16
        Width = 57
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NUMLANC'
        DataSource = frmGrContReceb.dtsrcContRec
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        Visible = False
        OnKeyDown = DBEdit1KeyDown
      end
      object DBMemo1: TDBMemo
        Left = 16
        Top = 136
        Width = 433
        Height = 33
        DataField = 'HISTORIC'
        DataSource = frmGrContReceb.dtsrcContRec
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnKeyDown = DBEdit1KeyDown
      end
      object DBEdit4: TDBEdit
        Left = 160
        Top = 88
        Width = 89
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NUMREC'
        DataSource = frmGrContReceb.dtsrcContRec
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnKeyDown = DBEdit1KeyDown
      end
      object DBEdit5: TDBEdit
        Left = 16
        Top = 192
        Width = 129
        Height = 21
        CharCase = ecUpperCase
        DataField = 'DTEMISS'
        DataSource = frmGrContReceb.dtsrcContRec
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 8
        ParentFont = False
        TabOrder = 4
        OnKeyDown = DBEdit1KeyDown
      end
      object DBEdit6: TDBEdit
        Left = 168
        Top = 192
        Width = 134
        Height = 21
        CharCase = ecUpperCase
        DataField = 'DTVENC'
        DataSource = frmGrContReceb.dtsrcContRec
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 8
        ParentFont = False
        TabOrder = 5
        OnKeyDown = DBEdit1KeyDown
      end
      object DBEdit7: TDBEdit
        Left = 328
        Top = 192
        Width = 121
        Height = 21
        CharCase = ecUpperCase
        DataField = 'DTREC'
        DataSource = frmGrContReceb.dtsrcContRec
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 8
        ParentFont = False
        TabOrder = 6
        OnKeyDown = DBEdit1KeyDown
      end
      object DBEdit9: TDBEdit
        Left = 152
        Top = 240
        Width = 105
        Height = 21
        CharCase = ecUpperCase
        DataField = 'VALORREC'
        DataSource = frmGrContReceb.dtsrcContRec
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        OnExit = DBEdit9Exit
        OnKeyDown = DBEdit1KeyDown
      end
      object DBEdit12: TDBEdit
        Left = 16
        Top = 240
        Width = 105
        Height = 21
        DataField = 'VALORMULTA'
        DataSource = frmGrContReceb.dtsrcContRec
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        OnExit = DBEdit12Exit
        OnKeyDown = DBEdit1KeyDown
      end
      object DBComboBox1: TDBComboBox
        Left = 16
        Top = 88
        Width = 121
        Height = 21
        DataField = 'TIPPAG'
        DataSource = frmGrContReceb.dtsrcContRec
        ItemHeight = 13
        Items.Strings = (
          'CARTEIRA'
          'CHEQUE'
          'CART'#195'O'
          'DEP'#211'SITO'
          'ORDEM DE PGTO')
        TabOrder = 1
        OnKeyDown = DBEdit1KeyDown
      end
      object DBEdit2: TDBEdit
        Left = 280
        Top = 240
        Width = 137
        Height = 21
        DataField = 'VALORRECTOT'
        DataSource = frmGrContReceb.dtsrcContRec
        TabOrder = 9
        OnKeyDown = DBEdit1KeyDown
      end
      object DBEdit3: TDBEdit
        Left = 264
        Top = 88
        Width = 89
        Height = 21
        DataField = 'DOCNF'
        DataSource = frmGrContReceb.dtsrcContRec
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 10
      end
      object DBEdit8: TDBEdit
        Left = 368
        Top = 88
        Width = 41
        Height = 21
        DataField = 'PARC'
        DataSource = frmGrContReceb.dtsrcContRec
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 11
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 16
        Top = 40
        Width = 433
        Height = 21
        DataField = 'LookCliente'
        DataSource = frmGrContReceb.dtsrcContRec
        TabOrder = 12
      end
    end
  end
  object tlbrCadCatProd: TToolBar
    Left = 0
    Top = 297
    Width = 464
    Height = 35
    Align = alBottom
    ButtonHeight = 31
    Caption = 'tlbrCadCatProd'
    TabOrder = 1
    object btbtnGrav: TBitBtn
      Left = 0
      Top = 2
      Width = 69
      Height = 31
      Caption = 'Gravar'
      TabOrder = 0
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
      Left = 69
      Top = 2
      Width = 75
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
    object btbtnAtual: TBitBtn
      Left = 144
      Top = 2
      Width = 75
      Height = 31
      Caption = 'Atualizar'
      TabOrder = 3
      OnClick = btbtnAtualClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555FFFFFFFFFF5F5557777777777505555777777777757F55555555555555
        055555555555FF5575F555555550055030555555555775F7F7F55555550FB000
        005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
        B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
        305555577F555557F7F5550E0BFBFB003055557575F55577F7F550EEE0BFB0B0
        305557FF575F5757F7F5000EEE0BFBF03055777FF575FFF7F7F50000EEE00000
        30557777FF577777F7F500000E05555BB05577777F75555777F5500000555550
        3055577777555557F7F555000555555999555577755555577755}
      NumGlyphs = 2
    end
    object ToolButton1: TToolButton
      Left = 219
      Top = 2
      Width = 8
      Caption = 'ToolButton1'
      Style = tbsSeparator
    end
    object btbtnFech: TBitBtn
      Left = 227
      Top = 2
      Width = 75
      Height = 31
      Caption = 'Fechar'
      TabOrder = 2
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
  end
end
