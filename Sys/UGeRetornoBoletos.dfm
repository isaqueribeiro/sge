object frmGeRetornoBoleto: TfrmGeRetornoBoleto
  Left = 425
  Top = 253
  BorderIcons = [biSystemMenu]
  Caption = 'Retorno Boletos'
  ClientHeight = 441
  ClientWidth = 912
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 398
    Width = 912
    Height = 4
    Align = alBottom
    Shape = bsSpacer
    ExplicitTop = 399
  end
  object Bevel5: TBevel
    Left = 0
    Top = 437
    Width = 912
    Height = 4
    Align = alBottom
    Shape = bsSpacer
    ExplicitTop = 438
  end
  object pnlFiltro: TPanel
    Left = 0
    Top = 0
    Width = 912
    Height = 161
    Align = alTop
    BevelOuter = bvNone
    BorderWidth = 4
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 4
      Top = 4
      Width = 904
      Height = 153
      Align = alClient
      Caption = 
        'Dados para processar arquivo de retorno de boletos recebidos pel' +
        'os bancos'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      DesignSize = (
        904
        153)
      object lblBanco: TLabel
        Left = 8
        Top = 24
        Width = 197
        Height = 13
        Caption = 'Selecionar a entidade financeira (Banco):'
        FocusControl = edBanco
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblDiretorioRetorno: TLabel
        Left = 8
        Top = 64
        Width = 163
        Height = 13
        Caption = 'Diret'#243'rio dos arquivos de retorno:'
        FocusControl = edDiretorioRetorno
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 315
        Top = 21
        Width = 324
        Height = 13
        Caption = 
          'Rela'#231#227'o de arquivos de retorno da entidade financeira selecionad' +
          'a:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblFormaPagto: TLabel
        Left = 8
        Top = 104
        Width = 160
        Height = 13
        Caption = 'Forma de Pagamento para Baixa:'
        FocusControl = edFormaPagto
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edBanco: TComboBox
        Left = 8
        Top = 40
        Width = 301
        Height = 21
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 0
        Text = '000 - Configurar Boleto em Cadastro/Bancos'
        OnChange = edBancoChange
        Items.Strings = (
          '000 - Configurar Boleto em Cadastro/Bancos')
      end
      object edDiretorioRetorno: TEdit
        Left = 8
        Top = 80
        Width = 301
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object lstBxRetorno: TCheckListBox
        Left = 315
        Top = 40
        Width = 578
        Height = 97
        Anchors = [akLeft, akTop, akRight]
        Columns = 4
        ItemHeight = 13
        Items.Strings = (
          '01'
          '02'
          '03'
          '04'
          '05'
          '06'
          '07'
          '08'
          '09'
          '10'
          '11'
          '12'
          '13'
          '14'
          '15'
          '16'
          '17'
          '18'
          '19'
          '20'
          '21')
        TabOrder = 3
      end
      object edFormaPagto: TComboBox
        Left = 8
        Top = 120
        Width = 301
        Height = 21
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 2
        Text = '000 - Configurar Forma de Pagamento'
        OnChange = edFormaPagtoChange
        Items.Strings = (
          '000 - Configurar Forma de Pagamento')
      end
    end
  end
  object pnlTitulos: TPanel
    Left = 0
    Top = 161
    Width = 912
    Height = 237
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 4
    TabOrder = 2
    object Shape1: TShape
      Left = 4
      Top = 4
      Width = 904
      Height = 20
      Align = alTop
      Brush.Color = clMoneyGreen
      Pen.Color = 9355662
    end
    object Bevel6: TBevel
      Left = 4
      Top = 24
      Width = 904
      Height = 4
      Align = alTop
      Shape = bsSpacer
    end
    object Label3: TLabel
      Left = 8
      Top = 8
      Width = 383
      Height = 13
      Caption = 
        'Rela'#231#227'o dos t'#237'tulos recebidos presentes no(s) arquivo(s) de reto' +
        'rno'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object dbgTitulos: TDBGrid
      Left = 4
      Top = 28
      Width = 904
      Height = 205
      TabStop = False
      Align = alClient
      DataSource = DtsTitulos
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = [fsBold]
      OnDrawColumnCell = dbgTitulosDrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'Quitar'
          Title.Alignment = taCenter
          Width = 45
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NossoNumero'
          Title.Caption = 'Nosso Numero'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NumeroDocumento'
          Title.Alignment = taCenter
          Title.Caption = 'No. Documento'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DataPagamento'
          Title.Alignment = taCenter
          Title.Caption = 'Data Pagto.'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ValorPago'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Lancamento'
          Title.Alignment = taCenter
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Parcela'
          Title.Alignment = taCenter
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'APagar'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Sacado'
          Width = 250
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Cnpj'
          Title.Caption = 'Cpf / Cnpj'
          Width = 120
          Visible = True
        end>
    end
    object FileListBox: TFileListBox
      Left = 608
      Top = 72
      Width = 281
      Height = 129
      ItemHeight = 13
      Mask = '*.RET'
      TabOrder = 1
      Visible = False
    end
  end
  object tlbBotoes: TPanel
    Left = 0
    Top = 402
    Width = 912
    Height = 35
    Align = alBottom
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 1
    object Bevel2: TBevel
      Left = 0
      Top = 0
      Width = 4
      Height = 35
      Align = alLeft
      Shape = bsSpacer
    end
    object Bevel3: TBevel
      Left = 79
      Top = 0
      Width = 4
      Height = 35
      Align = alLeft
      Shape = bsSpacer
    end
    object Bevel4: TBevel
      Left = 319
      Top = 0
      Width = 4
      Height = 35
      Align = alLeft
      Shape = bsSpacer
    end
    object btnFechar: TcxButton
      Left = 4
      Top = 0
      Width = 75
      Height = 35
      Align = alLeft
      Caption = '&Fechar'
      OptionsImage.ImageIndex = 15
      OptionsImage.Images = DMRecursos.ImgBotoes16x16
      TabOrder = 0
      TabStop = False
      OnClick = btnFecharClick
    end
    object btnCarregarRetorno: TcxButton
      Left = 83
      Top = 0
      Width = 118
      Height = 35
      Align = alLeft
      Caption = 'Carregar &Retorno'
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        424D360800000000000036000000280000002000000010000000010020000000
        000000000000C40E0000C40E000000000000000000000000FF000000FF000000
        FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
        FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
        FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
        FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
        FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
        FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
        FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
        FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
        FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
        FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
        FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
        FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
        FF000000FF000000FF00CDA187FFE5BC9EFF0000FF000000FF000000FF000000
        FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
        FF000000FF000000FF009D9D9DFFB7B7B7FF0000FF000000FF000000FF000000
        FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
        FF000000FF00AA7457FF904820FFB47657FFF0CEB3FF0000FF000000FF000000
        FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
        FF000000FF00707070FF434343FF727272FFC9C9C9FF0000FF000000FF000000
        FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
        FF00A55839FFD07850FFD07040FFB06030FFCB9173FF0000FF000000FF000000
        FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
        FF00565656FF747474FF6B6B6BFF595959FF8D8D8DFF0000FF000000FF000000
        FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00A050
        30FFD07850FFF09060FFE19C75FFD08860FFB96F42FFD3A486FF0000FF000000
        FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF004E4E
        4EFF747474FF8B8B8BFF979797FF838383FF686868FF9F9F9FFF0000FF000000
        FF000000FF000000FF000000FF000000FF000000FF000000FF00A56039FFE080
        50FFF09060FFF3AF8EFF0000FF00F2AA86FFD08860FFB46739FFEBC9AFFF0000
        FF000000FF000000FF000000FF000000FF000000FF000000FF005B5B5BFF7B7B
        7BFF8B8B8BFFABABABFF0000FF00A6A6A6FF838383FF606060FFC4C4C4FF0000
        FF000000FF000000FF000000FF000000FF000000FF000000FF00F1B698FFF0A8
        90FFF2AC82FF0000FF000000FF000000FF00E6AA86FFD08860FFAA6841FFF2C7
        B4FF0000FF000000FF000000FF000000FF000000FF000000FF00B2B2B2FFA8A8
        A8FFA6A6A6FF0000FF000000FF000000FF00A5A5A5FF838383FF626262FFC5C5
        C5FF0000FF000000FF000000FF000000FF000000FF000000FF00FDE0CDFFF7CE
        B6FF0000FF000000FF000000FF000000FF000000FF00E19C75FFD07850FFB47D
        56FFF2CCB3FF0000FF000000FF000000FF000000FF000000FF00DDDDDDFFCACA
        CAFF0000FF000000FF000000FF000000FF000000FF00979797FF747474FF7676
        76FFC8C8C8FF0000FF000000FF000000FF000000FF000000FF000000FF000000
        FF000000FF000000FF000000FF000000FF000000FF000000FF00E19C74FFC070
        40FFC38C74FFF1CAB0FF0000FF000000FF000000FF000000FF000000FF000000
        FF000000FF000000FF000000FF000000FF000000FF000000FF00969696FF6969
        69FF8A8A8AFFC6C6C6FF0000FF000000FF000000FF000000FF000000FF000000
        FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00E29F
        79FFC07040FFD29B82FFEBC3A8FF0000FF000000FF000000FF000000FF000000
        FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF009A9A
        9AFF696969FF999999FFBEBEBEFF0000FF000000FF000000FF000000FF000000
        FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
        FF00F1AF91FFC07050FFE4B99BFF0000FF000000FF000000FF000000FF000000
        FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
        FF00ACACACFF6E6E6EFFB4B4B4FF0000FF000000FF000000FF000000FF000000
        FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
        FF000000FF00F1C1A7FFD29172FF0000FF000000FF000000FF000000FF000000
        FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
        FF000000FF00BEBEBEFF8E8E8EFF0000FF000000FF000000FF000000FF000000
        FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
        FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
        FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
        FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
        FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
        FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
        FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
        FF000000FF000000FF000000FF000000FF000000FF00}
      OptionsImage.NumGlyphs = 2
      TabOrder = 1
      OnClick = btnCarregarRetornoClick
    end
    object btnConfirmarBaixa: TcxButton
      Left = 201
      Top = 0
      Width = 118
      Height = 35
      Align = alLeft
      Caption = '&Confirmar Baixa'
      Enabled = False
      OptionsImage.ImageIndex = 57
      OptionsImage.Images = DMRecursos.ImgPrincipal16x16
      TabOrder = 2
      OnClick = btnConfirmarBaixaClick
    end
  end
  object CdsTitulos: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    FieldDefs = <
      item
        Name = 'Quitar'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NossoNumero'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DataPagamento'
        DataType = ftDate
      end
      item
        Name = 'ValorPago'
        DataType = ftCurrency
      end
      item
        Name = 'NumeroDocumento'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Arquivo'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'Ano'
        DataType = ftSmallint
      end
      item
        Name = 'Lancamento'
        DataType = ftLargeint
      end
      item
        Name = 'Parcela'
        DataType = ftInteger
      end
      item
        Name = 'Banco'
        DataType = ftInteger
      end
      item
        Name = 'APagar'
        DataType = ftCurrency
      end
      item
        Name = 'Sacado'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'Cnpj'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'AnoVenda'
        DataType = ftInteger
      end
      item
        Name = 'NumVenda'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 16
    Top = 264
    object CdsTitulosQuitar: TStringField
      Alignment = taCenter
      FieldName = 'Quitar'
      Size = 1
    end
    object CdsTitulosNossoNumero: TStringField
      FieldName = 'NossoNumero'
    end
    object CdsTitulosDataPagamento: TDateField
      Alignment = taCenter
      DisplayLabel = 'D. Pagto.'
      FieldName = 'DataPagamento'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object CdsTitulosValorPago: TCurrencyField
      DisplayLabel = 'Valor Pago (R$)'
      FieldName = 'ValorPago'
      DisplayFormat = ',0.00'
    end
    object CdsTitulosNumeroDocumento: TStringField
      FieldName = 'NumeroDocumento'
    end
    object CdsTitulosAno: TSmallintField
      FieldName = 'Ano'
    end
    object CdsTitulosLancamento: TLargeintField
      Alignment = taCenter
      DisplayLabel = 'Lan'#231'amento'
      FieldName = 'Lancamento'
      DisplayFormat = '0000000'
    end
    object CdsTitulosParcela: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Parc.'
      FieldName = 'Parcela'
      DisplayFormat = '000'
    end
    object CdsTitulosBanco: TIntegerField
      Alignment = taCenter
      FieldName = 'Banco'
      DisplayFormat = '000'
    end
    object CdsTitulosAPagar: TCurrencyField
      DisplayLabel = 'A Pagar (R$)'
      FieldName = 'APagar'
      DisplayFormat = ',0.00'
    end
    object CdsTitulosSacado: TStringField
      FieldName = 'Sacado'
      Size = 60
    end
    object CdsTitulosCnpj: TStringField
      FieldName = 'Cnpj'
    end
    object CdsTitulosAnoVenda: TIntegerField
      FieldName = 'AnoVenda'
    end
    object CdsTitulosNumVenda: TIntegerField
      FieldName = 'NumVenda'
    end
    object CdsTitulosArquivo: TStringField
      FieldName = 'Arquivo'
      Size = 250
    end
    object CdsTitulosTotalAPagar: TAggregateField
      FieldName = 'TotalAPagar'
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'SUM(APagar)'
    end
  end
  object DtsTitulos: TDataSource
    DataSet = CdsTitulos
    Left = 48
    Top = 264
  end
  object ACBrBoleto: TACBrBoleto
    Banco.TamanhoMaximoNossoNum = 10
    Banco.TipoCobranca = cobNenhum
    Banco.LayoutVersaoArquivo = 0
    Banco.LayoutVersaoLote = 0
    Banco.CasasDecimaisMoraJuros = 2
    Cedente.TipoInscricao = pJuridica
    Cedente.IdentDistribuicao = tbBancoDistribui
    NumeroArquivo = 0
    ACBrBoletoFC = ACBrBoletoFCFR
    Configuracoes.Arquivos.LogRegistro = False
    Configuracoes.WebService.SSLHttpLib = httpOpenSSL
    Configuracoes.WebService.StoreName = 'My'
    Configuracoes.WebService.Ambiente = taHomologacao
    Configuracoes.WebService.Operacao = tpInclui
    Configuracoes.WebService.VersaoDF = '1.2'
    Left = 344
    Top = 245
  end
  object ACBrBoletoFCFR: TACBrBoletoFCFR
    LayOut = lPadraoEntrega
    ModoThread = False
    IncorporarBackgroundPdf = False
    IncorporarFontesPdf = False
    Left = 376
    Top = 245
  end
  object QryFormaPagto: TFDQuery
    Connection = DMBusiness.fdConexao
    SQL.Strings = (
      'Select'
      '    fp.cod     as forma_pagto'
      '  , fp.descri  as forma_pagto_desc'
      'from TBBANCO_BOLETO bb'
      
        '  inner join TBCONTA_CORRENTE cc on (cc.conta_banco_boleto = bb.' +
        'bco_cod)'
      
        '  inner join TBFORMPAGTO_CONTACOR fc on (fc.conta_corrente = cc.' +
        'codigo)'
      '  inner join TBFORMPAGTO fp on (fp.cod = fc.forma_pagto)'
      'where bb.bco_cod = :banco')
    Left = 136
    Top = 241
    ParamData = <
      item
        Name = 'BANCO'
        DataType = ftSmallint
        ParamType = ptInput
        Value = Null
      end>
  end
  object fdQryBancos: TFDQuery
    CachedUpdates = True
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    UpdateObject = fdUpdBancos
    SQL.Strings = (
      'Select'
      '    b.bco_codigo'
      '  , b.bco_cod'
      '  , b.bco_carteira'
      '  , b.bco_nome'
      '  , b.bco_agencia'
      '  , b.bco_cc'
      '  , b.bco_codigo_cedente'
      '  , b.bco_chave'
      '  , b.bco_gerar_boleto'
      '  , b.bco_nosso_num_inicio'
      '  , b.bco_nosso_num_final'
      '  , b.bco_nosso_num_proximo'
      '  , b.BCO_CONFG_1'
      '  , b.BCO_CONFG_2'
      '  , b.bco_sequencial_rem'
      '  , b.bco_diretorio_remessa'
      '  , b.bco_diretorio_retorno'
      '  , b.bco_percentual_juros'
      '  , b.bco_percentual_mora'
      '  , b.bco_dia_protesto'
      '  , b.bco_msg_instrucao'
      '  , b.bco_layout_remessa'
      '  , b.bco_layout_retorno'
      '  , b.empresa'
      '  , e.rzsoc'
      '  , e.nmfant'
      '  , e.ie'
      '  , e.im'
      '  , e.ender'
      '  , e.complemento'
      '  , e.numero_end'
      '  , e.bairro'
      '  , e.cep'
      '  , e.cidade'
      '  , e.uf'
      '  , e.email'
      'from TBBANCO_BOLETO b'
      '  inner join TBEMPRESA e on (b.empresa = e.cnpj)'
      ''
      'where b.bco_gerar_boleto = 1'
      '  and b.empresa = :empresa')
    Left = 24
    Top = 216
    ParamData = <
      item
        Name = 'EMPRESA'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object fdUpdBancos: TFDUpdateSQL
    Connection = DMBusiness.fdConexao
    InsertSQL.Strings = (
      'INSERT INTO TBBANCO_BOLETO'
      '(BCO_CODIGO, BCO_COD, EMPRESA, BCO_CARTEIRA, '
      '  BCO_NOME, BCO_AGENCIA, BCO_CC, BCO_CODIGO_CEDENTE, '
      '  BCO_CHAVE, BCO_GERAR_BOLETO, BCO_NOSSO_NUM_INICIO, '
      '  BCO_NOSSO_NUM_FINAL, BCO_NOSSO_NUM_PROXIMO, BCO_CONFG_1, '
      '  BCO_CONFG_2, BCO_SEQUENCIAL_REM, BCO_DIRETORIO_REMESSA, '
      
        '  BCO_DIRETORIO_RETORNO, BCO_PERCENTUAL_JUROS, BCO_PERCENTUAL_MO' +
        'RA, '
      '  BCO_DIA_PROTESTO, BCO_MSG_INSTRUCAO, BCO_LAYOUT_REMESSA, '
      '  BCO_LAYOUT_RETORNO)'
      
        'VALUES (:NEW_BCO_CODIGO, :NEW_BCO_COD, :NEW_EMPRESA, :NEW_BCO_CA' +
        'RTEIRA, '
      
        '  :NEW_BCO_NOME, :NEW_BCO_AGENCIA, :NEW_BCO_CC, :NEW_BCO_CODIGO_' +
        'CEDENTE, '
      
        '  :NEW_BCO_CHAVE, :NEW_BCO_GERAR_BOLETO, :NEW_BCO_NOSSO_NUM_INIC' +
        'IO, '
      
        '  :NEW_BCO_NOSSO_NUM_FINAL, :NEW_BCO_NOSSO_NUM_PROXIMO, :NEW_BCO' +
        '_CONFG_1, '
      
        '  :NEW_BCO_CONFG_2, :NEW_BCO_SEQUENCIAL_REM, :NEW_BCO_DIRETORIO_' +
        'REMESSA, '
      
        '  :NEW_BCO_DIRETORIO_RETORNO, :NEW_BCO_PERCENTUAL_JUROS, :NEW_BC' +
        'O_PERCENTUAL_MORA, '
      
        '  :NEW_BCO_DIA_PROTESTO, :NEW_BCO_MSG_INSTRUCAO, :NEW_BCO_LAYOUT' +
        '_REMESSA, '
      '  :NEW_BCO_LAYOUT_RETORNO)')
    ModifySQL.Strings = (
      'UPDATE TBBANCO_BOLETO'
      
        'SET BCO_CODIGO = :NEW_BCO_CODIGO, BCO_COD = :NEW_BCO_COD, EMPRES' +
        'A = :NEW_EMPRESA, '
      '  BCO_CARTEIRA = :NEW_BCO_CARTEIRA, BCO_NOME = :NEW_BCO_NOME, '
      
        '  BCO_AGENCIA = :NEW_BCO_AGENCIA, BCO_CC = :NEW_BCO_CC, BCO_CODI' +
        'GO_CEDENTE = :NEW_BCO_CODIGO_CEDENTE, '
      
        '  BCO_CHAVE = :NEW_BCO_CHAVE, BCO_GERAR_BOLETO = :NEW_BCO_GERAR_' +
        'BOLETO, '
      
        '  BCO_NOSSO_NUM_INICIO = :NEW_BCO_NOSSO_NUM_INICIO, BCO_NOSSO_NU' +
        'M_FINAL = :NEW_BCO_NOSSO_NUM_FINAL, '
      
        '  BCO_NOSSO_NUM_PROXIMO = :NEW_BCO_NOSSO_NUM_PROXIMO, BCO_CONFG_' +
        '1 = :NEW_BCO_CONFG_1, '
      
        '  BCO_CONFG_2 = :NEW_BCO_CONFG_2, BCO_SEQUENCIAL_REM = :NEW_BCO_' +
        'SEQUENCIAL_REM, '
      
        '  BCO_DIRETORIO_REMESSA = :NEW_BCO_DIRETORIO_REMESSA, BCO_DIRETO' +
        'RIO_RETORNO = :NEW_BCO_DIRETORIO_RETORNO, '
      
        '  BCO_PERCENTUAL_JUROS = :NEW_BCO_PERCENTUAL_JUROS, BCO_PERCENTU' +
        'AL_MORA = :NEW_BCO_PERCENTUAL_MORA, '
      
        '  BCO_DIA_PROTESTO = :NEW_BCO_DIA_PROTESTO, BCO_MSG_INSTRUCAO = ' +
        ':NEW_BCO_MSG_INSTRUCAO, '
      
        '  BCO_LAYOUT_REMESSA = :NEW_BCO_LAYOUT_REMESSA, BCO_LAYOUT_RETOR' +
        'NO = :NEW_BCO_LAYOUT_RETORNO'
      'WHERE BCO_CODIGO = :OLD_BCO_CODIGO')
    DeleteSQL.Strings = (
      'DELETE FROM TBBANCO_BOLETO'
      'WHERE BCO_CODIGO = :OLD_BCO_CODIGO')
    FetchRowSQL.Strings = (
      
        'SELECT BCO_CODIGO, BCO_COD, EMPRESA, BCO_CARTEIRA, BCO_NOME, BCO' +
        '_AGENCIA, '
      '  BCO_CC, BCO_CODIGO_CEDENTE, BCO_CHAVE, BCO_GERAR_BOLETO, '
      
        '  BCO_NOSSO_NUM_INICIO, BCO_NOSSO_NUM_FINAL, BCO_NOSSO_NUM_PROXI' +
        'MO, '
      
        '  BCO_CONFG_1, BCO_CONFG_2, BCO_SEQUENCIAL_REM, BCO_DIRETORIO_RE' +
        'MESSA, '
      
        '  BCO_DIRETORIO_RETORNO, BCO_PERCENTUAL_JUROS, BCO_PERCENTUAL_MO' +
        'RA, '
      '  BCO_DIA_PROTESTO, BCO_MSG_INSTRUCAO, BCO_LAYOUT_REMESSA, '
      '  BCO_LAYOUT_RETORNO'
      'FROM TBBANCO_BOLETO'
      'WHERE BCO_CODIGO = :BCO_CODIGO')
    Left = 56
    Top = 216
  end
  object gFind: TFDQuery
    Connection = DMBusiness.fdConexao
    Left = 136
    Top = 289
  end
  object qryBaixarREC: TFDQuery
    CachedUpdates = True
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    UpdateObject = updBaixarREC
    SQL.Strings = (
      'Select'
      '    b.ANOLANC'
      '  , b.NUMLANC'
      '  , b.SEQ'
      '  , b.HISTORICO'
      '  , b.DATA_PAGTO'
      '  , b.FORMA_PAGTO'
      '  , b.VALOR_BAIXA'
      '  , b.BANCO'
      '  , b.DOCUMENTO_BAIXA  '
      'from TBCONTREC_BAIXA b'
      'where (b.ANOLANC = 0)'
      '  and (b.NUMLANC = 0)'
      '  and (b.SEQ = 0)')
    Left = 136
    Top = 336
    object qryBaixarRECANOLANC: TSmallintField
      FieldName = 'ANOLANC'
      Origin = 'ANOLANC'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryBaixarRECNUMLANC: TIntegerField
      FieldName = 'NUMLANC'
      Origin = 'NUMLANC'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryBaixarRECSEQ: TSmallintField
      FieldName = 'SEQ'
      Origin = 'SEQ'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryBaixarRECHISTORICO: TMemoField
      FieldName = 'HISTORICO'
      Origin = 'HISTORICO'
      BlobType = ftMemo
    end
    object qryBaixarRECDATA_PAGTO: TDateField
      FieldName = 'DATA_PAGTO'
      Origin = 'DATA_PAGTO'
    end
    object qryBaixarRECFORMA_PAGTO: TSmallintField
      FieldName = 'FORMA_PAGTO'
      Origin = 'FORMA_PAGTO'
    end
    object qryBaixarRECVALOR_BAIXA: TFMTBCDField
      FieldName = 'VALOR_BAIXA'
      Origin = 'VALOR_BAIXA'
      Precision = 18
      Size = 2
    end
    object qryBaixarRECBANCO: TSmallintField
      FieldName = 'BANCO'
      Origin = 'BANCO'
    end
    object qryBaixarRECDOCUMENTO_BAIXA: TStringField
      FieldName = 'DOCUMENTO_BAIXA'
      Origin = 'DOCUMENTO_BAIXA'
      Size = 10
    end
  end
  object updBaixarREC: TFDUpdateSQL
    Connection = DMBusiness.fdConexao
    InsertSQL.Strings = (
      'INSERT INTO TBCONTREC_BAIXA'
      '(ANOLANC, NUMLANC, SEQ, HISTORICO, DATA_PAGTO, '
      '  FORMA_PAGTO, VALOR_BAIXA, BANCO, DOCUMENTO_BAIXA)'
      
        'VALUES (:NEW_ANOLANC, :NEW_NUMLANC, :NEW_SEQ, :NEW_HISTORICO, :N' +
        'EW_DATA_PAGTO, '
      
        '  :NEW_FORMA_PAGTO, :NEW_VALOR_BAIXA, :NEW_BANCO, :NEW_DOCUMENTO' +
        '_BAIXA)')
    ModifySQL.Strings = (
      'UPDATE TBCONTREC_BAIXA'
      
        'SET ANOLANC = :NEW_ANOLANC, NUMLANC = :NEW_NUMLANC, SEQ = :NEW_S' +
        'EQ, '
      '  HISTORICO = :NEW_HISTORICO, DATA_PAGTO = :NEW_DATA_PAGTO, '
      
        '  FORMA_PAGTO = :NEW_FORMA_PAGTO, VALOR_BAIXA = :NEW_VALOR_BAIXA' +
        ', '
      '  BANCO = :NEW_BANCO, DOCUMENTO_BAIXA = :NEW_DOCUMENTO_BAIXA'
      
        'WHERE ANOLANC = :OLD_ANOLANC AND NUMLANC = :OLD_NUMLANC AND SEQ ' +
        '= :OLD_SEQ')
    DeleteSQL.Strings = (
      'DELETE FROM TBCONTREC_BAIXA'
      
        'WHERE ANOLANC = :OLD_ANOLANC AND NUMLANC = :OLD_NUMLANC AND SEQ ' +
        '= :OLD_SEQ')
    FetchRowSQL.Strings = (
      
        'SELECT ANOLANC, NUMLANC, SEQ, HISTORICO, DATA_PAGTO, FORMA_PAGTO' +
        ', VALOR_BAIXA, '
      
        '  CONTROLE_CHEQUE, NUMERO_CHEQUE, EMPRESA, BANCO, BANCO_FEBRABAN' +
        ', '
      '  DOCUMENTO_BAIXA, USUARIO'
      'FROM TBCONTREC_BAIXA'
      'WHERE ANOLANC = :ANOLANC AND NUMLANC = :NUMLANC AND SEQ = :SEQ')
    Left = 168
    Top = 336
  end
end
