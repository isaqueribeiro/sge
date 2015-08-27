object frmGrUsuarioAlterarSenha: TfrmGrUsuarioAlterarSenha
  Left = 388
  Top = 221
  ActiveControl = dbSenhaAtual
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
      Transparent = True
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
      Transparent = True
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
      Transparent = True
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
      Transparent = True
    end
    object dbNome: TDBEdit
      Left = 122
      Top = 14
      Width = 167
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
    object btbtnSalvar: TcxButton
      Left = 210
      Top = 5
      Width = 75
      Height = 31
      Hint = 'Gravar Nova Senha'
      Anchors = [akTop, akRight]
      Caption = 'Salvar'
      OptionsImage.ImageIndex = 22
      OptionsImage.Images = DMRecursos.ImgBotoes16x16
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btbtnSalvarClick
    end
    object btbtnFechar: TcxButton
      Left = 288
      Top = 5
      Width = 75
      Height = 31
      Hint = 'Fechar'
      ParentCustomHint = False
      Anchors = [akTop, akRight]
      Caption = 'Fechar'
      OptionsImage.ImageIndex = 15
      OptionsImage.Images = DMRecursos.ImgBotoes16x16
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btbtnFecharClick
    end
  end
  object tblUsers: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
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
      '  , u.Alterar_Senha'
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
    ParamCheck = True
    UniDirectional = False
    UpdateObject = updUsers
    Left = 16
    Top = 152
    object tblUsersNOME: TIBStringField
      FieldName = 'NOME'
      Origin = '"TBUSERS"."NOME"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 12
    end
    object tblUsersSENHA: TIBStringField
      FieldName = 'SENHA'
      Origin = '"TBUSERS"."SENHA"'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 16
    end
    object tblUsersALTERAR_SENHA: TSmallintField
      FieldName = 'ALTERAR_SENHA'
      Origin = '"TBUSERS"."ALTERAR_SENHA"'
      ProviderFlags = [pfInUpdate]
    end
    object tblUsersSENHA_ATUAL: TIBStringField
      FieldName = 'SENHA_ATUAL'
      ProviderFlags = []
      Size = 16
    end
    object tblUsersSENHA_NOVA: TIBStringField
      FieldName = 'SENHA_NOVA'
      ProviderFlags = []
      Size = 16
    end
    object tblUsersSENHA_CONFIRMAR: TIBStringField
      FieldName = 'SENHA_CONFIRMAR'
      ProviderFlags = []
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
      '  LIMIDESC,'
      '  ATIVO,'
      '  ALTERAR_SENHA,'
      '  PERM_ALTERAR_VALOR_VENDA'
      'from TBUSERS '
      'where'
      '  NOME = :NOME')
    ModifySQL.Strings = (
      'update TBUSERS'
      'set'
      '  ALTERAR_SENHA = :ALTERAR_SENHA,'
      '  NOME = :NOME,'
      '  SENHA = :SENHA'
      'where'
      '  NOME = :OLD_NOME')
    InsertSQL.Strings = (
      'insert into TBUSERS'
      '  (ALTERAR_SENHA, NOME, SENHA)'
      'values'
      '  (:ALTERAR_SENHA, :NOME, :SENHA)')
    DeleteSQL.Strings = (
      'delete from TBUSERS'
      'where'
      '  NOME = :OLD_NOME')
    Left = 48
    Top = 154
  end
end
