inherited frmGeEquipamento: TfrmGeEquipamento
  Left = 466
  Top = 249
  Caption = 'Cadastro de Equipamentos'
  ClientHeight = 573
  ClientWidth = 999
  OldCreateOrder = True
  OnClose = FormClose
  ExplicitWidth = 1015
  ExplicitHeight = 612
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 569
    Width = 999
    ExplicitTop = 570
    ExplicitWidth = 81
  end
  inherited Bevel3: TBevel
    Top = 530
    Width = 999
    ExplicitTop = 531
    ExplicitWidth = 999
  end
  inherited pgcGuias: TPageControl
    Width = 999
    Height = 530
    OnChange = pgcGuiasChange
    ExplicitWidth = 999
    ExplicitHeight = 530
    inherited tbsTabela: TTabSheet
      ExplicitWidth = 991
      ExplicitHeight = 501
      inherited Bevel4: TBevel
        Top = 435
        Width = 991
        ExplicitTop = 436
        ExplicitWidth = 991
      end
      inherited dbgDados: TDBGrid
        Width = 991
        Height = 435
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
            Width = 280
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO_DESCRICAO'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Width = 190
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CNPJ'
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'REFERENCIA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SERIAL'
            Title.Caption = 'N'#250'mero Serial'
            Width = 150
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        Top = 439
        Width = 991
        ExplicitTop = 439
        ExplicitWidth = 991
        inherited grpBxFiltro: TGroupBox
          Left = 619
          Width = 368
          ExplicitLeft = 619
          ExplicitWidth = 368
          inherited lbltFiltrar: TLabel
            Left = 14
            Width = 77
            Caption = 'Equipamento:'
            ExplicitLeft = 14
            ExplicitWidth = 77
          end
          inherited edtFiltrar: TEdit
            Left = 96
            Width = 223
            ExplicitLeft = 96
            ExplicitWidth = 223
          end
          inherited btnFiltrar: TcxButton
            Left = 323
            ExplicitLeft = 323
          end
        end
      end
    end
    inherited tbsCadastro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 991
      ExplicitHeight = 501
      inherited Bevel8: TBevel
        Top = 182
        Width = 991
        ExplicitTop = 182
        ExplicitWidth = 991
      end
      object lblEspecificacao: TLabel [1]
        Left = 0
        Top = 169
        Width = 991
        Height = 13
        Align = alTop
        Caption = 'Especifica'#231#245'es gerais:'
        FocusControl = dbEspecificacao
        ExplicitWidth = 105
      end
      object Bevel9: TBevel [2]
        Left = 0
        Top = 0
        Width = 991
        Height = 4
        Align = alTop
        Shape = bsSpacer
      end
      object Bevel5: TBevel [3]
        Left = 0
        Top = 165
        Width = 991
        Height = 4
        Align = alTop
        Shape = bsSpacer
      end
      inherited GrpBxDadosNominais: TGroupBox
        Top = 4
        Width = 991
        Height = 161
        ExplicitTop = 4
        ExplicitWidth = 991
        ExplicitHeight = 161
        object lblModelo: TLabel [1]
          Left = 176
          Top = 104
          Width = 38
          Height = 13
          Caption = 'Modelo:'
          FocusControl = dbModelo
        end
        object lblReferencia: TLabel [2]
          Left = 336
          Top = 104
          Width = 56
          Height = 13
          Caption = 'Refer'#234'ncia:'
          FocusControl = dbReferencia
        end
        object lblUsuario: TLabel [3]
          Left = 584
          Top = 24
          Width = 46
          Height = 13
          Caption = 'Usu'#225'rio:'
          FocusControl = dbUsuario
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblDescricao: TLabel [4]
          Left = 176
          Top = 64
          Width = 50
          Height = 13
          Caption = 'Descri'#231#227'o:'
          FocusControl = dbDescricao
        end
        object lblTipo: TLabel [5]
          Left = 16
          Top = 64
          Width = 24
          Height = 13
          Caption = 'Tipo:'
          FocusControl = dbTipo
        end
        object lblMarca: TLabel [6]
          Left = 16
          Top = 104
          Width = 33
          Height = 13
          Caption = 'Marca:'
          FocusControl = dbMarca
        end
        object lblSerialNumber: TLabel [7]
          Left = 496
          Top = 104
          Width = 70
          Height = 13
          Caption = 'Serial Number:'
          FocusControl = dbSerialNumber
        end
        object lblCliente: TLabel [8]
          Left = 87
          Top = 24
          Width = 37
          Height = 13
          Caption = 'Cliente:'
          FocusControl = dbCliente
        end
        inherited dbCodigo: TDBEdit
          Color = clMoneyGreen
          DataField = 'CODIGO'
        end
        object dbModelo: TDBEdit
          Left = 176
          Top = 120
          Width = 153
          Height = 21
          CharCase = ecUpperCase
          DataField = 'MODELO'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
        end
        object dbReferencia: TDBEdit
          Left = 336
          Top = 120
          Width = 153
          Height = 21
          CharCase = ecUpperCase
          DataField = 'REFERENCIA'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
        end
        object dbUsuario: TDBEdit
          Left = 584
          Top = 40
          Width = 233
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'USUARIO'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object dbDescricao: TDBEdit
          Left = 176
          Top = 80
          Width = 641
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
          TabOrder = 4
        end
        object dbTipo: TDBLookupComboBox
          Left = 16
          Top = 80
          Width = 153
          Height = 21
          DataField = 'TIPO'
          DataSource = DtSrcTabela
          DropDownRows = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'CODIGO'
          ListField = 'DESCRICAO'
          ListSource = dtsTipo
          ParentFont = False
          TabOrder = 3
        end
        object dbMarca: TDBEdit
          Left = 16
          Top = 120
          Width = 153
          Height = 21
          CharCase = ecUpperCase
          DataField = 'MARCA'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
        object dbSerialNumber: TDBEdit
          Left = 496
          Top = 120
          Width = 321
          Height = 21
          CharCase = ecUpperCase
          DataField = 'SERIAL'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
        end
        object dbCliente: TJvDBComboEdit
          Left = 87
          Top = 40
          Width = 491
          Height = 21
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
          TabOrder = 1
          OnButtonClick = dbClienteButtonClick
        end
      end
      object dbEspecificacao: TDBMemo
        Left = 0
        Top = 186
        Width = 991
        Height = 315
        Align = alClient
        DataField = 'ESPECIFICACAO'
        DataSource = DtSrcTabela
        ScrollBars = ssBoth
        TabOrder = 1
      end
    end
  end
  inherited tlbBotoes: TPanel
    Top = 534
    Width = 999
    ExplicitTop = 534
    ExplicitWidth = 999
    inherited bvlTool3: TBevel
      Left = 796
      ExplicitLeft = 796
    end
    inherited bvlTool4: TBevel
      Left = 995
      ExplicitLeft = 742
    end
    inherited btbtnFechar: TcxButton
      Left = 800
      ExplicitLeft = 800
    end
    inherited btbtnSelecionar: TcxButton
      Left = 875
      ExplicitLeft = 875
    end
  end
  inherited IbDtstTabela: TIBDataSet
    AfterScroll = IbDtstTabelaAfterScroll
    OnNewRecord = IbDtstTabelaNewRecord
    SelectSQL.Strings = (
      'Select'
      '    e.codigo'
      '  , e.tipo'
      '  , e.cliente'
      '  , e.descricao'
      '  , e.especificacao'
      '  , e.marca'
      '  , e.modelo'
      '  , e.fabricante'
      '  , e.referencia'
      '  , e.serial'
      '  , e.usuario'
      '  , c.cnpj'
      '  , c.nome'
      '  , t.descricao as tipo_descricao'
      'from TBCLIENTE_EQUIPAMENTO e'
      '  left join TBCLIENTE c on (c.codigo = e.cliente)'
      '  left join SYS_TIPO_EQUIPAMENTO t on (t.codigo = e.tipo)')
    GeneratorField.Field = 'CODIGO'
    GeneratorField.Generator = 'GEN_CLIENTE_EQUIPAMENTO_ID'
    GeneratorField.ApplyEvent = gamOnNewRecord
    Top = 320
    object IbDtstTabelaCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Origin = '"TBCLIENTE_EQUIPAMENTO"."CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IbDtstTabelaTIPO: TSmallintField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Origin = '"TBCLIENTE_EQUIPAMENTO"."TIPO"'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object IbDtstTabelaCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
      Origin = '"TBCLIENTE_EQUIPAMENTO"."CLIENTE"'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object IbDtstTabelaDESCRICAO: TIBStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Origin = '"TBCLIENTE_EQUIPAMENTO"."DESCRICAO"'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object IbDtstTabelaESPECIFICACAO: TMemoField
      DisplayLabel = 'Especifica'#231#227'o'
      FieldName = 'ESPECIFICACAO'
      Origin = '"TBCLIENTE_EQUIPAMENTO"."ESPECIFICACAO"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object IbDtstTabelaMARCA: TIBStringField
      DisplayLabel = 'Marca'
      FieldName = 'MARCA'
      Origin = '"TBCLIENTE_EQUIPAMENTO"."MARCA"'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 50
    end
    object IbDtstTabelaMODELO: TIBStringField
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO'
      Origin = '"TBCLIENTE_EQUIPAMENTO"."MODELO"'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 50
    end
    object IbDtstTabelaFABRICANTE: TIntegerField
      DisplayLabel = 'Fabricante'
      FieldName = 'FABRICANTE'
      Origin = '"TBCLIENTE_EQUIPAMENTO"."FABRICANTE"'
      ProviderFlags = [pfInUpdate]
    end
    object IbDtstTabelaREFERENCIA: TIBStringField
      DisplayLabel = 'Refer'#234'ncia'
      FieldName = 'REFERENCIA'
      Origin = '"TBCLIENTE_EQUIPAMENTO"."REFERENCIA"'
      ProviderFlags = [pfInUpdate]
    end
    object IbDtstTabelaSERIAL: TIBStringField
      DisplayLabel = 'Serial Number'
      FieldName = 'SERIAL'
      Origin = '"TBCLIENTE_EQUIPAMENTO"."SERIAL"'
      ProviderFlags = [pfInUpdate]
    end
    object IbDtstTabelaUSUARIO: TIBStringField
      FieldName = 'USUARIO'
      Origin = '"TBCLIENTE_EQUIPAMENTO"."USUARIO"'
      ProviderFlags = [pfInUpdate]
      Size = 12
    end
    object IbDtstTabelaCNPJ: TIBStringField
      DisplayLabel = 'CPF / CNPJ'
      FieldName = 'CNPJ'
      Origin = '"TBCLIENTE"."CNPJ"'
      ProviderFlags = []
      OnGetText = IbDtstTabelaCNPJGetText
      Size = 18
    end
    object IbDtstTabelaNOME: TIBStringField
      DisplayLabel = 'Cliente'
      FieldName = 'NOME'
      Origin = '"TBCLIENTE"."NOME"'
      ProviderFlags = []
      Size = 100
    end
    object IbDtstTabelaTIPO_DESCRICAO: TIBStringField
      DisplayLabel = 'Tipo '
      FieldName = 'TIPO_DESCRICAO'
      Origin = '"SYS_TIPO_EQUIPAMENTO"."DESCRICAO"'
      ProviderFlags = []
      Size = 50
    end
  end
  inherited DtSrcTabela: TDataSource
    OnDataChange = DtSrcTabelaDataChange
    Left = 656
    Top = 320
  end
  inherited IbUpdTabela: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO,'
      '  TIPO,'
      '  CLIENTE,'
      '  DESCRICAO,'
      '  ESPECIFICACAO,'
      '  MARCA,'
      '  MODELO,'
      '  FABRICANTE,'
      '  REFERENCIA,'
      '  SERIAL,'
      '  USUARIO'
      'from TBCLIENTE_EQUIPAMENTO '
      'where'
      '  CODIGO = :CODIGO')
    ModifySQL.Strings = (
      'update TBCLIENTE_EQUIPAMENTO'
      'set'
      '  CLIENTE = :CLIENTE,'
      '  CODIGO = :CODIGO,'
      '  DESCRICAO = :DESCRICAO,'
      '  ESPECIFICACAO = :ESPECIFICACAO,'
      '  FABRICANTE = :FABRICANTE,'
      '  MARCA = :MARCA,'
      '  MODELO = :MODELO,'
      '  REFERENCIA = :REFERENCIA,'
      '  SERIAL = :SERIAL,'
      '  TIPO = :TIPO,'
      '  USUARIO = :USUARIO'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into TBCLIENTE_EQUIPAMENTO'
      
        '  (CLIENTE, CODIGO, DESCRICAO, ESPECIFICACAO, FABRICANTE, MARCA,' +
        ' MODELO, '
      '   REFERENCIA, SERIAL, TIPO, USUARIO)'
      'values'
      
        '  (:CLIENTE, :CODIGO, :DESCRICAO, :ESPECIFICACAO, :FABRICANTE, :' +
        'MARCA, '
      '   :MODELO, :REFERENCIA, :SERIAL, :TIPO, :USUARIO)')
    DeleteSQL.Strings = (
      'delete from TBCLIENTE_EQUIPAMENTO'
      'where'
      '  CODIGO = :OLD_CODIGO')
    Left = 688
    Top = 320
  end
  inherited ImgList: TImageList
    Top = 320
  end
  object dtsTipo: TDataSource
    DataSet = fdQryTipo
    Left = 656
    Top = 352
  end
  object fdQryTipo: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select *'
      'from SYS_TIPO_EQUIPAMENTO')
    Left = 628
    Top = 353
  end
end
