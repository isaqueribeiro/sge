inherited frmGrUsuario: TfrmGrUsuario
  Left = 392
  Top = 207
  ActiveControl = nil
  Caption = 'Tabela de Usu'#225'rios'
  ClientHeight = 456
  ClientWidth = 751
  OldCreateOrder = True
  ExplicitWidth = 767
  ExplicitHeight = 495
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 452
    Width = 751
    ExplicitTop = 453
    ExplicitWidth = 751
  end
  inherited Bevel3: TBevel
    Top = 413
    Width = 751
    ExplicitTop = 414
    ExplicitWidth = 751
  end
  inherited pgcGuias: TPageControl
    Width = 751
    Height = 413
    OnChange = pgcGuiasChange
    ExplicitWidth = 751
    ExplicitHeight = 413
    inherited tbsTabela: TTabSheet
      ExplicitWidth = 743
      ExplicitHeight = 384
      inherited Bevel4: TBevel
        Top = 318
        Width = 743
        ExplicitTop = 319
        ExplicitWidth = 743
      end
      inherited dbgDados: TDBGrid
        Width = 743
        Height = 318
        Columns = <
          item
            Expanded = False
            FieldName = 'ATV'
            Title.Alignment = taCenter
            Title.Caption = 'A'
            Width = 25
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMECOMPLETO'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PERFIL'
            Title.Caption = 'Perfil de acesso'
            Width = 250
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        Top = 322
        Width = 743
        ExplicitTop = 322
        ExplicitWidth = 743
        inherited grpBxFiltro: TGroupBox
          Left = 417
          Width = 322
          ExplicitLeft = 417
          ExplicitWidth = 322
          DesignSize = (
            322
            54)
          inherited lbltFiltrar: TLabel
            Left = 14
            Width = 46
            Caption = 'Usu'#225'rio:'
            ExplicitLeft = 14
            ExplicitWidth = 46
          end
          inherited edtFiltrar: TEdit
            Left = 72
            Width = 201
            ExplicitLeft = 72
            ExplicitWidth = 201
          end
          inherited btnFiltrar: TcxButton
            Left = 277
            ExplicitLeft = 277
          end
        end
      end
    end
    inherited tbsCadastro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 743
      ExplicitHeight = 384
      inherited Bevel8: TBevel
        Top = 81
        Width = 743
        ExplicitTop = 81
        ExplicitWidth = 743
      end
      object Bevel5: TBevel [1]
        Left = 0
        Top = 166
        Width = 743
        Height = 4
        Align = alTop
        Shape = bsSpacer
      end
      inherited GrpBxDadosNominais: TGroupBox
        Width = 743
        Height = 81
        Caption = 'Dados de autentica'#231#227'o'
        ExplicitWidth = 743
        ExplicitHeight = 81
        inherited lblCodigo: TLabel
          Enabled = False
        end
        object lblLogin: TLabel [1]
          Left = 88
          Top = 24
          Width = 29
          Height = 13
          Caption = 'Login:'
          FocusControl = dbLogin
        end
        object lblSenha: TLabel [2]
          Left = 296
          Top = 24
          Width = 34
          Height = 13
          Caption = 'Senha:'
          FocusControl = dbSenha
        end
        inherited dbCodigo: TDBEdit
          Color = clMoneyGreen
          Enabled = False
        end
        object dbLogin: TDBEdit
          Left = 88
          Top = 40
          Width = 201
          Height = 21
          CharCase = ecUpperCase
          DataField = 'NOME'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object dbSenha: TDBEdit
          Left = 296
          Top = 40
          Width = 201
          Height = 21
          CharCase = ecUpperCase
          DataField = 'SENHA'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          PasswordChar = '*'
          TabOrder = 2
        end
        object dbAlterarSenha: TDBCheckBox
          Left = 504
          Top = 40
          Width = 153
          Height = 17
          Caption = 'Alterar senha ao Logar'
          DataField = 'ALTERAR_SENHA'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
      object GrpBxDadosGerais: TGroupBox
        Left = 0
        Top = 85
        Width = 743
        Height = 81
        Align = alTop
        Caption = 'Dados de Identifica'#231#227'o'
        TabOrder = 1
        object lblNomeCompleto: TLabel
          Left = 16
          Top = 24
          Width = 121
          Height = 13
          Caption = 'Nome (Primeiro e '#218'ltimo):'
          FocusControl = dbNomeCompleto
        end
        object lblFuncao: TLabel
          Left = 296
          Top = 24
          Width = 79
          Height = 13
          Caption = 'Perfil de acesso:'
          FocusControl = dbFuncao
        end
        object dbNomeCompleto: TDBEdit
          Left = 16
          Top = 40
          Width = 273
          Height = 21
          CharCase = ecUpperCase
          DataField = 'NOMECOMPLETO'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object dbUsuarioAtivo: TDBCheckBox
          Left = 504
          Top = 40
          Width = 105
          Height = 17
          Caption = 'Usu'#225'rio ativo'
          DataField = 'ATIVO'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbFuncao: TDBLookupComboBox
          Left = 296
          Top = 40
          Width = 201
          Height = 21
          DataField = 'CODFUNCAO'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'COD'
          ListField = 'FUNCAO'
          ListSource = DtsFuncao
          ParentFont = False
          TabOrder = 1
        end
      end
      object GrpBxParametros: TGroupBox
        Left = 0
        Top = 170
        Width = 743
        Height = 214
        Align = alClient
        Caption = 'Par'#226'metros'
        TabOrder = 2
        object lblPercentualDesc: TLabel
          Left = 16
          Top = 24
          Width = 63
          Height = 13
          Caption = '% Desconto:'
          FocusControl = dbPercentualDesc
        end
        object lblVendedor: TLabel
          Left = 104
          Top = 24
          Width = 143
          Height = 13
          Caption = 'Funcion'#225'rio(a) / Vendedor(a):'
          FocusControl = dbVendedor
        end
        object dbPercentualDesc: TDBEdit
          Left = 16
          Top = 40
          Width = 81
          Height = 21
          CharCase = ecUpperCase
          DataField = 'LIMIDESC'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object dbAlterarValorVendaItem: TDBCheckBox
          Left = 16
          Top = 72
          Width = 257
          Height = 17
          Caption = 'Permitir alterar valor do item na venda'
          DataField = 'PERM_ALTERAR_VALOR_VENDA'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbVendedor: TDBLookupComboBox
          Left = 104
          Top = 40
          Width = 393
          Height = 21
          DataField = 'VENDEDOR'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'COD'
          ListField = 'NOME'
          ListSource = DtsVendedor
          ParentFont = False
          TabOrder = 1
        end
        object dbTipoAlteraValorVendaItem: TDBLookupComboBox
          Left = 16
          Top = 95
          Width = 209
          Height = 21
          DataField = 'TIPO_ALTERAR_VALOR_VENDA'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'CODIGO'
          ListField = 'DESCRICAO'
          ListSource = dtsTipoAlteraValor
          ParentFont = False
          TabOrder = 3
          OnClick = dbTipoAlteraValorVendaItemClick
        end
      end
    end
  end
  inherited tlbBotoes: TPanel
    Top = 417
    Width = 751
    ExplicitTop = 417
    ExplicitWidth = 751
    inherited bvlTool3: TBevel
      Left = 668
      ExplicitLeft = 668
    end
    inherited bvlTool4: TBevel
      Left = 747
      ExplicitLeft = 747
    end
    inherited btbtnFechar: TcxButton
      Left = 672
      ExplicitLeft = 672
    end
    inherited btbtnSelecionar: TcxButton
      Left = 548
      ExplicitLeft = 548
    end
  end
  inherited IbDtstTabela: TIBDataSet
    BeforePost = IbDtstTabelaBeforePost
    OnCalcFields = IbDtstTabelaCalcFields
    OnNewRecord = IbDtstTabelaNewRecord
    SelectSQL.Strings = (
      'Select'
      '    u.nome'
      '  , u.senha'
      '  , u.nomecompleto'
      '  , u.codfuncao'
      '  , u.limidesc'
      '  , u.ativo'
      '  , u.alterar_senha'
      '  , u.perm_alterar_valor_venda'
      '  , u.tipo_alterar_valor_venda'
      '  , u.vendedor'
      '  , f.funcao as perfil'
      'from TBUSERS u'
      '  left join TBFUNCAO f on (f.cod = u.codfuncao)')
    object IbDtstTabelaNOME: TIBStringField
      DisplayLabel = 'Login'
      FieldName = 'NOME'
      Origin = '"TBUSERS"."NOME"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 12
    end
    object IbDtstTabelaSENHA: TIBStringField
      DisplayLabel = 'Senha'
      FieldName = 'SENHA'
      Origin = '"TBUSERS"."SENHA"'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 16
    end
    object IbDtstTabelaNOMECOMPLETO: TIBStringField
      DisplayLabel = 'Nome Completo'
      FieldName = 'NOMECOMPLETO'
      Origin = '"TBUSERS"."NOMECOMPLETO"'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 60
    end
    object IbDtstTabelaCODFUNCAO: TSmallintField
      DisplayLabel = 'Perfil de acesso'
      FieldName = 'CODFUNCAO'
      Origin = '"TBUSERS"."CODFUNCAO"'
      ProviderFlags = [pfInUpdate]
      ReadOnly = True
      Required = True
    end
    object IbDtstTabelaLIMIDESC: TIBBCDField
      FieldName = 'LIMIDESC'
      Origin = '"TBUSERS"."LIMIDESC"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00'
      Precision = 9
      Size = 2
    end
    object IbDtstTabelaATIVO: TSmallintField
      FieldName = 'ATIVO'
      Origin = '"TBUSERS"."ATIVO"'
      ProviderFlags = [pfInUpdate]
    end
    object IbDtstTabelaALTERAR_SENHA: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'ALTERAR_SENHA'
      Origin = '"TBUSERS"."ALTERAR_SENHA"'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object IbDtstTabelaPERM_ALTERAR_VALOR_VENDA: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'PERM_ALTERAR_VALOR_VENDA'
      Origin = '"TBUSERS"."PERM_ALTERAR_VALOR_VENDA"'
      ProviderFlags = [pfInUpdate]
    end
    object IbDtstTabelaTIPO_ALTERAR_VALOR_VENDA: TSmallintField
      FieldName = 'TIPO_ALTERAR_VALOR_VENDA'
      Origin = '"TBUSERS"."TIPO_ALTERAR_VALOR_VENDA"'
      ProviderFlags = [pfInUpdate]
    end
    object IbDtstTabelaVENDEDOR: TIntegerField
      DisplayLabel = 'Vendedor'
      FieldName = 'VENDEDOR'
      Origin = '"TBUSERS"."VENDEDOR"'
      ProviderFlags = [pfInUpdate]
    end
    object IbDtstTabelaPERFIL: TIBStringField
      FieldName = 'PERFIL'
      Origin = '"TBFUNCAO"."FUNCAO"'
      ProviderFlags = []
      Size = 25
    end
    object IbDtstTabelaATV: TStringField
      Alignment = taCenter
      FieldKind = fkCalculated
      FieldName = 'ATV'
      Size = 1
      Calculated = True
    end
  end
  inherited DtSrcTabela: TDataSource
    OnDataChange = DtSrcTabelaDataChange
  end
  inherited IbUpdTabela: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  NOME,'
      '  SENHA,'
      '  NOMECOMPLETO,'
      '  CODFUNCAO,'
      '  LIMIDESC,'
      '  ATIVO,'
      '  ALTERAR_SENHA,'
      '  PERM_ALTERAR_VALOR_VENDA,'
      '  TIPO_ALTERAR_VALOR_VENDA,'
      '  VENDEDOR'
      'from TBUSERS '
      'where'
      '  NOME = :NOME')
    ModifySQL.Strings = (
      'update TBUSERS'
      'set'
      '  ALTERAR_SENHA = :ALTERAR_SENHA,'
      '  ATIVO = :ATIVO,'
      '  CODFUNCAO = :CODFUNCAO,'
      '  LIMIDESC = :LIMIDESC,'
      '  NOME = :NOME,'
      '  NOMECOMPLETO = :NOMECOMPLETO,'
      '  PERM_ALTERAR_VALOR_VENDA = :PERM_ALTERAR_VALOR_VENDA,'
      '  SENHA = :SENHA,'
      '  TIPO_ALTERAR_VALOR_VENDA = :TIPO_ALTERAR_VALOR_VENDA,'
      '  VENDEDOR = :VENDEDOR'
      'where'
      '  NOME = :OLD_NOME')
    InsertSQL.Strings = (
      'insert into TBUSERS'
      
        '  (ALTERAR_SENHA, ATIVO, CODFUNCAO, LIMIDESC, NOME, NOMECOMPLETO' +
        ', PERM_ALTERAR_VALOR_VENDA, '
      '   SENHA, TIPO_ALTERAR_VALOR_VENDA, VENDEDOR)'
      'values'
      
        '  (:ALTERAR_SENHA, :ATIVO, :CODFUNCAO, :LIMIDESC, :NOME, :NOMECO' +
        'MPLETO, '
      
        '   :PERM_ALTERAR_VALOR_VENDA, :SENHA, :TIPO_ALTERAR_VALOR_VENDA,' +
        ' :VENDEDOR)')
    DeleteSQL.Strings = (
      'delete from TBUSERS'
      'where'
      '  NOME = :OLD_NOME')
  end
  object QryFuncao: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'Select'
      '    f.cod'
      '  , f.funcao'
      'from TBFUNCAO f'
      'where f.cod <> :perfil')
    Left = 620
    Top = 41
    ParamData = <
      item
        DataType = ftInteger
        Name = 'perfil'
        ParamType = ptInput
        Value = 0
      end>
  end
  object DtsFuncao: TDataSource
    DataSet = QryFuncao
    Left = 652
    Top = 41
  end
  object QryVendedor: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'Select'
      '    v.cod'
      '  , v.nome'
      '  , v.ativo'
      'from TBVENDEDOR v'
      ''
      'order by'
      '    v.nome')
    Left = 620
    Top = 89
  end
  object DtsVendedor: TDataSource
    DataSet = QryVendedor
    Left = 652
    Top = 89
  end
  object tblTipoAlteraValor: TIBTable
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'VW_TIPO_ALTERA_VALOR_VENDA'
    TableTypes = [ttView]
    UniDirectional = False
    Left = 624
    Top = 144
  end
  object dtsTipoAlteraValor: TDataSource
    DataSet = tblTipoAlteraValor
    Left = 656
    Top = 144
  end
end
