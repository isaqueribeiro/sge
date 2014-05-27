object frmGrUsuarioAlterarSenha: TfrmGrUsuarioAlterarSenha
  Left = 1012
  Top = 305
  ActiveControl = dbNome
  BorderStyle = bsDialog
  Caption = 'Altera'#231#227'o de Senha'
  ClientHeight = 187
  ClientWidth = 367
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 367
    Height = 146
    Align = alClient
    BevelOuter = bvNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object lblNome: TLabel
      Left = 66
      Top = 18
      Width = 53
      Height = 16
      Alignment = taRightJustify
      Caption = 'Usu'#225'rio:'
      FocusControl = dbNome
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblSenhaNova: TLabel
      Left = 38
      Top = 83
      Width = 81
      Height = 16
      Alignment = taRightJustify
      Caption = 'Senha &Nova:'
      FocusControl = dbSenhaNova
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblSenhaConfirmar: TLabel
      Left = 15
      Top = 115
      Width = 104
      Height = 16
      Alignment = taRightJustify
      Caption = '&Confirmar Nova:'
      FocusControl = dbSenhaConfirmar
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblSenhaAtual: TLabel
      Left = 35
      Top = 50
      Width = 84
      Height = 16
      Alignment = taRightJustify
      Caption = 'Senha &Atual:'
      FocusControl = dbSenhaAtual
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbNome: TDBEdit
      Left = 122
      Top = 14
      Width = 231
      Height = 24
      CharCase = ecUpperCase
      DataField = 'NOME'
      DataSource = dtsUsers
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object dbSenhaAtual: TDBEdit
      Left = 122
      Top = 46
      Width = 167
      Height = 24
      CharCase = ecUpperCase
      DataField = 'SENHA_ATUAL'
      DataSource = dtsUsers
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 1
    end
    object dbSenhaNova: TDBEdit
      Left = 122
      Top = 79
      Width = 167
      Height = 24
      CharCase = ecUpperCase
      DataField = 'SENHA_NOVA'
      DataSource = dtsUsers
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 2
    end
    object dbSenhaConfirmar: TDBEdit
      Left = 122
      Top = 111
      Width = 167
      Height = 24
      CharCase = ecUpperCase
      DataField = 'SENHA_CONFIRMAR'
      DataSource = dtsUsers
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 3
    end
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 146
    Width = 367
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      367
      41)
    object BvlBotoes: TBevel
      Left = 0
      Top = 0
      Width = 367
      Height = 9
      Align = alTop
      Shape = bsTopLine
    end
    object btbtnSalvar: TBitBtn
      Left = 210
      Top = 5
      Width = 75
      Height = 31
      Hint = 'Gravar Nova Senha'
      Anchors = [akTop, akRight]
      Caption = 'Confirmar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btbtnSalvarClick
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
    object btbtnFechar: TBitBtn
      Left = 288
      Top = 5
      Width = 75
      Height = 31
      Hint = 'Fechar'
      Anchors = [akTop, akRight]
      Caption = 'Fechar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
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
  object tblUsers: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from TBUSERS'
      'where'
      '  NOME = :OLD_NOME')
    InsertSQL.Strings = (
      'insert into TBUSERS'
      '  (NOME, SENHA, NOMECOMPLETO, CODFUNCAO, LIMIDESC)'
      'values'
      '  (:NOME, :SENHA, :NOMECOMPLETO, :CODFUNCAO, :LIMIDESC)')
    RefreshSQL.Strings = (
      'Select '
      '  NOME,'
      '  SENHA,'
      '  NOMECOMPLETO,'
      '  CODFUNCAO,'
      '  LIMIDESC'
      'from TBUSERS '
      'where'
      '  NOME = :NOME')
    SelectSQL.Strings = (
      'Select'
      '    u.Nome'
      '  , u.Senha'
      '  , u.Nomecompleto'
      '  , u.Codfuncao'
      '  , u.Limidesc'
      '  , cast(null as varchar(16)) as Senha_Atual'
      '  , cast(null as varchar(16)) as Senha_Nova'
      '  , cast(null as varchar(16)) as Senha_Confirmar'
      'from TBUSERS u'
      'where u.Nome = :Nome')
    ModifySQL.Strings = (
      'update TBUSERS'
      'set'
      '  NOME = :NOME,'
      '  SENHA = :SENHA,'
      '  NOMECOMPLETO = :NOMECOMPLETO,'
      '  CODFUNCAO = :CODFUNCAO,'
      '  LIMIDESC = :LIMIDESC'
      'where'
      '  NOME = :OLD_NOME')
    UpdateObject = updUsers
    Left = 16
    Top = 152
    object tblUsersNOME: TIBStringField
      FieldName = 'NOME'
      Origin = 'TBUSERS.NOME'
      Required = True
      Size = 12
    end
    object tblUsersSENHA: TIBStringField
      FieldName = 'SENHA'
      Origin = 'TBUSERS.SENHA'
      Required = True
      Size = 16
    end
    object tblUsersNOMECOMPLETO: TIBStringField
      FieldName = 'NOMECOMPLETO'
      Origin = 'TBUSERS.NOMECOMPLETO'
      Required = True
      Size = 60
    end
    object tblUsersCODFUNCAO: TSmallintField
      FieldName = 'CODFUNCAO'
      Origin = 'TBUSERS.CODFUNCAO'
      Required = True
    end
    object tblUsersLIMIDESC: TIBBCDField
      FieldName = 'LIMIDESC'
      Origin = 'TBUSERS.LIMIDESC'
      Precision = 9
      Size = 2
    end
    object tblUsersSENHA_ATUAL: TIBStringField
      DisplayLabel = 'Senha Atual'
      FieldName = 'SENHA_ATUAL'
      ProviderFlags = []
      Required = True
      Size = 16
    end
    object tblUsersSENHA_NOVA: TIBStringField
      DisplayLabel = 'Nova Senha'
      FieldName = 'SENHA_NOVA'
      ProviderFlags = []
      Required = True
      Size = 16
    end
    object tblUsersSENHA_CONFIRMAR: TIBStringField
      DisplayLabel = 'Confirmar Senha'
      FieldName = 'SENHA_CONFIRMAR'
      ProviderFlags = []
      Required = True
      Size = 16
    end
  end
  object dtsUsers: TDataSource
    DataSet = tblUsers
    Left = 80
    Top = 152
  end
  object updUsers: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  NOME,'
      '  SENHA,'
      '  NOMECOMPLETO,'
      '  CODFUNCAO,'
      '  LIMIDESC'
      'from TBUSERS '
      'where'
      '  NOME = :NOME')
    ModifySQL.Strings = (
      'update TBUSERS'
      'set'
      '  NOME = :NOME,'
      '  SENHA = :SENHA,'
      '  NOMECOMPLETO = :NOMECOMPLETO,'
      '  CODFUNCAO = :CODFUNCAO,'
      '  LIMIDESC = :LIMIDESC'
      'where'
      '  NOME = :OLD_NOME')
    InsertSQL.Strings = (
      'insert into TBUSERS'
      '  (NOME, SENHA, NOMECOMPLETO, CODFUNCAO, LIMIDESC)'
      'values'
      '  (:NOME, :SENHA, :NOMECOMPLETO, :CODFUNCAO, :LIMIDESC)')
    DeleteSQL.Strings = (
      'delete from TBUSERS'
      'where'
      '  NOME = :OLD_NOME')
    Left = 48
    Top = 154
  end
end
