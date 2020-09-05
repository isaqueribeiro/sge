inherited frmGeConfiguracaoEmpresa: TfrmGeConfiguracaoEmpresa
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
          Left = 417
          Width = 322
          ExplicitLeft = 417
          ExplicitWidth = 322
          inherited lbltFiltrar: TLabel
            Left = 14
            Width = 52
            Caption = 'Empresa:'
            ExplicitLeft = 14
            ExplicitWidth = 52
          end
          inherited edtFiltrar: TEdit
            Left = 72
            Width = 201
            ExplicitLeft = 72
            ExplicitWidth = 201
          end
          inherited btnFiltrar: TcxButton
            Left = 277
            ExplicitLeft = 277
          end
        end
      end
    end
    inherited tbsCadastro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
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
        ActivePage = TbsOutrasConfig
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
            Top = 88
            Width = 201
            Height = 17
            Caption = 'Servidor requer autentica'#231#227'o'
            DataField = 'EMAIL_REQUER_AUTENTICACAO'
            DataSource = DtSrcTabela
            TabOrder = 5
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbEmailConexaoSSL: TDBCheckBox
            Left = 16
            Top = 112
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
            Width = 289
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
  inherited IbDtstTabela: TIBDataSet
    SelectSQL.Strings = (
      'Select'
      '    c.empresa'
      '  , c.email_conta'
      '  , c.email_senha'
      '  , c.email_pop'
      '  , c.email_smtp'
      '  , c.email_smtp_porta'
      '  , c.email_requer_autenticacao'
      '  , c.email_conexao_ssl'
      '  , c.email_assunto_padrao'
      '  , c.email_mensagem_padrao'
      '  , c.cliente_permitir_duplicar_cnpj'
      '  , c.cliente_permitir_vf_cnpj'
      '  , c.custo_oper_calcular'
      '  , c.permitir_venda_estoque_ins'
      '  , c.venda_carrega_produto_ean'
      '  , c.venda_forma_pagto_cartacredito'
      '  , c.estoque_unico_empresas'
      '  , c.estoque_satelite_cliente'
      '  , c.autoriza_informa_cliente'
      '  , c.usuario'
      '  , c.nfe_emitir'
      '  , c.nfe_serie'
      '  , c.nfe_numero'
      '  , c.nfe_lote'
      '  , c.nfe_carta_correcao'
      '  , c.nfe_emitir_entrada'
      '  , c.nfe_aceitar_nota_denegada'
      '  , c.nfe_solicita_dh_saida'
      '  , c.nfe_imprimir_cod_cliente'
      '  , c.nfe_imprimir_cod_referencia'
      '  , c.nfce_emitir'
      '  , c.nfce_serie'
      '  , c.nfce_numero'
      '  , c.nfce_token_id'
      '  , c.nfce_token'
      '  , c.rps_serie'
      '  , c.rps_numero'
      '  , c.nfse_emitir'
      '  , c.nfse_serie'
      '  , c.nfse_numero'
      '  , c.nfse_percentual_pis'
      '  , c.nfse_percentual_cofins'
      '  , c.nfse_percentual_csll'
      '  , c.nfse_percentual_issqn'
      '  , e.rzsoc'
      '  , e.nmfant'
      'from TBCONFIGURACAO c'
      '  inner join TBEMPRESA e on (e.cnpj = c.empresa)'
      '')
    Left = 376
  end
  inherited DtSrcTabela: TDataSource
    DataSet = fdQryTabela
    Left = 440
    Top = 32
  end
  inherited IbUpdTabela: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  EMPRESA,'
      '  EMAIL_CONTA,'
      '  EMAIL_SENHA,'
      '  EMAIL_POP,'
      '  EMAIL_SMTP,'
      '  EMAIL_SMTP_PORTA,'
      '  EMAIL_REQUER_AUTENTICACAO,'
      '  EMAIL_CONEXAO_SSL,'
      '  EMAIL_ASSUNTO_PADRAO,'
      '  EMAIL_MENSAGEM_PADRAO,'
      '  CLIENTE_PERMITIR_DUPLICAR_CNPJ,'
      '  CLIENTE_PERMITIR_VF_CNPJ,'
      '  CUSTO_OPER_CALCULAR,'
      '  PERMITIR_VENDA_ESTOQUE_INS,'
      '  VENDA_CARREGA_PRODUTO_EAN,'
      '  VENDA_FORMA_PAGTO_CARTACREDITO,'
      '  ESTOQUE_UNICO_EMPRESAS,'
      '  ESTOQUE_SATELITE_CLIENTE,'
      '  AUTORIZA_INFORMA_CLIENTE,'
      '  USUARIO,'
      '  NFE_EMITIR,'
      '  NFE_SERIE,'
      '  NFE_NUMERO,'
      '  NFE_LOTE,'
      '  NFE_CARTA_CORRECAO,'
      '  NFE_EMITIR_ENTRADA,'
      '  NFE_ACEITAR_NOTA_DENEGADA,'
      '  NFE_SOLICITA_DH_SAIDA,'
      '  NFE_IMPRIMIR_COD_CLIENTE,'
      '  NFE_IMPRIMIR_COD_REFERENCIA,'
      '  NFCE_EMITIR,'
      '  NFCE_SERIE,'
      '  NFCE_NUMERO,'
      '  NFCE_TOKEN_ID,'
      '  NFCE_TOKEN,'
      '  NFSE_EMITIR,'
      '  RPS_SERIE,'
      '  RPS_NUMERO,'
      '  NFSE_SERIE,'
      '  NFSE_NUMERO,'
      '  NFSE_PERCENTUAL_PIS,'
      '  NFSE_PERCENTUAL_COFINS,'
      '  NFSE_PERCENTUAL_CSLL,'
      '  NFSE_PERCENTUAL_ISSQN'
      'from TBCONFIGURACAO '
      'where'
      '  EMPRESA = :EMPRESA')
    ModifySQL.Strings = (
      'update TBCONFIGURACAO'
      'set'
      '  AUTORIZA_INFORMA_CLIENTE = :AUTORIZA_INFORMA_CLIENTE,'
      
        '  CLIENTE_PERMITIR_DUPLICAR_CNPJ = :CLIENTE_PERMITIR_DUPLICAR_CN' +
        'PJ,'
      '  CLIENTE_PERMITIR_VF_CNPJ = :CLIENTE_PERMITIR_VF_CNPJ,'
      '  CUSTO_OPER_CALCULAR = :CUSTO_OPER_CALCULAR,'
      '  EMAIL_ASSUNTO_PADRAO = :EMAIL_ASSUNTO_PADRAO,'
      '  EMAIL_CONEXAO_SSL = :EMAIL_CONEXAO_SSL,'
      '  EMAIL_CONTA = :EMAIL_CONTA,'
      '  EMAIL_MENSAGEM_PADRAO = :EMAIL_MENSAGEM_PADRAO,'
      '  EMAIL_POP = :EMAIL_POP,'
      '  EMAIL_REQUER_AUTENTICACAO = :EMAIL_REQUER_AUTENTICACAO,'
      '  EMAIL_SENHA = :EMAIL_SENHA,'
      '  EMAIL_SMTP = :EMAIL_SMTP,'
      '  EMAIL_SMTP_PORTA = :EMAIL_SMTP_PORTA,'
      '  EMPRESA = :EMPRESA,'
      '  ESTOQUE_SATELITE_CLIENTE = :ESTOQUE_SATELITE_CLIENTE,'
      '  ESTOQUE_UNICO_EMPRESAS = :ESTOQUE_UNICO_EMPRESAS,'
      '  NFCE_EMITIR = :NFCE_EMITIR,'
      '  NFCE_NUMERO = :NFCE_NUMERO,'
      '  NFCE_SERIE = :NFCE_SERIE,'
      '  NFCE_TOKEN = :NFCE_TOKEN,'
      '  NFCE_TOKEN_ID = :NFCE_TOKEN_ID,'
      '  NFE_ACEITAR_NOTA_DENEGADA = :NFE_ACEITAR_NOTA_DENEGADA,'
      '  NFE_CARTA_CORRECAO = :NFE_CARTA_CORRECAO,'
      '  NFE_EMITIR = :NFE_EMITIR,'
      '  NFE_EMITIR_ENTRADA = :NFE_EMITIR_ENTRADA,'
      '  NFE_IMPRIMIR_COD_CLIENTE = :NFE_IMPRIMIR_COD_CLIENTE,'
      '  NFE_IMPRIMIR_COD_REFERENCIA = :NFE_IMPRIMIR_COD_REFERENCIA,'
      '  NFE_LOTE = :NFE_LOTE,'
      '  NFE_NUMERO = :NFE_NUMERO,'
      '  NFE_SERIE = :NFE_SERIE,'
      '  NFE_SOLICITA_DH_SAIDA = :NFE_SOLICITA_DH_SAIDA,'
      '  NFSE_EMITIR = :NFSE_EMITIR,'
      '  NFSE_NUMERO = :NFSE_NUMERO,'
      '  NFSE_PERCENTUAL_COFINS = :NFSE_PERCENTUAL_COFINS,'
      '  NFSE_PERCENTUAL_CSLL = :NFSE_PERCENTUAL_CSLL,'
      '  NFSE_PERCENTUAL_ISSQN = :NFSE_PERCENTUAL_ISSQN,'
      '  NFSE_PERCENTUAL_PIS = :NFSE_PERCENTUAL_PIS,'
      '  NFSE_SERIE = :NFSE_SERIE,'
      '  PERMITIR_VENDA_ESTOQUE_INS = :PERMITIR_VENDA_ESTOQUE_INS,'
      '  RPS_NUMERO = :RPS_NUMERO,'
      '  RPS_SERIE = :RPS_SERIE,'
      '  USUARIO = :USUARIO,'
      '  VENDA_CARREGA_PRODUTO_EAN = :VENDA_CARREGA_PRODUTO_EAN,'
      
        '  VENDA_FORMA_PAGTO_CARTACREDITO = :VENDA_FORMA_PAGTO_CARTACREDI' +
        'TO'
      'where'
      '  EMPRESA = :OLD_EMPRESA')
    InsertSQL.Strings = (
      'insert into TBCONFIGURACAO'
      
        '  (AUTORIZA_INFORMA_CLIENTE, CLIENTE_PERMITIR_DUPLICAR_CNPJ, CLI' +
        'ENTE_PERMITIR_VF_CNPJ, '
      
        '   CUSTO_OPER_CALCULAR, EMAIL_ASSUNTO_PADRAO, EMAIL_CONEXAO_SSL,' +
        ' EMAIL_CONTA, '
      
        '   EMAIL_MENSAGEM_PADRAO, EMAIL_POP, EMAIL_REQUER_AUTENTICACAO, ' +
        'EMAIL_SENHA, '
      
        '   EMAIL_SMTP, EMAIL_SMTP_PORTA, EMPRESA, ESTOQUE_SATELITE_CLIEN' +
        'TE, ESTOQUE_UNICO_EMPRESAS, '
      
        '   NFCE_EMITIR, NFCE_NUMERO, NFCE_SERIE, NFCE_TOKEN, NFCE_TOKEN_' +
        'ID, NFE_ACEITAR_NOTA_DENEGADA, '
      
        '   NFE_CARTA_CORRECAO, NFE_EMITIR, NFE_EMITIR_ENTRADA, NFE_IMPRI' +
        'MIR_COD_CLIENTE, '
      
        '   NFE_IMPRIMIR_COD_REFERENCIA, NFE_LOTE, NFE_NUMERO, NFE_SERIE,' +
        ' NFE_SOLICITA_DH_SAIDA, '
      
        '   NFSE_EMITIR, NFSE_NUMERO, NFSE_PERCENTUAL_COFINS, NFSE_PERCEN' +
        'TUAL_CSLL, '
      
        '   NFSE_PERCENTUAL_ISSQN, NFSE_PERCENTUAL_PIS, NFSE_SERIE, PERMI' +
        'TIR_VENDA_ESTOQUE_INS, '
      
        '   RPS_NUMERO, RPS_SERIE, USUARIO, VENDA_CARREGA_PRODUTO_EAN, VE' +
        'NDA_FORMA_PAGTO_CARTACREDITO)'
      'values'
      
        '  (:AUTORIZA_INFORMA_CLIENTE, :CLIENTE_PERMITIR_DUPLICAR_CNPJ, :' +
        'CLIENTE_PERMITIR_VF_CNPJ, '
      
        '   :CUSTO_OPER_CALCULAR, :EMAIL_ASSUNTO_PADRAO, :EMAIL_CONEXAO_S' +
        'SL, :EMAIL_CONTA, '
      
        '   :EMAIL_MENSAGEM_PADRAO, :EMAIL_POP, :EMAIL_REQUER_AUTENTICACA' +
        'O, :EMAIL_SENHA, '
      
        '   :EMAIL_SMTP, :EMAIL_SMTP_PORTA, :EMPRESA, :ESTOQUE_SATELITE_C' +
        'LIENTE, '
      
        '   :ESTOQUE_UNICO_EMPRESAS, :NFCE_EMITIR, :NFCE_NUMERO, :NFCE_SE' +
        'RIE, :NFCE_TOKEN, '
      
        '   :NFCE_TOKEN_ID, :NFE_ACEITAR_NOTA_DENEGADA, :NFE_CARTA_CORREC' +
        'AO, :NFE_EMITIR, '
      
        '   :NFE_EMITIR_ENTRADA, :NFE_IMPRIMIR_COD_CLIENTE, :NFE_IMPRIMIR' +
        '_COD_REFERENCIA, '
      
        '   :NFE_LOTE, :NFE_NUMERO, :NFE_SERIE, :NFE_SOLICITA_DH_SAIDA, :' +
        'NFSE_EMITIR, '
      
        '   :NFSE_NUMERO, :NFSE_PERCENTUAL_COFINS, :NFSE_PERCENTUAL_CSLL,' +
        ' :NFSE_PERCENTUAL_ISSQN, '
      
        '   :NFSE_PERCENTUAL_PIS, :NFSE_SERIE, :PERMITIR_VENDA_ESTOQUE_IN' +
        'S, :RPS_NUMERO, '
      
        '   :RPS_SERIE, :USUARIO, :VENDA_CARREGA_PRODUTO_EAN, :VENDA_FORM' +
        'A_PAGTO_CARTACREDITO)')
    DeleteSQL.Strings = (
      'delete from TBCONFIGURACAO'
      'where'
      '  EMPRESA = :OLD_EMPRESA')
    Left = 408
  end
  inherited ImgList: TImageList
    Left = 336
    Top = 0
  end
  inherited fdQryTabela: TFDQuery
    BeforePost = fdQryTabelaBeforePost
    SQL.Strings = (
      'Select'
      '    c.empresa'
      '  , c.email_conta'
      '  , c.email_senha'
      '  , c.email_pop'
      '  , c.email_smtp'
      '  , c.email_smtp_porta'
      '  , c.email_requer_autenticacao'
      '  , c.email_conexao_ssl'
      '  , c.email_assunto_padrao'
      '  , c.email_mensagem_padrao'
      '  , c.cliente_permitir_duplicar_cnpj'
      '  , c.cliente_permitir_vf_cnpj'
      '  , c.custo_oper_calcular'
      '  , c.permitir_venda_estoque_ins'
      '  , c.venda_carrega_produto_ean'
      '  , c.venda_forma_pagto_cartacredito'
      '  , c.estoque_unico_empresas'
      '  , c.estoque_satelite_cliente'
      '  , c.autoriza_informa_cliente'
      '  , c.usuario'
      '  , c.nfe_emitir'
      '  , c.nfe_serie'
      '  , c.nfe_numero'
      '  , c.nfe_lote'
      '  , c.nfe_carta_correcao'
      '  , c.nfe_emitir_entrada'
      '  , c.nfe_aceitar_nota_denegada'
      '  , c.nfe_solicita_dh_saida'
      '  , c.nfe_imprimir_cod_cliente'
      '  , c.nfe_imprimir_cod_referencia'
      '  , c.nfce_emitir'
      '  , c.nfce_serie'
      '  , c.nfce_numero'
      '  , c.nfce_token_id'
      '  , c.nfce_token'
      '  , c.rps_serie'
      '  , c.rps_numero'
      '  , c.nfse_emitir'
      '  , c.nfse_serie'
      '  , c.nfse_numero'
      '  , c.nfse_percentual_pis'
      '  , c.nfse_percentual_cofins'
      '  , c.nfse_percentual_csll'
      '  , c.nfse_percentual_issqn'
      '  , c.contador_codigo'
      '  , c.contador_cnpjcpf'
      '  , e.rzsoc'
      '  , e.nmfant'
      '  , f.nomeforn as contador_nome'
      'from TBCONFIGURACAO c'
      '  inner join TBEMPRESA e on (e.cnpj = c.empresa)'
      '  left join TBFORNECEDOR f on (f.codforn = c.contador_codigo)'
      ''
      ''
      '')
    Left = 376
    object fdQryTabelaEMPRESA: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      Origin = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      OnGetText = fdQryTabelaEMPRESAGetText
      Size = 18
    end
    object fdQryTabelaEMAIL_CONTA: TStringField
      DisplayLabel = 'Conta de E-mail'
      FieldName = 'EMAIL_CONTA'
      Origin = 'EMAIL_CONTA'
      Size = 100
    end
    object fdQryTabelaEMAIL_SENHA: TStringField
      DisplayLabel = 'Senha da Conta de e-mail'
      FieldName = 'EMAIL_SENHA'
      Origin = 'EMAIL_SENHA'
      Size = 100
    end
    object fdQryTabelaEMAIL_POP: TStringField
      DisplayLabel = 'Servidor POP'
      FieldName = 'EMAIL_POP'
      Origin = 'EMAIL_POP'
      Size = 100
    end
    object fdQryTabelaEMAIL_SMTP: TStringField
      DisplayLabel = 'Servidor SMTP'
      FieldName = 'EMAIL_SMTP'
      Origin = 'EMAIL_SMTP'
      Size = 100
    end
    object fdQryTabelaEMAIL_SMTP_PORTA: TIntegerField
      DisplayLabel = 'Porta'
      FieldName = 'EMAIL_SMTP_PORTA'
      Origin = 'EMAIL_SMTP_PORTA'
    end
    object fdQryTabelaEMAIL_REQUER_AUTENTICACAO: TSmallintField
      FieldName = 'EMAIL_REQUER_AUTENTICACAO'
      Origin = 'EMAIL_REQUER_AUTENTICACAO'
      Required = True
    end
    object fdQryTabelaEMAIL_CONEXAO_SSL: TSmallintField
      FieldName = 'EMAIL_CONEXAO_SSL'
      Origin = 'EMAIL_CONEXAO_SSL'
      Required = True
    end
    object fdQryTabelaEMAIL_ASSUNTO_PADRAO: TStringField
      FieldName = 'EMAIL_ASSUNTO_PADRAO'
      Origin = 'EMAIL_ASSUNTO_PADRAO'
      Size = 100
    end
    object fdQryTabelaEMAIL_MENSAGEM_PADRAO: TStringField
      FieldName = 'EMAIL_MENSAGEM_PADRAO'
      Origin = 'EMAIL_MENSAGEM_PADRAO'
      Size = 250
    end
    object fdQryTabelaNFE_EMITIR: TSmallintField
      FieldName = 'NFE_EMITIR'
      Origin = 'NFE_EMITIR'
      Required = True
    end
    object fdQryTabelaNFE_EMITIR_ENTRADA: TSmallintField
      FieldName = 'NFE_EMITIR_ENTRADA'
      Origin = 'NFE_EMITIR_ENTRADA'
      Required = True
    end
    object fdQryTabelaNFE_SERIE: TSmallintField
      DisplayLabel = 'NF-e: S'#233'rie'
      FieldName = 'NFE_SERIE'
      Origin = 'NFE_SERIE'
    end
    object fdQryTabelaNFE_NUMERO: TIntegerField
      DisplayLabel = 'NF-e: N'#250'mero'
      FieldName = 'NFE_NUMERO'
      Origin = 'NFE_NUMERO'
      DisplayFormat = '###0000000'
    end
    object fdQryTabelaNFE_CARTA_CORRECAO: TIntegerField
      DisplayLabel = 'NF-e: Carta de Corre'#231#227'o'
      FieldName = 'NFE_CARTA_CORRECAO'
      Origin = 'NFE_CARTA_CORRECAO'
      DisplayFormat = '###000'
    end
    object fdQryTabelaNFE_LOTE: TIntegerField
      DisplayLabel = 'NF-e: Lote'
      FieldName = 'NFE_LOTE'
      Origin = 'NFE_LOTE'
      DisplayFormat = '###0000000'
    end
    object fdQryTabelaNFE_ACEITAR_NOTA_DENEGADA: TSmallintField
      FieldName = 'NFE_ACEITAR_NOTA_DENEGADA'
      Origin = 'NFE_ACEITAR_NOTA_DENEGADA'
      Required = True
    end
    object fdQryTabelaNFE_SOLICITA_DH_SAIDA: TSmallintField
      FieldName = 'NFE_SOLICITA_DH_SAIDA'
      Origin = 'NFE_SOLICITA_DH_SAIDA'
      Required = True
    end
    object fdQryTabelaNFE_IMPRIMIR_COD_CLIENTE: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'NFE_IMPRIMIR_COD_CLIENTE'
      Origin = 'NFE_IMPRIMIR_COD_CLIENTE'
      Required = True
    end
    object fdQryTabelaNFE_IMPRIMIR_COD_REFERENCIA: TSmallintField
      FieldName = 'NFE_IMPRIMIR_COD_REFERENCIA'
      Origin = 'NFE_IMPRIMIR_COD_REFERENCIA'
      Required = True
    end
    object fdQryTabelaNFCE_EMITIR: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'NFCE_EMITIR'
      Origin = 'NFCE_EMITIR'
      Required = True
    end
    object fdQryTabelaNFCE_SERIE: TSmallintField
      DisplayLabel = 'NFC-e: S'#233'rie'
      FieldName = 'NFCE_SERIE'
      Origin = 'NFCE_SERIE'
    end
    object fdQryTabelaNFCE_NUMERO: TIntegerField
      DisplayLabel = 'NFC-e: N'#250'mero'
      FieldName = 'NFCE_NUMERO'
      Origin = 'NFCE_NUMERO'
      DisplayFormat = '###0000000'
    end
    object fdQryTabelaNFCE_TOKEN_ID: TStringField
      DisplayLabel = 'Id Token / Id CSC'
      FieldName = 'NFCE_TOKEN_ID'
      Origin = 'NFCE_TOKEN_ID'
      Size = 250
    end
    object fdQryTabelaNFCE_TOKEN: TStringField
      DisplayLabel = 'Token / CSC'
      FieldName = 'NFCE_TOKEN'
      Origin = 'NFCE_TOKEN'
      Size = 250
    end
    object fdQryTabelaRPS_SERIE: TStringField
      DisplayLabel = 'RPS: S'#233'rie'
      FieldName = 'RPS_SERIE'
      Origin = 'RPS_SERIE'
      Size = 5
    end
    object fdQryTabelaRPS_NUMERO: TIntegerField
      DisplayLabel = 'RPS: N'#250'mero'
      FieldName = 'RPS_NUMERO'
      Origin = 'RPS_NUMERO'
      DisplayFormat = '###0000000'
    end
    object fdQryTabelaNFSE_EMITIR: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'NFSE_EMITIR'
      Origin = 'NFSE_EMITIR'
      Required = True
    end
    object fdQryTabelaNFSE_SERIE: TStringField
      DisplayLabel = 'NFS-e: S'#233'rie'
      FieldName = 'NFSE_SERIE'
      Origin = 'NFSE_SERIE'
      Size = 5
    end
    object fdQryTabelaNFSE_NUMERO: TIntegerField
      DisplayLabel = 'NFS-e: N'#250'mero'
      FieldName = 'NFSE_NUMERO'
      Origin = 'NFSE_NUMERO'
      DisplayFormat = '###0000000'
    end
    object fdQryTabelaNFSE_PERCENTUAL_PIS: TFMTBCDField
      FieldName = 'NFSE_PERCENTUAL_PIS'
      Origin = 'NFSE_PERCENTUAL_PIS'
      Precision = 18
      Size = 3
    end
    object fdQryTabelaNFSE_PERCENTUAL_COFINS: TFMTBCDField
      FieldName = 'NFSE_PERCENTUAL_COFINS'
      Origin = 'NFSE_PERCENTUAL_COFINS'
      Precision = 18
      Size = 3
    end
    object fdQryTabelaNFSE_PERCENTUAL_CSLL: TFMTBCDField
      FieldName = 'NFSE_PERCENTUAL_CSLL'
      Origin = 'NFSE_PERCENTUAL_CSLL'
      Precision = 18
      Size = 3
    end
    object fdQryTabelaNFSE_PERCENTUAL_ISSQN: TFMTBCDField
      FieldName = 'NFSE_PERCENTUAL_ISSQN'
      Origin = 'NFSE_PERCENTUAL_ISSQN'
      Precision = 18
      Size = 3
    end
    object fdQryTabelaCLIENTE_PERMITIR_DUPLICAR_CNPJ: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'CLIENTE_PERMITIR_DUPLICAR_CNPJ'
      Origin = 'CLIENTE_PERMITIR_DUPLICAR_CNPJ'
      Required = True
    end
    object fdQryTabelaCLIENTE_PERMITIR_VF_CNPJ: TSmallintField
      FieldName = 'CLIENTE_PERMITIR_VF_CNPJ'
      Origin = 'CLIENTE_PERMITIR_VF_CNPJ'
      Required = True
    end
    object fdQryTabelaCUSTO_OPER_CALCULAR: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'CUSTO_OPER_CALCULAR'
      Origin = 'CUSTO_OPER_CALCULAR'
      Required = True
    end
    object fdQryTabelaRZSOC: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'RZSOC'
      Origin = 'RZSOC'
      ProviderFlags = []
      Size = 60
    end
    object fdQryTabelaUSUARIO: TStringField
      FieldName = 'USUARIO'
      Origin = 'USUARIO'
      Size = 50
    end
    object fdQryTabelaAUTORIZA_INFORMA_CLIENTE: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'AUTORIZA_INFORMA_CLIENTE'
      Origin = 'AUTORIZA_INFORMA_CLIENTE'
      Required = True
    end
    object fdQryTabelaESTOQUE_SATELITE_CLIENTE: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'ESTOQUE_SATELITE_CLIENTE'
      Origin = 'ESTOQUE_SATELITE_CLIENTE'
      Required = True
    end
    object fdQryTabelaESTOQUE_UNICO_EMPRESAS: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'ESTOQUE_UNICO_EMPRESAS'
      Origin = 'ESTOQUE_UNICO_EMPRESAS'
      Required = True
    end
    object fdQryTabelaVENDA_FORMA_PAGTO_CARTACREDITO: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'VENDA_FORMA_PAGTO_CARTACREDITO'
      Origin = 'VENDA_FORMA_PAGTO_CARTACREDITO'
    end
    object fdQryTabelaVENDA_CARREGA_PRODUTO_EAN: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'VENDA_CARREGA_PRODUTO_EAN'
      Origin = 'VENDA_CARREGA_PRODUTO_EAN'
      Required = True
    end
    object fdQryTabelaPERMITIR_VENDA_ESTOQUE_INS: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'PERMITIR_VENDA_ESTOQUE_INS'
      Origin = 'PERMITIR_VENDA_ESTOQUE_INS'
      Required = True
    end
    object fdQryTabelaNMFANT: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NMFANT'
      Origin = 'NMFANT'
      ProviderFlags = []
      Size = 25
    end
    object fdQryTabelaCONTADOR_CODIGO: TIntegerField
      FieldName = 'CONTADOR_CODIGO'
      Origin = 'CONTADOR_CODIGO'
    end
    object fdQryTabelaCONTADOR_CNPJCPF: TStringField
      FieldName = 'CONTADOR_CNPJCPF'
      Origin = 'CONTADOR_CNPJCPF'
      Size = 18
    end
    object fdQryTabelaCONTADOR_NOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CONTADOR_NOME'
      Origin = 'NOMEFORN'
      ProviderFlags = []
      Size = 100
    end
  end
  inherited fdUpdTabela: TFDUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO TBCONFIGURACAO'
      '(EMPRESA, EMAIL_CONTA, EMAIL_SENHA, EMAIL_POP, '
      '  EMAIL_SMTP, EMAIL_SMTP_PORTA, EMAIL_REQUER_AUTENTICACAO, '
      
        '  EMAIL_CONEXAO_SSL, EMAIL_ASSUNTO_PADRAO, EMAIL_MENSAGEM_PADRAO' +
        ', '
      '  CLIENTE_PERMITIR_DUPLICAR_CNPJ, CLIENTE_PERMITIR_VF_CNPJ, '
      '  CUSTO_OPER_CALCULAR, PERMITIR_VENDA_ESTOQUE_INS, '
      '  VENDA_CARREGA_PRODUTO_EAN, VENDA_FORMA_PAGTO_CARTACREDITO, '
      '  ESTOQUE_UNICO_EMPRESAS, ESTOQUE_SATELITE_CLIENTE, '
      '  AUTORIZA_INFORMA_CLIENTE, USUARIO, NFE_EMITIR, '
      '  NFE_SERIE, NFE_NUMERO, NFE_LOTE, NFE_CARTA_CORRECAO, '
      '  NFE_EMITIR_ENTRADA, NFE_ACEITAR_NOTA_DENEGADA, '
      '  NFE_SOLICITA_DH_SAIDA, NFE_IMPRIMIR_COD_CLIENTE, '
      '  NFE_IMPRIMIR_COD_REFERENCIA, NFCE_EMITIR, NFCE_SERIE, '
      '  NFCE_NUMERO, NFCE_TOKEN_ID, NFCE_TOKEN, NFSE_EMITIR, '
      '  RPS_SERIE, RPS_NUMERO, NFSE_SERIE, NFSE_NUMERO, '
      
        '  NFSE_PERCENTUAL_PIS, NFSE_PERCENTUAL_COFINS, NFSE_PERCENTUAL_C' +
        'SLL, '
      '  NFSE_PERCENTUAL_ISSQN, CONTADOR_CODIGO, CONTADOR_CNPJCPF)'
      
        'VALUES (:NEW_EMPRESA, :NEW_EMAIL_CONTA, :NEW_EMAIL_SENHA, :NEW_E' +
        'MAIL_POP, '
      
        '  :NEW_EMAIL_SMTP, :NEW_EMAIL_SMTP_PORTA, :NEW_EMAIL_REQUER_AUTE' +
        'NTICACAO, '
      
        '  :NEW_EMAIL_CONEXAO_SSL, :NEW_EMAIL_ASSUNTO_PADRAO, :NEW_EMAIL_' +
        'MENSAGEM_PADRAO, '
      
        '  :NEW_CLIENTE_PERMITIR_DUPLICAR_CNPJ, :NEW_CLIENTE_PERMITIR_VF_' +
        'CNPJ, '
      '  :NEW_CUSTO_OPER_CALCULAR, :NEW_PERMITIR_VENDA_ESTOQUE_INS, '
      
        '  :NEW_VENDA_CARREGA_PRODUTO_EAN, :NEW_VENDA_FORMA_PAGTO_CARTACR' +
        'EDITO, '
      '  :NEW_ESTOQUE_UNICO_EMPRESAS, :NEW_ESTOQUE_SATELITE_CLIENTE, '
      '  :NEW_AUTORIZA_INFORMA_CLIENTE, :NEW_USUARIO, :NEW_NFE_EMITIR, '
      
        '  :NEW_NFE_SERIE, :NEW_NFE_NUMERO, :NEW_NFE_LOTE, :NEW_NFE_CARTA' +
        '_CORRECAO, '
      '  :NEW_NFE_EMITIR_ENTRADA, :NEW_NFE_ACEITAR_NOTA_DENEGADA, '
      '  :NEW_NFE_SOLICITA_DH_SAIDA, :NEW_NFE_IMPRIMIR_COD_CLIENTE, '
      
        '  :NEW_NFE_IMPRIMIR_COD_REFERENCIA, :NEW_NFCE_EMITIR, :NEW_NFCE_' +
        'SERIE, '
      
        '  :NEW_NFCE_NUMERO, :NEW_NFCE_TOKEN_ID, :NEW_NFCE_TOKEN, :NEW_NF' +
        'SE_EMITIR, '
      
        '  :NEW_RPS_SERIE, :NEW_RPS_NUMERO, :NEW_NFSE_SERIE, :NEW_NFSE_NU' +
        'MERO, '
      
        '  :NEW_NFSE_PERCENTUAL_PIS, :NEW_NFSE_PERCENTUAL_COFINS, :NEW_NF' +
        'SE_PERCENTUAL_CSLL, '
      
        '  :NEW_NFSE_PERCENTUAL_ISSQN, :NEW_CONTADOR_CODIGO, :NEW_CONTADO' +
        'R_CNPJCPF)')
    ModifySQL.Strings = (
      'UPDATE TBCONFIGURACAO'
      
        'SET EMPRESA = :NEW_EMPRESA, EMAIL_CONTA = :NEW_EMAIL_CONTA, EMAI' +
        'L_SENHA = :NEW_EMAIL_SENHA, '
      '  EMAIL_POP = :NEW_EMAIL_POP, EMAIL_SMTP = :NEW_EMAIL_SMTP, '
      
        '  EMAIL_SMTP_PORTA = :NEW_EMAIL_SMTP_PORTA, EMAIL_REQUER_AUTENTI' +
        'CACAO = :NEW_EMAIL_REQUER_AUTENTICACAO, '
      
        '  EMAIL_CONEXAO_SSL = :NEW_EMAIL_CONEXAO_SSL, EMAIL_ASSUNTO_PADR' +
        'AO = :NEW_EMAIL_ASSUNTO_PADRAO, '
      
        '  EMAIL_MENSAGEM_PADRAO = :NEW_EMAIL_MENSAGEM_PADRAO, CLIENTE_PE' +
        'RMITIR_DUPLICAR_CNPJ = :NEW_CLIENTE_PERMITIR_DUPLICAR_CNPJ, '
      '  CLIENTE_PERMITIR_VF_CNPJ = :NEW_CLIENTE_PERMITIR_VF_CNPJ, '
      
        '  CUSTO_OPER_CALCULAR = :NEW_CUSTO_OPER_CALCULAR, PERMITIR_VENDA' +
        '_ESTOQUE_INS = :NEW_PERMITIR_VENDA_ESTOQUE_INS, '
      '  VENDA_CARREGA_PRODUTO_EAN = :NEW_VENDA_CARREGA_PRODUTO_EAN, '
      
        '  VENDA_FORMA_PAGTO_CARTACREDITO = :NEW_VENDA_FORMA_PAGTO_CARTAC' +
        'REDITO, '
      
        '  ESTOQUE_UNICO_EMPRESAS = :NEW_ESTOQUE_UNICO_EMPRESAS, ESTOQUE_' +
        'SATELITE_CLIENTE = :NEW_ESTOQUE_SATELITE_CLIENTE, '
      '  AUTORIZA_INFORMA_CLIENTE = :NEW_AUTORIZA_INFORMA_CLIENTE, '
      
        '  USUARIO = :NEW_USUARIO, NFE_EMITIR = :NEW_NFE_EMITIR, NFE_SERI' +
        'E = :NEW_NFE_SERIE, '
      '  NFE_NUMERO = :NEW_NFE_NUMERO, NFE_LOTE = :NEW_NFE_LOTE, '
      
        '  NFE_CARTA_CORRECAO = :NEW_NFE_CARTA_CORRECAO, NFE_EMITIR_ENTRA' +
        'DA = :NEW_NFE_EMITIR_ENTRADA, '
      '  NFE_ACEITAR_NOTA_DENEGADA = :NEW_NFE_ACEITAR_NOTA_DENEGADA, '
      
        '  NFE_SOLICITA_DH_SAIDA = :NEW_NFE_SOLICITA_DH_SAIDA, NFE_IMPRIM' +
        'IR_COD_CLIENTE = :NEW_NFE_IMPRIMIR_COD_CLIENTE, '
      
        '  NFE_IMPRIMIR_COD_REFERENCIA = :NEW_NFE_IMPRIMIR_COD_REFERENCIA' +
        ', '
      '  NFCE_EMITIR = :NEW_NFCE_EMITIR, NFCE_SERIE = :NEW_NFCE_SERIE, '
      
        '  NFCE_NUMERO = :NEW_NFCE_NUMERO, NFCE_TOKEN_ID = :NEW_NFCE_TOKE' +
        'N_ID, '
      '  NFCE_TOKEN = :NEW_NFCE_TOKEN, NFSE_EMITIR = :NEW_NFSE_EMITIR, '
      '  RPS_SERIE = :NEW_RPS_SERIE, RPS_NUMERO = :NEW_RPS_NUMERO, '
      '  NFSE_SERIE = :NEW_NFSE_SERIE, NFSE_NUMERO = :NEW_NFSE_NUMERO, '
      
        '  NFSE_PERCENTUAL_PIS = :NEW_NFSE_PERCENTUAL_PIS, NFSE_PERCENTUA' +
        'L_COFINS = :NEW_NFSE_PERCENTUAL_COFINS, '
      
        '  NFSE_PERCENTUAL_CSLL = :NEW_NFSE_PERCENTUAL_CSLL, NFSE_PERCENT' +
        'UAL_ISSQN = :NEW_NFSE_PERCENTUAL_ISSQN, '
      
        '  CONTADOR_CODIGO = :NEW_CONTADOR_CODIGO, CONTADOR_CNPJCPF = :NE' +
        'W_CONTADOR_CNPJCPF'
      'WHERE EMPRESA = :OLD_EMPRESA')
    DeleteSQL.Strings = (
      'DELETE FROM TBCONFIGURACAO'
      'WHERE EMPRESA = :OLD_EMPRESA')
    FetchRowSQL.Strings = (
      
        'SELECT EMPRESA, EMAIL_CONTA, EMAIL_SENHA, EMAIL_POP, EMAIL_SMTP,' +
        ' EMAIL_SMTP_PORTA, '
      
        '  EMAIL_REQUER_AUTENTICACAO, EMAIL_CONEXAO_SSL, EMAIL_ASSUNTO_PA' +
        'DRAO, '
      
        '  EMAIL_MENSAGEM_PADRAO, CLIENTE_PERMITIR_DUPLICAR_CNPJ, CLIENTE' +
        '_PERMITIR_VF_CNPJ, '
      
        '  CUSTO_OPER_CALCULAR, PERMITIR_VENDA_ESTOQUE_INS, VENDA_CARREGA' +
        '_PRODUTO_EAN, '
      '  VENDA_FORMA_PAGTO_CARTACREDITO, ESTOQUE_UNICO_EMPRESAS, '
      '  ESTOQUE_SATELITE_CLIENTE, AUTORIZA_INFORMA_CLIENTE, USUARIO, '
      
        '  NFE_EMITIR, NFE_SERIE, NFE_NUMERO, NFE_LOTE, NFE_CARTA_CORRECA' +
        'O, '
      
        '  NFE_EMITIR_ENTRADA, NFE_ACEITAR_NOTA_DENEGADA, NFE_SOLICITA_DH' +
        '_SAIDA, '
      
        '  NFE_IMPRIMIR_COD_CLIENTE, NFE_IMPRIMIR_COD_REFERENCIA, NFCE_EM' +
        'ITIR, '
      
        '  NFCE_SERIE, NFCE_NUMERO, NFCE_TOKEN_ID, NFCE_TOKEN, NFSE_EMITI' +
        'R, '
      
        '  RPS_SERIE, RPS_NUMERO, NFSE_SERIE, NFSE_NUMERO, NFSE_PERCENTUA' +
        'L_PIS, '
      
        '  NFSE_PERCENTUAL_COFINS, NFSE_PERCENTUAL_CSLL, NFSE_PERCENTUAL_' +
        'ISSQN, '
      '  CONTADOR_CODIGO, CONTADOR_CNPJCPF'
      'FROM TBCONFIGURACAO'
      'WHERE EMPRESA = :OLD_EMPRESA')
    Left = 408
  end
  object dtsEmpresa: TDataSource
    DataSet = fdQryEmpresa
    Left = 680
    Top = 328
  end
  object fdQryFormaPagto: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    f.cod'
      '  , lpad(f.cod, 2, '#39'0'#39') || '#39' - '#39' || trim(f.descri) as descri'
      'from TBFORMPAGTO f')
    Left = 648
    Top = 296
  end
  object DtsFormaPagto: TDataSource
    DataSet = fdQryFormaPagto
    Left = 680
    Top = 296
  end
  object fdQryEmpresa: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    e.codigo'
      '  , e.cnpj'
      '  , e.rzsoc'
      '  , e.nmfant'
      'from TBEMPRESA e'
      'order by'
      '    e.rzsoc')
    Left = 648
    Top = 328
  end
  object fdQryConfiguracoes: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '  c.Empresa'
      'from TBCONFIGURACAO c'
      'where c.empresa = :empresa')
    Left = 648
    Top = 360
    ParamData = <
      item
        Name = 'EMPRESA'
        DataType = ftString
        ParamType = ptInput
        Size = 18
        Value = Null
      end>
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
