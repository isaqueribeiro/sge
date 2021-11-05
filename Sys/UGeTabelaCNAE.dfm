inherited frmGeTabelaCNAE: TfrmGeTabelaCNAE
  Left = 398
  Top = 210
  Caption = 'Tabela CNAE (C'#243'digo Nacional de Atividades Empresariais)'
  ClientHeight = 445
  ClientWidth = 728
  OldCreateOrder = True
  ExplicitWidth = 744
  ExplicitHeight = 484
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 441
    Width = 728
    ExplicitTop = 442
    ExplicitWidth = 728
  end
  inherited Bevel3: TBevel
    Top = 402
    Width = 728
    ExplicitTop = 403
    ExplicitWidth = 728
  end
  inherited pgcGuias: TPageControl
    Width = 728
    Height = 402
    ExplicitWidth = 728
    ExplicitHeight = 402
    inherited tbsTabela: TTabSheet
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 720
      ExplicitHeight = 373
      inherited Bevel4: TBevel
        Top = 307
        Width = 720
        ExplicitTop = 308
        ExplicitWidth = 720
      end
      inherited dbgDados: TDBGrid
        Width = 720
        Height = 307
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Title.Caption = 'C'#243'digo '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO_RESUMIDA'
            Title.Caption = 'Descri'#231#227'o resumida '
            Width = 600
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        Top = 311
        Width = 720
        ExplicitTop = 311
        ExplicitWidth = 720
        inherited grpBxFiltro: TGroupBox
          Left = 464
          ExplicitLeft = 464
          inherited lbltFiltrar: TLabel
            Left = 14
            Width = 31
            Caption = 'CNAE:'
            ExplicitLeft = 14
            ExplicitWidth = 31
          end
          inherited edtFiltrar: TEdit
            Left = 48
            Width = 155
            ExplicitLeft = 48
            ExplicitWidth = 155
          end
        end
      end
    end
    inherited tbsCadastro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 720
      ExplicitHeight = 373
      inherited Bevel8: TBevel
        Top = 225
        Width = 720
        ExplicitTop = 225
        ExplicitWidth = 720
      end
      inherited GrpBxDadosNominais: TGroupBox
        Width = 720
        Height = 225
        ExplicitWidth = 720
        ExplicitHeight = 225
        object lblDescricaoResumida: TLabel [1]
          Left = 88
          Top = 24
          Width = 96
          Height = 13
          Caption = 'Descri'#231#227'o resumida:'
          FocusControl = dbDescricaoResumida
        end
        object lblNotaExplicativa: TLabel [2]
          Left = 16
          Top = 104
          Width = 81
          Height = 13
          Caption = 'Nota Explicativa:'
          FocusControl = dbNotaExplicativa
        end
        object lblDescricaoCompleta: TLabel [3]
          Left = 16
          Top = 64
          Width = 96
          Height = 13
          Caption = 'Descri'#231#227'o completa:'
          FocusControl = dbDescricaoCompleta
        end
        inherited dbCodigo: TDBEdit
          DataField = 'CODIGO'
          ReadOnly = False
        end
        object dbDescricaoResumida: TDBEdit
          Left = 88
          Top = 40
          Width = 617
          Height = 21
          CharCase = ecUpperCase
          DataField = 'DESCRICAO_RESUMIDA'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object dbNotaExplicativa: TDBMemo
          Left = 16
          Top = 120
          Width = 689
          Height = 89
          DataField = 'NOTA_EXPLICATIVA'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ScrollBars = ssVertical
          TabOrder = 3
        end
        object dbDescricaoCompleta: TDBEdit
          Left = 16
          Top = 80
          Width = 689
          Height = 21
          CharCase = ecUpperCase
          DataField = 'DESCRICAO_COMPLETA'
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
      object GrpBxParametros: TGroupBox
        Left = 0
        Top = 229
        Width = 720
        Height = 144
        Align = alClient
        Caption = 'Par'#226'metros'
        TabOrder = 1
        object dbAtivo: TDBCheckBox
          Left = 16
          Top = 24
          Width = 105
          Height = 17
          Caption = 'Cadastro ativo'
          DataField = 'ATIVA'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbObrigaInscEstadual: TDBCheckBox
          Left = 16
          Top = 48
          Width = 193
          Height = 17
          Caption = #201' obrigat'#243'rio a Inscri'#231#227'o Estadual'
          DataField = 'OBRIGA_INSC_ESTADUAL'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
    end
  end
  inherited tlbBotoes: TPanel
    Top = 406
    Width = 728
    ExplicitTop = 406
    ExplicitWidth = 728
    inherited bvlTool3: TBevel
      Left = 645
      ExplicitLeft = 645
    end
    inherited bvlTool4: TBevel
      Left = 724
      ExplicitLeft = 724
    end
    inherited btbtnFechar: TcxButton
      Left = 649
      ExplicitLeft = 649
    end
    inherited btbtnSelecionar: TcxButton
      Left = 525
      ExplicitLeft = 525
    end
  end
  inherited IbDtstTabela: TIBDataSet
    OnNewRecord = IbDtstTabelaNewRecord
    SelectSQL.Strings = (
      'Select'
      '    c.codigo'
      '  , c.descricao_resumida'
      '  , c.descricao_completa'
      '  , c.nota_explicativa'
      '  , c.obriga_insc_estadual'
      '  , c.ativa'
      'from TBCNAE c')
    Left = 352
    Top = 304
  end
  inherited DtSrcTabela: TDataSource
    DataSet = fdQryTabela
    Top = 72
  end
  inherited IbUpdTabela: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO,'
      '  DESCRICAO_RESUMIDA,'
      '  DESCRICAO_COMPLETA,'
      '  NOTA_EXPLICATIVA,'
      '  OBRIGA_INSC_ESTADUAL,'
      '  ATIVA'
      'from TBCNAE '
      'where'
      '  CODIGO = :CODIGO')
    ModifySQL.Strings = (
      'update TBCNAE'
      'set'
      '  ATIVA = :ATIVA,'
      '  CODIGO = :CODIGO,'
      '  DESCRICAO_COMPLETA = :DESCRICAO_COMPLETA,'
      '  DESCRICAO_RESUMIDA = :DESCRICAO_RESUMIDA,'
      '  NOTA_EXPLICATIVA = :NOTA_EXPLICATIVA,'
      '  OBRIGA_INSC_ESTADUAL = :OBRIGA_INSC_ESTADUAL'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into TBCNAE'
      
        '  (ATIVA, CODIGO, DESCRICAO_COMPLETA, DESCRICAO_RESUMIDA, NOTA_E' +
        'XPLICATIVA, '
      '   OBRIGA_INSC_ESTADUAL)'
      'values'
      
        '  (:ATIVA, :CODIGO, :DESCRICAO_COMPLETA, :DESCRICAO_RESUMIDA, :N' +
        'OTA_EXPLICATIVA, '
      '   :OBRIGA_INSC_ESTADUAL)')
    DeleteSQL.Strings = (
      'delete from TBCNAE'
      'where'
      '  CODIGO = :OLD_CODIGO')
    Left = 384
    Top = 304
  end
  inherited ImgList: TImageList
    Left = 320
    Top = 304
  end
  inherited fdQryTabela: TFDQuery
    SQL.Strings = (
      'Select'
      '    c.codigo'
      '  , c.descricao_resumida'
      '  , c.descricao_completa'
      '  , c.nota_explicativa'
      '  , c.obriga_insc_estadual'
      '  , c.ativa'
      'from TBCNAE c')
    object fdQryTabelaCODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object fdQryTabelaDESCRICAO_RESUMIDA: TStringField
      DisplayLabel = 'Descri'#231#227'o resumida'
      FieldName = 'DESCRICAO_RESUMIDA'
      Origin = 'DESCRICAO_RESUMIDA'
      Required = True
      Size = 250
    end
    object fdQryTabelaDESCRICAO_COMPLETA: TStringField
      DisplayLabel = 'Descri'#231#227'o completa'
      FieldName = 'DESCRICAO_COMPLETA'
      Origin = 'DESCRICAO_COMPLETA'
      Size = 250
    end
    object fdQryTabelaNOTA_EXPLICATIVA: TMemoField
      DisplayLabel = 'Nota explicativa'
      FieldName = 'NOTA_EXPLICATIVA'
      Origin = 'NOTA_EXPLICATIVA'
      BlobType = ftMemo
    end
    object fdQryTabelaOBRIGA_INSC_ESTADUAL: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'OBRIGA_INSC_ESTADUAL'
      Origin = 'OBRIGA_INSC_ESTADUAL'
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
      'INSERT INTO TBCNAE'
      '(CODIGO, DESCRICAO_RESUMIDA, DESCRICAO_COMPLETA, '
      '  NOTA_EXPLICATIVA, OBRIGA_INSC_ESTADUAL, ATIVA)'
      
        'VALUES (:NEW_CODIGO, :NEW_DESCRICAO_RESUMIDA, :NEW_DESCRICAO_COM' +
        'PLETA, '
      '  :NEW_NOTA_EXPLICATIVA, :NEW_OBRIGA_INSC_ESTADUAL, :NEW_ATIVA)')
    ModifySQL.Strings = (
      'UPDATE TBCNAE'
      
        'SET CODIGO = :NEW_CODIGO, DESCRICAO_RESUMIDA = :NEW_DESCRICAO_RE' +
        'SUMIDA, '
      
        '  DESCRICAO_COMPLETA = :NEW_DESCRICAO_COMPLETA, NOTA_EXPLICATIVA' +
        ' = :NEW_NOTA_EXPLICATIVA, '
      
        '  OBRIGA_INSC_ESTADUAL = :NEW_OBRIGA_INSC_ESTADUAL, ATIVA = :NEW' +
        '_ATIVA'
      'WHERE CODIGO = :OLD_CODIGO')
    DeleteSQL.Strings = (
      'DELETE FROM TBCNAE'
      'WHERE CODIGO = :OLD_CODIGO')
    FetchRowSQL.Strings = (
      
        'SELECT CODIGO, DESCRICAO_RESUMIDA, DESCRICAO_COMPLETA, NOTA_EXPL' +
        'ICATIVA, '
      '  OBRIGA_INSC_ESTADUAL, ATIVA'
      'FROM TBCNAE'
      'WHERE CODIGO = :CODIGO')
  end
end
