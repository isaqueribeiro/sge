inherited frmGrUsuarioPerfil: TfrmGrUsuarioPerfil
  Left = 394
  Top = 213
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  Caption = 'Cadastro de Perfis de Acesso'
  ClientHeight = 408
  ClientWidth = 741
  OldCreateOrder = True
  ExplicitWidth = 757
  ExplicitHeight = 447
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 404
    Width = 741
    ExplicitTop = 405
    ExplicitWidth = 741
  end
  inherited Bevel3: TBevel
    Top = 365
    Width = 741
    ExplicitTop = 366
    ExplicitWidth = 741
  end
  inherited pgcGuias: TPageControl
    Width = 741
    Height = 365
    OnChange = pgcGuiasChange
    ExplicitWidth = 741
    ExplicitHeight = 365
    inherited tbsTabela: TTabSheet
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 733
      ExplicitHeight = 336
      inherited Bevel4: TBevel
        Top = 270
        Width = 733
        ExplicitTop = 271
        ExplicitWidth = 733
      end
      inherited dbgDados: TDBGrid
        Width = 733
        Height = 270
        Columns = <
          item
            Expanded = False
            FieldName = 'COD'
            Title.Caption = 'C'#243'digo '
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FUNCAO'
            Title.Caption = 'Descri'#231#227'o '
            Width = 350
            Visible = True
          end
          item
            Expanded = False
            Title.Alignment = taCenter
            Title.Caption = 'Particular '
            Visible = False
          end>
      end
      inherited pnlFiltros: TPanel
        Top = 274
        Width = 733
        ExplicitTop = 274
        ExplicitWidth = 733
        inherited grpBxFiltro: TGroupBox
          Left = 424
          Width = 305
          ExplicitLeft = 424
          ExplicitWidth = 305
          inherited lbltFiltrar: TLabel
            Width = 92
            Caption = 'Perfil de Acesso:'
            ExplicitWidth = 92
          end
          inherited edtFiltrar: TEdit
            Left = 104
            Width = 152
            ExplicitLeft = 104
            ExplicitWidth = 152
          end
          inherited btnFiltrar: TcxButton
            Left = 260
            ExplicitLeft = 260
          end
        end
      end
    end
    inherited tbsCadastro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 733
      ExplicitHeight = 336
      inherited Bevel8: TBevel
        Top = 81
        Width = 733
        ExplicitTop = 81
        ExplicitWidth = 733
      end
      inherited GrpBxDadosNominais: TGroupBox
        Width = 733
        Height = 81
        ExplicitWidth = 733
        ExplicitHeight = 81
        object lblDescricao: TLabel [1]
          Left = 88
          Top = 24
          Width = 50
          Height = 13
          Caption = 'Descri'#231#227'o:'
          FocusControl = dbDescricao
        end
        inherited dbCodigo: TDBEdit
          Color = clMoneyGreen
          DataField = 'COD'
        end
        object dbDescricao: TDBEdit
          Left = 88
          Top = 40
          Width = 337
          Height = 21
          CharCase = ecUpperCase
          DataField = 'FUNCAO'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
      end
      object GrpBxDadosClassificacao: TGroupBox
        Left = 0
        Top = 85
        Width = 733
        Height = 251
        Align = alClient
        Caption = 'Permiss'#245'es'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object TreeMenu: TTreeView
          Left = 2
          Top = 15
          Width = 729
          Height = 234
          Hint = 
            'Pressione espa'#231'o para mudar o tipo de acesso ou '#13#10'clique para di' +
            'reita para selecionar os tipos de acesso'
          Align = alClient
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          HotTrack = True
          Images = ImgList
          Indent = 21
          ParentFont = False
          ParentShowHint = False
          PopupMenu = PopMenuTree
          ReadOnly = True
          RightClickSelect = True
          RowSelect = True
          ShowHint = False
          TabOrder = 0
        end
      end
    end
  end
  inherited tlbBotoes: TPanel
    Top = 369
    Width = 741
    ExplicitTop = 369
    ExplicitWidth = 741
    inherited bvlTool3: TBevel
      Left = 658
      ExplicitLeft = 658
    end
    inherited bvlTool4: TBevel
      Left = 737
      ExplicitLeft = 737
    end
    inherited btbtnFechar: TcxButton
      Left = 662
      ExplicitLeft = 662
    end
    inherited btbtnSelecionar: TcxButton
      Left = 538
      ExplicitLeft = 538
    end
  end
  inherited IbDtstTabela: TIBDataSet
    SelectSQL.Strings = ()
  end
  inherited DtSrcTabela: TDataSource
    DataSet = fdQryTabela
  end
  inherited IbUpdTabela: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  COD,'
      '  FUNCAO'
      'from TBFUNCAO '
      'where'
      '  COD = :COD')
    ModifySQL.Strings = (
      'update TBFUNCAO'
      'set'
      '  COD = :COD,'
      '  FUNCAO = :FUNCAO'
      'where'
      '  COD = :OLD_COD')
    InsertSQL.Strings = (
      'insert into TBFUNCAO'
      '  (COD, FUNCAO)'
      'values'
      '  (:COD, :FUNCAO)')
    DeleteSQL.Strings = (
      'delete from TBFUNCAO'
      'where'
      '  COD = :OLD_COD')
  end
  inherited fdQryTabela: TFDQuery
    AfterCancel = fdQryTabelaAfterCancel
    SQL.Strings = (
      'Select'
      '    f.cod'
      '  , f.funcao'
      'from TBFUNCAO f')
    object fdQryTabelaCOD: TSmallintField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD'
      Origin = 'COD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object fdQryTabelaFUNCAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'FUNCAO'
      Origin = 'FUNCAO'
      Size = 25
    end
  end
  inherited fdUpdTabela: TFDUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO TBFUNCAO'
      '(COD, FUNCAO)'
      'VALUES (:NEW_COD, :NEW_FUNCAO)')
    ModifySQL.Strings = (
      'UPDATE TBFUNCAO'
      'SET COD = :NEW_COD, FUNCAO = :NEW_FUNCAO'
      'WHERE COD = :OLD_COD')
    DeleteSQL.Strings = (
      'DELETE FROM TBFUNCAO'
      'WHERE COD = :OLD_COD')
    FetchRowSQL.Strings = (
      'SELECT COD, FUNCAO'
      'FROM TBFUNCAO'
      'WHERE COD = :COD')
  end
  object PopMenuTree: TPopupMenu
    Images = ImgList
    Left = 312
    Top = 176
    object miRestrito: TMenuItem
      Caption = 'Restrito'
      OnClick = SetPermissaoPopup
    end
    object miDisponivel: TMenuItem
      Tag = 1
      Caption = 'Dispon'#237'vel'
      OnClick = SetPermissaoPopup
    end
    object miInvisivel: TMenuItem
      Tag = 2
      Caption = 'Invis'#237'vel'
      Visible = False
      OnClick = SetPermissaoPopup
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object miRestritoTodas: TMenuItem
      Caption = 'Restrigir Todas'
      ImageIndex = 41
      OnClick = SetPermissaoPopupTodas
    end
    object miDisponivelTodas: TMenuItem
      Tag = 1
      Caption = 'Disponibilizar Todas'
      ImageIndex = 42
      OnClick = SetPermissaoPopupTodas
    end
    object miInverterMarcacao: TMenuItem
      Tag = 2
      Caption = 'Inverter Marca'#231#227'o'
      OnClick = SetPermissaoPopupTodas
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object miCopiarPerfil: TMenuItem
      Caption = 'Copiar perfil de...'
      OnClick = miCopiarPerfilClick
    end
  end
  object dspMenu: TDataSetProvider
    DataSet = qryMenu
    Left = 120
    Top = 176
  end
  object cdsMenu: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftSmallint
        Name = 'SISTEMA'
        ParamType = ptInput
      end>
    ProviderName = 'dspMenu'
    Left = 152
    Top = 176
  end
  object dspSubMenu: TDataSetProvider
    DataSet = qrySubMenu
    Left = 120
    Top = 224
  end
  object cdsSubMenu: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftSmallint
        Name = 'SISTEMA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ROTINA'
        ParamType = ptInput
        Size = 10
      end>
    ProviderName = 'dspSubMenu'
    Left = 152
    Top = 224
  end
  object dspPermissao: TDataSetProvider
    DataSet = qryPermissao
    Left = 120
    Top = 272
  end
  object cdsPermissao: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftSmallint
        Name = 'SISTEMA'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'PERFIL'
        ParamType = ptInput
      end>
    ProviderName = 'dspPermissao'
    Left = 152
    Top = 272
  end
  object stpFuncaoPermissao: TFDStoredProc
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    StoredProcName = 'SET_FUNCAO_PERMISSAO'
    Left = 640
    Top = 136
    ParamData = <
      item
        Position = 1
        Name = 'SIS_CODIGO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'FUN_CODIGO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'ROT_CODIGO'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 4
        Name = 'ACESSO'
        DataType = ftSmallint
        ParamType = ptInput
      end>
  end
  object qryMenu: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    r.rot_cod'
      '  , r.rot_tipo'
      '  , r.rot_descricao'
      '  , r.rot_cod_pai'
      'from SYS_ROTINA r'
      '  inner join SYS_SISTEMA_ROTINA s on (s.rot_cod = r.rot_cod)'
      ''
      'where s.sis_cod = :sistema'
      '  and r.rot_tipo = 0'
      '  and r.rot_cod_pai is null'
      ''
      'order by'
      '    r.rot_cod')
    Left = 88
    Top = 176
    ParamData = <
      item
        Name = 'SISTEMA'
        DataType = ftSmallint
        ParamType = ptInput
        Value = Null
      end>
  end
  object qrySubMenu: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    r.rot_cod'
      '  , r.rot_tipo'
      '  , r.rot_descricao'
      '  , r.rot_cod_pai'
      'from SYS_ROTINA r'
      '  inner join SYS_SISTEMA_ROTINA s on (s.rot_cod = r.rot_cod)'
      ''
      'where s.sis_cod     = :sistema'
      '  and r.rot_cod_pai = :rotina'
      ''
      'order by'
      '    r.rot_cod')
    Left = 88
    Top = 224
    ParamData = <
      item
        Name = 'SISTEMA'
        DataType = ftSmallint
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ROTINA'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end>
  end
  object qryPermissao: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    p.sistema'
      '  , p.funcao'
      '  , p.rotina'
      '  , p.acesso'
      'from SYS_FUNCAO_PERMISSAO p'
      'where p.sistema = :sistema'
      '  and p.funcao  = :perfil'
      ''
      'order by'
      '    p.rotina')
    Left = 88
    Top = 272
    ParamData = <
      item
        Name = 'SISTEMA'
        DataType = ftSmallint
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PERFIL'
        DataType = ftSmallint
        ParamType = ptInput
      end>
  end
end
