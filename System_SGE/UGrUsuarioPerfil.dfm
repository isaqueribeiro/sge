inherited frmGrUsuarioPerfil: TfrmGrUsuarioPerfil
  Left = 386
  Top = 212
  Width = 757
  Height = 447
  ActiveControl = dbCodigo
  Caption = 'Cadastro de Perfis de Acesso'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 405
    Width = 741
  end
  inherited Bevel3: TBevel
    Top = 366
    Width = 741
  end
  inherited tlbBotoes: TToolBar
    Top = 370
    Width = 741
  end
  inherited pgcGuias: TPageControl
    Width = 741
    Height = 366
    ActivePage = tbsCadastro
    OnChange = pgcGuiasChange
    inherited tbsTabela: TTabSheet
      inherited Bevel4: TBevel
        Top = 271
        Width = 733
      end
      inherited dbgDados: TDBGrid
        Width = 733
        Height = 271
        Columns = <
          item
            Expanded = False
            FieldName = 'COD'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FUNCAO'
            Width = 350
            Visible = True
          end
          item
            Expanded = False
            Title.Alignment = taCenter
            Title.Caption = 'Particular'
            Visible = False
          end>
      end
      inherited pnlFiltros: TPanel
        Top = 275
        Width = 733
        inherited grpBxFiltro: TGroupBox
          Left = 424
          Width = 305
          inherited lbltFiltrar: TLabel
            Width = 92
            Caption = 'Perfil de Acesso:'
          end
          inherited btnFiltrar: TSpeedButton
            Left = 260
          end
          inherited edtFiltrar: TEdit
            Left = 104
            Width = 152
          end
        end
      end
    end
    inherited tbsCadastro: TTabSheet
      inherited Bevel8: TBevel
        Top = 81
        Width = 733
      end
      inherited GrpBxDadosNominais: TGroupBox
        Width = 733
        Height = 81
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
        Height = 252
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
          Height = 235
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
  inherited IbDtstTabela: TIBDataSet
    AfterCancel = IbDtstTabelaAfterCancel
    OnNewRecord = IbDtstTabelaNewRecord
    SelectSQL.Strings = (
      'Select'
      '    f.cod'
      '  , f.funcao'
      'from TBFUNCAO f')
    object IbDtstTabelaCOD: TSmallintField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD'
      Origin = '"TBFUNCAO"."COD"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IbDtstTabelaFUNCAO: TIBStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'FUNCAO'
      Origin = '"TBFUNCAO"."FUNCAO"'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 25
    end
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
  object qryMenu: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
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
        DataType = ftSmallint
        Name = 'sistema'
        ParamType = ptInput
        Value = 0
      end>
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
        Name = 'sistema'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspMenu'
    Left = 152
    Top = 176
  end
  object qrySubMenu: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
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
        DataType = ftSmallint
        Name = 'sistema'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftString
        Name = 'rotina'
        ParamType = ptInput
        Value = ''
      end>
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
        Name = 'sistema'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftString
        Name = 'rotina'
        ParamType = ptInput
        Value = ''
      end>
    ProviderName = 'dspSubMenu'
    Left = 152
    Top = 224
  end
  object qryPermissao: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
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
        DataType = ftSmallint
        Name = 'sistema'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftSmallint
        Name = 'perfil'
        ParamType = ptInput
        Value = 0
      end>
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
        Name = 'sistema'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftSmallint
        Name = 'perfil'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspPermissao'
    Left = 152
    Top = 272
  end
  object stpFuncaoPermissao: TIBStoredProc
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    StoredProcName = 'SET_FUNCAO_PERMISSAO'
    Left = 624
    Top = 56
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'SIS_CODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'FUN_CODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ROT_CODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'ACESSO'
        ParamType = ptInput
      end>
  end
end
