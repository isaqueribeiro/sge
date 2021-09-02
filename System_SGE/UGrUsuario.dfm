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
            Title.Caption = 'Login '
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMECOMPLETO'
            Title.Caption = 'Nome Completo '
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PERFIL'
            Title.Caption = 'Perfil de acesso '
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
      object pgcParametros: TPageControl
        Left = 0
        Top = 170
        Width = 743
        Height = 214
        ActivePage = tbsVendas
        Align = alClient
        TabOrder = 2
        object tbsVendas: TTabSheet
          Caption = 'Vendas / OS'
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object GrpBxParametrosVenda: TGroupBox
            Left = 0
            Top = 0
            Width = 735
            Height = 186
            Align = alClient
            Caption = 'Par'#226'metros'
            TabOrder = 0
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
              Width = 297
              Height = 17
              Caption = 'Permitir alterar valor do item na Venda e/ou OS'
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
              Width = 269
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
        object tbsControleInterno: TTabSheet
          Caption = 'Controle Interno'
          ImageIndex = 1
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object GrpBxParametrosAlmox: TGroupBox
            Left = 0
            Top = 0
            Width = 735
            Height = 186
            Align = alClient
            Caption = 'Par'#226'metros'
            TabOrder = 0
            object dbAlmoxManifestoAuto: TDBCheckBox
              Left = 16
              Top = 24
              Width = 270
              Height = 33
              Caption = 
                'Gerar Manifesto automaticamente a partir da Requisi'#231#227'o de Materi' +
                'ais/Produtos ao Estoque'
              DataField = 'ALMOX_MANIFESTO_AUTOMATICO'
              DataSource = DtSrcTabela
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              ValueChecked = '1'
              ValueUnchecked = '0'
              WordWrap = True
            end
          end
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
    SelectSQL.Strings = ()
  end
  inherited DtSrcTabela: TDataSource
    DataSet = fdQryTabela
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
      '  VENDEDOR,'
      '  ALMOX_MANIFESTO_AUTOMATICO'
      'from TBUSERS '
      'where'
      '  NOME = :NOME')
    ModifySQL.Strings = (
      'update TBUSERS'
      'set'
      '  ALMOX_MANIFESTO_AUTOMATICO = :ALMOX_MANIFESTO_AUTOMATICO,'
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
      
        '  (ALMOX_MANIFESTO_AUTOMATICO, ALTERAR_SENHA, ATIVO, CODFUNCAO, ' +
        'LIMIDESC, '
      
        '   NOME, NOMECOMPLETO, PERM_ALTERAR_VALOR_VENDA, SENHA, TIPO_ALT' +
        'ERAR_VALOR_VENDA, '
      '   VENDEDOR)'
      'values'
      
        '  (:ALMOX_MANIFESTO_AUTOMATICO, :ALTERAR_SENHA, :ATIVO, :CODFUNC' +
        'AO, :LIMIDESC, '
      
        '   :NOME, :NOMECOMPLETO, :PERM_ALTERAR_VALOR_VENDA, :SENHA, :TIP' +
        'O_ALTERAR_VALOR_VENDA, '
      '   :VENDEDOR)')
    DeleteSQL.Strings = (
      'delete from TBUSERS'
      'where'
      '  NOME = :OLD_NOME')
  end
  inherited fdQryTabela: TFDQuery
    BeforePost = fdQryTabelaBeforePost
    OnCalcFields = fdQryTabelaCalcFields
    SQL.Strings = (
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
      '  , u.almox_manifesto_automatico'
      '  , f.funcao as perfil'
      'from TBUSERS u'
      '  left join TBFUNCAO f on (f.cod = u.codfuncao)')
    object fdQryTabelaNOME: TStringField
      DisplayLabel = 'Login'
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 12
    end
    object fdQryTabelaSENHA: TStringField
      DisplayLabel = 'Senha'
      FieldName = 'SENHA'
      Origin = 'SENHA'
      Required = True
      Size = 16
    end
    object fdQryTabelaNOMECOMPLETO: TStringField
      DisplayLabel = 'Nome Completo'
      FieldName = 'NOMECOMPLETO'
      Origin = 'NOMECOMPLETO'
      Required = True
      Size = 60
    end
    object fdQryTabelaCODFUNCAO: TSmallintField
      DisplayLabel = 'Perfil de acesso'
      FieldName = 'CODFUNCAO'
      Origin = 'CODFUNCAO'
      Required = True
    end
    object fdQryTabelaLIMIDESC: TCurrencyField
      FieldName = 'LIMIDESC'
      Origin = 'LIMIDESC'
      DisplayFormat = ',0.00'
    end
    object fdQryTabelaATIVO: TSmallintField
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      Required = True
    end
    object fdQryTabelaALTERAR_SENHA: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'ALTERAR_SENHA'
      Origin = 'ALTERAR_SENHA'
      Required = True
    end
    object fdQryTabelaPERM_ALTERAR_VALOR_VENDA: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'PERM_ALTERAR_VALOR_VENDA'
      Origin = 'PERM_ALTERAR_VALOR_VENDA'
      Required = True
    end
    object fdQryTabelaTIPO_ALTERAR_VALOR_VENDA: TSmallintField
      FieldName = 'TIPO_ALTERAR_VALOR_VENDA'
      Origin = 'TIPO_ALTERAR_VALOR_VENDA'
      Required = True
    end
    object fdQryTabelaVENDEDOR: TIntegerField
      DisplayLabel = 'Vendedor'
      FieldName = 'VENDEDOR'
      Origin = 'VENDEDOR'
    end
    object fdQryTabelaALMOX_MANIFESTO_AUTOMATICO: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'ALMOX_MANIFESTO_AUTOMATICO'
      Origin = 'ALMOX_MANIFESTO_AUTOMATICO'
      Required = True
    end
    object fdQryTabelaPERFIL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PERFIL'
      Origin = 'FUNCAO'
      ProviderFlags = []
      Size = 25
    end
    object fdQryTabelaATV: TStringField
      Alignment = taCenter
      FieldKind = fkInternalCalc
      FieldName = 'ATV'
      Size = 1
    end
  end
  inherited fdUpdTabela: TFDUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO TBUSERS'
      '(NOME, SENHA, NOMECOMPLETO, CODFUNCAO, LIMIDESC, '
      '  ATIVO, ALTERAR_SENHA, PERM_ALTERAR_VALOR_VENDA, '
      
        '  TIPO_ALTERAR_VALOR_VENDA, VENDEDOR, ALMOX_MANIFESTO_AUTOMATICO' +
        ')'
      
        'VALUES (:NEW_NOME, :NEW_SENHA, :NEW_NOMECOMPLETO, :NEW_CODFUNCAO' +
        ', :NEW_LIMIDESC, '
      
        '  :NEW_ATIVO, :NEW_ALTERAR_SENHA, :NEW_PERM_ALTERAR_VALOR_VENDA,' +
        ' '
      
        '  :NEW_TIPO_ALTERAR_VALOR_VENDA, :NEW_VENDEDOR, :NEW_ALMOX_MANIF' +
        'ESTO_AUTOMATICO)')
    ModifySQL.Strings = (
      'UPDATE TBUSERS'
      
        'SET NOME = :NEW_NOME, SENHA = :NEW_SENHA, NOMECOMPLETO = :NEW_NO' +
        'MECOMPLETO, '
      
        '  CODFUNCAO = :NEW_CODFUNCAO, LIMIDESC = :NEW_LIMIDESC, ATIVO = ' +
        ':NEW_ATIVO, '
      
        '  ALTERAR_SENHA = :NEW_ALTERAR_SENHA, PERM_ALTERAR_VALOR_VENDA =' +
        ' :NEW_PERM_ALTERAR_VALOR_VENDA, '
      '  TIPO_ALTERAR_VALOR_VENDA = :NEW_TIPO_ALTERAR_VALOR_VENDA, '
      
        '  VENDEDOR = :NEW_VENDEDOR, ALMOX_MANIFESTO_AUTOMATICO = :NEW_AL' +
        'MOX_MANIFESTO_AUTOMATICO'
      'WHERE NOME = :OLD_NOME')
    DeleteSQL.Strings = (
      'DELETE FROM TBUSERS'
      'WHERE NOME = :OLD_NOME')
    FetchRowSQL.Strings = (
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
      '  , u.almox_manifesto_automatico'
      '  , f.funcao as perfil'
      'from TBUSERS u'
      '  left join TBFUNCAO f on (f.cod = u.codfuncao)'
      'WHERE u.NOME = :NOME')
  end
  object DtsFuncao: TDataSource
    DataSet = fdQryFuncao
    Left = 600
    Top = 248
  end
  object DtsVendedor: TDataSource
    DataSet = fdQryVendedor
    Left = 600
    Top = 280
  end
  object dtsTipoAlteraValor: TDataSource
    DataSet = fdQryTipoAlteraValor
    Left = 600
    Top = 312
  end
  object fdQryTipoAlteraValor: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select *'
      'from VW_TIPO_ALTERA_VALOR_VENDA')
    Left = 568
    Top = 312
  end
  object fdQryVendedor: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    v.cod'
      '  , v.nome'
      '  , v.ativo'
      'from TBVENDEDOR v'
      ''
      'order by'
      '    v.nome')
    Left = 568
    Top = 280
  end
  object fdQryFuncao: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    f.cod'
      '  , f.funcao'
      'from TBFUNCAO f'
      'where f.cod <> :perfil')
    Left = 568
    Top = 248
    ParamData = <
      item
        Name = 'PERFIL'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
end
