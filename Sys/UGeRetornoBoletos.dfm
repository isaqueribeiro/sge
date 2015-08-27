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
  OnDestroy = FormDestroy
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
      OptionsImage.Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000000000000000000000000000000000000000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FFCDA187E5BC9E0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF9D9D9DB7B7B700
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FFAA7457904820B47657F0CEB30000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF707070434343727272C9
        C9C90000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FFA55839D07850D07040B06030CB91730000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF5656567474746B6B6B5959598D
        8D8D0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        A05030D07850F09060E19C75D08860B96F42D3A4860000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF4E4E4E7474748B8B8B97979783838368
        68689F9F9F0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFA56039
        E08050F09060F3AF8E0000FFF2AA86D08860B46739EBC9AF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF5B5B5B7B7B7B8B8B8BABABAB0000FFA6A6A683
        8383606060C4C4C40000FF0000FF0000FF0000FF0000FF0000FF0000FFF1B698
        F0A890F2AC820000FF0000FF0000FFE6AA86D08860AA6841F2C7B40000FF0000
        FF0000FF0000FF0000FF0000FFB2B2B2A8A8A8A6A6A60000FF0000FF0000FFA5
        A5A5838383626262C5C5C50000FF0000FF0000FF0000FF0000FF0000FFFDE0CD
        F7CEB60000FF0000FF0000FF0000FF0000FFE19C75D07850B47D56F2CCB30000
        FF0000FF0000FF0000FF0000FFDDDDDDCACACA0000FF0000FF0000FF0000FF00
        00FF979797747474767676C8C8C80000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FFE19C74C07040C38C74F1CA
        B00000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF9696966969698A8A8AC6C6C60000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFE29F79C07040D29B
        82EBC3A80000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF9A9A9A696969999999BEBEBE0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFF1AF91C070
        50E4B99B0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FFACACAC6E6E6EB4B4B40000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFF1C1
        A7D291720000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FFBEBEBE8E8E8E0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF}
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
  object UpdateLanc: TIBSQL
    Database = DMBusiness.ibdtbsBusiness
    SQL.Strings = (
      'Update TBCONTREC set'
      '    nossonumero = :nossonumero'
      '  , codbanco    = :banco'
      '  , dataprocessoboleto = :data'
      'where numlanc = :lancamento')
    Transaction = DMBusiness.ibtrnsctnBusiness
    Left = 112
    Top = 264
  end
  object CdsTitulos: TClientDataSet
    PersistDataPacket.Data = {
      870100009619E0BD01000000180000000F000000000003000000870106517569
      74617201004900000001000557494454480200020001000B4E6F73736F4E756D
      65726F01004900000001000557494454480200020014000D4461746150616761
      6D656E746F04000600000000000956616C6F725061676F080004000000010007
      535542545950450200490006004D6F6E6579000F4E756D65726F446F63756D65
      6E746F0100490000000100055749445448020002001400074172717569766F01
      0049000000010005574944544802000200FA0003416E6F02000100000000000A
      4C616E63616D656E746F08000100000000000750617263656C61040001000000
      00000542616E636F040001000000000006415061676172080004000000010007
      535542545950450200490006004D6F6E6579000653616361646F010049000000
      0100055749445448020002003C0004436E706A01004900000001000557494454
      4802000200140008416E6F56656E64610400010000000000084E756D56656E64
      6104000100000000000000}
    Active = True
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
  object gFind: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 80
    Top = 265
  end
  object IbQryBancos: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'Select'
      '    b.bco_cod'
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
    UpdateObject = IbUpdBancos
    Left = 16
    Top = 216
    ParamData = <
      item
        DataType = ftString
        Name = 'empresa'
        ParamType = ptInput
        Value = ''
      end>
    object IbQryBancosBCO_COD: TSmallintField
      FieldName = 'BCO_COD'
      Origin = '"TBBANCO_BOLETO"."BCO_COD"'
      ProviderFlags = [pfInUpdate, pfInKey]
      Required = True
    end
    object IbQryBancosEMPRESA: TIBStringField
      FieldName = 'EMPRESA'
      Origin = '"TBBANCO_BOLETO"."EMPRESA"'
      ProviderFlags = [pfInUpdate]
      Size = 18
    end
    object IbQryBancosBCO_CARTEIRA: TIBStringField
      FieldName = 'BCO_CARTEIRA'
      Origin = '"TBBANCO_BOLETO"."BCO_CARTEIRA"'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 10
    end
    object IbQryBancosBCO_NOME: TIBStringField
      FieldName = 'BCO_NOME'
      Origin = '"TBBANCO_BOLETO"."BCO_NOME"'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object IbQryBancosBCO_AGENCIA: TIBStringField
      FieldName = 'BCO_AGENCIA'
      Origin = '"TBBANCO_BOLETO"."BCO_AGENCIA"'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object IbQryBancosBCO_CC: TIBStringField
      FieldName = 'BCO_CC'
      Origin = '"TBBANCO_BOLETO"."BCO_CC"'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object IbQryBancosBCO_CODIGO_CEDENTE: TIBStringField
      FieldName = 'BCO_CODIGO_CEDENTE'
      Origin = '"TBBANCO_BOLETO"."BCO_CODIGO_CEDENTE"'
      Size = 10
    end
    object IbQryBancosBCO_CHAVE: TIBStringField
      FieldName = 'BCO_CHAVE'
      Origin = '"TBBANCO_BOLETO"."BCO_CHAVE"'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object IbQryBancosBCO_GERAR_BOLETO: TSmallintField
      FieldName = 'BCO_GERAR_BOLETO'
      Origin = '"TBBANCO_BOLETO"."BCO_GERAR_BOLETO"'
      ProviderFlags = [pfInUpdate]
    end
    object IbQryBancosBCO_NOSSO_NUM_INICIO: TIBStringField
      FieldName = 'BCO_NOSSO_NUM_INICIO'
      Origin = '"TBBANCO_BOLETO"."BCO_NOSSO_NUM_INICIO"'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object IbQryBancosBCO_NOSSO_NUM_FINAL: TIBStringField
      FieldName = 'BCO_NOSSO_NUM_FINAL'
      Origin = '"TBBANCO_BOLETO"."BCO_NOSSO_NUM_FINAL"'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object IbQryBancosBCO_NOSSO_NUM_PROXIMO: TIBStringField
      FieldName = 'BCO_NOSSO_NUM_PROXIMO'
      Origin = '"TBBANCO_BOLETO"."BCO_NOSSO_NUM_PROXIMO"'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object IbQryBancosBCO_CONFG_1: TIBStringField
      FieldName = 'BCO_CONFG_1'
      Origin = '"TBBANCO_BOLETO"."BCO_CONFG_1"'
      ProviderFlags = [pfInUpdate]
    end
    object IbQryBancosBCO_CONFG_2: TIBStringField
      FieldName = 'BCO_CONFG_2'
      Origin = '"TBBANCO_BOLETO"."BCO_CONFG_2"'
      ProviderFlags = [pfInUpdate]
    end
    object IbQryBancosBCO_SEQUENCIAL_REM: TIntegerField
      FieldName = 'BCO_SEQUENCIAL_REM'
      Origin = '"TBBANCO_BOLETO"."BCO_SEQUENCIAL_REM"'
      ProviderFlags = [pfInUpdate]
    end
    object IbQryBancosBCO_DIRETORIO_REMESSA: TIBStringField
      FieldName = 'BCO_DIRETORIO_REMESSA'
      Origin = '"TBBANCO_BOLETO"."BCO_DIRETORIO_REMESSA"'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object IbQryBancosBCO_DIRETORIO_RETORNO: TIBStringField
      FieldName = 'BCO_DIRETORIO_RETORNO'
      Origin = '"TBBANCO_BOLETO"."BCO_DIRETORIO_RETORNO"'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object IbQryBancosBCO_PERCENTUAL_JUROS: TIBBCDField
      FieldName = 'BCO_PERCENTUAL_JUROS'
      Origin = '"TBBANCO_BOLETO"."BCO_PERCENTUAL_JUROS"'
      Precision = 18
      Size = 2
    end
    object IbQryBancosBCO_PERCENTUAL_MORA: TIBBCDField
      FieldName = 'BCO_PERCENTUAL_MORA'
      Origin = '"TBBANCO_BOLETO"."BCO_PERCENTUAL_MORA"'
      Precision = 18
      Size = 2
    end
    object IbQryBancosBCO_DIA_PROTESTO: TSmallintField
      FieldName = 'BCO_DIA_PROTESTO'
      Origin = '"TBBANCO_BOLETO"."BCO_DIA_PROTESTO"'
    end
    object IbQryBancosBCO_MSG_INSTRUCAO: TIBStringField
      FieldName = 'BCO_MSG_INSTRUCAO'
      Origin = '"TBBANCO_BOLETO"."BCO_MSG_INSTRUCAO"'
      Size = 250
    end
    object IbQryBancosBCO_LAYOUT_REMESSA: TSmallintField
      FieldName = 'BCO_LAYOUT_REMESSA'
      Origin = '"TBBANCO_BOLETO"."BCO_LAYOUT_REMESSA"'
      ProviderFlags = []
    end
    object IbQryBancosBCO_LAYOUT_RETORNO: TSmallintField
      FieldName = 'BCO_LAYOUT_RETORNO'
      Origin = '"TBBANCO_BOLETO"."BCO_LAYOUT_RETORNO"'
      ProviderFlags = []
    end
    object IbQryBancosRZSOC: TIBStringField
      FieldName = 'RZSOC'
      Origin = '"TBEMPRESA"."RZSOC"'
      ProviderFlags = []
      Size = 60
    end
    object IbQryBancosNMFANT: TIBStringField
      FieldName = 'NMFANT'
      Origin = '"TBEMPRESA"."NMFANT"'
      ProviderFlags = []
      Size = 25
    end
    object IbQryBancosIE: TIBStringField
      FieldName = 'IE'
      Origin = '"TBEMPRESA"."IE"'
      ProviderFlags = []
      Size = 11
    end
    object IbQryBancosIM: TIBStringField
      FieldName = 'IM'
      Origin = '"TBEMPRESA"."IM"'
      ProviderFlags = []
      Size = 12
    end
    object IbQryBancosENDER: TIBStringField
      FieldName = 'ENDER'
      Origin = '"TBEMPRESA"."ENDER"'
      ProviderFlags = []
      Size = 250
    end
    object IbQryBancosCOMPLEMENTO: TIBStringField
      FieldName = 'COMPLEMENTO'
      Origin = '"TBEMPRESA"."COMPLEMENTO"'
      ProviderFlags = []
      Size = 50
    end
    object IbQryBancosNUMERO_END: TIBStringField
      FieldName = 'NUMERO_END'
      Origin = '"TBEMPRESA"."NUMERO_END"'
      ProviderFlags = []
      Size = 10
    end
    object IbQryBancosBAIRRO: TIBStringField
      FieldName = 'BAIRRO'
      Origin = '"TBEMPRESA"."BAIRRO"'
      ProviderFlags = []
      Size = 25
    end
    object IbQryBancosCEP: TIBStringField
      FieldName = 'CEP'
      Origin = '"TBEMPRESA"."CEP"'
      ProviderFlags = []
      Size = 8
    end
    object IbQryBancosCIDADE: TIBStringField
      FieldName = 'CIDADE'
      Origin = '"TBEMPRESA"."CIDADE"'
      ProviderFlags = []
      Size = 30
    end
    object IbQryBancosUF: TIBStringField
      FieldName = 'UF'
      Origin = '"TBEMPRESA"."UF"'
      ProviderFlags = []
      FixedChar = True
      Size = 2
    end
    object IbQryBancosEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = '"TBEMPRESA"."EMAIL"'
      ProviderFlags = []
      Size = 100
    end
  end
  object IbUpdBancos: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  RDB$DB_KEY as IBX_INTERNAL_DBKEY, '
      '  BCO_COD,'
      '  BCO_CARTEIRA,'
      '  BCO_NOME,'
      '  BCO_CHAVE,'
      '  BCO_AGENCIA,'
      '  BCO_CC,'
      '  BCO_NOSSO_NUM_INICIO,'
      '  BCO_NOSSO_NUM_FINAL,'
      '  BCO_NOSSO_NUM_PROXIMO,'
      '  BCO_CONFG_1,'
      '  BCO_CONFG_2,'
      '  BCO_SEQUENCIAL_REM'
      'from TBBANCO_BOLETO '
      'where'
      '  BCO_COD = :BCO_COD')
    ModifySQL.Strings = (
      'update TBBANCO_BOLETO'
      'set'
      '  BCO_AGENCIA = :BCO_AGENCIA,'
      '  BCO_CC = :BCO_CC,'
      '  BCO_NOSSO_NUM_INICIO = :BCO_NOSSO_NUM_INICIO,'
      '  BCO_NOSSO_NUM_FINAL = :BCO_NOSSO_NUM_FINAL,'
      '  BCO_NOSSO_NUM_PROXIMO = :BCO_NOSSO_NUM_PROXIMO,'
      '  BCO_SEQUENCIAL_REM = :BCO_SEQUENCIAL_REM'
      'where'
      '  BCO_COD = :OLD_BCO_COD')
    Left = 48
    Top = 216
  end
  object QryFormaPagto: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
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
    Left = 112
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'banco'
        ParamType = ptInput
        Value = 0
      end>
  end
  object ACBrBoleto: TACBrBoleto
    Banco.TamanhoMaximoNossoNum = 10
    Banco.TipoCobranca = cobNenhum
    Cedente.TipoInscricao = pJuridica
    NumeroArquivo = 0
    ACBrBoletoFC = ACBrBoletoFCFR
    Left = 344
    Top = 245
  end
  object ACBrBoletoFCFR: TACBrBoletoFCFR
    ACBrBoleto = ACBrBoleto
    LayOut = lPadraoEntrega
    Left = 376
    Top = 245
  end
end
