inherited ViewConfiguracaoEmpresa: TViewConfiguracaoEmpresa
  Left = 407
  Top = 238
  ActiveControl = nil
  Caption = 'Configura'#231#245'es da Empresa'
  ClientHeight = 506
  ClientWidth = 751
  OldCreateOrder = True
  ExplicitWidth = 767
  ExplicitHeight = 545
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 502
    Width = 751
    ExplicitTop = 453
    ExplicitWidth = 751
  end
  inherited Bevel3: TBevel
    Top = 463
    Width = 751
    ExplicitTop = 414
    ExplicitWidth = 751
  end
  inherited pgcGuias: TPageControl
    Width = 751
    Height = 463
    ActivePage = tbsCadastro
    ExplicitWidth = 751
    ExplicitHeight = 463
    inherited tbsTabela: TTabSheet
      ExplicitWidth = 743
      ExplicitHeight = 434
      inherited Bevel4: TBevel
        Top = 368
        Width = 743
        ExplicitTop = 319
        ExplicitWidth = 743
      end
      inherited dbgDados: TDBGrid
        Width = 743
        Height = 368
        Columns = <
          item
            Expanded = False
            FieldName = 'EMPRESA'
            Title.Caption = 'CNPJ '
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RZSOC'
            Title.Caption = 'Raz'#227'o Social '
            Width = 400
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NFE_EMITIR'
            Title.Alignment = taCenter
            Title.Caption = 'NFe '
            Width = 35
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NFCE_EMITIR'
            Title.Alignment = taCenter
            Title.Caption = 'NFCe '
            Width = 35
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NFSE_EMITIR'
            Title.Alignment = taCenter
            Title.Caption = 'NFSe '
            Width = 35
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        Top = 372
        Width = 743
        ExplicitTop = 372
        ExplicitWidth = 743
        inherited grpBxFiltro: TGroupBox
          Left = 383
          Width = 356
          ExplicitLeft = 383
          ExplicitWidth = 356
          inherited lbltFiltrar: TLabel
            Left = 14
            Width = 52
            Caption = 'Empresa:'
            ExplicitLeft = 14
            ExplicitWidth = 52
          end
          inherited edtFiltrar: TEdit
            Width = 237
            ExplicitWidth = 237
            ExplicitHeight = 23
          end
          inherited btnFiltrar: TcxButton
            Left = 315
            ExplicitLeft = 281
          end
        end
      end
    end
    inherited tbsCadastro: TTabSheet
      ExplicitWidth = 743
      ExplicitHeight = 434
      inherited Bevel8: TBevel
        Top = 81
        Width = 743
        ExplicitTop = 81
        ExplicitWidth = 743
      end
      inherited GrpBxDadosNominais: TGroupBox
        Width = 743
        Height = 81
        Caption = 'Empresa'
        ExplicitWidth = 743
        ExplicitHeight = 81
        inherited lblCodigo: TLabel
          Width = 30
          Caption = 'CNPJ:'
          ExplicitWidth = 30
        end
        object lblEmpresa: TLabel [1]
          Left = 240
          Top = 24
          Width = 64
          Height = 13
          Caption = 'Raz'#227'o Social:'
          FocusControl = dbEmpresa
        end
        inherited dbCodigo: TDBEdit
          Width = 217
          Color = clMoneyGreen
          DataField = 'EMPRESA'
          ExplicitWidth = 217
        end
        object dbEmpresa: TDBLookupComboBox
          Left = 240
          Top = 40
          Width = 489
          Height = 21
          DataField = 'EMPRESA'
          DataSource = DtSrcTabela
          DropDownRows = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'CNPJ'
          ListField = 'RZSOC'
          ListSource = dtsEmpresa
          ParentFont = False
          TabOrder = 1
        end
      end
      object pgcConfigurar: TPageControl
        Left = 0
        Top = 85
        Width = 743
        Height = 349
        ActivePage = tbsContaEmail
        Align = alClient
        TabOrder = 1
        object tbsContaEmail: TTabSheet
          Caption = 'Conta de E-mail'
          object lblEmailConta: TLabel
            Left = 16
            Top = 8
            Width = 32
            Height = 13
            Caption = 'E-mail:'
            FocusControl = dbEmailConta
          end
          object lblEmailSenha: TLabel
            Left = 312
            Top = 8
            Width = 34
            Height = 13
            Caption = 'Senha:'
            FocusControl = dbEmailSenha
          end
          object lblEmailPOP: TLabel
            Left = 16
            Top = 48
            Width = 67
            Height = 13
            Caption = 'Servidor POP:'
            FocusControl = dbEmailPOP
          end
          object lblEmailSMTP: TLabel
            Left = 224
            Top = 48
            Width = 73
            Height = 13
            Caption = 'Servidor SMTP:'
            FocusControl = dbEmailSMTP
          end
          object lblEmailPorta: TLabel
            Left = 432
            Top = 48
            Width = 30
            Height = 13
            Caption = 'Porta:'
            FocusControl = dbEmailPorta
          end
          object dbEmailConta: TDBEdit
            Left = 16
            Top = 24
            Width = 289
            Height = 21
            CharCase = ecLowerCase
            DataField = 'EMAIL_CONTA'
            DataSource = DtSrcTabela
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object dbEmailSenha: TDBEdit
            Left = 312
            Top = 24
            Width = 177
            Height = 21
            DataField = 'EMAIL_SENHA'
            DataSource = DtSrcTabela
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            PasswordChar = '*'
            TabOrder = 1
          end
          object dbEmailPOP: TDBEdit
            Left = 16
            Top = 64
            Width = 201
            Height = 21
            CharCase = ecLowerCase
            DataField = 'EMAIL_POP'
            DataSource = DtSrcTabela
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object dbEmailSMTP: TDBEdit
            Left = 224
            Top = 64
            Width = 201
            Height = 21
            CharCase = ecLowerCase
            DataField = 'EMAIL_SMTP'
            DataSource = DtSrcTabela
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
          object dbEmailPorta: TDBEdit
            Left = 432
            Top = 64
            Width = 57
            Height = 21
            DataField = 'EMAIL_SMTP_PORTA'
            DataSource = DtSrcTabela
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
          end
          object dbEmailAutentica: TDBCheckBox
            Left = 16
            Top = 96
            Width = 201
            Height = 17
            Caption = 'Servidor requer autentica'#231#227'o (TLS)'
            DataField = 'EMAIL_REQUER_AUTENTICACAO'
            DataSource = DtSrcTabela
            TabOrder = 5
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbEmailConexaoSSL: TDBCheckBox
            Left = 16
            Top = 120
            Width = 201
            Height = 17
            Caption = 'Conex'#227'o Segura (SSL)'
            DataField = 'EMAIL_CONEXAO_SSL'
            DataSource = DtSrcTabela
            TabOrder = 6
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
        object tbsVenda: TTabSheet
          Caption = 'Vendas'
          ImageIndex = 4
          object lblFormaPagtoCartaCredito: TLabel
            Left = 16
            Top = 8
            Width = 232
            Height = 13
            Caption = 'Forma de Pagamento para CARTA DE CR'#201'DITO:'
            FocusControl = dbFormaPagtoCartaCredito
          end
          object dbFormaPagtoCartaCredito: TDBLookupComboBox
            Left = 16
            Top = 24
            Width = 359
            Height = 21
            DataField = 'VENDA_FORMA_PAGTO_CARTACREDITO'
            DataSource = DtSrcTabela
            DropDownRows = 10
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            KeyField = 'COD'
            ListField = 'DESCRI'
            ListSource = DtsFormaPagto
            ParentFont = False
            TabOrder = 0
          end
          object dbPermitirVendaSemEstoque: TDBCheckBox
            Left = 16
            Top = 51
            Width = 321
            Height = 17
            Caption = 'Permitir venda de produtos com estoque insuficiente'
            DataField = 'PERMITIR_VENDA_ESTOQUE_INS'
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
          object dbCarregarProdutoPeloEAN: TDBCheckBox
            Left = 16
            Top = 74
            Width = 321
            Height = 17
            Caption = 'Carregar Produto pelo C'#243'digo EAN'
            DataField = 'VENDA_CARREGA_PRODUTO_EAN'
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
        end
        object TbsNFe: TTabSheet
          Caption = 'NF-e / NFC-e'
          ImageIndex = 1
          object chkNFE_SolicitaDHSaida: TDBCheckBox
            Left = 16
            Top = 244
            Width = 330
            Height = 17
            Caption = 'Solicitar Data/Hora de sa'#237'da da NF-e para impress'#227'o no DANFE'
            DataField = 'NFE_SOLICITA_DH_SAIDA'
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
          object chkImprimirCodCliente: TDBCheckBox
            Left = 16
            Top = 268
            Width = 377
            Height = 17
            Caption = 'Imprimir C'#243'digo Interno do Cliente no DANFE da NF-e'
            DataField = 'NFE_IMPRIMIR_COD_CLIENTE'
            DataSource = DtSrcTabela
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object chkNFE_Emitir: TDBCheckBox
            Left = 16
            Top = 16
            Width = 169
            Height = 17
            Caption = 'Permitir Emiss'#227'o de NF-e'
            DataField = 'NFE_EMITIR'
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
          object chkNFE_SalvarNotaDenegada: TDBCheckBox
            Left = 16
            Top = 220
            Width = 193
            Height = 17
            Caption = 'Aceitar/Salvar NF-e Denegada'
            DataField = 'NFE_ACEITAR_NOTA_DENEGADA'
            DataSource = DtSrcTabela
            Enabled = False
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
          object grpBxToken: TGroupBox
            Left = 352
            Top = 141
            Width = 373
            Height = 73
            Caption = 'Token Principal p/ emiss'#227'o de NFC-e'
            TabOrder = 8
            DesignSize = (
              373
              73)
            object lblTokenId: TLabel
              Left = 16
              Top = 24
              Width = 101
              Height = 13
              Caption = 'Id Token / Id CSC:'
              FocusControl = edTokenId
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblToken: TLabel
              Left = 127
              Top = 24
              Width = 63
              Height = 13
              Caption = 'Token / CSC:'
              FocusControl = edToken
            end
            object edTokenId: TDBEdit
              Left = 16
              Top = 40
              Width = 105
              Height = 21
              DataField = 'NFCE_TOKEN_ID'
              DataSource = DtSrcTabela
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object edToken: TDBEdit
              Left = 127
              Top = 40
              Width = 230
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              DataField = 'NFCE_TOKEN'
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
          object chkNFE_EmitirEntrada: TDBCheckBox
            Left = 16
            Top = 39
            Width = 209
            Height = 17
            Caption = 'Permitir Emiss'#227'o de NF-e p/ Entradas'
            DataField = 'NFE_EMITIR_ENTRADA'
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
          object grpBxNFe: TGroupBox
            Left = 16
            Top = 62
            Width = 205
            Height = 152
            Caption = 'Numera'#231#227'o NF-e ('#218'ltima Emiss'#227'o)'
            TabOrder = 2
            object lblNFeSerie: TLabel
              Left = 16
              Top = 24
              Width = 28
              Height = 13
              Caption = 'S'#233'rie:'
              FocusControl = dbNFeSerie
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblNFeNumero: TLabel
              Left = 69
              Top = 24
              Width = 41
              Height = 13
              Caption = 'N'#250'mero:'
              FocusControl = dbNFeNumero
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblNFeCartaCorrecao: TLabel
              Left = 16
              Top = 72
              Width = 28
              Height = 13
              Caption = 'CC-e:'
              FocusControl = dbNFeCartaCorrecao
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblNFeLote: TLabel
              Left = 69
              Top = 72
              Width = 25
              Height = 13
              Caption = 'Lote:'
              FocusControl = dbNFeLote
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object dbNFeSerie: TDBEdit
              Left = 16
              Top = 40
              Width = 47
              Height = 21
              DataField = 'NFE_SERIE'
              DataSource = DtSrcTabela
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object dbNFeNumero: TDBEdit
              Left = 69
              Top = 40
              Width = 116
              Height = 21
              DataField = 'NFE_NUMERO'
              DataSource = DtSrcTabela
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
            object dbNFeCartaCorrecao: TDBEdit
              Left = 16
              Top = 88
              Width = 47
              Height = 21
              DataField = 'NFE_CARTA_CORRECAO'
              DataSource = DtSrcTabela
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
            end
            object dbNFeLote: TDBEdit
              Left = 69
              Top = 88
              Width = 116
              Height = 21
              DataField = 'NFE_LOTE'
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
          object chkNFCE_Emitir: TDBCheckBox
            Left = 352
            Top = 39
            Width = 169
            Height = 17
            Caption = 'Permitir Emiss'#227'o de NFC-e'
            DataField = 'NFCE_EMITIR'
            DataSource = DtSrcTabela
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 6
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object grpBxNFCe: TGroupBox
            Left = 352
            Top = 62
            Width = 205
            Height = 73
            Caption = 'Numera'#231#227'o NFC-e ('#218'ltima Emiss'#227'o)'
            TabOrder = 7
            object lblNFCeSerie: TLabel
              Left = 16
              Top = 24
              Width = 28
              Height = 13
              Caption = 'S'#233'rie:'
              FocusControl = dbNFCeSerie
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblNFCeNumero: TLabel
              Left = 69
              Top = 24
              Width = 41
              Height = 13
              Caption = 'N'#250'mero:'
              FocusControl = dbNFCeNumero
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object dbNFCeSerie: TDBEdit
              Left = 16
              Top = 40
              Width = 47
              Height = 21
              DataField = 'NFCE_SERIE'
              DataSource = DtSrcTabela
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object dbNFCeNumero: TDBEdit
              Left = 69
              Top = 40
              Width = 116
              Height = 21
              DataField = 'NFCE_NUMERO'
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
          object chkImprimirCodReferencia: TDBCheckBox
            Left = 16
            Top = 291
            Width = 644
            Height = 17
            Caption = 
              'Imprimir "C'#243'digo Externo" e/ou "Refer'#234'ncia Fornecedor/Cliente" c' +
              'omo C'#243'digo do Produto no DANFE da NF-e'
            DataField = 'NFE_IMPRIMIR_COD_REFERENCIA'
            DataSource = DtSrcTabela
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 9
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
        object TbsNFSe: TTabSheet
          Caption = 'NFS-e'
          ImageIndex = 3
          object chkNFSE_Emitir: TDBCheckBox
            Left = 16
            Top = 16
            Width = 184
            Height = 17
            Caption = 'Permitir Emiss'#227'o de NFS-e'
            DataField = 'NFSE_EMITIR'
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
          object grpBxNFSe: TGroupBox
            Left = 16
            Top = 118
            Width = 184
            Height = 73
            Caption = 'Numera'#231#227'o NFS-e ('#218'ltima Emiss'#227'o)'
            TabOrder = 2
            object lblNFSeSerie: TLabel
              Left = 16
              Top = 24
              Width = 28
              Height = 13
              Caption = 'S'#233'rie:'
              FocusControl = dbNFSeSerie
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblNFSeNumero: TLabel
              Left = 69
              Top = 24
              Width = 41
              Height = 13
              Caption = 'N'#250'mero:'
              FocusControl = dbNFSeNumero
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object dbNFSeSerie: TDBEdit
              Left = 16
              Top = 40
              Width = 47
              Height = 21
              DataField = 'NFSE_SERIE'
              DataSource = DtSrcTabela
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object dbNFSeNumero: TDBEdit
              Left = 69
              Top = 40
              Width = 100
              Height = 21
              DataField = 'NFSE_NUMERO'
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
          object grpBxNFSeAliquotas: TGroupBox
            Left = 16
            Top = 197
            Width = 184
            Height = 115
            Caption = 'Percentuais / Al'#237'quotas '
            TabOrder = 3
            object lblNFSePIS: TLabel
              Left = 16
              Top = 24
              Width = 20
              Height = 13
              Caption = 'PIS:'
              FocusControl = dbNFSePIS
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblNFSeCOFINS: TLabel
              Left = 95
              Top = 24
              Width = 42
              Height = 13
              Caption = 'COFINS:'
              FocusControl = dbNFSeCOFINS
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblNFSeCSLL: TLabel
              Left = 16
              Top = 64
              Width = 27
              Height = 13
              Caption = 'CSLL:'
              FocusControl = dbNFSeCSLL
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblNFSeISSQN: TLabel
              Left = 95
              Top = 64
              Width = 35
              Height = 13
              Caption = 'ISSQN:'
              FocusControl = dbNFSeISSQN
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object dbNFSePIS: TDBEdit
              Left = 16
              Top = 40
              Width = 73
              Height = 21
              DataField = 'NFSE_PERCENTUAL_PIS'
              DataSource = DtSrcTabela
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object dbNFSeCOFINS: TDBEdit
              Left = 95
              Top = 40
              Width = 74
              Height = 21
              DataField = 'NFSE_PERCENTUAL_COFINS'
              DataSource = DtSrcTabela
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
            object dbNFSeCSLL: TDBEdit
              Left = 16
              Top = 80
              Width = 73
              Height = 21
              DataField = 'NFSE_PERCENTUAL_CSLL'
              DataSource = DtSrcTabela
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
            end
            object dbNFSeISSQN: TDBEdit
              Left = 95
              Top = 80
              Width = 74
              Height = 21
              DataField = 'NFSE_PERCENTUAL_ISSQN'
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
          object grpBxRPS: TGroupBox
            Left = 16
            Top = 39
            Width = 184
            Height = 73
            Caption = 'Numera'#231#227'o RPS ('#218'ltima Emiss'#227'o)'
            TabOrder = 1
            object lblRPSSerie: TLabel
              Left = 16
              Top = 24
              Width = 28
              Height = 13
              Caption = 'S'#233'rie:'
              FocusControl = dbRPSSerie
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblRPSNumero: TLabel
              Left = 69
              Top = 24
              Width = 41
              Height = 13
              Caption = 'N'#250'mero:'
              FocusControl = dbRPSNumero
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object dbRPSSerie: TDBEdit
              Left = 16
              Top = 40
              Width = 47
              Height = 21
              DataField = 'RPS_SERIE'
              DataSource = DtSrcTabela
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object dbRPSNumero: TDBEdit
              Left = 69
              Top = 40
              Width = 100
              Height = 21
              DataField = 'RPS_NUMERO'
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
        end
        object TbsOutrasConfig: TTabSheet
          Caption = 'Outras Configura'#231#245'es'
          ImageIndex = 2
          object lblContador: TLabel
            Left = 16
            Top = 13
            Width = 186
            Height = 13
            Caption = 'Contador / Escrit'#243'rio de Contabilidade:'
            FocusControl = dbContador
          end
          object dbCustoOperacional: TDBCheckBox
            Left = 16
            Top = 59
            Width = 313
            Height = 17
            Caption = 'Calcular Custo Operacional nas vendas por Cliente'
            DataField = 'CUSTO_OPER_CALCULAR'
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
          object dbEstoqueUnico: TDBCheckBox
            Left = 16
            Top = 83
            Width = 257
            Height = 17
            Caption = 'Trabalhar com estoque unificado de produtos'
            DataField = 'ESTOQUE_UNICO_EMPRESAS'
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
          object dbDuplicarCnpj: TDBCheckBox
            Left = 16
            Top = 131
            Width = 321
            Height = 17
            Caption = 'Permitir duplicar CPF/CNPJ no cadastro dos clientes'
            DataField = 'CLIENTE_PERMITIR_DUPLICAR_CNPJ'
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
          object dbEstoqueSatelite: TDBCheckBox
            Left = 16
            Top = 107
            Width = 241
            Height = 17
            Caption = 'Habilitar estoque satelite para clientes'
            DataField = 'ESTOQUE_SATELITE_CLIENTE'
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
          object dbAutorizacaoInformaCliente: TDBCheckBox
            Left = 16
            Top = 177
            Width = 438
            Height = 17
            Caption = 
              'Informar Cliente nas Autoriza'#231#245'es/Requisi'#231#245'es de Compras/Servi'#231'o' +
              's'
            DataField = 'AUTORIZA_INFORMA_CLIENTE'
            DataSource = DtSrcTabela
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 6
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbVerdadeiroFalsoCnpj: TDBCheckBox
            Left = 16
            Top = 154
            Width = 438
            Height = 17
            Caption = 
              'Permitir verdadeiro-falso na valida'#231#227'o do CPF/CNPJ no cadastro d' +
              'os clientes'
            DataField = 'CLIENTE_PERMITIR_VF_CNPJ'
            DataSource = DtSrcTabela
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbContador: TJvDBComboEdit
            Left = 16
            Top = 32
            Width = 438
            Height = 21
            ButtonHint = 'Pesquisar Contador / Contabilidade (Ctrl+P)'
            CharCase = ecUpperCase
            ClickKey = 16464
            Color = clMoneyGreen
            DataField = 'CONTADOR_NOME'
            DataSource = DtSrcTabela
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              18000000000000060000000000000000000000000000000000001DE6B51DE6B5
              1DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B5B1AD
              AC203040ACA5A21DE6B5C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FACA5A2C3C3C31DE6B5B0A090
              6048306048306048306048306048306048306048306048306048305048403050
              604078C0304860B1ACA6C3C3C37F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3B1ACA61DE6B5B0A090
              FFFFFFB0A090B0A090B0A090B0A090B0A090B0A090B0A0909088803050703080
              D04098E050B0F0506870C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C39088807F7F7FC3C3C3C3C3C3C3C3C37F7F7F1DE6B5B0A090
              FFFFFFFFFFFFFFF8FFF0F0F0D0D8D090989070686060686050586040709040A0
              E060C8FF7090A0C5BEB5C3C3C37F7F7FFFFFFFFFFFFFFFF8FFF0F0F0D0D8D07F
              7F7F7F7F7F7F7F7F505860C3C3C3C3C3C3C3C3C37090A0C5BEB51DE6B5B0A090
              FFFFFFFFFFFFFFFFFFE0E0E0909090B0A8A0D0C0B0D0B0A08078705058506090
              B07098B0AEAEAA1DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFE0E0E07F7F7F7F
              7F7FD0C0B0D0B0A0807870505850C3C3C37098B0AEAEAAC3C3C31DE6B5B0A090
              FFFFFFFFFFFFFFFFFFB0B0B0C0B8B0FFF0E0FFE8E0F0D8C0F0D0B08078709D8F
              8CAEAFAA1DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFF
              F0E0FFE8E0F0D8C0F0D0B08078709D8F8CAEAFAAC3C3C3C3C3C31DE6B5C0A890
              FFFFFFFFFFFFFFFFFFA09890F0E8E0FFF8F0FFF0F0FFE8E0F0D8D0D0B0A06367
              5E1DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFF
              F8F0FFF0F0FFE8E0F0D8D0D0B0A063675EC3C3C3C3C3C3C3C3C31DE6B5C0A8A0
              FFFFFFFFFFFFFFFFFFA0A090F0E8E0FFFFFFFFF8F0FFF0F0FFE8E0E0C0B0716E
              6C1DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFF
              FFFFFFF8F0FFF0F0FFE8E0E0C0B0716E6CC3C3C3C3C3C3C3C3C31DE6B5C0B0A0
              FFFFFFFFFFFFFFFFFFC0C8C0C0C0C0FFFFFFFFFFFFFFF8F0FFF0E0B0A090A69C
              951DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFF
              FFFFFFFFFFFFF8F0FFF0E0B0A090A69C95C3C3C3C3C3C3C3C3C31DE6B5D0B0A0
              FFFFFFFFFFFFFFFFFFF0F8FFC0B8B0C0C0C0F0E8E0F0E8E0B0B0A07070601DE6
              B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFF0F8FF7F7F7F7F
              7F7FF0E8E0F0E8E0B0B0A0707060C3C3C3C3C3C3C3C3C3C3C3C31DE6B5D0B8A0
              FFFFFFFFFFFFFFFFFFFFFFFFF0F8FFC0C8C0A0A0909090809090906050401DE6
              B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFF0F8FF7F
              7F7FA0A0907F7F7F909090605040C3C3C3C3C3C3C3C3C3C3C3C31DE6B5D0B8B0
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0A0906048306048306048301DE6
              B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFF7F7F7F604830604830604830C3C3C3C3C3C3C3C3C3C3C3C31DE6B5D0C0B0
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A890D0C8C06048301DE6B51DE6
              B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFF7F7F7FC3C3C3604830C3C3C3C3C3C3C3C3C3C3C3C3C3C3C31DE6B5E0C0B0
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A8A0604830E0C6B71DE6B51DE6
              B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C31DE6B5E0C0B0
              E0C0B0E0C0B0E0C0B0E0C0B0D0C0B0D0B8B0D0B0A0E0C7B91DE6B51DE6B51DE6
              B51DE6B51DE6B51DE6B5C3C3C37F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C31DE6B51DE6B5
              1DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6
              B51DE6B51DE6B51DE6B5C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3}
            NumGlyphs = 2
            ParentFont = False
            ParentShowHint = False
            ReadOnly = True
            ShowHint = True
            TabOrder = 0
            OnButtonClick = dbContadorButtonClick
          end
        end
      end
    end
  end
  inherited tlbBotoes: TPanel
    Top = 467
    Width = 751
    ExplicitTop = 467
    ExplicitWidth = 751
    inherited bvlTool3: TBevel
      Left = 668
      ExplicitLeft = 668
    end
    inherited bvlTool4: TBevel
      Left = 747
      ExplicitLeft = 747
    end
    inherited btbtnFechar: TcxButton
      Left = 672
      ExplicitLeft = 672
    end
    inherited btbtnSelecionar: TcxButton
      Left = 548
      ExplicitLeft = 548
    end
  end
  inherited DtSrcTabela: TDataSource
    Left = 408
    Top = 0
  end
  inherited ImgList: TImageList
    Left = 376
    Top = 0
  end
  object dtsEmpresa: TDataSource
    Left = 472
  end
  object DtsFormaPagto: TDataSource
    Left = 440
  end
  object imgGrid: TImageList
    Left = 712
    Top = 8
    Bitmap = {
      494C010102000800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000EAEDFA0095A2E5005B6FD6003D55CF003B53CF00576BD5008D9BE300E3E6
      F800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009CA8
      E6002E47CB002540C9002540C9002540C9002540C9002540C9002540C9002944
      CA008C9BE300FCFCFE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007C8CDF002540
      C9002540C9002540C9002E48CB005C70D7006A7DDA004D63D3002641C9002540
      C9002540C900687ADA00FCFCFE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A4AFE8002540C9002540
      C9002540C9005E72D700F5F6FC00000000000000000000000000D9DDF500556A
      D5002540C9002540C9008B99E200000000000000000000000000000000000000
      000000000000CDA18700E5BC9E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F0F2FB00324BCC002540C9002540
      C9002540C9002741C900A6B1E90000000000000000000000000000000000F7F8
      FD00566BD5002540C9002944CA00E2E6F8000000000000000000000000000000
      0000AA74570090482000B4765700F0CEB3000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A4B0E9002540C9002540C900677A
      D9002D47CB002540C9002741C900A6B1E9000000000000000000000000000000
      0000DDE1F7002842CA002540C9008D9BE300000000000000000000000000A558
      3900D0785000D0704000B0603000CB9173000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006D7FDB002540C9002842CA00ECEF
      FA00C3CBF0002D47CB002540C9002741C900A6B1E90000000000000000000000
      0000000000005A6ED6002540C900566BD5000000000000000000A0503000D078
      5000F0906000E19C7500D0886000B96F4200D3A4860000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005268D4002540C900485FD2000000
      000000000000C3CBF0002D47CB002540C9002741C900A6B1E900000000000000
      0000000000008292E0002540C9003B53CF0000000000A5603900E0805000F090
      6000F3AF8E0000000000F2AA8600D0886000B4673900EBC9AF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005469D5002540C9005167D4000000
      00000000000000000000C3CBF0002D47CB002540C9002741C900A6B1E9000000
      000000000000808FDF002540C9003C54CF0000000000F1B69800F0A89000F2AC
      8200000000000000000000000000E6AA8600D0886000AA684100F2C7B4000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007183DC002540C900334CCC00FCFC
      FE00000000000000000000000000C3CBF0002D47CB002540C9002741C900A6B1
      E900000000005469D5002540C9005A6ED60000000000FDE0CD00F7CEB6000000
      000000000000000000000000000000000000E19C7500D0785000B47D5600F2CC
      B300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ADB7EB002540C9002540C900B6BF
      ED0000000000000000000000000000000000C3CBF0002D47CB002540C9002741
      C9008493E1002641C9002540C90095A2E5000000000000000000000000000000
      00000000000000000000000000000000000000000000E19C7400C0704000C38C
      7400F1CAB0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F6F8FD003A52CE002540C9003B53
      CF00E5E9F90000000000000000000000000000000000C3CBF0002D47CB002540
      C9002540C9002540C9002E47CB00EAECFA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E29F7900C070
      4000D29B8200EBC3A80000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B4BDEC002641C9002540
      C9003B53CF00BBC3EE00FEFEFF00000000000000000000000000919EE4002540
      C9002540C9002540C9009CA8E600000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F1AF
      9100C0705000E4B99B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000093A1E4002641
      C9002540C9002540C9003D55CF00687ADA006A7DDA00435AD0002540C9002540
      C9002540C9007D8DDF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F1C1A700D291720000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B5BE
      ED003951CE002540C9002540C9002540C9002540C9002540C9002540C900324B
      CC00A4B0E9000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F6F8FD00ADB7EB007384DC00556AD5005368D4006E80DB00A6B1E900F1F3
      FC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00F00FFFFF00000000E003FFFF00000000
      C001FFFF0000000081C1F9FF0000000001E0F0FF0000000000F0E0FF00000000
      0078C07F000000001838843F000000001C188E1F000000000E089F0F00000000
      0F00FF87000000000780FFC30000000081C1FFE300000000C003FFF300000000
      E007FFFF00000000F00FFFFF0000000000000000000000000000000000000000
      000000000000}
  end
end
