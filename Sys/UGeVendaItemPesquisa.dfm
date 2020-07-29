inherited FrmGeVendaItemPesquisa: TFrmGeVendaItemPesquisa
  Left = 387
  Top = 208
  ActiveControl = nil
  Caption = 'Consultar Vendas de Produtos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlPesquisa: TPanel
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
      inherited lblPesquisar: TLabel
        Left = 240
        ExplicitLeft = 240
      end
      object lblData: TLabel [1]
        Left = 16
        Top = 24
        Width = 46
        Height = 13
        Caption = 'Per'#237'o&do:'
        FocusControl = e1Data
      end
      inherited edPesquisar: TEdit
        Left = 240
        Width = 273
        TabOrder = 2
        ExplicitLeft = 240
        ExplicitWidth = 273
      end
      inherited BrnPesquisar: TcxButton
        Left = 519
        TabOrder = 3
        ExplicitLeft = 519
      end
      object e1Data: TJvDateEdit
        Left = 16
        Top = 40
        Width = 104
        Height = 21
        Date = 41449.000000000000000000
        Glyph.Data = {
          76050000424D760500000000000036000000280000001C0000000C0000000100
          2000000000004005000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF008080800080808000808080008080800080808000808080008080
          800080808000808080008080800080808000FF00FF00FF00FF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FF00FF00FF00FF000000000000000000800000000000
          0000800000008000000000000000800000000000000000000000800000008080
          8000FF00FF008080800080808000808080008080800080808000808080008080
          80008080800080808000808080008080800080808000FFFFFF00FF00FF00FF00
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
          FF00FFFFFF00FFFFFF00FFFFFF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FF00
          FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF0000000000000000000000
          0000FFFFFF00000000000000000000000000C0C0C000FFFFFF00800000008080
          8000FF00FF0080808000FFFFFF00808080008080800080808000FF00FF008080
          80008080800080808000FF00FF00FFFFFF0080808000FFFFFF00FF00FF00FF00
          FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00C0C0C000FFFFFF00C0C0
          C00000000000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
          FF0080808000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF0080808000FFFF
          FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF00FFFFFF0000000000FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00800000008080
          8000FF00FF0080808000FFFFFF00FF00FF0080808000FFFFFF00FF00FF00FF00
          FF00FFFFFF00FFFFFF0080808000FF00FF0080808000FFFFFF00FF00FF00FF00
          FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000000000000000
          0000C0C0C000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
          FF0080808000FFFFFF00FF00FF00808080008080800080808000FF00FF00FF00
          FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF000000000000000000FFFF
          FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00800000008080
          8000FF00FF0080808000FFFFFF008080800080808000FFFFFF00FF00FF008080
          8000FFFFFF00FFFFFF00FFFFFF00FFFFFF0080808000FFFFFF00FF00FF00FF00
          FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000000000000000
          000000000000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
          FF0080808000FF00FF00FF00FF0080808000808080008080800080808000FF00
          FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00800000008080
          8000FF00FF0080808000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF0080808000FFFFFF00FF00FF00FF00
          FF00FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
          C000C0C0C000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF0080808000FFFFFF00FF00FF00FF00FF000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF008080800080808000808080008080800080808000808080008080
          80008080800080808000808080008080800080808000FF00FF00}
        ImageKind = ikCustom
        NumGlyphs = 2
        PopupColor = clBtnFace
        ShowNullDate = False
        TabOrder = 0
      end
      object e2Data: TJvDateEdit
        Left = 128
        Top = 40
        Width = 104
        Height = 21
        Date = 41449.000000000000000000
        Glyph.Data = {
          76050000424D760500000000000036000000280000001C0000000C0000000100
          2000000000004005000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF008080800080808000808080008080800080808000808080008080
          800080808000808080008080800080808000FF00FF00FF00FF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FF00FF00FF00FF000000000000000000800000000000
          0000800000008000000000000000800000000000000000000000800000008080
          8000FF00FF008080800080808000808080008080800080808000808080008080
          80008080800080808000808080008080800080808000FFFFFF00FF00FF00FF00
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
          FF00FFFFFF00FFFFFF00FFFFFF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FF00
          FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF0000000000000000000000
          0000FFFFFF00000000000000000000000000C0C0C000FFFFFF00800000008080
          8000FF00FF0080808000FFFFFF00808080008080800080808000FF00FF008080
          80008080800080808000FF00FF00FFFFFF0080808000FFFFFF00FF00FF00FF00
          FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00C0C0C000FFFFFF00C0C0
          C00000000000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
          FF0080808000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF0080808000FFFF
          FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF00FFFFFF0000000000FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00800000008080
          8000FF00FF0080808000FFFFFF00FF00FF0080808000FFFFFF00FF00FF00FF00
          FF00FFFFFF00FFFFFF0080808000FF00FF0080808000FFFFFF00FF00FF00FF00
          FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000000000000000
          0000C0C0C000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
          FF0080808000FFFFFF00FF00FF00808080008080800080808000FF00FF00FF00
          FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF000000000000000000FFFF
          FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00800000008080
          8000FF00FF0080808000FFFFFF008080800080808000FFFFFF00FF00FF008080
          8000FFFFFF00FFFFFF00FFFFFF00FFFFFF0080808000FFFFFF00FF00FF00FF00
          FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000000000000000
          000000000000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
          FF0080808000FF00FF00FF00FF0080808000808080008080800080808000FF00
          FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00800000008080
          8000FF00FF0080808000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF0080808000FFFFFF00FF00FF00FF00
          FF00FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
          C000C0C0C000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF0080808000FFFFFF00FF00FF00FF00FF000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF008080800080808000808080008080800080808000808080008080
          80008080800080808000808080008080800080808000FF00FF00}
        ImageKind = ikCustom
        NumGlyphs = 2
        PopupColor = clBtnFace
        ShowNullDate = False
        TabOrder = 1
      end
    end
  end
  inherited PnlTabela: TPanel
    inherited dbgDados: TDBGrid
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
  inherited fdQryPesquisa: TFDQuery
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
      '  left join TBGRUPOPROD g on (g.cod = p.codgrupo)')
    object fdQryPesquisaCODPROD: TStringField
      FieldName = 'CODPROD'
      Origin = 'CODPROD'
      Required = True
      Size = 10
    end
    object fdQryPesquisaPRODUTO: TStringField
      FieldName = 'PRODUTO'
      Origin = 'PRODUTO'
      Size = 50
    end
    object fdQryPesquisaGRUPO: TStringField
      FieldName = 'GRUPO'
      Origin = 'GRUPO'
      Size = 30
    end
    object fdQryPesquisaUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      Size = 5
    end
    object fdQryPesquisaVENDEDOR: TStringField
      FieldName = 'VENDEDOR'
      Origin = 'VENDEDOR'
      Size = 60
    end
    object fdQryPesquisaCLIENTE_CPF: TStringField
      FieldName = 'CLIENTE_CPF'
      Origin = 'CLIENTE_CPF'
      Size = 18
    end
    object fdQryPesquisaCLIENTE_NOME: TStringField
      FieldName = 'CLIENTE_NOME'
      Origin = 'CLIENTE_NOME'
      Size = 100
    end
    object fdQryPesquisaQUANTIDADE: TFMTBCDField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
      Precision = 18
      Size = 3
    end
    object fdQryPesquisaTOTAL_BRUTO: TFMTBCDField
      FieldName = 'TOTAL_BRUTO'
      Origin = 'TOTAL_BRUTO'
      Precision = 18
      Size = 2
    end
    object fdQryPesquisaTOTAL_DESCONTO: TFMTBCDField
      FieldName = 'TOTAL_DESCONTO'
      Origin = 'TOTAL_DESCONTO'
      Precision = 18
      Size = 2
    end
    object fdQryPesquisaTOTAL_FINAL: TFMTBCDField
      FieldName = 'TOTAL_FINAL'
      Origin = 'TOTAL_FINAL'
      Precision = 18
      Size = 2
    end
  end
  inherited QryPesquisaXXX: TIBQuery
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
  end
end
