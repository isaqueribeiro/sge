inherited frmGeCentroCusto: TfrmGeCentroCusto
  Left = 394
  Top = 218
  Caption = 'Tabela de Departamentos / Centros de Custos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcGuias: TPageControl
    inherited tbsTabela: TTabSheet
      inherited dbgDados: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Title.Caption = 'C'#243'digo '
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Title.Caption = 'Descri'#231#227'o '
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Title.Caption = 'Cliente '
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ATIVO_TEMP'
            Title.Alignment = taCenter
            Title.Caption = 'Ativo '
            Width = 35
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        inherited grpBxFiltro: TGroupBox
          Left = 304
          Width = 419
          ExplicitLeft = 304
          ExplicitWidth = 419
          DesignSize = (
            419
            54)
          inherited lbltFiltrar: TLabel
            Left = 48
            Width = 58
            Alignment = taRightJustify
            Caption = 'Descri'#231#227'o:'
            ExplicitLeft = 48
            ExplicitWidth = 58
          end
          inherited edtFiltrar: TEdit
            Left = 112
            Width = 258
            ExplicitLeft = 112
            ExplicitWidth = 258
          end
          inherited btnFiltrar: TcxButton
            Left = 374
            ExplicitLeft = 374
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
        Top = 145
        ExplicitTop = 145
      end
      inherited GrpBxDadosNominais: TGroupBox
        Height = 145
        ExplicitHeight = 145
        object lblDesricao: TLabel [1]
          Left = 88
          Top = 24
          Width = 50
          Height = 13
          Caption = 'Descri'#231#227'o:'
          FocusControl = dbDesricao
        end
        object lblCliente: TLabel [2]
          Left = 16
          Top = 64
          Width = 37
          Height = 13
          Caption = 'Cliente:'
          FocusControl = dbCliente
        end
        inherited dbCodigo: TDBEdit
          Color = clMoneyGreen
          DataField = 'CODIGO'
        end
        object dbDesricao: TDBEdit
          Left = 88
          Top = 40
          Width = 617
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
        object dbAtivo: TDBCheckBox
          Left = 16
          Top = 112
          Width = 57
          Height = 17
          Caption = 'Ativo'
          DataField = 'ATIVO'
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
        object dbCliente: TJvDBComboEdit
          Left = 16
          Top = 80
          Width = 689
          Height = 21
          Hint = 'Pesquisar Cliente (Ctrl + P)'#13#10'Limpar Campo (Ctrl + L)'
          ButtonHint = 'Pesquisar Cliente (Ctrl+P)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clMoneyGreen
          DataField = 'NOME'
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
          TabOrder = 2
          OnButtonClick = dbClienteButtonClick
        end
      end
      object dbgEmpresaLista: TDBGrid
        Left = 0
        Top = 149
        Width = 727
        Height = 180
        Hint = 
          'Dica:'#13#10#13#10'Pressione a tecla "Espa'#231'o" para marcar o desmarcar a Em' +
          'presa selecionada.'
        Align = alClient
        DataSource = dtsEmpresaLista
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
        OnDblClick = dbgEmpresaListaDblClick
        OnKeyDown = dbgEmpresaListaKeyDown
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
            FieldName = 'RZSOC'
            Title.Caption = 'Empresa '
            Width = 450
            Visible = True
          end>
      end
    end
  end
  inherited IbDtstTabela: TIBDataSet
    SelectSQL.Strings = (
      'Select'
      '    c.codigo'
      '  , c.descricao'
      '  , c.ativo'
      '  , c.codcliente'
      '  , cc.nome'
      'from TBCENTRO_CUSTO c'
      '  left join TBCLIENTE cc on (cc.codigo = c.codcliente)')
    GeneratorField.Field = 'CODIGO'
    GeneratorField.Generator = 'GEN_CENTRO_CUSTO'
    GeneratorField.ApplyEvent = gamOnNewRecord
  end
  inherited DtSrcTabela: TDataSource
    DataSet = fdQryTabela
  end
  inherited IbUpdTabela: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO,'
      '  DESCRICAO,'
      '  ATIVO,'
      '  CODCLIENTE'
      'from TBCENTRO_CUSTO '
      'where'
      '  CODIGO = :CODIGO')
    ModifySQL.Strings = (
      'update TBCENTRO_CUSTO'
      'set'
      '  ATIVO = :ATIVO,'
      '  CODCLIENTE = :CODCLIENTE,'
      '  CODIGO = :CODIGO,'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into TBCENTRO_CUSTO'
      '  (ATIVO, CODCLIENTE, CODIGO, DESCRICAO)'
      'values'
      '  (:ATIVO, :CODCLIENTE, :CODIGO, :DESCRICAO)')
    DeleteSQL.Strings = (
      'delete from TBCENTRO_CUSTO'
      'where'
      '  CODIGO = :OLD_CODIGO')
  end
  inherited fdQryTabela: TFDQuery
    AfterScroll = fdQryTabelaAfterScroll
    OnCalcFields = fdQryTabelaCalcFields
    UpdateOptions.AssignedValues = [uvFetchGeneratorsPoint, uvGeneratorName]
    UpdateOptions.FetchGeneratorsPoint = gpImmediate
    UpdateOptions.GeneratorName = 'GEN_CENTRO_CUSTO'
    UpdateOptions.KeyFields = 'CODIGO'
    UpdateOptions.AutoIncFields = 'CODIGO'
    SQL.Strings = (
      'Select'
      '    c.codigo'
      '  , c.descricao'
      '  , c.ativo'
      '  , c.codcliente'
      '  , cc.nome'
      'from TBCENTRO_CUSTO c'
      '  left join TBCLIENTE cc on (cc.codigo = c.codcliente)')
    object fdQryTabelaCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object fdQryTabelaDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 100
    end
    object fdQryTabelaATIVO: TSmallintField
      Alignment = taLeftJustify
      DisplayLabel = 'Ativo?'
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      Required = True
    end
    object fdQryTabelaCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
      Origin = 'CODCLIENTE'
    end
    object fdQryTabelaNOME: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Cliente'
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object fdQryTabelaATIVO_TEMP: TStringField
      Alignment = taCenter
      DisplayLabel = 'Ativo'
      FieldKind = fkInternalCalc
      FieldName = 'ATIVO_TEMP'
      Size = 1
    end
  end
  inherited fdUpdTabela: TFDUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO TBCENTRO_CUSTO'
      '(CODIGO, DESCRICAO, ATIVO, CODCLIENTE)'
      
        'VALUES (:NEW_CODIGO, :NEW_DESCRICAO, :NEW_ATIVO, :NEW_CODCLIENTE' +
        ')'
      'RETURNING CODIGO, CODCLIENTE')
    ModifySQL.Strings = (
      'UPDATE TBCENTRO_CUSTO'
      
        'SET CODIGO = :NEW_CODIGO, DESCRICAO = :NEW_DESCRICAO, ATIVO = :N' +
        'EW_ATIVO, '
      '  CODCLIENTE = :NEW_CODCLIENTE'
      'WHERE CODIGO = :OLD_CODIGO'
      'RETURNING CODIGO, CODCLIENTE')
    DeleteSQL.Strings = (
      'DELETE FROM TBCENTRO_CUSTO'
      'WHERE CODIGO = :OLD_CODIGO')
    FetchRowSQL.Strings = (
      'Select'
      '    c.codigo'
      '  , c.descricao'
      '  , c.ativo'
      '  , c.codcliente'
      '  , cc.nome'
      'from TBCENTRO_CUSTO c'
      '  left join TBCLIENTE cc on (cc.codigo = c.codcliente)'
      'WHERE c.CODIGO = :CODIGO')
  end
  object dspEmpresaLista: TDataSetProvider
    DataSet = qryEmpresaLista
    Left = 216
    Top = 224
  end
  object cdsEmpresaLista: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'CENTRO_CUSTO'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspEmpresaLista'
    Left = 248
    Top = 224
    object cdsEmpresaListaSELECIONAR: TIntegerField
      Alignment = taCenter
      FieldName = 'SELECIONAR'
      OnGetText = cdsEmpresaListaSELECIONARGetText
    end
    object cdsEmpresaListaCNPJ: TStringField
      FieldName = 'CNPJ'
      Required = True
      Size = 18
    end
    object cdsEmpresaListaRZSOC: TStringField
      FieldName = 'RZSOC'
      Size = 60
    end
    object cdsEmpresaListaCENTRO_CUSTO: TIntegerField
      FieldName = 'CENTRO_CUSTO'
      ReadOnly = True
    end
    object cdsEmpresaListaEMPRESA: TStringField
      FieldName = 'EMPRESA'
      ReadOnly = True
      Size = 18
    end
  end
  object dtsEmpresaLista: TDataSource
    DataSet = cdsEmpresaLista
    Left = 280
    Top = 224
  end
  object qryEmpresaLista: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      
        '    Case when c.centro_custo is null then 0 else 1 end as seleci' +
        'onar'
      '  , e.cnpj'
      '  , e.rzsoc'
      '  , c.centro_custo'
      '  , c.empresa'
      'from TBEMPRESA e'
      
        '  left join TBCENTRO_CUSTO_EMPRESA c on (c.empresa = e.cnpj and ' +
        'c.centro_custo = :centro_custo)'
      ''
      'order by'
      '    e.rzsoc')
    Left = 184
    Top = 224
    ParamData = <
      item
        Position = 1
        Name = 'CENTRO_CUSTO'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end>
    object qryEmpresaListaSELECIONAR: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'SELECIONAR'
      Origin = 'SELECIONAR'
      ProviderFlags = []
    end
    object qryEmpresaListaCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 18
    end
    object qryEmpresaListaRZSOC: TStringField
      FieldName = 'RZSOC'
      Origin = 'RZSOC'
      Size = 60
    end
    object qryEmpresaListaCENTRO_CUSTO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CENTRO_CUSTO'
      Origin = 'CENTRO_CUSTO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryEmpresaListaEMPRESA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'EMPRESA'
      Origin = 'EMPRESA'
      ProviderFlags = []
      ReadOnly = True
      Size = 18
    end
  end
end
