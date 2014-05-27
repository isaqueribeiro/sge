inherited FrmGeVendaItemPesquisa: TFrmGeVendaItemPesquisa
  Left = 126
  Top = 78
  Width = 1132
  Height = 724
  ActiveControl = e1Data
  Caption = 'Consultar Vendas de Produtos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlPesquisa: TPanel
    Width = 1116
    inherited GrpBxTipoPesquisa: TGroupBox
      inherited lblTipoPesquisa: TLabel
        Enabled = True
      end
      inherited edTipoPesquisa: TComboBox
        Enabled = True
        Text = 'Per'#237'odo, Autom'#225'tico'
        Items.Strings = (
          'Per'#237'odo, Autom'#225'tico'
          'Per'#237'odo, Grupo'
          'Per'#237'odo, Vendedor'
          'Per'#237'odo, Cliente')
      end
    end
    inherited GrpBxPesquisar: TGroupBox
      Width = 888
      inherited BrnPesquisar: TSpeedButton
        Left = 851
      end
      inherited lblPesquisar: TLabel
        Left = 240
      end
      object lblData: TLabel [2]
        Left = 16
        Top = 24
        Width = 46
        Height = 13
        Caption = 'Per'#237'o&do:'
        FocusControl = e1Data
      end
      inherited edPesquisar: TEdit
        Left = 240
        Width = 604
        TabOrder = 2
      end
      object e1Data: TDateEdit
        Left = 16
        Top = 40
        Width = 105
        Height = 21
        NumGlyphs = 2
        TabOrder = 0
        Text = '24/06/2013'
      end
      object e2Data: TDateEdit
        Left = 128
        Top = 40
        Width = 105
        Height = 21
        NumGlyphs = 2
        TabOrder = 1
        Text = '24/06/2013'
      end
    end
  end
  inherited PnlTabela: TPanel
    Width = 1116
    Height = 605
    inherited dbgDados: TDBGrid
      Width = 1108
      Height = 597
      Columns = <
        item
          Expanded = False
          FieldName = 'CODPROD'
          Title.Caption = 'C'#243'digo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRODUTO'
          Title.Caption = 'Produto'
          Width = 300
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'GRUPO'
          Title.Caption = 'Grupo'
          Width = 250
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VENDEDOR'
          Title.Caption = 'Vendedor(a)'
          Width = 250
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CLIENTE_NOME'
          Title.Caption = 'Cliente'
          Width = 250
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QUANTIDADE'
          Title.Caption = 'Quant.'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADE'
          Title.Caption = 'Und.'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TOTAL_BRUTO'
          Title.Caption = 'V. Bruto (R$)'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TOTAL_DESCONTO'
          Title.Caption = 'Descontos (R$)'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TOTAL_FINAL'
          Title.Caption = 'V. L'#237'quido (R$)'
          Width = 100
          Visible = True
        end>
    end
  end
  inherited QryPesquisa: TIBQuery
    SQL.Strings = (
      'Select'
      '    i.codprod'
      '  , p.descri as Produto'
      '  , g.descri as Grupo'
      '  , u.unp_sigla as Unidade'
      '  , sum(i.qtde) as Quantidade'
      '  , sum(i.total_bruto)    as total_bruto'
      '  , sum(i.total_desconto) as total_desconto'
      '  , sum(i.total_liquido)  as total_final'
      '  , vd.nome  as Vendedor'
      '  , v.codcli as Cliente_Cpf'
      '  , cl.nome  as Cliente_Nome'
      'from TBVENDAS v'
      '  inner join TBVENDEDOR vd on (vd.cod = v.vendedor_cod)'
      '  inner join TBCLIENTE cl on (cl.codigo = v.codcliente)'
      
        '  inner join TVENDASITENS i on (i.ano = v.ano and i.codcontrol =' +
        ' v.codcontrol)'
      '  inner join TBPRODUTO p on (p.cod = i.codprod)'
      '  left join TBUNIDADEPROD u on (u.unp_cod = i.unid_cod)'
      '  left join TBGRUPOPROD g on (g.cod = p.codgrupo)'
      '')
    ParamData = <>
    object QryPesquisaCODPROD: TIBStringField
      FieldName = 'CODPROD'
      Origin = '"TVENDASITENS"."CODPROD"'
      Required = True
      Size = 10
    end
    object QryPesquisaPRODUTO: TIBStringField
      FieldName = 'PRODUTO'
      ProviderFlags = []
      Size = 50
    end
    object QryPesquisaGRUPO: TIBStringField
      FieldName = 'GRUPO'
      ProviderFlags = []
      Size = 30
    end
    object QryPesquisaUNIDADE: TIBStringField
      FieldName = 'UNIDADE'
      ProviderFlags = []
      Size = 50
    end
    object QryPesquisaQUANTIDADE: TLargeintField
      FieldName = 'QUANTIDADE'
      ProviderFlags = []
      DisplayFormat = ',0.###'
    end
    object QryPesquisaTOTAL_BRUTO: TIBBCDField
      FieldName = 'TOTAL_BRUTO'
      ProviderFlags = []
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object QryPesquisaTOTAL_DESCONTO: TIBBCDField
      FieldName = 'TOTAL_DESCONTO'
      ProviderFlags = []
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object QryPesquisaTOTAL_FINAL: TIBBCDField
      FieldName = 'TOTAL_FINAL'
      ProviderFlags = []
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object QryPesquisaVENDEDOR: TIBStringField
      FieldName = 'VENDEDOR'
      ProviderFlags = []
      Size = 60
    end
    object QryPesquisaCLIENTE_CPF: TIBStringField
      FieldName = 'CLIENTE_CPF'
      ProviderFlags = []
      Size = 18
    end
    object QryPesquisaCLIENTE_NOME: TIBStringField
      FieldName = 'CLIENTE_NOME'
      ProviderFlags = []
      Size = 60
    end
  end
end
