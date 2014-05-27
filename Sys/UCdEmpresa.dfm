object frmCadEmpresa: TfrmCadEmpresa
  Left = 357
  Top = 160
  Width = 383
  Height = 382
  AutoSize = True
  BorderIcons = [biSystemMenu]
  Caption = 'Cadastro de Empresa'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 367
    Height = 308
    Align = alClient
    TabOrder = 0
    object grpbxProd: TGroupBox
      Left = 1
      Top = 1
      Width = 365
      Height = 306
      Align = alClient
      Caption = 'Dados'
      Ctl3D = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      object Label5: TLabel
        Left = 12
        Top = 19
        Width = 36
        Height = 13
        Caption = 'CNPJ:'
      end
      object Label6: TLabel
        Left = 13
        Top = 146
        Width = 59
        Height = 13
        Caption = 'Endere'#231'o:'
      end
      object Label8: TLabel
        Left = 12
        Top = 190
        Width = 38
        Height = 13
        Caption = 'Bairro:'
      end
      object Label11: TLabel
        Left = 219
        Top = 191
        Width = 29
        Height = 13
        Caption = 'CEP:'
      end
      object Label9: TLabel
        Left = 12
        Top = 238
        Width = 44
        Height = 13
        Caption = 'Cidade:'
      end
      object Label12: TLabel
        Left = 193
        Top = 239
        Width = 21
        Height = 13
        Caption = 'UF:'
      end
      object Label10: TLabel
        Left = 12
        Top = 103
        Width = 107
        Height = 13
        Caption = 'Nome de Fantasia:'
      end
      object Label1: TLabel
        Left = 12
        Top = 60
        Width = 80
        Height = 13
        Caption = 'Raz'#227'o Social:'
      end
      object DBEdit2: TDBEdit
        Left = 12
        Top = 77
        Width = 333
        Height = 21
        Hint = 'Tipo de Im'#243'vel'
        AutoSize = False
        CharCase = ecUpperCase
        DataField = 'RZSOC'
        DataSource = frmGridEmpresa.dtsrcEmpresa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnKeyDown = DBEdit2KeyDown
      end
      object DBEdit6: TDBEdit
        Left = 13
        Top = 162
        Width = 336
        Height = 21
        Hint = 'Endere'#231'o do Im'#243'vel'
        CharCase = ecUpperCase
        DataField = 'ENDER'
        DataSource = frmGridEmpresa.dtsrcEmpresa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnKeyDown = DBEdit2KeyDown
      end
      object DBEdit9: TDBEdit
        Left = 12
        Top = 207
        Width = 169
        Height = 21
        Hint = 'Bairro  do Im'#243'vel'
        CharCase = ecUpperCase
        DataField = 'BAIRRO'
        DataSource = frmGridEmpresa.dtsrcEmpresa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnKeyDown = DBEdit2KeyDown
      end
      object DBEdit10: TDBEdit
        Left = 219
        Top = 207
        Width = 81
        Height = 21
        Hint = 'CEP do Im'#243'vel'
        DataField = 'CEP'
        DataSource = frmGridEmpresa.dtsrcEmpresa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 9
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnKeyDown = DBEdit2KeyDown
      end
      object DBEdit11: TDBEdit
        Left = 12
        Top = 256
        Width = 145
        Height = 21
        Hint = 'Cidade  do Im'#243'vel'
        CharCase = ecUpperCase
        DataField = 'CIDADE'
        DataSource = frmGridEmpresa.dtsrcEmpresa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        OnKeyDown = DBEdit2KeyDown
      end
      object DBEdit12: TDBEdit
        Left = 193
        Top = 256
        Width = 25
        Height = 21
        Hint = 'Estado da Cidade do Im'#243'vel'
        CharCase = ecUpperCase
        DataField = 'UF'
        DataSource = frmGridEmpresa.dtsrcEmpresa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
        OnKeyDown = DBEdit2KeyDown
      end
      object DBEdit1: TDBEdit
        Left = 12
        Top = 35
        Width = 119
        Height = 21
        Hint = 'Data que foi cadastro o Im'#243'vel'
        DataField = 'CNPJ'
        DataSource = frmGridEmpresa.dtsrcEmpresa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnKeyDown = DBEdit2KeyDown
      end
      object DBEdit8: TDBEdit
        Left = 12
        Top = 120
        Width = 181
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NMFANT'
        DataSource = frmGridEmpresa.dtsrcEmpresa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnKeyDown = DBEdit2KeyDown
      end
    end
  end
  object tlbrCadProd: TToolBar
    Left = 0
    Top = 308
    Width = 367
    Height = 38
    Align = alBottom
    ButtonHeight = 31
    Caption = 'tlbrCadProd'
    TabOrder = 1
    object btbtnGrav: TBitBtn
      Left = 0
      Top = 2
      Width = 75
      Height = 31
      Hint = 'Gravar Dados do Im'#243'vel'
      Caption = 'Gravar'
      ParentShowHint = False
      ShowHint = True
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
      Height = 31
      Hint = 'Cancelar Dados do Im'#243'vel'
      Caption = 'Cancelar'
      ParentShowHint = False
      ShowHint = True
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
      Height = 31
      Hint = 'Fechar o Cadastro'
      Caption = 'Fechar'
      ParentShowHint = False
      ShowHint = True
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
