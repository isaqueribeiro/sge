inherited frmGeCondicaoPagto: TfrmGeCondicaoPagto
  Left = 419
  Top = 247
  ActiveControl = nil
  Caption = 'Tabela de Condi'#231#245'es de Pagamento'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcGuias: TPageControl
    inherited tbsTabela: TTabSheet
      inherited dbgDados: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'COND_COD'
            Title.Caption = 'C'#243'digo '
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COND_DESCRICAO_FULL'
            Title.Caption = 'Descri'#231#227'o '
            Width = 550
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'APrazo'
            Title.Alignment = taCenter
            Title.Caption = 'A Prazo? '
            Width = 60
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        object lblRegistroDesativado: TLabel [0]
          Left = 2
          Top = 44
          Width = 212
          Height = 13
          Caption = '* Condi'#231#227'o de Pagamento desativada'
          Font.Charset = ANSI_CHARSET
          Font.Color = 7303023
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        inherited grpBxFiltro: TGroupBox
          Left = 441
          Width = 282
          ExplicitLeft = 441
          ExplicitWidth = 282
          inherited lbltFiltrar: TLabel
            Width = 86
            Caption = 'Condi'#231#227'o Pgto.:'
            ExplicitWidth = 86
          end
          inherited edtFiltrar: TEdit
            Left = 96
            Width = 137
            ExplicitLeft = 96
            ExplicitWidth = 137
          end
          inherited btnFiltrar: TcxButton
            Left = 237
            ExplicitLeft = 237
          end
        end
      end
    end
    inherited tbsCadastro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 727
      ExplicitHeight = 329
      inherited Bevel8: TBevel
        Top = 185
        ExplicitTop = 185
      end
      inherited GrpBxDadosNominais: TGroupBox
        Height = 185
        ExplicitHeight = 185
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
        object dbCondicaoPagtoPDV: TDBCheckBox
          Left = 88
          Top = 152
          Width = 225
          Height = 17
          Caption = 'Usar Condi'#231#227'o de Pagamento no PDV'
          DataField = 'COND_PDV'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 15
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbAtiva: TDBCheckBox
          Left = 448
          Top = 152
          Width = 81
          Height = 17
          Caption = 'Ativa'
          DataField = 'ATIVA'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 16
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
      object dbgFormaPagto: TDBGrid
        Left = 0
        Top = 189
        Width = 727
        Height = 140
        Hint = 
          'Dica:'#13#10#13#10'Pressione a tecla "Espa'#231'o" para marcar o desmarcar a Fo' +
          'rma de Pagamento'#13#10'selecionada. E atente para o fato de que a for' +
          'ma de pagamento marcada est'#225#13#10'relacionada a condi'#231#227'o de pagament' +
          'o em quest'#227'o.'
        Align = alClient
        DataSource = dtsFormaPagtoLista
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
        OnDblClick = dbgFormaPagtoDblClick
        OnKeyDown = dbgFormaPagtoKeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'SELECIONAR'
            Title.Alignment = taCenter
            Title.Caption = 'S'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGO'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'digo'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Width = 400
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'USAR_PDV'
            Title.Alignment = taCenter
            Title.Caption = 'PDV'
            Width = 30
            Visible = True
          end>
      end
    end
  end
  inherited IbDtstTabela: TIBDataSet
    SelectSQL.Strings = (
      'Select'
      '    c.Cond_cod'
      '  , c.Cond_descricao'
      '  , c.Cond_prazo'
      '  , c.Cond_pdv'
      '  , c.Cond_qtde_parcelas'
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
      '  , c.Ativa'
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
    Top = 72
  end
  inherited DtSrcTabela: TDataSource
    DataSet = fdQryTabela
    OnDataChange = DtSrcTabelaDataChange
    Top = 136
  end
  inherited IbUpdTabela: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  COND_COD,'
      '  COND_DESCRICAO,'
      '  COND_PRAZO,'
      '  COND_PDV,'
      '  COND_QTDE_PARCELAS,'
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
      '  COND_PRAZO_12,'
      '  ATIVA'
      'from TBCONDICAOPAGTO '
      'where'
      '  COND_COD = :COND_COD')
    ModifySQL.Strings = (
      'update TBCONDICAOPAGTO'
      'set'
      '  ATIVA = :ATIVA,'
      '  COND_COD = :COND_COD,'
      '  COND_DESCRICAO = :COND_DESCRICAO,'
      '  COND_PDV = :COND_PDV,'
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
      '  COND_PRAZO_12 = :COND_PRAZO_12,'
      '  COND_QTDE_PARCELAS = :COND_QTDE_PARCELAS'
      'where'
      '  COND_COD = :OLD_COND_COD')
    InsertSQL.Strings = (
      'insert into TBCONDICAOPAGTO'
      
        '  (ATIVA, COND_COD, COND_DESCRICAO, COND_PDV, COND_PRAZO, COND_P' +
        'RAZO_01, '
      
        '   COND_PRAZO_02, COND_PRAZO_03, COND_PRAZO_04, COND_PRAZO_05, C' +
        'OND_PRAZO_06, '
      
        '   COND_PRAZO_07, COND_PRAZO_08, COND_PRAZO_09, COND_PRAZO_10, C' +
        'OND_PRAZO_11, '
      '   COND_PRAZO_12, COND_QTDE_PARCELAS)'
      'values'
      
        '  (:ATIVA, :COND_COD, :COND_DESCRICAO, :COND_PDV, :COND_PRAZO, :' +
        'COND_PRAZO_01, '
      
        '   :COND_PRAZO_02, :COND_PRAZO_03, :COND_PRAZO_04, :COND_PRAZO_0' +
        '5, :COND_PRAZO_06, '
      
        '   :COND_PRAZO_07, :COND_PRAZO_08, :COND_PRAZO_09, :COND_PRAZO_1' +
        '0, :COND_PRAZO_11, '
      '   :COND_PRAZO_12, :COND_QTDE_PARCELAS)')
    DeleteSQL.Strings = (
      'delete from TBCONDICAOPAGTO'
      'where'
      '  COND_COD = :OLD_COND_COD')
    Top = 72
  end
  inherited ImgList: TImageList
    Left = 576
    Top = 192
  end
  inherited fdQryTabela: TFDQuery
    BeforePost = fdQryTabelaBeforePost
    AfterScroll = fdQryTabelaAfterScroll
    OnCalcFields = fdQryTabelaCalcFields
    UpdateOptions.AssignedValues = [uvFetchGeneratorsPoint, uvGeneratorName]
    UpdateOptions.FetchGeneratorsPoint = gpImmediate
    UpdateOptions.GeneratorName = 'GEN_CONDICAOPAGTO_COD'
    UpdateOptions.KeyFields = 'COND_COD'
    UpdateOptions.AutoIncFields = 'COND_COD'
    SQL.Strings = (
      'Select'
      '    c.Cond_cod'
      '  , c.Cond_descricao'
      '  , c.Cond_prazo'
      '  , c.Cond_pdv'
      '  , c.Cond_qtde_parcelas'
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
      '  , c.Ativa'
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
    Top = 104
    object fdQryTabelaCOND_COD: TSmallintField
      AutoGenerateValue = arAutoInc
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COND_COD'
      Origin = 'COND_COD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object fdQryTabelaCOND_DESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'COND_DESCRICAO'
      Origin = 'COND_DESCRICAO'
      Required = True
      Size = 80
    end
    object fdQryTabelaCOND_PRAZO: TSmallintField
      Alignment = taCenter
      DisplayLabel = 'A Prazo?'
      FieldName = 'COND_PRAZO'
      Origin = 'COND_PRAZO'
      Required = True
    end
    object fdQryTabelaCOND_PDV: TSmallintField
      FieldName = 'COND_PDV'
      Origin = 'COND_PDV'
      Required = True
    end
    object fdQryTabelaCOND_QTDE_PARCELAS: TSmallintField
      FieldName = 'COND_QTDE_PARCELAS'
      Origin = 'COND_QTDE_PARCELAS'
    end
    object fdQryTabelaCOND_PRAZO_01: TSmallintField
      DisplayLabel = 'Prazo 1'
      FieldName = 'COND_PRAZO_01'
      Origin = 'COND_PRAZO_01'
    end
    object fdQryTabelaCOND_PRAZO_02: TSmallintField
      DisplayLabel = 'Prazo 2'
      FieldName = 'COND_PRAZO_02'
      Origin = 'COND_PRAZO_02'
    end
    object fdQryTabelaCOND_PRAZO_03: TSmallintField
      DisplayLabel = 'Prazo 3'
      FieldName = 'COND_PRAZO_03'
      Origin = 'COND_PRAZO_03'
    end
    object fdQryTabelaCOND_PRAZO_04: TSmallintField
      DisplayLabel = 'Prazo 4'
      FieldName = 'COND_PRAZO_04'
      Origin = 'COND_PRAZO_04'
    end
    object fdQryTabelaCOND_PRAZO_05: TSmallintField
      DisplayLabel = 'Prazo5'
      FieldName = 'COND_PRAZO_05'
      Origin = 'COND_PRAZO_05'
    end
    object fdQryTabelaCOND_PRAZO_06: TSmallintField
      DisplayLabel = 'Prazo 6'
      FieldName = 'COND_PRAZO_06'
      Origin = 'COND_PRAZO_06'
    end
    object fdQryTabelaCOND_PRAZO_07: TSmallintField
      DisplayLabel = 'Prazo 7'
      FieldName = 'COND_PRAZO_07'
      Origin = 'COND_PRAZO_07'
    end
    object fdQryTabelaCOND_PRAZO_08: TSmallintField
      DisplayLabel = 'Prazo 8'
      FieldName = 'COND_PRAZO_08'
      Origin = 'COND_PRAZO_08'
    end
    object fdQryTabelaCOND_PRAZO_09: TSmallintField
      DisplayLabel = 'Prazo 9'
      FieldName = 'COND_PRAZO_09'
      Origin = 'COND_PRAZO_09'
    end
    object fdQryTabelaCOND_PRAZO_10: TSmallintField
      DisplayLabel = 'Prazo 10'
      FieldName = 'COND_PRAZO_10'
      Origin = 'COND_PRAZO_10'
    end
    object fdQryTabelaCOND_PRAZO_11: TSmallintField
      DisplayLabel = 'Prazo 11'
      FieldName = 'COND_PRAZO_11'
      Origin = 'COND_PRAZO_11'
    end
    object fdQryTabelaCOND_PRAZO_12: TSmallintField
      DisplayLabel = 'Prazo 12'
      FieldName = 'COND_PRAZO_12'
      Origin = 'COND_PRAZO_12'
    end
    object fdQryTabelaATIVA: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'ATIVA'
      Origin = 'ATIVA'
      Required = True
    end
    object fdQryTabelaCOND_DESCRICAO_FULL: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'COND_DESCRICAO_FULL'
      Origin = 'COND_DESCRICAO_FULL'
      ProviderFlags = []
      Size = 177
    end
    object fdQryTabelaAPrazo: TStringField
      Alignment = taCenter
      DisplayWidth = 1
      FieldKind = fkInternalCalc
      FieldName = 'APrazo'
      Size = 1
    end
  end
  inherited fdUpdTabela: TFDUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO TBCONDICAOPAGTO'
      '(COND_COD, COND_DESCRICAO, COND_PRAZO, COND_PDV, '
      '  COND_QTDE_PARCELAS, COND_PRAZO_01, COND_PRAZO_02, '
      '  COND_PRAZO_03, COND_PRAZO_04, COND_PRAZO_05, '
      '  COND_PRAZO_06, COND_PRAZO_07, COND_PRAZO_08, '
      '  COND_PRAZO_09, COND_PRAZO_10, COND_PRAZO_11, '
      '  COND_PRAZO_12, ATIVA)'
      
        'VALUES (:NEW_COND_COD, :NEW_COND_DESCRICAO, :NEW_COND_PRAZO, :NE' +
        'W_COND_PDV, '
      
        '  :NEW_COND_QTDE_PARCELAS, :NEW_COND_PRAZO_01, :NEW_COND_PRAZO_0' +
        '2, '
      '  :NEW_COND_PRAZO_03, :NEW_COND_PRAZO_04, :NEW_COND_PRAZO_05, '
      '  :NEW_COND_PRAZO_06, :NEW_COND_PRAZO_07, :NEW_COND_PRAZO_08, '
      '  :NEW_COND_PRAZO_09, :NEW_COND_PRAZO_10, :NEW_COND_PRAZO_11, '
      '  :NEW_COND_PRAZO_12, :NEW_ATIVA)'
      'RETURNING COND_QTDE_PARCELAS')
    ModifySQL.Strings = (
      'UPDATE TBCONDICAOPAGTO'
      
        'SET COND_COD = :NEW_COND_COD, COND_DESCRICAO = :NEW_COND_DESCRIC' +
        'AO, '
      '  COND_PRAZO = :NEW_COND_PRAZO, COND_PDV = :NEW_COND_PDV, '
      
        '  COND_QTDE_PARCELAS = :NEW_COND_QTDE_PARCELAS, COND_PRAZO_01 = ' +
        ':NEW_COND_PRAZO_01, '
      
        '  COND_PRAZO_02 = :NEW_COND_PRAZO_02, COND_PRAZO_03 = :NEW_COND_' +
        'PRAZO_03, '
      
        '  COND_PRAZO_04 = :NEW_COND_PRAZO_04, COND_PRAZO_05 = :NEW_COND_' +
        'PRAZO_05, '
      
        '  COND_PRAZO_06 = :NEW_COND_PRAZO_06, COND_PRAZO_07 = :NEW_COND_' +
        'PRAZO_07, '
      
        '  COND_PRAZO_08 = :NEW_COND_PRAZO_08, COND_PRAZO_09 = :NEW_COND_' +
        'PRAZO_09, '
      
        '  COND_PRAZO_10 = :NEW_COND_PRAZO_10, COND_PRAZO_11 = :NEW_COND_' +
        'PRAZO_11, '
      '  COND_PRAZO_12 = :NEW_COND_PRAZO_12, ATIVA = :NEW_ATIVA'
      'WHERE COND_COD = :OLD_COND_COD'
      'RETURNING COND_QTDE_PARCELAS')
    DeleteSQL.Strings = (
      'DELETE FROM TBCONDICAOPAGTO'
      'WHERE COND_COD = :OLD_COND_COD')
    FetchRowSQL.Strings = (
      
        'SELECT COND_COD, COND_DESCRICAO, COND_PRAZO, COND_PDV, COND_QTDE' +
        '_PARCELAS, '
      '  COND_PRAZO_01, COND_PRAZO_02, COND_PRAZO_03, COND_PRAZO_04, '
      '  COND_PRAZO_05, COND_PRAZO_06, COND_PRAZO_07, COND_PRAZO_08, '
      '  COND_PRAZO_09, COND_PRAZO_10, COND_PRAZO_11, COND_PRAZO_12, '
      '  ATIVA'
      'FROM TBCONDICAOPAGTO'
      'WHERE COND_COD = :COND_COD')
    Top = 104
  end
  object dspFormaPagtoLista: TDataSetProvider
    DataSet = qryFormaPagtoLista
    Left = 176
    Top = 280
  end
  object cdsFormaPagtoLista: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftSmallint
        Name = 'CONDICAO_PAGTO'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspFormaPagtoLista'
    Left = 208
    Top = 280
    object cdsFormaPagtoListaSELECIONAR: TIntegerField
      Alignment = taCenter
      FieldName = 'SELECIONAR'
      OnGetText = cdsFormaPagtoListaSELECIONARGetText
    end
    object cdsFormaPagtoListaCODIGO: TSmallintField
      Alignment = taCenter
      FieldName = 'CODIGO'
      Required = True
      DisplayFormat = '00'
    end
    object cdsFormaPagtoListaDESCRICAO: TStringField
      DisplayLabel = 'Forma de Pagamento'
      FieldName = 'DESCRICAO'
      Size = 30
    end
    object cdsFormaPagtoListaUSAR_PDV: TStringField
      Alignment = taCenter
      FieldName = 'USAR_PDV'
      FixedChar = True
      Size = 1
    end
  end
  object dtsFormaPagtoLista: TDataSource
    DataSet = cdsFormaPagtoLista
    Left = 240
    Top = 280
  end
  object qryFormaPagtoLista: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      
        '    Case when c.condicao_pagto is null then 0 else 1 end as sele' +
        'cionar'
      '  , f.cod    as codigo'
      '  , f.descri as descricao'
      
        '  , Case when f.formapagto_pdv = 1 then '#39'X'#39' else '#39'.'#39' end usar_pd' +
        'v'
      'from TBFORMPAGTO f'
      
        '  left join TBFORMPAGTO_CONDICAO c on (c.forma_pagto = f.cod and' +
        ' c.condicao_pagto = :condicao_pagto)'
      ''
      'order by'
      '    f.cod')
    Left = 144
    Top = 280
    ParamData = <
      item
        Position = 1
        Name = 'CONDICAO_PAGTO'
        DataType = ftSmallint
        ParamType = ptInput
        Value = 0
      end>
    object qryFormaPagtoListaSELECIONAR: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'SELECIONAR'
      Origin = 'SELECIONAR'
      ProviderFlags = []
    end
    object qryFormaPagtoListaCODIGO: TSmallintField
      FieldName = 'CODIGO'
      Origin = 'COD'
      Required = True
    end
    object qryFormaPagtoListaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRI'
      Size = 30
    end
    object qryFormaPagtoListaUSAR_PDV: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'USAR_PDV'
      Origin = 'USAR_PDV'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
  end
end
