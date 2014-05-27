inherited frmGeLogradouro: TfrmGeLogradouro
  Left = 548
  Top = 271
  ActiveControl = dbCodigo
  Caption = 'Tabela de Logradouros'
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
            FieldName = 'LOG_COD'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LOGRADOURO'
            Width = 400
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CID_NOME'
            Width = 200
            Visible = True
          end>
      end
    end
    inherited tbsCadastro: TTabSheet
      inherited Bevel8: TBevel
        Width = 727
      end
      inherited GrpBxDadosNominais: TGroupBox
        Width = 727
        object lblNome: TLabel [1]
          Left = 216
          Top = 24
          Width = 31
          Height = 13
          Caption = 'Nome:'
        end
        object lblTipo: TLabel [2]
          Left = 88
          Top = 24
          Width = 24
          Height = 13
          Caption = 'Tipo:'
        end
        object lblCidade: TLabel [3]
          Left = 16
          Top = 64
          Width = 37
          Height = 13
          Caption = 'Cidade:'
        end
        inherited dbCodigo: TDBEdit
          Color = clMoneyGreen
          DataField = 'LOG_COD'
        end
        object dbNome: TDBEdit
          Left = 216
          Top = 40
          Width = 481
          Height = 21
          CharCase = ecUpperCase
          DataField = 'LOG_NOME'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object dbTipo: TDBLookupComboBox
          Left = 88
          Top = 40
          Width = 121
          Height = 21
          DataField = 'TLG_COD'
          DataSource = DtSrcTabela
          DropDownRows = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'TLG_COD'
          ListField = 'TLG_DESCRICAO'
          ListSource = dtsTipo
          ParentFont = False
          TabOrder = 1
        end
        object dbCidade: TRxDBComboEdit
          Left = 16
          Top = 80
          Width = 273
          Height = 21
          ButtonHint = 'Pesquisar Cidade (Ctrl+P)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clMoneyGreen
          DataField = 'CID_NOME'
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
          TabOrder = 3
          OnButtonClick = dbCidadeButtonClick
        end
      end
    end
  end
  inherited IbDtstTabela: TIBDataSet
    OnNewRecord = IbDtstTabelaNewRecord
    SelectSQL.Strings = (
      'Select'
      '    l.Log_cod'
      '  , l.Log_nome'
      '  , l.Tlg_cod'
      '  , l.Cid_cod'
      
        '  , coalesce(coalesce(t.Tlg_sigla, t.Tlg_descricao) || '#39' '#39', '#39#39') ' +
        '|| l.Log_nome as logradouro'
      '  , c.Cid_nome || '#39' ('#39' || e.Est_sigla || '#39')'#39' as Cid_nome'
      'from TBLOGRADOURO l'
      '  inner join TBTIPO_LOGRADOURO t on (t.Tlg_cod = l.Tlg_cod)'
      '  inner join TBCIDADE c on (c.Cid_cod = l.Cid_cod)'
      '  inner join TBESTADO e on (e.Est_cod = c.Est_cod)')
    GeneratorField.Field = 'LOG_COD'
    GeneratorField.Generator = 'GEN_LOGRADOURO_ID'
    object IbDtstTabelaLOG_COD: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'LOG_COD'
      Origin = 'TBLOGRADOURO.LOG_COD'
    end
    object IbDtstTabelaLOG_NOME: TIBStringField
      DisplayLabel = 'Nome'
      FieldName = 'LOG_NOME'
      Origin = 'TBLOGRADOURO.LOG_NOME'
      Size = 250
    end
    object IbDtstTabelaTLG_COD: TSmallintField
      DisplayLabel = 'Tipo'
      FieldName = 'TLG_COD'
      Origin = 'TBLOGRADOURO.TLG_COD'
      Required = True
    end
    object IbDtstTabelaCID_COD: TIntegerField
      DisplayLabel = 'Cidade'
      FieldName = 'CID_COD'
      Origin = 'TBLOGRADOURO.CID_COD'
      Required = True
    end
    object IbDtstTabelaLOGRADOURO: TIBStringField
      DisplayLabel = 'Nome'
      FieldName = 'LOGRADOURO'
      Required = True
      Size = 300
    end
    object IbDtstTabelaCID_NOME: TIBStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CID_NOME'
      Size = 105
    end
  end
  inherited IbUpdTabela: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  LOG_COD,'
      '  LOG_NOME,'
      '  TLG_COD,'
      '  CID_COD'
      'from TBLOGRADOURO '
      'where'
      '  LOG_COD = :LOG_COD')
    ModifySQL.Strings = (
      'update TBLOGRADOURO'
      'set'
      '  LOG_COD = :LOG_COD,'
      '  LOG_NOME = :LOG_NOME,'
      '  TLG_COD = :TLG_COD,'
      '  CID_COD = :CID_COD'
      'where'
      '  LOG_COD = :OLD_LOG_COD')
    InsertSQL.Strings = (
      'insert into TBLOGRADOURO'
      '  (LOG_COD, LOG_NOME, TLG_COD, CID_COD)'
      'values'
      '  (:LOG_COD, :LOG_NOME, :TLG_COD, :CID_COD)')
    DeleteSQL.Strings = (
      'delete from TBLOGRADOURO'
      'where'
      '  LOG_COD = :OLD_LOG_COD')
  end
  object dtsTipo: TDataSource
    DataSet = tblTipo
    Left = 688
    Top = 104
  end
  object tblTipo: TIBTable
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    TableName = 'TBTIPO_LOGRADOURO'
    Left = 656
    Top = 104
  end
end
