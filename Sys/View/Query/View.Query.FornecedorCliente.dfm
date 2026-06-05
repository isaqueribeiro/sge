inherited ViewQueryFornecedorCliente: TViewQueryFornecedorCliente
  Caption = 'Pesquisar Fornecedor / Cliente'
  ClientWidth = 777
  TextHeight = 13
  inherited pnlPesquisa: TPanel
    Width = 771
    ExplicitWidth = 771
    inherited GrpBxPesquisar: TGroupBox
      Width = 543
    end
  end
  inherited PnlTabela: TPanel
    Width = 777
    inherited dbgDados: TDBGrid
      Height = 294
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
    inherited pnlBotoes: TPanel
      Top = 301
    end
  end
end
