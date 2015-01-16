inherited frmGeTipoDespesa: TfrmGeTipoDespesa
  Left = 385
  Top = 217
  Width = 757
  Height = 447
  ActiveControl = dbCodigo
  Caption = 'Cadastro de Tipos de Despesas'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 405
    Width = 741
  end
  inherited Bevel3: TBevel
    Top = 366
    Width = 741
  end
  inherited tlbBotoes: TToolBar
    Top = 370
    Width = 741
  end
  inherited pgcGuias: TPageControl
    Width = 741
    Height = 366
    ActivePage = tbsCadastro
    inherited tbsTabela: TTabSheet
      inherited Bevel4: TBevel
        Top = 271
        Width = 733
      end
      inherited dbgDados: TDBGrid
        Width = 733
        Height = 271
        Columns = <
          item
            Expanded = False
            FieldName = 'COD'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPODESP'
            Width = 350
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO_PARTICULAR_DESC'
            Title.Alignment = taCenter
            Title.Caption = 'Particular'
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        Top = 275
        Width = 733
        inherited grpBxFiltro: TGroupBox
          Left = 439
          Width = 290
          inherited lbltFiltrar: TLabel
            Width = 78
            Caption = 'Tipo Despesa:'
          end
          inherited btnFiltrar: TSpeedButton
            Left = 245
          end
          inherited edtFiltrar: TEdit
            Left = 88
            Width = 153
          end
        end
      end
    end
    inherited tbsCadastro: TTabSheet
      inherited Bevel8: TBevel
        Top = 81
        Width = 733
      end
      inherited GrpBxDadosNominais: TGroupBox
        Width = 733
        Height = 81
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
          Width = 337
          Height = 21
          CharCase = ecUpperCase
          DataField = 'TIPODESP'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object dbTipoParticular: TDBCheckBox
          Left = 432
          Top = 40
          Width = 97
          Height = 17
          Caption = 'Tipo Particular'
          DataField = 'TIPO_PARTICULAR'
          DataSource = DtSrcTabela
          TabOrder = 2
          ValueChecked = '1'
          ValueUnchecked = '0'
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
          Left = 16
          Top = 20
          Width = 155
          Height = 13
          Caption = 'Plano de Contas de lan'#231'amento:'
          FocusControl = dbPlanoContas
        end
        object dbPlanoContas: TRxDBComboEdit
          Left = 16
          Top = 36
          Width = 697
          Height = 21
          ButtonHint = 'Pesquisar Plano de Contas (Ctrl+P)'#13#10'Limpar Campo (Ctrl+L)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clMoneyGreen
          DataField = 'DESCRICAO_RESUMIDA'
          DataSource = DtSrcTabela
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
          TabOrder = 0
          OnButtonClick = dbPlanoContasButtonClick
        end
      end
    end
  end
  inherited IbDtstTabela: TIBDataSet
    BeforePost = IbDtstTabelaBeforePost
    OnNewRecord = IbDtstTabelaNewRecord
    SelectSQL.Strings = (
      'Select'
      '    t.Cod'
      '  , t.Tipodesp'
      '  , t.Tipo_Particular'
      '  , t.plano_conta'
      
        '  , Case when t.Tipo_Particular = 1 then '#39'S'#39' else '#39#39' end Tipo_Pa' +
        'rticular_Desc'
      
        '  , coalesce(nullif(trim(p.codigo_contabil), '#39#39') || '#39' - '#39', '#39#39') |' +
        '| p.descricao_resumida as descricao_resumida'
      'from TBTPDESPESA t'
      '  left join TBPLANO_CONTA p on (p.codigo = t.plano_conta)')
    object IbDtstTabelaCOD: TSmallintField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD'
      Origin = '"TBTPDESPESA"."COD"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IbDtstTabelaTIPODESP: TIBStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'TIPODESP'
      Origin = '"TBTPDESPESA"."TIPODESP"'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 50
    end
    object IbDtstTabelaTIPO_PARTICULAR: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'TIPO_PARTICULAR'
      Origin = '"TBTPDESPESA"."TIPO_PARTICULAR"'
    end
    object IbDtstTabelaPLANO_CONTA: TIntegerField
      FieldName = 'PLANO_CONTA'
      Origin = '"TBTPDESPESA"."PLANO_CONTA"'
      ProviderFlags = [pfInUpdate]
    end
    object IbDtstTabelaTIPO_PARTICULAR_DESC: TIBStringField
      Alignment = taCenter
      FieldName = 'TIPO_PARTICULAR_DESC'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object IbDtstTabelaDESCRICAO_RESUMIDA: TIBStringField
      FieldName = 'DESCRICAO_RESUMIDA'
      Origin = '"TBPLANO_CONTA"."DESCRICAO_RESUMIDA"'
      ProviderFlags = []
      Size = 100
    end
  end
  inherited IbUpdTabela: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  COD,'
      '  TIPODESP,'
      '  TIPO_PARTICULAR,'
      '  PLANO_CONTA'
      'from TBTPDESPESA '
      'where'
      '  COD = :COD')
    ModifySQL.Strings = (
      'update TBTPDESPESA'
      'set'
      '  COD = :COD,'
      '  PLANO_CONTA = :PLANO_CONTA,'
      '  TIPO_PARTICULAR = :TIPO_PARTICULAR,'
      '  TIPODESP = :TIPODESP'
      'where'
      '  COD = :OLD_COD')
    InsertSQL.Strings = (
      'insert into TBTPDESPESA'
      '  (COD, PLANO_CONTA, TIPO_PARTICULAR, TIPODESP)'
      'values'
      '  (:COD, :PLANO_CONTA, :TIPO_PARTICULAR, :TIPODESP)')
    DeleteSQL.Strings = (
      'delete from TBTPDESPESA'
      'where'
      '  COD = :OLD_COD')
  end
end
