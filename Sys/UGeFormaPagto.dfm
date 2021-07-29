inherited frmGeFormaPagto: TfrmGeFormaPagto
  Left = 393
  Top = 215
  ActiveControl = dbgDados
  Caption = 'Tabela de Formas de Pagamento'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcGuias: TPageControl
    ActivePage = tbsTabela
    inherited tbsTabela: TTabSheet
      inherited dbgDados: TDBGrid
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
            FieldName = 'DESCRI'
            Title.Caption = 'Descri'#231#227'o '
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ACRESCIMO'
            Title.Caption = '% Acr'#233'scimo '
            Visible = True
          end
          item
            Expanded = False
            Visible = False
          end>
      end
      inherited pnlFiltros: TPanel
        object lblRegistroDesativado: TLabel [0]
          Left = 2
          Top = 44
          Width = 197
          Height = 13
          Caption = '* Forma de Pagamento desativada'
          Font.Charset = ANSI_CHARSET
          Font.Color = 7303023
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        inherited grpBxFiltro: TGroupBox
          Left = 383
          Width = 340
          ExplicitLeft = 383
          ExplicitWidth = 340
          inherited lbltFiltrar: TLabel
            Width = 107
            Caption = 'Forma Pagamento:'
            ExplicitWidth = 107
          end
          inherited edtFiltrar: TEdit
            Left = 120
            Width = 171
            ExplicitLeft = 120
            ExplicitWidth = 153
          end
          inherited btnFiltrar: TcxButton
            Left = 295
            ExplicitLeft = 277
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
        Top = 153
        ExplicitTop = 153
      end
      inherited GrpBxDadosNominais: TGroupBox
        Height = 153
        ExplicitHeight = 153
        object lblNome: TLabel [1]
          Left = 88
          Top = 24
          Width = 50
          Height = 13
          Caption = 'Descri'#231#227'o:'
        end
        object lblAcrescimo: TLabel [2]
          Left = 344
          Top = 24
          Width = 66
          Height = 13
          Caption = '% Acr'#233'scimo:'
        end
        object lblFormaPagtoNCFe: TLabel [3]
          Left = 448
          Top = 24
          Width = 139
          Height = 13
          Caption = 'Forma de Pagamento NFC-e:'
          FocusControl = dbFormaPagtoNCFe
        end
        inherited dbCodigo: TDBEdit
          Color = clMoneyGreen
          DataField = 'COD'
        end
        object dbNome: TDBEdit
          Left = 88
          Top = 40
          Width = 249
          Height = 21
          CharCase = ecUpperCase
          DataField = 'DESCRI'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object dbAcrescimo: TDBEdit
          Left = 344
          Top = 40
          Width = 97
          Height = 21
          CharCase = ecUpperCase
          DataField = 'ACRESCIMO'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object dbDecrementarLimite: TDBCheckBox
          Left = 16
          Top = 72
          Width = 377
          Height = 17
          Caption = 'Forma de Pagamento DECREMENTA Limite de Cr'#233'dito do Cliente'
          DataField = 'DEBITAR_LIMITE_CLIENTE'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbFormaPagtoNCFe: TDBLookupComboBox
          Left = 448
          Top = 40
          Width = 265
          Height = 21
          DataField = 'FORMAPAGTO_NFCE'
          DataSource = DtSrcTabela
          DropDownRows = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'CODIGO'
          ListField = 'DESCRICAO'
          ListSource = dtsFormaPagtoNCFe
          ParentFont = False
          TabOrder = 3
        end
        object dbFormaPagtoPDV: TDBCheckBox
          Left = 16
          Top = 96
          Width = 225
          Height = 17
          Caption = 'Usar Forma de Pagamento no PDV'
          DataField = 'FORMAPAGTO_PDV'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbFormaPagtoPDVRelatorio: TDBCheckBox
          Left = 16
          Top = 120
          Width = 265
          Height = 17
          Caption = 'Emitir Relat'#243'rio Gerencial no PDV (P'#243's Venda)'
          DataField = 'FORMAPAGTO_PDV_CUPOM_EXTRA'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbAtiva: TDBCheckBox
          Left = 448
          Top = 72
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
          TabOrder = 7
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
      object dbgContaCorrente: TDBGrid
        Left = 0
        Top = 157
        Width = 727
        Height = 172
        Hint = 
          'Dica:'#13#10#13#10'Pressione a tecla "Espa'#231'o" para marcar o desmarcar a Co' +
          'nta Corrente'#13#10'selecionada. E atente para o fato de que a conta c' +
          'orrente marcada est'#225#13#10'relacionada a forma de pagamento em quest'#227 +
          'o.'
        Align = alClient
        DataSource = dtsContaCorrenteLista
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
        OnDblClick = dbgContaCorrenteDblClick
        OnKeyDown = dbgContaCorrenteKeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'SELECIONAR'
            Title.Alignment = taCenter
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGO'
            Title.Caption = 'C'#243'digo'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Title.Caption = 'Conta Corrente'
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO'
            Title.Caption = 'Tipo'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RZSOC'
            Title.Caption = 'Empresa'
            Width = 300
            Visible = True
          end>
      end
    end
  end
  inherited IbDtstTabela: TIBDataSet
    SelectSQL.Strings = (
      'Select'
      '    p.Cod'
      '  , p.Descri'
      '  , p.Acrescimo'
      '  , p.FormaPagto_NFCe'
      '  , p.FormaPagto_PDV'
      '  , p.Formapagto_PDV_Cupom_Extra'
      '  , p.Debitar_limite_cliente'
      '  , p.Ativa'
      'from TBFORMPAGTO p')
    GeneratorField.Field = 'COD'
    GeneratorField.Generator = 'GEN_GRUPOPRODUTO_COD'
  end
  inherited DtSrcTabela: TDataSource
    DataSet = fdQryTabela
  end
  inherited IbUpdTabela: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  COD,'
      '  DESCRI,'
      '  ACRESCIMO,'
      '  CONTA_CORRENTE,'
      '  DEBITAR_LIMITE_CLIENTE,'
      '  FORMAPAGTO_NFCE,'
      '  FORMAPAGTO_PDV,'
      '  FORMAPAGTO_PDV_CUPOM_EXTRA,'
      '  ATIVA'
      'from TBFORMPAGTO '
      'where'
      '  COD = :COD')
    ModifySQL.Strings = (
      'update TBFORMPAGTO'
      'set'
      '  ACRESCIMO = :ACRESCIMO,'
      '  ATIVA = :ATIVA,'
      '  COD = :COD,'
      '  DEBITAR_LIMITE_CLIENTE = :DEBITAR_LIMITE_CLIENTE,'
      '  DESCRI = :DESCRI,'
      '  FORMAPAGTO_NFCE = :FORMAPAGTO_NFCE,'
      '  FORMAPAGTO_PDV = :FORMAPAGTO_PDV,'
      '  FORMAPAGTO_PDV_CUPOM_EXTRA = :FORMAPAGTO_PDV_CUPOM_EXTRA'
      'where'
      '  COD = :OLD_COD')
    InsertSQL.Strings = (
      'insert into TBFORMPAGTO'
      
        '  (ACRESCIMO, ATIVA, COD, DEBITAR_LIMITE_CLIENTE, DESCRI, FORMAP' +
        'AGTO_NFCE, '
      '   FORMAPAGTO_PDV, FORMAPAGTO_PDV_CUPOM_EXTRA)'
      'values'
      
        '  (:ACRESCIMO, :ATIVA, :COD, :DEBITAR_LIMITE_CLIENTE, :DESCRI, :' +
        'FORMAPAGTO_NFCE, '
      '   :FORMAPAGTO_PDV, :FORMAPAGTO_PDV_CUPOM_EXTRA)')
    DeleteSQL.Strings = (
      'delete from TBFORMPAGTO'
      'where'
      '  COD = :OLD_COD')
  end
  inherited ImgList: TImageList
    Left = 560
    Top = 200
  end
  inherited fdQryTabela: TFDQuery
    AfterScroll = fdQryTabelaAfterScroll
    SQL.Strings = (
      'Select'
      '    p.Cod'
      '  , p.Descri'
      '  , p.Acrescimo'
      '  , p.FormaPagto_NFCe'
      '  , p.FormaPagto_PDV'
      '  , p.Formapagto_PDV_Cupom_Extra'
      '  , p.Debitar_limite_cliente'
      '  , p.Ativa'
      'from TBFORMPAGTO p')
    object fdQryTabelaCOD: TSmallintField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD'
      Origin = 'COD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object fdQryTabelaDESCRI: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRI'
      Origin = 'DESCRI'
      Required = True
      Size = 30
    end
    object fdQryTabelaACRESCIMO: TSingleField
      DisplayLabel = '% Acr'#233'scimo'
      FieldName = 'ACRESCIMO'
      Origin = 'ACRESCIMO'
      DisplayFormat = ',0.00'
    end
    object fdQryTabelaFORMAPAGTO_NFCE: TStringField
      DisplayLabel = 'Forma de Pagamento NFC-e'
      FieldName = 'FORMAPAGTO_NFCE'
      Origin = 'FORMAPAGTO_NFCE'
      Required = True
      Size = 2
    end
    object fdQryTabelaFORMAPAGTO_PDV: TSmallintField
      FieldName = 'FORMAPAGTO_PDV'
      Origin = 'FORMAPAGTO_PDV'
      Required = True
    end
    object fdQryTabelaFORMAPAGTO_PDV_CUPOM_EXTRA: TSmallintField
      FieldName = 'FORMAPAGTO_PDV_CUPOM_EXTRA'
      Origin = 'FORMAPAGTO_PDV_CUPOM_EXTRA'
      Required = True
    end
    object fdQryTabelaDEBITAR_LIMITE_CLIENTE: TSmallintField
      FieldName = 'DEBITAR_LIMITE_CLIENTE'
      Origin = 'DEBITAR_LIMITE_CLIENTE'
      Required = True
    end
    object fdQryTabelaATIVA: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'ATIVA'
      Origin = 'ATIVA'
      Required = True
    end
  end
  inherited fdUpdTabela: TFDUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO TBFORMPAGTO'
      '(COD, DESCRI, ACRESCIMO, DEBITAR_LIMITE_CLIENTE, '
      '  FORMAPAGTO_NFCE, FORMAPAGTO_PDV, FORMAPAGTO_PDV_CUPOM_EXTRA, '
      '  ATIVA)'
      
        'VALUES (:NEW_COD, :NEW_DESCRI, :NEW_ACRESCIMO, :NEW_DEBITAR_LIMI' +
        'TE_CLIENTE, '
      
        '  :NEW_FORMAPAGTO_NFCE, :NEW_FORMAPAGTO_PDV, :NEW_FORMAPAGTO_PDV' +
        '_CUPOM_EXTRA, '
      '  :NEW_ATIVA)')
    ModifySQL.Strings = (
      'UPDATE TBFORMPAGTO'
      
        'SET COD = :NEW_COD, DESCRI = :NEW_DESCRI, ACRESCIMO = :NEW_ACRES' +
        'CIMO, '
      
        '  DEBITAR_LIMITE_CLIENTE = :NEW_DEBITAR_LIMITE_CLIENTE, FORMAPAG' +
        'TO_NFCE = :NEW_FORMAPAGTO_NFCE, '
      
        '  FORMAPAGTO_PDV = :NEW_FORMAPAGTO_PDV, FORMAPAGTO_PDV_CUPOM_EXT' +
        'RA = :NEW_FORMAPAGTO_PDV_CUPOM_EXTRA, '
      '  ATIVA = :NEW_ATIVA'
      'WHERE COD = :OLD_COD')
    DeleteSQL.Strings = (
      'DELETE FROM TBFORMPAGTO'
      'WHERE COD = :OLD_COD')
    FetchRowSQL.Strings = (
      
        'SELECT COD, DESCRI, ACRESCIMO, CONTA_CORRENTE, DEBITAR_LIMITE_CL' +
        'IENTE, '
      '  FORMAPAGTO_NFCE, FORMAPAGTO_PDV, FORMAPAGTO_PDV_CUPOM_EXTRA, '
      '  ATIVA'
      'FROM TBFORMPAGTO'
      'WHERE COD = :COD')
  end
  object dtsFormaPagtoNCFe: TDataSource
    DataSet = fdQryFormaPagtoNCFe
    Left = 672
    Top = 96
  end
  object dtsContaCorrenteLista: TDataSource
    DataSet = cdsContaCorrenteLista
    Left = 276
    Top = 241
  end
  object dspContaCorrenteLista: TDataSetProvider
    DataSet = fdQryContaCorrenteLista
    Left = 212
    Top = 241
  end
  object cdsContaCorrenteLista: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'FORMA_PAGTO'
        ParamType = ptInput
      end>
    ProviderName = 'dspContaCorrenteLista'
    Left = 244
    Top = 241
    object cdsContaCorrenteListaSELECIONAR: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'S'
      FieldName = 'SELECIONAR'
      ProviderFlags = [pfInUpdate]
      OnGetText = cdsContaCorrenteListaSELECIONARGetText
    end
    object cdsContaCorrenteListaCODIGO: TIntegerField
      Alignment = taCenter
      FieldName = 'CODIGO'
      Required = True
      DisplayFormat = '0000'
    end
    object cdsContaCorrenteListaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object cdsContaCorrenteListaTIPO: TStringField
      FieldName = 'TIPO'
      ReadOnly = True
      FixedChar = True
      Size = 5
    end
    object cdsContaCorrenteListaRZSOC: TStringField
      FieldName = 'RZSOC'
      ReadOnly = True
      Size = 60
    end
  end
  object fdQryFormaPagtoNCFe: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select *'
      'from VW_FORMA_PAGTO_NFC_E')
    Left = 643
    Top = 96
  end
  object fdQryContaCorrenteLista: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      
        '--    Case when f.conta_corrente is null then 0 else 1 end as se' +
        'lecionar'
      '    f.selecionar'
      '  , c.codigo'
      '  , c.descricao'
      '  , Case c.tipo'
      '      when 1 then '#39'Caixa'#39
      '      when 2 then '#39'Banco'#39
      '    end as tipo'
      '  , e.rzsoc'
      'from TBCONTA_CORRENTE c'
      '  left join TBEMPRESA e on (e.cnpj = c.empresa)'
      
        '  left join TBFORMPAGTO_CONTACOR f on (f.conta_corrente = c.codi' +
        'go and f.forma_pagto = :forma_pagto)'
      ''
      'order by'
      '    c.descricao')
    Left = 179
    Top = 240
    ParamData = <
      item
        Position = 1
        Name = 'FORMA_PAGTO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
end
