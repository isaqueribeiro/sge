inherited ViewPerfil: TViewPerfil
  Left = 394
  Top = 213
  ActiveControl = dbCodigo
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  Caption = 'Cadastro de Perfis de Acesso'
  ClientHeight = 407
  ClientWidth = 737
  ExplicitWidth = 753
  ExplicitHeight = 446
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 403
    Width = 737
    ExplicitTop = 405
    ExplicitWidth = 741
  end
  inherited Bevel3: TBevel
    Top = 364
    Width = 737
    ExplicitTop = 366
    ExplicitWidth = 741
  end
  inherited pgcGuias: TPageControl
    Width = 737
    Height = 364
    ActivePage = tbsCadastro
    OnChange = pgcGuiasChange
    ExplicitWidth = 737
    ExplicitHeight = 364
    inherited tbsTabela: TTabSheet
      ExplicitWidth = 733
      ExplicitHeight = 336
      inherited Bevel4: TBevel
        Top = 262
        Width = 733
        ExplicitTop = 271
        ExplicitWidth = 733
      end
      inherited dbgDados: TDBGrid
        Width = 733
        Height = 262
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
        Top = 266
        Width = 733
        ExplicitTop = 266
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
            Left = 109
            Width = 152
            ExplicitLeft = 109
            ExplicitWidth = 152
          end
          inherited btnFiltrar: TcxButton
            Left = 267
            ExplicitLeft = 267
          end
        end
      end
    end
    inherited tbsCadastro: TTabSheet
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
        ExplicitWidth = 729
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
        ExplicitWidth = 729
        ExplicitHeight = 250
        object TreeMenu: TTreeView
          AlignWithMargins = True
          Left = 10
          Top = 23
          Width = 713
          Height = 218
          Hint = 
            'Pressione espa'#231'o para mudar o tipo de acesso ou '#13#10'clique para di' +
            'reita para selecionar os tipos de acesso'
          Margins.Left = 8
          Margins.Top = 8
          Margins.Right = 8
          Margins.Bottom = 8
          Align = alClient
          BorderStyle = bsNone
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
    Top = 368
    Width = 737
    ExplicitTop = 368
    ExplicitWidth = 737
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
      ExplicitLeft = 658
    end
    inherited btbtnSelecionar: TcxButton
      Left = 538
      ExplicitLeft = 534
    end
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
end
