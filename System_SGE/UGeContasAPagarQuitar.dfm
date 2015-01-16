inherited frmGeContasAPagarQuitar: TfrmGeContasAPagarQuitar
  Left = 398
  Top = 213
  Width = 1071
  Height = 554
  Caption = 'Quitar Contas A Pagar (por Lote)'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlPesquisa: TPanel
    Width = 1055
    inherited GrpBxPesquisar: TGroupBox
      Width = 827
      DesignSize = (
        827
        73)
      inherited BrnPesquisar: TSpeedButton
        Left = 790
      end
      inherited lblPesquisar: TLabel
        Left = 232
      end
      object lblData: TLabel [2]
        Left = 17
        Top = 24
        Width = 70
        Height = 13
        Caption = '&Vencimento:'
        FocusControl = e1Data
      end
      inherited edPesquisar: TEdit
        Left = 232
        Width = 551
        TabOrder = 2
      end
      object e1Data: TDateEdit
        Left = 17
        Top = 40
        Width = 102
        Height = 21
        GlyphKind = gkCustom
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
        NumGlyphs = 2
        TabOrder = 0
        Text = '01/01/2012'
      end
      object e2Data: TDateEdit
        Left = 123
        Top = 40
        Width = 104
        Height = 21
        NumGlyphs = 2
        TabOrder = 1
        Text = '01/01/2012'
      end
    end
  end
  inherited PnlTabela: TPanel
    Width = 1055
    Height = 435
    inherited dbgDados: TDBGrid
      Width = 1047
      Height = 324
      Hint = 'Pressione "ESPA'#199'O" para'#13#10'Marcar/Desmarcar o Lan'#231'amento com "X".'
      Columns = <
        item
          Expanded = False
          FieldName = 'SELECIONAR'
          Title.Alignment = taCenter
          Title.Caption = 'Quitar'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LANCAMENTO'
          Title.Caption = 'Lan'#231'amento'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PARCELA'
          Title.Alignment = taCenter
          Title.Caption = 'Parc.'
          Width = 35
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DTEMISS'
          Title.Caption = 'Emiss'#227'o'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'DTVENC'
          Title.Caption = 'Vencimento'
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALORPAG'
          Title.Caption = 'Despesa (R$)'
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALORPAGTOT'
          Title.Caption = 'Pago (R$)'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'VALOR_APAGAR'
          Title.Caption = 'A Pagar (R$)'
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ENTRADA'
          Title.Caption = 'Entrada'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ENTRADA_DOC_TIPO'
          Title.Caption = 'Documento'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ENTRADA_DOC'
          Title.Caption = 'No. Documento'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ENTRADA_FORNECEDOR'
          Title.Caption = 'Fornecedor'
          Width = 350
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ENTRADA_FORNECEDOR_CNPJ'
          Title.Caption = 'CPF/CNPJ'
          Width = 150
          Visible = True
        end>
    end
    object PnlControleQuitacao: TPanel
      Left = 4
      Top = 328
      Width = 1047
      Height = 103
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object GrpBxControleQuitacao: TGroupBox
        Left = 0
        Top = 0
        Width = 1047
        Height = 103
        Align = alClient
        Caption = 'Dados importantes para Quita'#231#227'o'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        DesignSize = (
          1047
          103)
        object lblDataPagto: TLabel
          Left = 16
          Top = 24
          Width = 69
          Height = 13
          Caption = '&Data Pagto.:'
          FocusControl = dbDataPagto
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblFormaPagto: TLabel
          Left = 136
          Top = 24
          Width = 124
          Height = 13
          Caption = '&Forma de Pagamento:'
          FocusControl = dbFormaPagto
        end
        object lblHistorico: TLabel
          Left = 400
          Top = 24
          Width = 86
          Height = 13
          Caption = '&Hist'#243'rico Geral:'
          FocusControl = dbHistorico
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbDataPagto: TDBDateEdit
          Left = 16
          Top = 40
          Width = 113
          Height = 21
          DataField = 'DataPagto'
          DataSource = dtsPagamentoLOTE
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          NumGlyphs = 2
          ParentFont = False
          TabOrder = 0
        end
        object dbFormaPagto: TDBLookupComboBox
          Left = 136
          Top = 40
          Width = 257
          Height = 21
          DataField = 'FormaPagto'
          DataSource = dtsPagamentoLOTE
          DropDownRows = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'COD'
          ListField = 'DESCRI'
          ListSource = dtsFormaPagto
          ParentFont = False
          TabOrder = 1
        end
        object dbHistorico: TDBMemo
          Left = 400
          Top = 40
          Width = 537
          Height = 49
          Anchors = [akLeft, akTop, akRight, akBottom]
          DataField = 'HistoricoGeral'
          DataSource = dtsPagamentoLOTE
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
        object BtnQuitar: TcxButton
          Left = 939
          Top = 64
          Width = 99
          Height = 25
          Hint = 'Quitar lan'#231'amentos selecionados'
          Anchors = [akRight, akBottom]
          Caption = 'Quitar'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnClick = BtnQuitarClick
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00F0DDCD002078B0002078B0003068
            900030485000CFB9A700FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00B0D8F000C0F0F00040D0FF0030C0
            FF0030A8F000304850002070900030485000CBAF9B00FF00FF00FF00FF00F1E2
            D6002078B0002078B0003068900030405000EFD9C700A0C8D000A0C0C00090A0
            A0008080800070D0F00040D0FF0040B8F00040587000FF00FF00FF00FF0090B0
            C000C0F0F00040D0FF0030C0FF0030B0F00010385000FF00FF00FF00FF00EDD9
            C5001078B0001070A0002058700020384000B3A79D00FF00FF00FF00FF00FF00
            FF0090B0C000A0C0C00090A0A00080889000F4DDCA00FF00FF00FF00FF0090B0
            C000D0FFFF0060D8FF0040D0FF0040B8F00030586000FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00EDD8
            C5001068A0001070A0002058700020384000B3A79D00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0080C0
            D000D0FFFF0060D8FF0040D0FF0040B8F00020486000FF00FF00D07850009048
            200090482000904820008040200080402000804020008038200080382000C0B8
            C0000068A0001070A00020587000203040008098A00080202000D0785000C088
            7000C0805000B0907000D0A89000E0C8B000C0806000B0683000C050500080B8
            E000C0F0F00040D0FF0030C0FF0030A8F0002050700080202000D0805000B090
            8000D0C0B000E0D0C000D0B0A000E0C8C000B0887000B0704000C0705000D0B8
            A00080B0E000A0C0D0008098B0007080A000D0B8900080202000D0886000E0D0
            C000E0B8A000C0886000C0805000D0B8A000E0B09000B0785000B0705000E0A8
            8000C098900090583000A0604000B0A09000C098800080282000E0907000FFFF
            FF00D0988000D0886000C0886000E0D8D000C0988000C0805000B0705000C090
            7000C0B8B000A058300090583000A0603000C0C0C00080282000E0987000E0D0
            D000F0C8B000D0987000D0886000F0D8D000C0988000C0886000B0805000C090
            7000D0C0B000A0603000A0603000B0887000C090800080302000E0A08000B0A0
            9000E0C8C000F0E0E000F0C8B000E0B0A000F0C8B000D0A89000C0988000E0B8
            A000C0908000C0A09000D0B8B000B0988000A060300080302000E0A08000A088
            8000B0908000B0A09000D0C0B000FFF0E000FFF0F000F0F0F000F0F0F000F0E0
            E000F0D8C000C0A89000A078600090583000A058200080382000E0A08000E0A0
            8000E0A08000E0A08000E0988000E0987000D0907000D0887000C0806000C078
            6000B0785000B0705000B0684000A0604000A058400090503000}
        end
      end
    end
  end
  inherited QryPesquisa: TIBQuery
    SQL.Strings = (
      'Select'
      '    c.anolanc'
      '  , c.numlanc'
      
        '  , c.anolanc || '#39'/'#39' || right('#39'0000000'#39' || c.numlanc, 7) as lanc' +
        'amento'
      '  , c.empresa'
      '  , c.parcela'
      '  , c.tippag'
      '  , c.dtemiss'
      '  , c.dtvenc'
      '  , c.dtpag'
      '  , c.valorpag'
      '  , c.valormulta'
      '  , c.valorpagtot'
      '  , c.valorsaldo'
      '  , c.valorsaldo as valor_apagar'
      ''
      
        '  , c.anocompra || '#39'/'#39' || right('#39'0000000'#39' || c.numcompra, 7) as ' +
        'entrada'
      '  , c.anocompra     as entrada_ano'
      '  , c.numcompra     as entrada_numero'
      '  , d.tpd_descricao as entrada_doc_tipo'
      
        '  , right('#39'0000000'#39' || e.nf, 7) || coalesce('#39'-'#39' || nullif(trim(e' +
        '.nfserie), '#39#39'), '#39#39') as entrada_doc'
      '  , e.nf            as entrada_doc_numero'
      '  , e.nfserie       as entrada_doc_serie'
      '  , f.nomeforn      as entrada_fornecedor'
      '  , f.cnpj          as entrada_fornecedor_cnpj'
      ''
      '  , 0 as selecionar'
      'from TBCONTPAG c'
      '  left join TBFORNECEDOR f on (f.codforn = c.codforn)'
      
        '  left join TBCOMPRAS e on (e.ano = c.anocompra and c.numcompra ' +
        '= e.codcontrol)'
      
        '  left join VW_TIPO_DOCUMENTO_ENTRADA d on (d.tpd_codigo = e.tip' +
        'o_documento)'
      '')
  end
  inherited DtsPesquisa: TDataSource
    DataSet = CdsPesquisa
    Left = 360
    Top = 273
  end
  object DspPesquisa: TDataSetProvider
    DataSet = QryPesquisa
    Left = 360
    Top = 209
  end
  object CdsPesquisa: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'DspPesquisa'
    Left = 360
    Top = 241
    object CdsPesquisaANOLANC: TSmallintField
      FieldName = 'ANOLANC'
      Required = True
    end
    object CdsPesquisaNUMLANC: TIntegerField
      FieldName = 'NUMLANC'
      Required = True
    end
    object CdsPesquisaEMPRESA: TStringField
      FieldName = 'EMPRESA'
      Size = 18
    end
    object CdsPesquisaLANCAMENTO: TStringField
      FieldName = 'LANCAMENTO'
      Size = 25
    end
    object CdsPesquisaPARCELA: TSmallintField
      Alignment = taCenter
      FieldName = 'PARCELA'
      DisplayFormat = '00'
    end
    object CdsPesquisaTIPPAG: TStringField
      FieldName = 'TIPPAG'
      Size = 35
    end
    object CdsPesquisaDTEMISS: TDateField
      FieldName = 'DTEMISS'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object CdsPesquisaDTVENC: TDateField
      FieldName = 'DTVENC'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object CdsPesquisaDTPAG: TDateField
      FieldName = 'DTPAG'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object CdsPesquisaVALORPAG: TBCDField
      FieldName = 'VALORPAG'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object CdsPesquisaVALORMULTA: TBCDField
      FieldName = 'VALORMULTA'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object CdsPesquisaVALORPAGTOT: TBCDField
      FieldName = 'VALORPAGTOT'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object CdsPesquisaVALORSALDO: TBCDField
      FieldName = 'VALORSALDO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object CdsPesquisaVALOR_APAGAR: TBCDField
      FieldName = 'VALOR_APAGAR'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object CdsPesquisaENTRADA: TStringField
      FieldName = 'ENTRADA'
      Size = 25
    end
    object CdsPesquisaENTRADA_ANO: TSmallintField
      FieldName = 'ENTRADA_ANO'
    end
    object CdsPesquisaENTRADA_NUMERO: TIntegerField
      FieldName = 'ENTRADA_NUMERO'
    end
    object CdsPesquisaENTRADA_DOC_TIPO: TStringField
      FieldName = 'ENTRADA_DOC_TIPO'
      ReadOnly = True
      FixedChar = True
      Size = 12
    end
    object CdsPesquisaENTRADA_DOC: TStringField
      FieldName = 'ENTRADA_DOC'
      Size = 23
    end
    object CdsPesquisaENTRADA_DOC_NUMERO: TIntegerField
      FieldName = 'ENTRADA_DOC_NUMERO'
    end
    object CdsPesquisaENTRADA_DOC_SERIE: TStringField
      FieldName = 'ENTRADA_DOC_SERIE'
      Size = 4
    end
    object CdsPesquisaENTRADA_FORNECEDOR: TStringField
      FieldName = 'ENTRADA_FORNECEDOR'
      Size = 100
    end
    object CdsPesquisaENTRADA_FORNECEDOR_CNPJ: TStringField
      FieldName = 'ENTRADA_FORNECEDOR_CNPJ'
      Size = 18
    end
    object CdsPesquisaSELECIONAR: TIntegerField
      Alignment = taCenter
      FieldName = 'SELECIONAR'
      OnGetText = CdsPesquisaSELECIONARGetText
    end
    object CdsPesquisaSelecionados: TAggregateField
      FieldName = 'Selecionados'
      Active = True
      Expression = 'SUM(SELECIONAR)'
    end
  end
  object tblFormaPagto: TIBTable
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    TableName = 'TBFORMPAGTO'
    Left = 552
    Top = 264
  end
  object dtsFormaPagto: TDataSource
    DataSet = tblFormaPagto
    Left = 584
    Top = 264
  end
  object cdsPagamentoLOTE: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'DataPagto'
        DataType = ftDateTime
      end
      item
        Name = 'FormaPagto'
        DataType = ftInteger
      end
      item
        Name = 'HistoricoGeral'
        DataType = ftMemo
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 72
    Top = 249
    object cdsPagamentoLOTEDataPagto: TDateTimeField
      FieldName = 'DataPagto'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPagamentoLOTEFormaPagto: TIntegerField
      FieldName = 'FormaPagto'
    end
    object cdsPagamentoLOTEHistoricoGeral: TMemoField
      FieldName = 'HistoricoGeral'
      BlobType = ftMemo
    end
  end
  object dtsPagamentoLOTE: TDataSource
    DataSet = cdsPagamentoLOTE
    Left = 104
    Top = 249
  end
  object cdsPagamentos: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    CachedUpdates = True
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'Select'
      '    p.Anolanc'
      '  , p.Numlanc'
      '  , p.Seq'
      '  , p.Historico'
      '  , p.Data_pagto'
      '  , p.Forma_pagto'
      '  , f.Descri as Forma_pagto_desc'
      '  , p.Valor_baixa'
      '  , p.Numero_cheque'
      '  , p.Banco'
      '  , b.Bco_nome'
      '  , p.Documento_baixa'
      '  , p.Usuario'
      'from TBCONTPAG_BAIXA p'
      '  left join TBFORMPAGTO f on (f.Cod = p.Forma_pagto)'
      '  left join TBBANCO_BOLETO b on (b.Bco_cod = p.Banco)')
    ModifySQL.Strings = (
      '')
    UpdateObject = updPagamentos
    Left = 72
    Top = 296
    object cdsPagamentosANOLANC: TSmallintField
      FieldName = 'ANOLANC'
      Origin = 'TBCONTPAG_BAIXA.ANOLANC'
      Required = True
    end
    object cdsPagamentosNUMLANC: TIntegerField
      FieldName = 'NUMLANC'
      Origin = 'TBCONTPAG_BAIXA.NUMLANC'
      Required = True
    end
    object cdsPagamentosSEQ: TSmallintField
      Alignment = taCenter
      DisplayLabel = '#'
      FieldName = 'SEQ'
      Origin = 'TBCONTPAG_BAIXA.SEQ'
      Required = True
      DisplayFormat = '00'
    end
    object cdsPagamentosHISTORICO: TMemoField
      FieldName = 'HISTORICO'
      Origin = 'TBCONTPAG_BAIXA.HISTORICO'
      BlobType = ftMemo
      Size = 8
    end
    object cdsPagamentosDATA_PAGTO: TDateField
      Alignment = taCenter
      DisplayLabel = 'Data Pagto.'
      FieldName = 'DATA_PAGTO'
      Origin = 'TBCONTPAG_BAIXA.DATA_PAGTO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/0000;1; '
    end
    object cdsPagamentosFORMA_PAGTO: TSmallintField
      FieldName = 'FORMA_PAGTO'
      Origin = 'TBCONTPAG_BAIXA.FORMA_PAGTO'
    end
    object cdsPagamentosFORMA_PAGTO_DESC: TIBStringField
      DisplayLabel = 'Forma de Pagamento'
      FieldName = 'FORMA_PAGTO_DESC'
      Origin = 'TBFORMPAGTO.DESCRI'
      Size = 30
    end
    object cdsPagamentosVALOR_BAIXA: TIBBCDField
      DisplayLabel = 'Valor Pago (R$)'
      FieldName = 'VALOR_BAIXA'
      Origin = 'TBCONTPAG_BAIXA.VALOR_BAIXA'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsPagamentosNUMERO_CHEQUE: TIBStringField
      DisplayLabel = 'No. Cheque'
      FieldName = 'NUMERO_CHEQUE'
      Origin = 'TBCONTPAG_BAIXA.NUMERO_CHEQUE'
      Size = 10
    end
    object cdsPagamentosBANCO: TSmallintField
      FieldName = 'BANCO'
      Origin = 'TBCONTPAG_BAIXA.BANCO'
    end
    object cdsPagamentosBCO_NOME: TIBStringField
      DisplayLabel = 'Banco'
      FieldName = 'BCO_NOME'
      Origin = 'TBBANCO_BOLETO.BCO_NOME'
      Size = 50
    end
    object cdsPagamentosDOCUMENTO_BAIXA: TIBStringField
      DisplayLabel = 'Doc. Baixa'
      FieldName = 'DOCUMENTO_BAIXA'
      Origin = 'TBCONTPAG_BAIXA.DOCUMENTO_BAIXA'
      Size = 10
    end
    object cdsPagamentosUSUARIO: TIBStringField
      FieldName = 'USUARIO'
      Origin = 'TBCONTPAG_BAIXA.USUARIO'
      Size = 12
    end
  end
  object updPagamentos: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  ANOLANC,'
      '  NUMLANC,'
      '  SEQ,'
      '  HISTORICO,'
      '  DATA_PAGTO,'
      '  FORMA_PAGTO,'
      '  VALOR_BAIXA,'
      '  NUMERO_CHEQUE,'
      '  BANCO,'
      '  DOCUMENTO_BAIXA,'
      '  USUARIO'
      'from TBCONTPAG_BAIXA '
      'where'
      '  ANOLANC = :ANOLANC and'
      '  NUMLANC = :NUMLANC and'
      '  SEQ = :SEQ')
    ModifySQL.Strings = (
      'update TBCONTPAG_BAIXA'
      'set'
      '  ANOLANC = :ANOLANC,'
      '  NUMLANC = :NUMLANC,'
      '  SEQ = :SEQ,'
      '  HISTORICO = :HISTORICO,'
      '  DATA_PAGTO = :DATA_PAGTO,'
      '  FORMA_PAGTO = :FORMA_PAGTO,'
      '  VALOR_BAIXA = :VALOR_BAIXA,'
      '  NUMERO_CHEQUE = :NUMERO_CHEQUE,'
      '  BANCO = :BANCO,'
      '  DOCUMENTO_BAIXA = :DOCUMENTO_BAIXA,'
      '  USUARIO = :USUARIO'
      'where'
      '  ANOLANC = :OLD_ANOLANC and'
      '  NUMLANC = :OLD_NUMLANC and'
      '  SEQ = :OLD_SEQ')
    InsertSQL.Strings = (
      'insert into TBCONTPAG_BAIXA'
      
        '  (ANOLANC, NUMLANC, SEQ, HISTORICO, DATA_PAGTO, FORMA_PAGTO, VA' +
        'LOR_BAIXA, '
      '   NUMERO_CHEQUE, BANCO, DOCUMENTO_BAIXA, USUARIO)'
      'values'
      
        '  (:ANOLANC, :NUMLANC, :SEQ, :HISTORICO, :DATA_PAGTO, :FORMA_PAG' +
        'TO, :VALOR_BAIXA, '
      '   :NUMERO_CHEQUE, :BANCO, :DOCUMENTO_BAIXA, :USUARIO)')
    DeleteSQL.Strings = (
      'delete from TBCONTPAG_BAIXA'
      'where'
      '  ANOLANC = :OLD_ANOLANC and'
      '  NUMLANC = :OLD_NUMLANC and'
      '  SEQ = :OLD_SEQ')
    Left = 104
    Top = 296
  end
end
