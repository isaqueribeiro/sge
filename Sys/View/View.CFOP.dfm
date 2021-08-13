inherited ViewCFOP: TViewCFOP
  Left = 391
  Top = 217
  Caption = 'Tabela CFOP (C'#243'digo Fiscal de Opera'#231#245'es e Presta'#231#245'es)'
  ClientHeight = 555
  ClientWidth = 773
  OldCreateOrder = True
  ExplicitWidth = 789
  ExplicitHeight = 594
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 551
    Width = 773
    ExplicitTop = 443
    ExplicitWidth = 728
  end
  inherited Bevel3: TBevel
    Top = 512
    Width = 773
    ExplicitTop = 404
    ExplicitWidth = 728
  end
  inherited pgcGuias: TPageControl
    Width = 773
    Height = 512
    ExplicitWidth = 773
    ExplicitHeight = 512
    inherited tbsTabela: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 765
      ExplicitHeight = 483
      inherited Bevel4: TBevel
        Top = 417
        Width = 765
        ExplicitTop = 309
        ExplicitWidth = 720
      end
      inherited dbgDados: TDBGrid
        Width = 765
        Height = 417
        Columns = <
          item
            Expanded = False
            FieldName = 'CFOP_COD'
            Title.Caption = 'C'#243'digo '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CFOP_DESCRICAO'
            Title.Caption = 'Descri'#231#227'o '
            Width = 650
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        Top = 421
        Width = 765
        ExplicitTop = 421
        ExplicitWidth = 765
        object Bevel5: TBevel [0]
          Left = 497
          Top = 4
          Width = 4
          Height = 54
          Align = alRight
          Shape = bsSpacer
          ExplicitLeft = 645
          ExplicitTop = 0
          ExplicitHeight = 35
        end
        inherited grpBxFiltro: TGroupBox
          Left = 501
          Width = 260
          TabOrder = 1
          ExplicitLeft = 501
          ExplicitWidth = 260
          inherited lbltFiltrar: TLabel
            Left = 11
            Width = 31
            Caption = 'CFOP:'
            ExplicitLeft = 11
            ExplicitWidth = 31
          end
          inherited edtFiltrar: TEdit
            Left = 50
            Width = 163
            ExplicitLeft = 50
            ExplicitWidth = 163
          end
          inherited btnFiltrar: TcxButton
            Left = 219
            ExplicitLeft = 219
          end
        end
        object rgpTipo: TRadioGroup
          Left = 229
          Top = 4
          Width = 268
          Height = 54
          Align = alRight
          Caption = '&Tipo'
          Columns = 3
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ItemIndex = 0
          Items.Strings = (
            'Todas'
            'Entrada'
            'Sa'#237'da')
          ParentFont = False
          TabOrder = 0
        end
      end
    end
    inherited tbsCadastro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 765
      ExplicitHeight = 483
      inherited Bevel8: TBevel
        Top = 274
        Width = 765
        ExplicitTop = 225
        ExplicitWidth = 720
      end
      inherited GrpBxDadosNominais: TGroupBox
        Width = 765
        Height = 274
        ExplicitWidth = 765
        ExplicitHeight = 274
        object lblNome: TLabel [1]
          Left = 88
          Top = 24
          Width = 96
          Height = 13
          Caption = 'Descri'#231#227'o resumida:'
        end
        object lblEspecificacao: TLabel [2]
          Left = 16
          Top = 112
          Width = 68
          Height = 13
          Caption = 'Especifica'#231#227'o:'
        end
        object lblInformacaoFisco: TLabel [3]
          Left = 16
          Top = 224
          Width = 106
          Height = 13
          Caption = 'Informa'#231#245'es ao Fisco:'
          FocusControl = dbInformacaoFisco
        end
        object lblTipo: TLabel [4]
          Left = 584
          Top = 24
          Width = 24
          Height = 13
          Caption = 'Tipo:'
          FocusControl = dbTipo
        end
        object lblDescricao: TLabel [5]
          Left = 16
          Top = 69
          Width = 98
          Height = 13
          Caption = 'Descri'#231#227'o Completa:'
        end
        inherited dbCodigo: TDBEdit
          DataField = 'CFOP_COD'
          ReadOnly = False
        end
        object dbResumido: TDBEdit
          Left = 88
          Top = 40
          Width = 490
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CFOP_RESUMIDO'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object dbEspecificacao: TDBMemo
          Left = 16
          Top = 128
          Width = 736
          Height = 89
          Anchors = [akLeft, akTop, akRight]
          DataField = 'CFOP_ESPECIFICACAO'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ScrollBars = ssVertical
          TabOrder = 4
        end
        object dbInformacaoFisco: TDBEdit
          Left = 16
          Top = 240
          Width = 736
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          CharCase = ecUpperCase
          DataField = 'CFOP_INFORMACAO_FISCO'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
        object dbTipo: TcxDBImageComboBox
          Left = 584
          Top = 40
          Anchors = [akLeft, akTop, akRight]
          DataBinding.DataField = 'CFOP_TIPO'
          DataBinding.DataSource = DtSrcTabela
          Properties.Images = ImgList
          Properties.Items = <
            item
              Description = 'Entrada'
              ImageIndex = 18
              Value = 1
            end
            item
              Description = 'Sa'#237'da'
              ImageIndex = 18
              Value = 2
            end>
          TabOrder = 2
          Width = 168
        end
        object dbDescricao: TDBEdit
          Left = 16
          Top = 85
          Width = 736
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          CharCase = ecUpperCase
          DataField = 'CFOP_DESCRICAO'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
      end
      object GrpBxParametros: TGroupBox
        Left = 0
        Top = 278
        Width = 765
        Height = 205
        Align = alClient
        Caption = 'Par'#226'metros'
        TabOrder = 1
        DesignSize = (
          765
          205)
        object lblCSTEntrada: TLabel
          Left = 304
          Top = 113
          Width = 187
          Height = 13
          Caption = 'CST Padr'#227'o para Entrada de Produtos:'
          FocusControl = dbCSTEntrada
        end
        object lblCSTSaida: TLabel
          Left = 304
          Top = 153
          Width = 175
          Height = 13
          Caption = 'CST Padr'#227'o para Sa'#237'da de Produtos:'
          FocusControl = dbCSTSaida
        end
        object lblInformeRemessa: TLabel
          Left = 573
          Top = 24
          Width = 179
          Height = 39
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = 
            '* Esta op'#231#227'o transfere estoque para o Cliente na finaliza'#231#227'o das' +
            ' Vendas'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
          ExplicitLeft = 526
        end
        object dbAlteraCustoEntrada: TDBCheckBox
          Left = 16
          Top = 24
          Width = 257
          Height = 17
          Caption = 'CFOP altera o Custo do Produto na Entrada'
          DataField = 'CFOP_ALTERA_CUSTO_PRODUTO'
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
        object dbCSTEntrada: TDBLookupComboBox
          Left = 304
          Top = 132
          Width = 448
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'CFOP_CST_PADRAO_ENTRADA'
          DataSource = DtSrcTabela
          DropDownRows = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'CODIGO'
          ListField = 'DESCRICAO'
          ListSource = DtsCST
          ParentFont = False
          TabOrder = 8
        end
        object dbCSTSaida: TDBLookupComboBox
          Left = 304
          Top = 172
          Width = 448
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'CFOP_CST_PADRAO_SAIDA'
          DataSource = DtSrcTabela
          DropDownRows = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'CODIGO'
          ListField = 'DESCRICAO'
          ListSource = DtsCST
          ParentFont = False
          TabOrder = 9
        end
        object dbCfopDevolucao: TDBCheckBox
          Left = 16
          Top = 70
          Width = 154
          Height = 17
          Caption = 'CFOP de Devolu'#231#227'o'
          DataField = 'CFOP_DEVOLUCAO'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbCfopGerarTitulo: TDBCheckBox
          Left = 304
          Top = 47
          Width = 184
          Height = 17
          Hint = 'Gerar t'#237'tulos A Pagar / A Receber'
          Caption = 'CFOP Gera T'#237'tulos A Receber'
          DataField = 'CFOP_GERAR_TITULO'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbCfopGerarDuplicata: TDBCheckBox
          Left = 304
          Top = 70
          Width = 184
          Height = 17
          Hint = 'Gerar t'#237'tulos A Pagar / A Receber'
          Caption = 'CFOP Gera Duplicata A Pagar'
          DataField = 'CFOP_GERAR_DUPLICATA'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbCfopRemessa: TDBCheckBox
          Left = 304
          Top = 24
          Width = 154
          Height = 17
          Caption = 'CFOP de Remessa'
          DataField = 'CFOP_REMESSA'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object grpBxCfopRetorno: TGroupBox
          Left = 16
          Top = 116
          Width = 249
          Height = 76
          Caption = 'CFOPs de Retorno para:'
          TabOrder = 7
          object lblCfopRetornoDentro: TLabel
            Left = 16
            Top = 26
            Width = 88
            Height = 13
            Caption = 'Dentro do Estado:'
            FocusControl = dbCfopRetornoDentro
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblCfopRetornoFora: TLabel
            Left = 127
            Top = 26
            Width = 77
            Height = 13
            Caption = 'Fora do Estado:'
            FocusControl = dbCfopRetornoFora
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object dbCfopRetornoDentro: TDBEdit
            Left = 16
            Top = 45
            Width = 105
            Height = 21
            DataField = 'CFOP_RETORNO_INTERNO'
            DataSource = DtSrcTabela
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object dbCfopRetornoFora: TDBEdit
            Left = 127
            Top = 45
            Width = 105
            Height = 21
            DataField = 'CFOP_RETORNO_EXTERNO'
            DataSource = DtSrcTabela
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
        end
        object dbAlteraEstoqueEntradaSaida: TDBCheckBox
          Left = 16
          Top = 47
          Width = 257
          Height = 17
          Caption = 'CFOP altera Estoque do Produto na Ent./Sa'#237'da'
          DataField = 'CFOP_ALTERA_ESTOQUE_PRODUTO'
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
        object dbCfopFaturarRemessa: TDBCheckBox
          Left = 16
          Top = 93
          Width = 154
          Height = 17
          Caption = 'CFOP para Faturar Remessas'
          DataField = 'CFOP_FATURAR_REMESSA'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
    end
  end
  inherited tlbBotoes: TPanel
    Top = 516
    Width = 773
    ExplicitTop = 516
    ExplicitWidth = 773
    inherited bvlTool3: TBevel
      Left = 690
      ExplicitLeft = 645
    end
    inherited bvlTool4: TBevel
      Left = 769
      ExplicitLeft = 724
    end
    inherited btbtnFechar: TcxButton
      Left = 694
      ExplicitLeft = 694
    end
    inherited btbtnSelecionar: TcxButton
      Left = 570
      ExplicitLeft = 570
    end
  end
  inherited DtSrcTabela: TDataSource
    OnDataChange = DtSrcTabelaDataChange
    Left = 560
    Top = 0
  end
  inherited ImgList: TImageList
    Left = 512
    Top = 0
  end
  object DtsCST: TDataSource
    Left = 480
    Top = 176
  end
end
