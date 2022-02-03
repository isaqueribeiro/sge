inherited ViewQueryFornecedorCliente: TViewQueryFornecedorCliente
  Caption = 'ViewQueryFornecedorCliente'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlPesquisa: TPanel
    ExplicitLeft = 3
    ExplicitTop = 3
    ExplicitWidth = 771
    inherited GrpBxTipoPesquisa: TGroupBox
      inherited lblTipoPesquisa: TLabel
        ExplicitTop = 24
      end
    end
    inherited GrpBxPesquisar: TGroupBox
      ExplicitWidth = 543
      inherited lblPesquisar: TLabel
        ExplicitTop = 24
      end
      inherited edPesquisar: TEdit
        ExplicitWidth = 495
      end
      inherited BtnPesquisar: TcxButton
        ExplicitLeft = 510
      end
    end
  end
  inherited PnlTabela: TPanel
    ExplicitTop = 84
    ExplicitHeight = 346
    inherited pnlBotoes: TPanel
      inherited btnSelecionar: TcxButton
        ExplicitLeft = 543
      end
      inherited btnFechar: TcxButton
        ExplicitLeft = 656
      end
    end
  end
end
