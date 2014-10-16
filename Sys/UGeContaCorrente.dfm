inherited frmGeContaCorrente: TfrmGeContaCorrente
  Left = 538
  Top = 151
  Width = 759
  Height = 478
  ActiveControl = dbCodigo
  Caption = 'Controle de Conta Corrente'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 436
    Width = 743
  end
  inherited Bevel3: TBevel
    Top = 397
    Width = 743
  end
  inherited tlbBotoes: TToolBar
    Top = 401
    Width = 743
  end
  inherited pgcGuias: TPageControl
    Width = 743
    Height = 397
    ActivePage = tbsCadastro
    inherited tbsTabela: TTabSheet
      inherited Bevel4: TBevel
        Top = 302
        Width = 735
      end
      inherited dbgDados: TDBGrid
        Width = 735
        Height = 302
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Width = 240
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO_DESC'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BANCO'
            Width = 300
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        Top = 306
        Width = 735
        inherited grpBxFiltro: TGroupBox
          Left = 409
          Width = 322
          DesignSize = (
            322
            54)
          inherited lbltFiltrar: TLabel
            Left = 14
            Width = 89
            Caption = 'Conta Corrente:'
          end
          inherited btnFiltrar: TSpeedButton
            Left = 277
          end
          inherited edtFiltrar: TEdit
            Left = 112
            Width = 161
          end
        end
      end
    end
    inherited tbsCadastro: TTabSheet
      inherited Bevel8: TBevel
        Top = 161
        Width = 735
      end
      inherited GrpBxDadosNominais: TGroupBox
        Width = 735
        Height = 161
        object lblNome: TLabel [1]
          Left = 88
          Top = 24
          Width = 50
          Height = 13
          Caption = 'Descri'#231#227'o:'
        end
        object lblBanco: TLabel [2]
          Left = 16
          Top = 64
          Width = 33
          Height = 13
          Caption = 'Banco:'
          FocusControl = dbBanco
        end
        object lblEmpresa: TLabel [3]
          Left = 16
          Top = 104
          Width = 45
          Height = 13
          Caption = 'Empresa:'
          FocusControl = dbEmpresa
        end
        inherited dbCodigo: TDBEdit
          Color = clMoneyGreen
          DataField = 'CODIGO'
        end
        object dbNome: TDBEdit
          Left = 88
          Top = 40
          Width = 417
          Height = 21
          CharCase = ecUpperCase
          DataField = 'DESCRICAO'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object dbBanco: TRxDBComboEdit
          Left = 16
          Top = 80
          Width = 705
          Height = 21
          ButtonHint = 'Pesquisar Banco (Ctrl+P)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clMoneyGreen
          DataField = 'BANCO'
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
          OnButtonClick = dbBancoButtonClick
        end
        object dbTipo: TDBRadioGroup
          Left = 512
          Top = 16
          Width = 209
          Height = 44
          Caption = 'Tipo'
          Columns = 2
          DataField = 'TIPO'
          DataSource = DtSrcTabela
          Items.Strings = (
            'Caixa'
            'Banco')
          TabOrder = 2
          Values.Strings = (
            '1'
            '2')
        end
        object dbEmpresa: TDBLookupComboBox
          Left = 16
          Top = 120
          Width = 705
          Height = 21
          DataField = 'EMPRESA'
          DataSource = DtSrcTabela
          DropDownRows = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'CNPJ'
          ListField = 'RZSOC'
          ListSource = dtsEmpresa
          ParentFont = False
          TabOrder = 4
        end
      end
    end
  end
  inherited IbDtstTabela: TIBDataSet
    OnNewRecord = IbDtstTabelaNewRecord
    SelectSQL.Strings = (
      'Select'
      '    cc.Codigo'
      '  , cc.Descricao'
      '  , cc.Tipo'
      '  , cc.Empresa'
      '  , cc.Conta_banco_boleto'
      
        '  , Case when cc.Tipo = 1 then '#39'Caixa'#39' when cc.Tipo = 2 then '#39'Ba' +
        'nco'#39' else '#39#39' end Tipo_Desc'
      
        '  , cb.Bco_nome || '#39' AG.: '#39' || cb.Bco_agencia || '#39' C/C.: '#39' || cb' +
        '.Bco_cc as Banco'
      'from TBCONTA_CORRENTE cc'
      
        '  left join TBBANCO_BOLETO cb on (cb.Bco_cod = cc.Conta_banco_bo' +
        'leto)')
    Left = 600
    object IbDtstTabelaCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Origin = 'TBCONTA_CORRENTE.CODIGO'
      Required = True
    end
    object IbDtstTabelaDESCRICAO: TIBStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Origin = 'TBCONTA_CORRENTE.DESCRICAO'
      Required = True
      Size = 50
    end
    object IbDtstTabelaTIPO: TSmallintField
      Alignment = taLeftJustify
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Origin = 'TBCONTA_CORRENTE.TIPO'
      Required = True
    end
    object IbDtstTabelaCONTA_BANCO_BOLETO: TSmallintField
      DisplayLabel = 'Banco'
      FieldName = 'CONTA_BANCO_BOLETO'
      Origin = 'TBCONTA_CORRENTE.CONTA_BANCO_BOLETO'
    end
    object IbDtstTabelaEMPRESA: TIBStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      Origin = '"TBCONTA_CORRENTE"."EMPRESA"'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 18
    end
    object IbDtstTabelaTIPO_DESC: TIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_DESC'
      ProviderFlags = []
      FixedChar = True
      Size = 5
    end
    object IbDtstTabelaBANCO: TIBStringField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
      ProviderFlags = []
      Size = 83
    end
  end
  inherited DtSrcTabela: TDataSource
    OnDataChange = DtSrcTabelaDataChange
    Left = 664
  end
  inherited IbUpdTabela: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO,'
      '  EMPRESA,'
      '  DESCRICAO,'
      '  TIPO,'
      '  CONTA_BANCO_BOLETO'
      'from TBCONTA_CORRENTE '
      'where'
      '  CODIGO = :CODIGO')
    ModifySQL.Strings = (
      'update TBCONTA_CORRENTE'
      'set'
      '  CODIGO = :CODIGO,'
      '  CONTA_BANCO_BOLETO = :CONTA_BANCO_BOLETO,'
      '  DESCRICAO = :DESCRICAO,'
      '  EMPRESA = :EMPRESA,'
      '  TIPO = :TIPO'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into TBCONTA_CORRENTE'
      '  (CODIGO, CONTA_BANCO_BOLETO, DESCRICAO, EMPRESA, TIPO)'
      'values'
      '  (:CODIGO, :CONTA_BANCO_BOLETO, :DESCRICAO, :EMPRESA, :TIPO)')
    DeleteSQL.Strings = (
      'delete from TBCONTA_CORRENTE'
      'where'
      '  CODIGO = :OLD_CODIGO')
    Left = 632
  end
  inherited ImgList: TImageList
    Left = 568
  end
  object tblEmpresa: TIBTable
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    TableName = 'TBEMPRESA'
    Left = 344
    Top = 264
  end
  object dtsEmpresa: TDataSource
    DataSet = tblEmpresa
    Left = 376
    Top = 264
  end
end
