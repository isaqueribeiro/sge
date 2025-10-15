inherited ViewUsuario: TViewUsuario
  Left = 392
  Top = 207
  ActiveControl = nil
  Caption = 'Tabela de Usu'#225'rios'
  ClientHeight = 456
  ClientWidth = 751
  ExplicitWidth = 763
  ExplicitHeight = 494
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
    ActivePage = tbsCadastro
    OnChange = pgcGuiasChange
    ExplicitWidth = 747
    ExplicitHeight = 412
    inherited tbsTabela: TTabSheet
      ExplicitWidth = 743
      ExplicitHeight = 384
      inherited Bevel4: TBevel
        Top = 310
        Width = 743
        ExplicitTop = 319
        ExplicitWidth = 743
      end
      inherited dbgDados: TDBGrid
        Width = 743
        Height = 310
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Title.Alignment = taCenter
            Title.Caption = '#'
            Width = 45
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
        Top = 314
        Width = 743
        ExplicitTop = 314
        ExplicitWidth = 743
        inherited grpBxFiltro: TGroupBox
          Left = 417
          Width = 322
          ExplicitLeft = 417
          ExplicitWidth = 322
          inherited lbltFiltrar: TLabel
            AlignWithMargins = True
            Left = 24
            Top = 25
            Width = 47
            Height = 21
            Margins.Top = 10
            Margins.Bottom = 14
            Align = alRight
            AutoSize = False
            Caption = 'Usu'#225'rio:'
            Layout = tlCenter
            ExplicitLeft = 24
            ExplicitTop = 25
            ExplicitWidth = 47
            ExplicitHeight = 21
          end
          inherited edtFiltrar: TEdit
            Left = 77
            Width = 201
            ExplicitLeft = 77
            ExplicitWidth = 201
          end
          inherited btnFiltrar: TcxButton
            Left = 284
            ExplicitLeft = 284
          end
        end
        object pnlStatus: TPanel
          AlignWithMargins = True
          Left = 7
          Top = 6
          Width = 143
          Height = 58
          Margins.Top = 2
          Margins.Bottom = 2
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 1
          object pnlSatusColor: TPanel
            Left = 0
            Top = 0
            Width = 24
            Height = 58
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 0
            object shpRegistroDesativado: TShape
              AlignWithMargins = True
              Left = 3
              Top = 1
              Width = 18
              Height = 18
              Margins.Top = 1
              Margins.Bottom = 1
              Align = alTop
              Brush.Color = 10658466
              Pen.Style = psClear
              ExplicitTop = 2
              ExplicitWidth = 19
            end
          end
          object pnlStatusText: TPanel
            Left = 24
            Top = 0
            Width = 119
            Height = 58
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object lblRegistroDesativado: TLabel
              AlignWithMargins = True
              Left = 3
              Top = 1
              Width = 113
              Height = 18
              Margins.Top = 1
              Margins.Bottom = 1
              Align = alTop
              AutoSize = False
              Caption = '* Usu'#225'rio inativo'
              Font.Charset = ANSI_CHARSET
              Font.Color = 10658466
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Layout = tlCenter
              StyleElements = []
              ExplicitTop = 2
              ExplicitWidth = 251
            end
          end
        end
      end
    end
    inherited tbsCadastro: TTabSheet
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
        ExplicitWidth = 739
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
          DataField = 'CODIGO'
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
        ExplicitTop = 83
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
        object dbFuncao: TDBLookupComboBox
          Left = 296
          Top = 40
          Width = 201
          Height = 21
          Cursor = crHandPoint
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
        object dbAttivo: TcxDBCheckBox
          Left = 503
          Top = 39
          Caption = 'Usu'#225'rio ativo'
          DataBinding.DataField = 'ATIVO'
          DataBinding.DataSource = DtSrcTabela
          Properties.Alignment = taLeftJustify
          Properties.ValueChecked = '1'
          Properties.ValueUnchecked = '0'
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = True
          Style.TransparentBorder = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfUltraFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfUltraFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 2
        end
      end
      object pgcParametros: TPageControl
        Left = 0
        Top = 170
        Width = 743
        Height = 214
        Cursor = crHandPoint
        ActivePage = tbsVendas
        Align = alClient
        TabOrder = 2
        ExplicitWidth = 739
        ExplicitHeight = 213
        object tbsVendas: TTabSheet
          Caption = 'Vendas / OS'
          object GrpBxParametrosVenda: TGroupBox
            Left = 0
            Top = 0
            Width = 735
            Height = 186
            Align = alClient
            Caption = 'Par'#226'metros'
            TabOrder = 0
            ExplicitWidth = 731
            ExplicitHeight = 185
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
              Cursor = crHandPoint
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
              Cursor = crHandPoint
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
          object GrpBxParametrosAlmox: TGroupBox
            Left = 0
            Top = 0
            Width = 735
            Height = 186
            Align = alClient
            Caption = 'Par'#226'metros'
            TabOrder = 0
            object lblCentroCusto: TLabel
              Left = 16
              Top = 24
              Width = 116
              Height = 13
              Caption = 'Centro de Custo Padr'#227'o'
              FocusControl = dbCentroCusto
            end
            object dbAlmoxManifestoAuto: TDBCheckBox
              Left = 16
              Top = 67
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
              TabOrder = 1
              ValueChecked = '1'
              ValueUnchecked = '0'
              WordWrap = True
            end
            object dbCentroCusto: TDBLookupComboBox
              Left = 16
              Top = 40
              Width = 393
              Height = 21
              Cursor = crHandPoint
              DataField = 'CENTRO_CUSTO'
              DataSource = DtSrcTabela
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              KeyField = 'codigo'
              ListField = 'descricao'
              ListSource = DtsCentroCusto
              ParentFont = False
              TabOrder = 0
            end
          end
        end
      end
    end
  end
  inherited tlbBotoes: TPanel
    Top = 417
    Width = 751
    ExplicitTop = 416
    ExplicitWidth = 747
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
      ExplicitLeft = 668
    end
    inherited btbtnSelecionar: TcxButton
      Left = 548
      ExplicitLeft = 544
    end
  end
  inherited DtSrcTabela: TDataSource
    OnDataChange = DtSrcTabelaDataChange
  end
  object DtsFuncao: TDataSource
    Left = 600
    Top = 248
  end
  object DtsVendedor: TDataSource
    Left = 600
    Top = 280
  end
  object dtsTipoAlteraValor: TDataSource
    Left = 600
    Top = 312
  end
  object DtsCentroCusto: TDataSource
    Left = 600
    Top = 344
  end
end
