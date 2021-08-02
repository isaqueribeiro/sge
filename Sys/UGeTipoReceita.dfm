inherited frmGeTipoReceita: TfrmGeTipoReceita
  Left = 390
  Caption = 'Cadastro de Tipos de Receita'
  ClientHeight = 459
  ClientWidth = 741
  OldCreateOrder = True
  ExplicitWidth = 757
  ExplicitHeight = 498
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 455
    Width = 741
    ExplicitTop = 405
    ExplicitWidth = 741
  end
  inherited Bevel3: TBevel
    Top = 416
    Width = 741
    ExplicitTop = 366
    ExplicitWidth = 741
  end
  inherited pgcGuias: TPageControl
    Width = 741
    Height = 416
    ExplicitWidth = 741
    ExplicitHeight = 416
    inherited tbsTabela: TTabSheet
      ExplicitWidth = 733
      ExplicitHeight = 387
      inherited Bevel4: TBevel
        Top = 321
        Width = 733
        ExplicitTop = 271
        ExplicitWidth = 733
      end
      inherited dbgDados: TDBGrid
        Width = 733
        Height = 321
        Columns = <
          item
            Expanded = False
            FieldName = 'COD'
            Title.Caption = 'C'#243'digo '
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPOREC'
            Title.Caption = 'Descri'#231#227'o '
            Width = 280
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO_RESUMIDA'
            Title.Caption = 'Plano de Contas '
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO_PARTICULAR_DESC'
            Title.Alignment = taCenter
            Title.Caption = 'Particular '
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        Top = 325
        Width = 733
        ExplicitTop = 325
        ExplicitWidth = 733
        object lblRegistroDesativado: TLabel [0]
          Left = 2
          Top = 44
          Width = 181
          Height = 13
          Caption = '* Tipos de Receitas desativados'
          Font.Charset = ANSI_CHARSET
          Font.Color = 7303023
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        inherited grpBxFiltro: TGroupBox
          Left = 439
          Width = 290
          ExplicitLeft = 439
          ExplicitWidth = 290
          DesignSize = (
            290
            54)
          inherited lbltFiltrar: TLabel
            Left = 9
            Width = 73
            Caption = 'Tipo Receita:'
            ExplicitLeft = 9
            ExplicitWidth = 73
          end
          inherited edtFiltrar: TEdit
            Left = 88
            Width = 153
            ExplicitLeft = 88
            ExplicitWidth = 153
          end
          inherited btnFiltrar: TcxButton
            Left = 245
            ExplicitLeft = 245
          end
        end
      end
    end
    inherited tbsCadastro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 733
      ExplicitHeight = 387
      inherited Bevel8: TBevel
        Top = 166
        Width = 733
        ExplicitLeft = 16
        ExplicitTop = 292
        ExplicitWidth = 733
      end
      object Bevel5: TBevel [1]
        Left = 0
        Top = 81
        Width = 733
        Height = 4
        Align = alTop
        Shape = bsSpacer
      end
      object Bevel6: TBevel [2]
        Left = 0
        Top = 249
        Width = 733
        Height = 4
        Align = alTop
        Shape = bsSpacer
        ExplicitTop = 318
      end
      inherited GrpBxDadosNominais: TGroupBox
        Width = 733
        Height = 81
        ExplicitWidth = 733
        ExplicitHeight = 81
        object lblDescricao: TLabel [1]
          Left = 88
          Top = 24
          Width = 50
          Height = 13
          Caption = 'Descri'#231#227'o:'
          FocusControl = dbDescricao
        end
        inherited dbCodigo: TDBEdit
          DataField = 'COD'
        end
        object dbDescricao: TDBEdit
          Left = 88
          Top = 40
          Width = 625
          Height = 21
          CharCase = ecUpperCase
          DataField = 'TIPOREC'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
      end
      object GrpBxDadosClassificacao: TGroupBox
        Left = 0
        Top = 85
        Width = 733
        Height = 81
        Align = alTop
        Caption = 'Classifica'#231#227'o Cont'#225'bil'
        TabOrder = 1
        object lblPlanoContas: TLabel
          Left = 223
          Top = 18
          Width = 155
          Height = 13
          Caption = 'Plano de Contas de lan'#231'amento:'
          Enabled = False
          FocusControl = dbPlanoContas
        end
        object lblClassificacao: TLabel
          Left = 16
          Top = 18
          Width = 122
          Height = 13
          Caption = 'Classifica'#231#227'o / Categoria:'
          FocusControl = dbClassificacao
        end
        object dbPlanoContas: TJvDBComboEdit
          Left = 223
          Top = 36
          Width = 490
          Height = 21
          ButtonHint = 'Pesquisar Plano de Contas (Ctrl+P)'#13#10'Limpar Campo (Ctrl+L)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clMoneyGreen
          DataField = 'DESCRICAO_RESUMIDA'
          DataSource = DtSrcTabela
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000000000000000000000000000000000001DE6B51DE6B5
            1DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B5B1AD
            AC203040ACA5A21DE6B5C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FACA5A2C3C3C31DE6B5B0A090
            6048306048306048306048306048306048306048306048306048305048403050
            604078C0304860B1ACA6C3C3C37F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
            7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3B1ACA61DE6B5B0A090
            FFFFFFB0A090B0A090B0A090B0A090B0A090B0A090B0A0909088803050703080
            D04098E050B0F0506870C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C39088807F7F7FC3C3C3C3C3C3C3C3C37F7F7F1DE6B5B0A090
            FFFFFFFFFFFFFFF8FFF0F0F0D0D8D090989070686060686050586040709040A0
            E060C8FF7090A0C5BEB5C3C3C37F7F7FFFFFFFFFFFFFFFF8FFF0F0F0D0D8D07F
            7F7F7F7F7F7F7F7F505860C3C3C3C3C3C3C3C3C37090A0C5BEB51DE6B5B0A090
            FFFFFFFFFFFFFFFFFFE0E0E0909090B0A8A0D0C0B0D0B0A08078705058506090
            B07098B0AEAEAA1DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFE0E0E07F7F7F7F
            7F7FD0C0B0D0B0A0807870505850C3C3C37098B0AEAEAAC3C3C31DE6B5B0A090
            FFFFFFFFFFFFFFFFFFB0B0B0C0B8B0FFF0E0FFE8E0F0D8C0F0D0B08078709D8F
            8CAEAFAA1DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFF
            F0E0FFE8E0F0D8C0F0D0B08078709D8F8CAEAFAAC3C3C3C3C3C31DE6B5C0A890
            FFFFFFFFFFFFFFFFFFA09890F0E8E0FFF8F0FFF0F0FFE8E0F0D8D0D0B0A06367
            5E1DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFF
            F8F0FFF0F0FFE8E0F0D8D0D0B0A063675EC3C3C3C3C3C3C3C3C31DE6B5C0A8A0
            FFFFFFFFFFFFFFFFFFA0A090F0E8E0FFFFFFFFF8F0FFF0F0FFE8E0E0C0B0716E
            6C1DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFF
            FFFFFFF8F0FFF0F0FFE8E0E0C0B0716E6CC3C3C3C3C3C3C3C3C31DE6B5C0B0A0
            FFFFFFFFFFFFFFFFFFC0C8C0C0C0C0FFFFFFFFFFFFFFF8F0FFF0E0B0A090A69C
            951DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFF
            FFFFFFFFFFFFF8F0FFF0E0B0A090A69C95C3C3C3C3C3C3C3C3C31DE6B5D0B0A0
            FFFFFFFFFFFFFFFFFFF0F8FFC0B8B0C0C0C0F0E8E0F0E8E0B0B0A07070601DE6
            B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFF0F8FF7F7F7F7F
            7F7FF0E8E0F0E8E0B0B0A0707060C3C3C3C3C3C3C3C3C3C3C3C31DE6B5D0B8A0
            FFFFFFFFFFFFFFFFFFFFFFFFF0F8FFC0C8C0A0A0909090809090906050401DE6
            B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFF0F8FF7F
            7F7FA0A0907F7F7F909090605040C3C3C3C3C3C3C3C3C3C3C3C31DE6B5D0B8B0
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0A0906048306048306048301DE6
            B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF7F7F7F604830604830604830C3C3C3C3C3C3C3C3C3C3C3C31DE6B5D0C0B0
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A890D0C8C06048301DE6B51DE6
            B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF7F7F7FC3C3C3604830C3C3C3C3C3C3C3C3C3C3C3C3C3C3C31DE6B5E0C0B0
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A8A0604830E0C6B71DE6B51DE6
            B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C31DE6B5E0C0B0
            E0C0B0E0C0B0E0C0B0E0C0B0D0C0B0D0B8B0D0B0A0E0C7B91DE6B51DE6B51DE6
            B51DE6B51DE6B51DE6B5C3C3C37F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
            7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C31DE6B51DE6B5
            1DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6
            B51DE6B51DE6B51DE6B5C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3}
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 1
        end
        object dbClassificacao: TDBLookupComboBox
          Left = 16
          Top = 36
          Width = 201
          Height = 21
          DataField = 'CLASSIFICACAO'
          DataSource = DtSrcTabela
          DropDownRows = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'TPE_CODIGO'
          ListField = 'TPE_DESCRICAO'
          ListSource = DtsClassificacao
          ParentFont = False
          TabOrder = 0
        end
      end
      object GrpBxParametros: TGroupBox
        Left = 0
        Top = 170
        Width = 733
        Height = 79
        Align = alTop
        Caption = 'Par'#226'metros'
        TabOrder = 2
        object dbTipoParticular: TDBCheckBox
          Left = 16
          Top = 26
          Width = 97
          Height = 17
          Caption = 'Tipo Particular'
          DataField = 'TIPO_PARTICULAR'
          DataSource = DtSrcTabela
          TabOrder = 0
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbAtivo: TDBCheckBox
          Left = 16
          Top = 49
          Width = 97
          Height = 17
          Caption = 'Ativo'
          DataField = 'ATIVO'
          DataSource = DtSrcTabela
          TabOrder = 1
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
      object GrpBxPlanoConta: TGroupBox
        Left = 0
        Top = 253
        Width = 733
        Height = 134
        Align = alClient
        Caption = 'Planos de Contas'
        TabOrder = 3
        object PnlPlanoContaBtn: TPanel
          AlignWithMargins = True
          Left = 5
          Top = 18
          Width = 33
          Height = 111
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
          object Bevel7: TBevel
            Left = 0
            Top = 33
            Width = 33
            Height = 4
            Align = alTop
            Shape = bsSpacer
            Visible = False
            ExplicitTop = 366
            ExplicitWidth = 741
          end
          object BtnPlanoAdicionar: TcxButton
            Tag = 1
            Left = 0
            Top = 0
            Width = 33
            Height = 33
            Hint = 'Incluir Plano de Contas'#13#10'(Ctrl + Ins)'
            Align = alTop
            Enabled = False
            OptionsImage.ImageIndex = 6
            OptionsImage.Images = DMRecursos.ImgBotoes16x16
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            OnClick = BtnPlanoAdicionarClick
            ExplicitTop = -2
          end
          object BtnPlanoExcluir: TcxButton
            Tag = 1
            Left = 0
            Top = 37
            Width = 33
            Height = 33
            Hint = 'Excluir Plano de Contas'#13#10'(Ctrl + Delete)'
            Align = alTop
            Enabled = False
            OptionsImage.ImageIndex = 4
            OptionsImage.Images = DMRecursos.ImgBotoes16x16
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            Visible = False
          end
        end
        object dbgPlanoContas: TDBGrid
          AlignWithMargins = True
          Left = 44
          Top = 18
          Width = 684
          Height = 111
          Hint = 
            'Dica:'#13#10#13#10'Pressione a tecla "Espa'#231'o" para marcar o desmarcar o Pl' +
            'ano de Contas'#13#10'selecionado. E atente para o fato de que o plano ' +
            'de contas marcado est'#225#13#10'relacionado a empresa em quest'#227'o.'
          Align = alClient
          BorderStyle = bsNone
          DataSource = dtsPlanoConta
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 1
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = [fsBold]
          OnDrawColumnCell = dbgDadosDrawColumnCell
          OnDblClick = dbgPlanoContasDblClick
          OnKeyDown = dbgPlanoContasKeyDown
          Columns = <
            item
              Expanded = False
              FieldName = 'SELECIONAR'
              Title.Alignment = taCenter
              Title.Caption = 'S'
              Width = 25
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PLANO_CONTA'
              Title.Caption = 'Plano de Contas'
              Width = 370
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EMPRESA_RAZAO'
              Title.Caption = 'Empresa'
              Width = 250
              Visible = True
            end>
        end
      end
    end
  end
  inherited tlbBotoes: TPanel
    Top = 420
    Width = 741
    ExplicitTop = 420
    ExplicitWidth = 741
    inherited bvlTool3: TBevel
      Left = 658
      ExplicitLeft = 658
    end
    inherited bvlTool4: TBevel
      Left = 737
      ExplicitLeft = 737
    end
    inherited btbtnLista: TcxButton
      Visible = True
    end
    inherited btbtnFechar: TcxButton
      Left = 662
      ExplicitLeft = 662
    end
    inherited btbtnSelecionar: TcxButton
      Left = 538
      ExplicitLeft = 538
    end
  end
  inherited IbDtstTabela: TIBDataSet
    SelectSQL.Strings = (
      'Select'
      '    t.Cod'
      '  , t.Tiporec'
      '  , t.classificacao'
      '  , t.Tipo_Particular'
      '  , t.plano_conta'
      '  , t.ativo'
      
        '  , Case when t.Tipo_Particular = 1 then '#39'S'#39' else '#39#39' end Tipo_Pa' +
        'rticular_Desc'
      
        '  , coalesce(nullif(trim(p.codigo_contabil), '#39#39') || '#39' - '#39', '#39#39') |' +
        '| p.descricao_resumida as descricao_resumida'
      'from TBTPRECEITA t'
      
        '  left join TBTPRECEITA_PLANO x on (x.receita = t.cod and x.empr' +
        'esa = :empresa)'
      '  left join TBPLANO_CONTA p on (p.codigo = x.plano)')
  end
  inherited DtSrcTabela: TDataSource
    DataSet = fdQryTabela
  end
  inherited IbUpdTabela: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  COD,'
      '  CLASSIFICACAO,'
      '  TIPOREC,'
      '  TIPO_PARTICULAR,'
      '  PLANO_CONTA,'
      '  ATIVO'
      'from TBTPRECEITA '
      'where'
      '  COD = :COD')
    ModifySQL.Strings = (
      'update TBTPRECEITA'
      'set'
      '  ATIVO = :ATIVO,'
      '  CLASSIFICACAO = :CLASSIFICACAO,'
      '  COD = :COD,'
      '  PLANO_CONTA = :PLANO_CONTA,'
      '  TIPO_PARTICULAR = :TIPO_PARTICULAR,'
      '  TIPOREC = :TIPOREC'
      'where'
      '  COD = :OLD_COD')
    InsertSQL.Strings = (
      'insert into TBTPRECEITA'
      
        '  (ATIVO, CLASSIFICACAO, COD, PLANO_CONTA, TIPO_PARTICULAR, TIPO' +
        'REC)'
      'values'
      
        '  (:ATIVO, :CLASSIFICACAO, :COD, :PLANO_CONTA, :TIPO_PARTICULAR,' +
        ' :TIPOREC)')
    DeleteSQL.Strings = (
      'delete from TBTPRECEITA'
      'where'
      '  COD = :OLD_COD')
  end
  inherited ImgList: TImageList
    Left = 568
    Top = 112
  end
  inherited fdQryTabela: TFDQuery
    BeforePost = fdQryTabelaBeforePost
    AfterScroll = fdQryTabelaAfterScroll
    SQL.Strings = (
      'Select'
      '    t.Cod'
      '  , t.Tiporec'
      '  , t.classificacao'
      '  , t.Tipo_Particular'
      '  , t.plano_conta'
      '  , t.ativo'
      
        '  , Case when t.Tipo_Particular = 1 then '#39'S'#39' else '#39#39' end Tipo_Pa' +
        'rticular_Desc'
      
        '  , coalesce(nullif(trim(p.codigo_contabil), '#39#39') || '#39' - '#39', '#39#39') |' +
        '| p.descricao_resumida as descricao_resumida'
      'from TBTPRECEITA t'
      
        '  left join TBTPRECEITA_PLANO x on (x.receita = t.cod and x.empr' +
        'esa = :empresa)'
      '  left join TBPLANO_CONTA p on (p.codigo = x.plano)')
    ParamData = <
      item
        Name = 'EMPRESA'
        DataType = ftString
        ParamType = ptInput
        Size = 18
        Value = Null
      end>
    object fdQryTabelaCOD: TSmallintField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD'
      Origin = 'COD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object fdQryTabelaTIPOREC: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'TIPOREC'
      Origin = 'TIPOREC'
      Required = True
      Size = 50
    end
    object fdQryTabelaCLASSIFICACAO: TSmallintField
      DisplayLabel = 'Classifica'#231#227'o / Categoria'
      FieldName = 'CLASSIFICACAO'
      Origin = 'CLASSIFICACAO'
      Required = True
    end
    object fdQryTabelaTIPO_PARTICULAR: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'TIPO_PARTICULAR'
      Origin = 'TIPO_PARTICULAR'
      Required = True
    end
    object fdQryTabelaPLANO_CONTA: TIntegerField
      FieldName = 'PLANO_CONTA'
      Origin = 'PLANO_CONTA'
    end
    object fdQryTabelaATIVO: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      Required = True
    end
    object fdQryTabelaTIPO_PARTICULAR_DESC: TStringField
      Alignment = taCenter
      AutoGenerateValue = arDefault
      FieldName = 'TIPO_PARTICULAR_DESC'
      Origin = 'TIPO_PARTICULAR_DESC'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object fdQryTabelaDESCRICAO_RESUMIDA: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Plano de Contas'
      FieldName = 'DESCRICAO_RESUMIDA'
      Origin = 'DESCRICAO_RESUMIDA'
      ProviderFlags = []
      Size = 133
    end
  end
  inherited fdUpdTabela: TFDUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO TBTPRECEITA'
      '(COD, CLASSIFICACAO, TIPOREC, TIPO_PARTICULAR, '
      '  PLANO_CONTA, ATIVO)'
      
        'VALUES (:NEW_COD, :NEW_CLASSIFICACAO, :NEW_TIPOREC, :NEW_TIPO_PA' +
        'RTICULAR, '
      '  :NEW_PLANO_CONTA, :NEW_ATIVO)'
      'RETURNING COD')
    ModifySQL.Strings = (
      'UPDATE TBTPRECEITA'
      
        'SET COD = :NEW_COD, CLASSIFICACAO = :NEW_CLASSIFICACAO, TIPOREC ' +
        '= :NEW_TIPOREC, '
      
        '  TIPO_PARTICULAR = :NEW_TIPO_PARTICULAR, PLANO_CONTA = :NEW_PLA' +
        'NO_CONTA, '
      '  ATIVO = :NEW_ATIVO'
      'WHERE COD = :OLD_COD'
      'RETURNING COD')
    DeleteSQL.Strings = (
      'DELETE FROM TBTPRECEITA'
      'WHERE COD = :OLD_COD')
    FetchRowSQL.Strings = (
      'Select'
      '    t.Cod'
      '  , t.Tiporec'
      '  , t.classificacao'
      '  , t.Tipo_Particular'
      '  , t.plano_conta'
      '  , t.ativo'
      
        '  , Case when t.Tipo_Particular = 1 then '#39'S'#39' else '#39#39' end Tipo_Pa' +
        'rticular_Desc'
      
        '  , coalesce(nullif(trim(p.codigo_contabil), '#39#39') || '#39' - '#39', '#39#39') |' +
        '| p.descricao_resumida as descricao_resumida'
      'from TBTPRECEITA t'
      
        '  left join TBTPRECEITA_PLANO x on (x.receita = t.cod and x.empr' +
        'esa = :empresa)'
      '  left join TBPLANO_CONTA p on (p.codigo = x.plano)'
      'WHERE t.COD = :COD')
  end
  object fdQryClassificacao: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    r.tpe_codigo'
      '  , r.tpe_descricao'
      'from VW_CLASSIFICAO_RECEITA r'
      'order by '
      '    r.tpe_codigo')
    Left = 624
    Top = 224
  end
  object DtsClassificacao: TDataSource
    DataSet = fdQryClassificacao
    Left = 656
    Top = 224
  end
  object fdQryPlanoConta: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    r.receita'
      '  , r.plano'
      '  , r.empresa'
      '  , r.selecionar'
      '  , p.codigo_contabil'
      '  , p.descricao_resumida'
      
        '  , p.codigo_contabil || '#39' - '#39' || p.descricao_resumida as plano_' +
        'conta'
      '  , coalesce(e.rzsoc, '#39'(Todas)'#39') as empresa_razao'
      '  , coalesce(e.nmfant, '#39'(Todas)'#39') as empresa_fantasia'
      'from TBTPRECEITA_PLANO r'
      '  left join TBPLANO_CONTA p on (p.codigo = r.plano)'
      
        '  left join TBEMPRESA e on (e.cnpj = coalesce(r.empresa, p.empre' +
        'sa))'
      ''
      'where r.receita = :receita'
      ''
      'order by'
      '    p.codigo_contabil'
      '  , p.descricao_resumida')
    Left = 232
    Top = 224
    ParamData = <
      item
        Position = 1
        Name = 'RECEITA'
        DataType = ftSmallint
        ParamType = ptInput
      end>
  end
  object dspPlanoConta: TDataSetProvider
    DataSet = fdQryPlanoConta
    Left = 264
    Top = 224
  end
  object cdsPlanoConta: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftSmallint
        Name = 'RECEITA'
        ParamType = ptInput
      end>
    ProviderName = 'dspPlanoConta'
    Left = 296
    Top = 224
    object cdsPlanoContaRECEITA: TSmallintField
      FieldName = 'RECEITA'
      Required = True
    end
    object cdsPlanoContaPLANO: TIntegerField
      FieldName = 'PLANO'
      Required = True
    end
    object cdsPlanoContaEMPRESA: TStringField
      FieldName = 'EMPRESA'
      Size = 18
    end
    object cdsPlanoContaSELECIONAR: TSmallintField
      Alignment = taCenter
      FieldName = 'SELECIONAR'
      Required = True
      OnGetText = cdsPlanoContaSELECIONARGetText
    end
    object cdsPlanoContaCODIGO_CONTABIL: TStringField
      FieldName = 'CODIGO_CONTABIL'
      ProviderFlags = []
      Size = 30
    end
    object cdsPlanoContaDESCRICAO_RESUMIDA: TStringField
      FieldName = 'DESCRICAO_RESUMIDA'
      ProviderFlags = []
      Size = 100
    end
    object cdsPlanoContaPLANO_CONTA: TStringField
      FieldName = 'PLANO_CONTA'
      ProviderFlags = []
      Size = 133
    end
    object cdsPlanoContaEMPRESA_RAZAO: TStringField
      FieldName = 'EMPRESA_RAZAO'
      ProviderFlags = []
      Size = 60
    end
    object cdsPlanoContaEMPRESA_FANTASIA: TStringField
      FieldName = 'EMPRESA_FANTASIA'
      ProviderFlags = []
      Size = 25
    end
  end
  object dtsPlanoConta: TDataSource
    AutoEdit = False
    DataSet = cdsPlanoConta
    Left = 328
    Top = 224
  end
end
