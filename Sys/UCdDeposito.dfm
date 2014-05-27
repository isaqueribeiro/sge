object frmCdDeposito: TfrmCdDeposito
  Left = 267
  Top = 165
  AutoSize = True
  BorderStyle = bsDialog
  Caption = 'Lan'#231'amento de Dep'#243'sito'
  ClientHeight = 226
  ClientWidth = 366
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
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 366
    Height = 188
    Align = alClient
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 364
      Height = 186
      Align = alClient
      Caption = 'Dados'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object lblCod: TLabel
        Left = 298
        Top = 68
        Width = 33
        Height = 13
        Caption = 'Lanc:'
        Visible = False
      end
      object Label2: TLabel
        Left = 275
        Top = 20
        Width = 38
        Height = 13
        Caption = 'Conta:'
      end
      object Label1: TLabel
        Left = 169
        Top = 20
        Width = 51
        Height = 13
        Caption = 'Ag'#234'ncia:'
      end
      object Label3: TLabel
        Left = 9
        Top = 117
        Width = 50
        Height = 13
        Caption = 'Esp'#233'cie:'
      end
      object Label4: TLabel
        Left = 9
        Top = 68
        Width = 110
        Height = 13
        Caption = 'Comprovante Dep.:'
      end
      object Label5: TLabel
        Left = 9
        Top = 20
        Width = 41
        Height = 13
        Caption = 'Banco:'
      end
      object Label7: TLabel
        Left = 170
        Top = 67
        Width = 104
        Height = 13
        Caption = 'Data de Dep'#243'sito:'
      end
      object DBText1: TDBText
        Left = 168
        Top = 36
        Width = 81
        Height = 19
        Color = clBtnHighlight
        DataField = 'AGENCIA'
        DataSource = frmGrDepositos.DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object DBText2: TDBText
        Left = 275
        Top = 36
        Width = 78
        Height = 19
        Color = clWhite
        DataField = 'CONTA'
        DataSource = frmGrDepositos.DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label8: TLabel
        Left = 168
        Top = 116
        Width = 102
        Height = 13
        Caption = 'Valor Depositado:'
        FocusControl = DBEdit1
      end
      object DBEdit3: TDBEdit
        Left = 298
        Top = 83
        Width = 42
        Height = 21
        DataField = 'NUMLANC'
        DataSource = frmGrDepositos.dtsrcLancDepos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        Visible = False
      end
      object DBEdit5: TDBEdit
        Left = 9
        Top = 83
        Width = 126
        Height = 21
        CharCase = ecUpperCase
        DataField = 'COMPRDEP'
        DataSource = frmGrDepositos.dtsrcLancDepos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnKeyDown = DBLookupComboBox1KeyDown
      end
      object DBEdit7: TDBEdit
        Left = 169
        Top = 83
        Width = 110
        Height = 21
        DataField = 'DATADEP'
        DataSource = frmGrDepositos.dtsrcLancDepos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 8
        ParentFont = False
        TabOrder = 2
        OnKeyDown = DBLookupComboBox1KeyDown
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 8
        Top = 35
        Width = 127
        Height = 21
        DataField = 'BancoLook'
        DataSource = frmGrDepositos.dtsrcLancDepos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnKeyDown = DBLookupComboBox1KeyDown
      end
      object DBComboBox2: TDBComboBox
        Left = 8
        Top = 133
        Width = 127
        Height = 21
        CharCase = ecUpperCase
        DataField = 'ESPECIE'
        DataSource = frmGrDepositos.dtsrcLancDepos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        Items.Strings = (
          'DINHEIRO'
          'CHEQUE')
        ParentFont = False
        TabOrder = 4
        OnKeyDown = DBLookupComboBox1KeyDown
      end
      object DBEdit1: TDBEdit
        Left = 168
        Top = 132
        Width = 111
        Height = 21
        CharCase = ecUpperCase
        DataField = 'VALORDEP'
        DataSource = frmGrDepositos.dtsrcLancDepos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        OnKeyDown = DBLookupComboBox1KeyDown
      end
    end
  end
  object tlbrCadCatProd: TToolBar
    Left = 0
    Top = 188
    Width = 366
    Height = 38
    Align = alBottom
    ButtonHeight = 33
    Caption = 'tlbrCadCatProd'
    TabOrder = 1
    object btbtnGrav: TBitBtn
      Left = 0
      Top = 2
      Width = 75
      Height = 33
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
      Left = 75
      Top = 2
      Width = 75
      Height = 33
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
    object ToolButton1: TToolButton
      Left = 150
      Top = 2
      Width = 8
      Caption = 'ToolButton1'
      Style = tbsSeparator
    end
    object btbtnFech: TBitBtn
      Left = 158
      Top = 2
      Width = 75
      Height = 33
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
