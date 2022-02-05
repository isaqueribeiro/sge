inherited ViewQueryFornecedorCliente: TViewQueryFornecedorCliente
  Caption = 'Pesquisar Fornecedor / Cliente'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlTabela: TPanel
    inherited dbgDados: TDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'tipo'
          Title.Caption = 'Tipo'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'id'
          Title.Caption = 'Id'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nome'
          Title.Caption = 'Fornecedor / Cliente '
          Width = 320
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cnpj'
          Title.Caption = 'CPF / CNPJ '
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ativo'
          Title.Alignment = taCenter
          Title.Caption = 'Ativo '
          Width = 40
          Visible = True
        end>
    end
  end
end
