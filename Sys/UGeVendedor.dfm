inherited frmGeVendedor: TfrmGeVendedor
  Left = 396
  Top = 231
  Caption = 'Cadastro de Vendedores'
  ClientWidth = 730
  OldCreateOrder = True
  ExplicitWidth = 746
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 730
    ExplicitWidth = 730
  end
  inherited Bevel3: TBevel
    Width = 730
    ExplicitWidth = 730
  end
  inherited pgcGuias: TPageControl
    Width = 730
    ExplicitWidth = 730
    inherited tbsTabela: TTabSheet
      ExplicitWidth = 722
      inherited Bevel4: TBevel
        Width = 722
        ExplicitWidth = 722
      end
      inherited dbgDados: TDBGrid
        Width = 722
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
            FieldName = 'NOME'
            Title.Caption = 'Nome '
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CPF'
            Title.Caption = 'CPF '
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COMISSAO_TIPO_FLAG'
            Title.Alignment = taCenter
            Title.Caption = 'TC '
            Width = 25
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COMISSAO'
            Title.Caption = 'Comiss'#227'o (%) '
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COMISSAO_VL'
            Title.Alignment = taRightJustify
            Title.Caption = 'Comiss'#227'o (R$) '
            Width = 110
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ATIVO'
            Title.Alignment = taCenter
            Title.Caption = 'A '
            Visible = False
          end>
      end
      inherited pnlFiltros: TPanel
        Width = 722
        ExplicitWidth = 722
        inherited grpBxFiltro: TGroupBox
          Left = 428
          Width = 290
          ExplicitLeft = 428
          ExplicitWidth = 290
          DesignSize = (
            290
            54)
          inherited lbltFiltrar: TLabel
            Width = 57
            Caption = 'Vendedor:'
            ExplicitWidth = 57
          end
          inherited edtFiltrar: TEdit
            Left = 72
            Width = 169
            ExplicitLeft = 72
            ExplicitWidth = 169
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
      ExplicitWidth = 722
      ExplicitHeight = 329
      inherited Bevel8: TBevel
        Top = 137
        Width = 722
        ExplicitTop = 100
        ExplicitWidth = 722
      end
      inherited GrpBxDadosNominais: TGroupBox
        Width = 722
        Height = 137
        ExplicitWidth = 722
        ExplicitHeight = 137
        object lblNome: TLabel [1]
          Left = 88
          Top = 24
          Width = 31
          Height = 13
          Caption = 'Nome:'
          FocusControl = dbNome
        end
        object lblCPF: TLabel [2]
          Left = 16
          Top = 64
          Width = 23
          Height = 13
          Caption = 'CPF:'
          FocusControl = dbCPF
        end
        object lblComissao: TLabel [3]
          Left = 407
          Top = 64
          Width = 71
          Height = 13
          Caption = 'Comiss'#227'o (%):'
          FocusControl = dbComissao
        end
        object lblComissaoValor: TLabel [4]
          Left = 495
          Top = 64
          Width = 73
          Height = 13
          Caption = 'Comiss'#227'o (R$):'
          FocusControl = dbComissaoValor
        end
        object lblTipoComissao: TLabel [5]
          Left = 150
          Top = 65
          Width = 68
          Height = 13
          Caption = 'Tipo Comiss'#227'o'
          FocusControl = dbTipoComissao
        end
        object lblEmail: TLabel [6]
          Left = 407
          Top = 24
          Width = 32
          Height = 13
          Caption = 'E-mail:'
          FocusControl = dbEmail
        end
        inherited dbCodigo: TDBEdit
          Color = clMoneyGreen
          DataField = 'COD'
        end
        object dbNome: TDBEdit
          Left = 88
          Top = 40
          Width = 313
          Height = 21
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
        object dbCPF: TDBEdit
          Left = 16
          Top = 80
          Width = 128
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CPF'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object dbComissao: TDBEdit
          Left = 407
          Top = 80
          Width = 81
          Height = 21
          CharCase = ecUpperCase
          DataField = 'COMISSAO'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
        object dbComissaoValor: TDBEdit
          Left = 495
          Top = 80
          Width = 97
          Height = 21
          CharCase = ecUpperCase
          DataField = 'COMISSAO_VL'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
        end
        object chkbxAtivo: TDBCheckBox
          Left = 16
          Top = 107
          Width = 113
          Height = 17
          Caption = 'Vendedor Ativo'
          DataField = 'ATIVO'
          DataSource = DtSrcTabela
          TabOrder = 7
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbTipoComissao: TDBLookupComboBox
          Left = 150
          Top = 80
          Width = 251
          Height = 21
          DataField = 'COMISSAO_TIPO'
          DataSource = DtSrcTabela
          DropDownRows = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'CODIGO'
          ListField = 'DESCRICAO'
          ListSource = dtsTipoComissao
          ParentFont = False
          TabOrder = 4
        end
        object dbEmail: TDBEdit
          Left = 407
          Top = 40
          Width = 290
          Height = 21
          CharCase = ecLowerCase
          DataField = 'EMAIL'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
      end
    end
  end
  inherited tlbBotoes: TPanel
    Width = 730
    ExplicitWidth = 730
    inherited bvlTool3: TBevel
      Left = 647
      ExplicitLeft = 647
    end
    inherited bvlTool4: TBevel
      Left = 726
      ExplicitLeft = 726
    end
    inherited btbtnSalvar: TcxButton
      ExplicitLeft = 306
      ExplicitTop = 2
    end
    inherited btbtnFechar: TcxButton
      Left = 651
      ExplicitLeft = 651
    end
    inherited btbtnSelecionar: TcxButton
      Left = 527
      ExplicitLeft = 527
    end
  end
  inherited IbDtstTabela: TIBDataSet
    SelectSQL.Strings = (
      'Select'
      '    v.Cod'
      '  , v.Nome'
      '  , v.Cpf'
      '  , v.Ativo'
      '  , v.comissao_tipo'
      '  , v.comissao'
      '  , v.Comissao_vl'
      '  , Case'
      '      when v.comissao_tipo = 0 then '#39'D'#39
      '      when v.comissao_tipo = 1 then '#39'P'#39
      '      else '#39'*'#39
      '    end comissao_tipo_flag'
      'from TBVENDEDOR v')
    GeneratorField.Field = 'COD'
    GeneratorField.Generator = 'GEN_GRUPOPRODUTO_COD'
  end
  inherited DtSrcTabela: TDataSource
    DataSet = fdQryTabela
    OnDataChange = DtSrcTabelaDataChange
  end
  inherited IbUpdTabela: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  COD,'
      '  NOME,'
      '  CPF,'
      '  COMISSAO_TIPO,'
      '  COMISSAO,'
      '  COMISSAO_VL,'
      '  TIPO,'
      '  ATIVO'
      'from TBVENDEDOR '
      'where'
      '  COD = :COD')
    ModifySQL.Strings = (
      'update TBVENDEDOR'
      'set'
      '  ATIVO = :ATIVO,'
      '  COD = :COD,'
      '  COMISSAO = :COMISSAO,'
      '  COMISSAO_TIPO = :COMISSAO_TIPO,'
      '  COMISSAO_VL = :COMISSAO_VL,'
      '  CPF = :CPF,'
      '  NOME = :NOME'
      'where'
      '  COD = :OLD_COD')
    InsertSQL.Strings = (
      'insert into TBVENDEDOR'
      '  (ATIVO, COD, COMISSAO, COMISSAO_TIPO, COMISSAO_VL, CPF, NOME)'
      'values'
      
        '  (:ATIVO, :COD, :COMISSAO, :COMISSAO_TIPO, :COMISSAO_VL, :CPF, ' +
        ':NOME)')
    DeleteSQL.Strings = (
      'delete from TBVENDEDOR'
      'where'
      '  COD = :OLD_COD')
  end
  inherited ImgList: TImageList
    Left = 600
    Top = 0
  end
  inherited fdQryTabela: TFDQuery
    BeforePost = fdQryTabelaBeforePost
    AfterScroll = fdQryTabelaAfterScroll
    SQL.Strings = (
      'Select'
      '    v.Cod'
      '  , v.Nome'
      '  , v.Email'
      '  , v.Cpf'
      '  , v.Tipo'
      '  , v.Ativo'
      '  , v.comissao_tipo'
      '  , v.comissao'
      '  , v.Comissao_vl'
      '  , Case'
      '      when v.comissao_tipo = 0 then '#39'D'#39
      '      when v.comissao_tipo = 1 then '#39'P'#39
      '      else '#39'*'#39
      '    end comissao_tipo_flag'
      'from TBVENDEDOR v')
    object fdQryTabelaCOD: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD'
      Origin = 'COD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object fdQryTabelaNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 60
    end
    object fdQryTabelaCPF: TStringField
      FieldName = 'CPF'
      Origin = 'CPF'
      Required = True
      EditMask = '000\.000\.000\-00;0; '
      Size = 12
    end
    object fdQryTabelaEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 150
    end
    object fdQryTabelaTIPO: TSmallintField
      FieldName = 'TIPO'
      Origin = 'TIPO'
    end
    object fdQryTabelaCOMISSAO_TIPO: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'COMISSAO_TIPO'
      Origin = 'COMISSAO_TIPO'
    end
    object fdQryTabelaCOMISSAO: TCurrencyField
      DisplayLabel = '% Comiss'#227'o'
      FieldName = 'COMISSAO'
      Origin = 'COMISSAO'
      Required = True
      DisplayFormat = '#0.00'
    end
    object fdQryTabelaCOMISSAO_VL: TCurrencyField
      DisplayLabel = 'Valor Comiss'#227'o'
      FieldName = 'COMISSAO_VL'
      Origin = 'COMISSAO_VL'
      Required = True
      DisplayFormat = ',0.00'
    end
    object fdQryTabelaCOMISSAO_TIPO_FLAG: TStringField
      Alignment = taCenter
      AutoGenerateValue = arDefault
      FieldName = 'COMISSAO_TIPO_FLAG'
      Origin = 'COMISSAO_TIPO_FLAG'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object fdQryTabelaATIVO: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      Required = True
    end
  end
  inherited fdUpdTabela: TFDUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO TBVENDEDOR'
      '(COD, NOME, CPF, EMAIL, COMISSAO_TIPO, '
      '  COMISSAO, COMISSAO_VL, TIPO, ATIVO)'
      
        'VALUES (:NEW_COD, :NEW_NOME, :NEW_CPF, :NEW_EMAIL, :NEW_COMISSAO' +
        '_TIPO, '
      '  :NEW_COMISSAO, :NEW_COMISSAO_VL, :NEW_TIPO, :NEW_ATIVO)')
    ModifySQL.Strings = (
      'UPDATE TBVENDEDOR'
      
        'SET COD = :NEW_COD, NOME = :NEW_NOME, CPF = :NEW_CPF, EMAIL = :N' +
        'EW_EMAIL, '
      '  COMISSAO_TIPO = :NEW_COMISSAO_TIPO, COMISSAO = :NEW_COMISSAO, '
      
        '  COMISSAO_VL = :NEW_COMISSAO_VL, TIPO = :NEW_TIPO, ATIVO = :NEW' +
        '_ATIVO'
      'WHERE COD = :OLD_COD')
    DeleteSQL.Strings = (
      'DELETE FROM TBVENDEDOR'
      'WHERE COD = :OLD_COD')
    FetchRowSQL.Strings = (
      
        'SELECT COD, NOME, CPF, EMAIL, COMISSAO_TIPO, COMISSAO, COMISSAO_' +
        'VL, '
      '  TIPO, ATIVO'
      'FROM TBVENDEDOR'
      'WHERE COD = :OLD_COD')
  end
  object dtsTipoComissao: TDataSource
    DataSet = fdQryTipoComissao
    Left = 624
    Top = 256
  end
  object fdQryTipoComissao: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select *'
      'from VW_TIPO_COMISSAO')
    Left = 596
    Top = 257
  end
end
