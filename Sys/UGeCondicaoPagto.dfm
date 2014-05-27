inherited frmGeCondicaoPagto: TfrmGeCondicaoPagto
  Left = 408
  Top = 232
  ActiveControl = nil
  Caption = 'Tabela de Condi'#231#245'es de Pagamento'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcGuias: TPageControl
    ActivePage = tbsCadastro
    inherited tbsTabela: TTabSheet
      inherited dbgDados: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'COND_COD'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COND_DESCRICAO_FULL'
            Width = 550
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COND_PRAZO'
            Title.Alignment = taCenter
            Width = 60
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        inherited grpBxFiltro: TGroupBox
          Left = 441
          Width = 282
          inherited lbltFiltrar: TLabel
            Width = 86
            Caption = 'Condi'#231#227'o Pgto.:'
          end
          inherited btnFiltrar: TSpeedButton
            Left = 237
          end
          inherited edtFiltrar: TEdit
            Left = 96
            Width = 137
          end
        end
      end
    end
    inherited tbsCadastro: TTabSheet
      inherited Bevel8: TBevel
        Top = 153
        Width = 727
      end
      inherited GrpBxDadosNominais: TGroupBox
        Width = 727
        Height = 153
        object lblNome: TLabel [1]
          Left = 88
          Top = 24
          Width = 50
          Height = 13
          Caption = 'Descri'#231#227'o:'
          FocusControl = dbNome
        end
        object lblPrazo01: TLabel [2]
          Left = 88
          Top = 64
          Width = 46
          Height = 13
          Caption = 'Prazo 01:'
          FocusControl = dbPrazo01
        end
        object lblPrazo02: TLabel [3]
          Left = 160
          Top = 64
          Width = 46
          Height = 13
          Caption = 'Prazo 02:'
          FocusControl = dbPrazo02
        end
        object lblPrazo03: TLabel [4]
          Left = 232
          Top = 64
          Width = 46
          Height = 13
          Caption = 'Prazo 03:'
          FocusControl = dbPrazo03
        end
        object lblPrazo04: TLabel [5]
          Left = 304
          Top = 64
          Width = 46
          Height = 13
          Caption = 'Prazo 04:'
          FocusControl = dbPrazo04
        end
        object lblPrazo05: TLabel [6]
          Left = 376
          Top = 64
          Width = 46
          Height = 13
          Caption = 'Prazo 05:'
          FocusControl = dbPrazo05
        end
        object lblPrazo06: TLabel [7]
          Left = 448
          Top = 64
          Width = 46
          Height = 13
          Caption = 'Prazo 06:'
          FocusControl = dbPrazo06
        end
        object lblPrazo07: TLabel [8]
          Left = 88
          Top = 104
          Width = 46
          Height = 13
          Caption = 'Prazo 07:'
          FocusControl = dbPrazo07
        end
        object lblPrazo08: TLabel [9]
          Left = 160
          Top = 104
          Width = 46
          Height = 13
          Caption = 'Prazo 08:'
          FocusControl = dbPrazo08
        end
        object lblPrazo09: TLabel [10]
          Left = 232
          Top = 104
          Width = 46
          Height = 13
          Caption = 'Prazo 09:'
          FocusControl = dbPrazo09
        end
        object lblPrazo10: TLabel [11]
          Left = 304
          Top = 104
          Width = 46
          Height = 13
          Caption = 'Prazo 10:'
          FocusControl = dbPrazo10
        end
        object lblPrazo11: TLabel [12]
          Left = 376
          Top = 104
          Width = 46
          Height = 13
          Caption = 'Prazo 11:'
          FocusControl = dbPrazo11
        end
        object lblPrazo12: TLabel [13]
          Left = 448
          Top = 104
          Width = 46
          Height = 13
          Caption = 'Prazo 12:'
          FocusControl = dbPrazo12
        end
        inherited dbCodigo: TDBEdit
          TabStop = False
          Color = clMoneyGreen
          DataField = 'COND_COD'
        end
        object dbNome: TDBEdit
          Left = 88
          Top = 40
          Width = 425
          Height = 21
          CharCase = ecUpperCase
          DataField = 'COND_DESCRICAO'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object dbPrazo: TDBCheckBox
          Left = 520
          Top = 40
          Width = 73
          Height = 17
          Caption = 'A Prazo'
          DataField = 'COND_PRAZO'
          DataSource = DtSrcTabela
          TabOrder = 2
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbPrazo01: TDBEdit
          Left = 88
          Top = 80
          Width = 65
          Height = 21
          CharCase = ecUpperCase
          DataField = 'COND_PRAZO_01'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object dbPrazo02: TDBEdit
          Left = 160
          Top = 80
          Width = 65
          Height = 21
          CharCase = ecUpperCase
          DataField = 'COND_PRAZO_02'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
        object dbPrazo03: TDBEdit
          Left = 232
          Top = 80
          Width = 65
          Height = 21
          CharCase = ecUpperCase
          DataField = 'COND_PRAZO_03'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
        object dbPrazo04: TDBEdit
          Left = 304
          Top = 80
          Width = 65
          Height = 21
          CharCase = ecUpperCase
          DataField = 'COND_PRAZO_04'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
        end
        object dbPrazo05: TDBEdit
          Left = 376
          Top = 80
          Width = 65
          Height = 21
          CharCase = ecUpperCase
          DataField = 'COND_PRAZO_05'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
        end
        object dbPrazo06: TDBEdit
          Left = 448
          Top = 80
          Width = 65
          Height = 21
          CharCase = ecUpperCase
          DataField = 'COND_PRAZO_06'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
        end
        object dbPrazo07: TDBEdit
          Left = 88
          Top = 120
          Width = 65
          Height = 21
          CharCase = ecUpperCase
          DataField = 'COND_PRAZO_07'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
        end
        object dbPrazo08: TDBEdit
          Left = 160
          Top = 120
          Width = 65
          Height = 21
          CharCase = ecUpperCase
          DataField = 'COND_PRAZO_08'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
        end
        object dbPrazo09: TDBEdit
          Left = 232
          Top = 120
          Width = 65
          Height = 21
          CharCase = ecUpperCase
          DataField = 'COND_PRAZO_09'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 11
        end
        object dbPrazo10: TDBEdit
          Left = 304
          Top = 120
          Width = 65
          Height = 21
          CharCase = ecUpperCase
          DataField = 'COND_PRAZO_10'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 12
        end
        object dbPrazo11: TDBEdit
          Left = 376
          Top = 120
          Width = 65
          Height = 21
          CharCase = ecUpperCase
          DataField = 'COND_PRAZO_11'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 13
        end
        object dbPrazo12: TDBEdit
          Left = 448
          Top = 120
          Width = 65
          Height = 21
          CharCase = ecUpperCase
          DataField = 'COND_PRAZO_12'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 14
        end
      end
    end
  end
  inherited IbDtstTabela: TIBDataSet
    BeforePost = IbDtstTabelaBeforePost
    OnNewRecord = IbDtstTabelaNewRecord
    SelectSQL.Strings = (
      'Select'
      '    c.Cond_cod'
      '  , c.Cond_descricao'
      '  , c.Cond_prazo'
      '  , c.Cond_prazo_01'
      '  , c.Cond_prazo_02'
      '  , c.Cond_prazo_03'
      '  , c.Cond_prazo_04'
      '  , c.Cond_prazo_05'
      '  , c.Cond_prazo_06'
      '  , c.Cond_prazo_07'
      '  , c.Cond_prazo_08'
      '  , c.Cond_prazo_09'
      '  , c.Cond_prazo_10'
      '  , c.Cond_prazo_11'
      '  , c.Cond_prazo_12'
      '  , c.Cond_descricao || '#39' ['#39' ||'
      
        '      case when c.Cond_prazo_01 is not Null then c.Cond_prazo_01' +
        ' else '#39#39' end ||'
      
        '      case when c.Cond_prazo_02 is not Null then '#39', '#39' || c.Cond_' +
        'prazo_02 else '#39#39' end ||'
      
        '      case when c.Cond_prazo_03 is not Null then '#39', '#39' || c.Cond_' +
        'prazo_03 else '#39#39' end ||'
      
        '      case when c.Cond_prazo_04 is not Null then '#39', '#39' || c.Cond_' +
        'prazo_04 else '#39#39' end ||'
      
        '      case when c.Cond_prazo_05 is not Null then '#39', '#39' || c.Cond_' +
        'prazo_05 else '#39#39' end ||'
      
        '      case when c.Cond_prazo_06 is not Null then '#39', '#39' || c.Cond_' +
        'prazo_06 else '#39#39' end ||'
      
        '      case when c.Cond_prazo_07 is not Null then '#39', '#39' || c.Cond_' +
        'prazo_07 else '#39#39' end ||'
      
        '      case when c.Cond_prazo_08 is not Null then '#39', '#39' || c.Cond_' +
        'prazo_08 else '#39#39' end ||'
      
        '      case when c.Cond_prazo_09 is not Null then '#39', '#39' || c.Cond_' +
        'prazo_09 else '#39#39' end ||'
      
        '      case when c.Cond_prazo_10 is not Null then '#39', '#39' || c.Cond_' +
        'prazo_10 else '#39#39' end ||'
      
        '      case when c.Cond_prazo_11 is not Null then '#39', '#39' || c.Cond_' +
        'prazo_11 else '#39#39' end ||'
      
        '      case when c.Cond_prazo_12 is not Null then '#39', '#39' || c.Cond_' +
        'prazo_12 else '#39#39' end || '#39']'#39
      '    as Cond_descricao_full'
      'from TBCONDICAOPAGTO c')
    GeneratorField.Field = 'COND_COD'
    GeneratorField.Generator = 'GEN_CONDICAOPAGTO_COD'
    object IbDtstTabelaCOND_COD: TSmallintField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COND_COD'
      Origin = 'TBCONDICAOPAGTO.COND_COD'
      Required = True
    end
    object IbDtstTabelaCOND_DESCRICAO: TIBStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'COND_DESCRICAO'
      Origin = 'TBCONDICAOPAGTO.COND_DESCRICAO'
      Size = 80
    end
    object IbDtstTabelaCOND_PRAZO: TSmallintField
      Alignment = taCenter
      DisplayLabel = 'A Prazo?'
      FieldName = 'COND_PRAZO'
      Origin = 'TBCONDICAOPAGTO.COND_PRAZO'
      Required = True
    end
    object IbDtstTabelaCOND_PRAZO_01: TSmallintField
      DisplayLabel = 'Prazo 1'
      FieldName = 'COND_PRAZO_01'
      Origin = 'TBCONDICAOPAGTO.COND_PRAZO_01'
    end
    object IbDtstTabelaCOND_PRAZO_02: TSmallintField
      DisplayLabel = 'Prazo 2'
      FieldName = 'COND_PRAZO_02'
      Origin = 'TBCONDICAOPAGTO.COND_PRAZO_02'
    end
    object IbDtstTabelaCOND_PRAZO_03: TSmallintField
      DisplayLabel = 'Prazo 3'
      FieldName = 'COND_PRAZO_03'
      Origin = 'TBCONDICAOPAGTO.COND_PRAZO_03'
    end
    object IbDtstTabelaCOND_PRAZO_04: TSmallintField
      DisplayLabel = 'Prazo 4'
      FieldName = 'COND_PRAZO_04'
      Origin = 'TBCONDICAOPAGTO.COND_PRAZO_04'
    end
    object IbDtstTabelaCOND_PRAZO_05: TSmallintField
      DisplayLabel = 'Prazo 5'
      FieldName = 'COND_PRAZO_05'
      Origin = 'TBCONDICAOPAGTO.COND_PRAZO_05'
    end
    object IbDtstTabelaCOND_PRAZO_06: TSmallintField
      DisplayLabel = 'Prazo 6'
      FieldName = 'COND_PRAZO_06'
      Origin = 'TBCONDICAOPAGTO.COND_PRAZO_06'
    end
    object IbDtstTabelaCOND_PRAZO_07: TSmallintField
      DisplayLabel = 'Prazo 7'
      FieldName = 'COND_PRAZO_07'
      Origin = 'TBCONDICAOPAGTO.COND_PRAZO_07'
    end
    object IbDtstTabelaCOND_PRAZO_08: TSmallintField
      DisplayLabel = 'Prazo 8'
      FieldName = 'COND_PRAZO_08'
      Origin = 'TBCONDICAOPAGTO.COND_PRAZO_08'
    end
    object IbDtstTabelaCOND_PRAZO_09: TSmallintField
      DisplayLabel = 'Prazo 9'
      FieldName = 'COND_PRAZO_09'
      Origin = 'TBCONDICAOPAGTO.COND_PRAZO_09'
    end
    object IbDtstTabelaCOND_PRAZO_10: TSmallintField
      DisplayLabel = 'Prazo 10'
      FieldName = 'COND_PRAZO_10'
      Origin = 'TBCONDICAOPAGTO.COND_PRAZO_10'
    end
    object IbDtstTabelaCOND_PRAZO_11: TSmallintField
      DisplayLabel = 'Prazo 11'
      FieldName = 'COND_PRAZO_11'
      Origin = 'TBCONDICAOPAGTO.COND_PRAZO_11'
    end
    object IbDtstTabelaCOND_PRAZO_12: TSmallintField
      DisplayLabel = 'Prazo 12'
      FieldName = 'COND_PRAZO_12'
      Origin = 'TBCONDICAOPAGTO.COND_PRAZO_12'
    end
    object IbDtstTabelaCOND_DESCRICAO_FULL: TIBStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'COND_DESCRICAO_FULL'
      Size = 175
    end
  end
  inherited DtSrcTabela: TDataSource
    OnDataChange = DtSrcTabelaDataChange
  end
  inherited IbUpdTabela: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  COND_COD,'
      '  COND_DESCRICAO,'
      '  COND_PRAZO,'
      '  COND_PRAZO_01,'
      '  COND_PRAZO_02,'
      '  COND_PRAZO_03,'
      '  COND_PRAZO_04,'
      '  COND_PRAZO_05,'
      '  COND_PRAZO_06,'
      '  COND_PRAZO_07,'
      '  COND_PRAZO_08,'
      '  COND_PRAZO_09,'
      '  COND_PRAZO_10,'
      '  COND_PRAZO_11,'
      '  COND_PRAZO_12'
      'from TBCONDICAOPAGTO '
      'where'
      '  COND_COD = :COND_COD')
    ModifySQL.Strings = (
      'update TBCONDICAOPAGTO'
      'set'
      '  COND_COD = :COND_COD,'
      '  COND_DESCRICAO = :COND_DESCRICAO,'
      '  COND_PRAZO = :COND_PRAZO,'
      '  COND_PRAZO_01 = :COND_PRAZO_01,'
      '  COND_PRAZO_02 = :COND_PRAZO_02,'
      '  COND_PRAZO_03 = :COND_PRAZO_03,'
      '  COND_PRAZO_04 = :COND_PRAZO_04,'
      '  COND_PRAZO_05 = :COND_PRAZO_05,'
      '  COND_PRAZO_06 = :COND_PRAZO_06,'
      '  COND_PRAZO_07 = :COND_PRAZO_07,'
      '  COND_PRAZO_08 = :COND_PRAZO_08,'
      '  COND_PRAZO_09 = :COND_PRAZO_09,'
      '  COND_PRAZO_10 = :COND_PRAZO_10,'
      '  COND_PRAZO_11 = :COND_PRAZO_11,'
      '  COND_PRAZO_12 = :COND_PRAZO_12'
      'where'
      '  COND_COD = :OLD_COND_COD')
    InsertSQL.Strings = (
      'insert into TBCONDICAOPAGTO'
      
        '  (COND_COD, COND_DESCRICAO, COND_PRAZO, COND_PRAZO_01, COND_PRA' +
        'ZO_02, '
      
        '   COND_PRAZO_03, COND_PRAZO_04, COND_PRAZO_05, COND_PRAZO_06, C' +
        'OND_PRAZO_07, '
      
        '   COND_PRAZO_08, COND_PRAZO_09, COND_PRAZO_10, COND_PRAZO_11, C' +
        'OND_PRAZO_12)'
      'values'
      
        '  (:COND_COD, :COND_DESCRICAO, :COND_PRAZO, :COND_PRAZO_01, :CON' +
        'D_PRAZO_02, '
      
        '   :COND_PRAZO_03, :COND_PRAZO_04, :COND_PRAZO_05, :COND_PRAZO_0' +
        '6, :COND_PRAZO_07, '
      
        '   :COND_PRAZO_08, :COND_PRAZO_09, :COND_PRAZO_10, :COND_PRAZO_1' +
        '1, :COND_PRAZO_12)')
    DeleteSQL.Strings = (
      'delete from TBCONDICAOPAGTO'
      'where'
      '  COND_COD = :OLD_COND_COD')
  end
end
