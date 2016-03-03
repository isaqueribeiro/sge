inherited frmGeFornecedorClientePesquisa: TfrmGeFornecedorClientePesquisa
  Caption = 'Pesquisar Fornecedor / Cliente'
  ClientHeight = 444
  ClientWidth = 747
  ExplicitWidth = 763
  ExplicitHeight = 483
  PixelsPerInch = 96
  TextHeight = 13
  object bvlBotoes2: TBevel [0]
    Left = 0
    Top = 440
    Width = 747
    Height = 4
    Align = alBottom
    Shape = bsSpacer
    ExplicitTop = 290
    ExplicitWidth = 539
  end
  object bvlBotoes1: TBevel [1]
    Left = 0
    Top = 401
    Width = 747
    Height = 4
    Align = alBottom
    Shape = bsSpacer
    ExplicitTop = 251
    ExplicitWidth = 539
  end
  inherited pnlPesquisa: TPanel
    Width = 747
    inherited GrpBxPesquisar: TGroupBox
      Width = 519
      inherited edPesquisar: TEdit
        Width = 459
      end
      inherited BrnPesquisar: TcxButton
        Left = 482
      end
    end
  end
  inherited PnlTabela: TPanel
    Width = 747
    Height = 320
    inherited dbgDados: TDBGrid
      Width = 739
      Height = 312
      Columns = <
        item
          Expanded = False
          FieldName = 'TIPO'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Width = 320
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CNPJ'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ATIVO'
          Title.Alignment = taCenter
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          Visible = False
        end
        item
          Expanded = False
          Visible = False
        end>
    end
  end
  object pnlBotoes: TPanel [4]
    Left = 0
    Top = 405
    Width = 747
    Height = 35
    Align = alBottom
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 2
    ExplicitTop = 412
    ExplicitWidth = 777
    object Bevel2: TBevel
      Left = 664
      Top = 0
      Width = 4
      Height = 35
      Align = alRight
      Shape = bsSpacer
      ExplicitLeft = 438
    end
    object bvlTool4: TBevel
      Left = 743
      Top = 0
      Width = 4
      Height = 35
      Align = alRight
      Shape = bsSpacer
      ExplicitLeft = 535
    end
    object btnSelecionar: TcxButton
      Left = 544
      Top = 0
      Width = 120
      Height = 35
      Align = alRight
      Caption = 'Selecionar (F2)'
      Enabled = False
      OptionsImage.ImageIndex = 10
      OptionsImage.Images = DMRecursos.ImgBotoes16x16
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btnSelecionarClick
      ExplicitLeft = 400
      ExplicitTop = 2
    end
    object btnFechar: TcxButton
      Left = 668
      Top = 0
      Width = 75
      Height = 35
      Align = alRight
      Cancel = True
      Caption = 'Fechar'
      OptionsImage.ImageIndex = 15
      OptionsImage.Images = DMRecursos.ImgBotoes16x16
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btnFecharClick
      ExplicitLeft = 680
    end
  end
  inherited QryPesquisa: TIBQuery
    AfterScroll = QryPesquisaAfterScroll
    SQL.Strings = (
      'Select'
      '    1 as Tipo -- Fornecedor'
      '  , '#39'01'#39' || right('#39'0000000'#39' || f.codforn, 7) as ID'
      '  , f.codforn        as Codigo'
      '  , trim(f.nomeforn) as Nome'
      '  , f.cnpj           as Cnpj'
      '  , f.pessoa_fisica  as PF'
      '  , f.ativo'
      'from TBFORNECEDOR f'
      'where 1=1'
      '  and f.cliente_origem_cod is null'
      ''
      'union'
      ''
      'Select'
      '    2 as Tipo -- Cliente'
      '  , '#39'02'#39' || right('#39'0000000'#39' || c.codigo, 7) as ID'
      '  , c.codigo        as Codigo'
      '  , trim(c.nome)    as Nome'
      '  , c.cnpj          as Cnpj'
      '  , c.pessoa_fisica as PF'
      '  , c.ativo'
      'from TBCLIENTE c'
      'where 2=2'
      ''
      'order by'
      '    4, 5')
    Left = 80
    Top = 153
    ParamData = <>
    object QryPesquisaTIPO: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      ProviderFlags = []
      OnGetText = QryPesquisaTIPOGetText
    end
    object QryPesquisaID: TIBStringField
      FieldName = 'ID'
      ProviderFlags = []
    end
    object QryPesquisaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = '"TBFORNECEDOR"."CODFORN"'
      Required = True
    end
    object QryPesquisaNOME: TIBStringField
      DisplayLabel = 'Fornecedor / Cliente'
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object QryPesquisaCNPJ: TIBStringField
      DisplayLabel = 'CPF / CNPJ'
      FieldName = 'CNPJ'
      Origin = '"TBFORNECEDOR"."CNPJ"'
      OnGetText = QryPesquisaCNPJGetText
      Size = 18
    end
    object QryPesquisaPF: TSmallintField
      FieldName = 'PF'
      Origin = '"TBFORNECEDOR"."PESSOA_FISICA"'
    end
    object QryPesquisaATIVO: TSmallintField
      Alignment = taCenter
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Origin = '"TBFORNECEDOR"."ATIVO"'
      OnGetText = QryPesquisaATIVOGetText
    end
  end
  inherited DtsPesquisa: TDataSource
    Left = 112
    Top = 153
  end
end
