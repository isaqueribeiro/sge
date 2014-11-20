inherited frmGeRequisicaoCompraPesquisa: TfrmGeRequisicaoCompraPesquisa
  Left = 467
  Top = 217
  Width = 1132
  Height = 615
  ActiveControl = edTipoRequisicao
  Caption = 'Conerverter Requisi'#231#245'es em Autoriza'#231#245'es de Compras/Servi'#231'os'
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlPesquisa: TPanel
    Width = 1116
    inherited GrpBxTipoPesquisa: TGroupBox
      inherited edTipoPesquisa: TComboBox
        Text = 'Per'#237'odo, Autom'#225'tico'
        Items.Strings = (
          'Per'#237'odo, Autom'#225'tico')
      end
    end
    inherited GrpBxPesquisar: TGroupBox
      Width = 888
      DesignSize = (
        888
        73)
      inherited BrnPesquisar: TSpeedButton
        Left = 763
      end
      inherited lblPesquisar: TLabel
        Left = 440
        Visible = False
      end
      object lblData: TLabel [2]
        Left = 216
        Top = 24
        Width = 46
        Height = 13
        Caption = 'Per'#237'o&do:'
        FocusControl = e1Data
      end
      object lblTipoRequisicao: TLabel [3]
        Left = 16
        Top = 24
        Width = 91
        Height = 13
        Caption = '&Tipo Requisi'#231#227'o:'
        FocusControl = edTipoRequisicao
      end
      object lblFornecedor: TLabel [4]
        Left = 440
        Top = 24
        Width = 67
        Height = 13
        Caption = '&Fornecedor:'
        FocusControl = edFornecedor
      end
      object BtnConverter: TSpeedButton [5]
        Left = 792
        Top = 40
        Width = 89
        Height = 22
        Cursor = crHandPoint
        Caption = '&Converter'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A090604830
          604830604830604830604830604830604830604830604830604830604830FFFF
          FFFFFFFFFFFFFFFFFFFF8F9EAD33435733435733435733435733435733435733
          4357334357334357334357334357FFFFFFFFFFFFFFFFFFFFFFFFC0A890FFF8F0
          FFF0E0F0E8E0F0E0D0F0D0C0F0C8B0E0C0A0E0B8A0E0B090E0A890604830FFFF
          FFFFFFFFFFFFFFFFFFFF95A3B2F4F6F7E8ECEFE1E6EAD6DDE3C5CED6BBC5CFAE
          BAC6A9B5C19DABB999A7B5334357FFFFFFFFFFFFFFFFFFFFFFFFC0A8A0FFFFF0
          C0A8A0B0A0A0F0E8E0B0A090B09890B09890B09890B09890E0B090604830FFFF
          FFFFFFFFFFFFFFFFFFFF9AA8B6F9FAFA9AA8B692A1B0E1E6EA8E9DAC8998A889
          98A88998A88998A89DABB9334357FFFFFFFFFFFFFFFFFFFFFFFFC0A8A0FFFFF0
          FFFFF0FFF8F0FFF0E0F0E8E0F0E0D0F0D0C0F0C8B0E0C0A0E0B8A0604830FFFF
          FFFFFFFFFFFFFFFFFFFF9AA8B6F9FAFAF9FAFAF4F6F7E8ECEFE1E6EAD6DDE3C5
          CED6BBC5CFAEBAC6A9B5C1334357FFFFFFFFFFFFFFFFFFFFFFFFC0A8A0FFFFF0
          B0A8A0B0A0A0FFF8F0B0A090B09890B09890B09890B09890E0C0A0604830FFFF
          FFFFFFFFFFFFFFFFFFFF9AA8B6F9FAFA98A6B492A1B0F4F6F78E9DAC8998A889
          98A88998A88998A8AEBAC6334357FFFFFFFFFFFFFFFFFFFFFFFFC0B0A0FFFFF0
          FFFFF0FFFFF0FFFFF0FFF8F0FFF0E0F0E8E0F0E0D0F0D0C0F0C8B0604830FFFF
          FFFFFFFFFFFFFFFFFFFFA0ADBAF9FAFAF9FAFAF9FAFAF9FAFAF4F6F7E8ECEFE1
          E6EAD6DDE3C5CED6BBC5CF334357FFFFFFFFFFFFFFFFFFFFFFFFC0B0A0FFFFF0
          FFFFF0FFFFF0FFFFF0FFFFF0FFF8F0C0C8C0406070F0E0D0F0D0C0604830FFFF
          FFFFFFFFFFFFFFFFFFFFA0ADBAF9FAFAF9FAFAF9FAFAF9FAFAF9FAFAF4F6F7B9
          C4CE4F6175D6DDE3C5CED6334357FFFFFFFFFFFFFFFFFFFFFFFFC0B0A0FFFFFF
          E0E8F0607880E0E0E0FFFFF0C0C8D050607030A8D0203840B0A0A0604830FFFF
          FFFFFFFFA0B39A408050A0ADBAFFFFFFE4E9ED66778ADAE0E5F9FAFABFC9D250
          627698A6B428374A92A1B0334357FFFFFFFFFFFF9BA9B7586A7ED0B0A0FFFFFF
          90A8B080D0E0506070B0B8C050607060C0E050607030B8F01028301030401028
          3070747D40784050A860A1AEBBFFFFFF99A7B5C1CBD4506276ADB9C5506276B3
          BEC9506276ADB9C51A27382331441A27386576894E607477889AD0B8A0FFFFFF
          E0E8F090A8B080E0F050607080D0E050607060D0F040607030B0E02098D02088
          B020507050886050B060A6B3C0FFFFFFE4E9ED99A7B5D2D9E0506276C1CBD450
          6276C3CCD54F6175A2AFBC8C9BAB77889A4354686475887D8D9ED0B8A0D0B8A0
          D0B8A0C0B0A090A8B080E0F050607080E0F040587060D0F050C8F040C0F020B0
          E020A0D060987050B870A6B3C0A6B3C0A6B3C0A0ADBA99A7B5D2D9E0506276D2
          D9E04B5C70C3CCD5BCC6D0B4BFCAA0ADBA909FAE7485978696A6FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF90A8B080E0F040587080E0F070D8F060D0F050C8F040C0
          F030B8F070A88060C080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99A7B5D2D9E04B
          5C70D2D9E0CBD3DBC3CCD5BCC6D0B4BFCAADB9C58595A592A1B0FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF90A8B080E0F080E0F080E0F070D8F060D0F060B0
          D0808890B0C0A090D0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99A7B5D2
          D9E0D2D9E0D2D9E0CBD3DBC3CCD5A3B0BD78899BA7B4C0AEBAC6FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF90A8B090A0B090A0A08098A08090A08088
          90B9B9BDA0B8A0B0C0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99
          A7B593A2B18F9EAD8797A78292A378899BAEBAC6A1AEBBA7B4C0FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        NumGlyphs = 2
        ParentFont = False
        OnClick = BtnConverterClick
      end
      inherited edPesquisar: TEdit
        Left = 440
        Width = 321
        Enabled = False
        TabOrder = 4
        Visible = False
      end
      object e1Data: TDateEdit
        Left = 216
        Top = 40
        Width = 105
        Height = 21
        NumGlyphs = 2
        TabOrder = 1
        Text = '24/06/2013'
      end
      object e2Data: TDateEdit
        Left = 328
        Top = 40
        Width = 105
        Height = 21
        NumGlyphs = 2
        TabOrder = 2
        Text = '24/06/2013'
      end
      object edTipoRequisicao: TComboBox
        Left = 16
        Top = 40
        Width = 193
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
      end
      object edFornecedor: TComboEdit
        Left = 440
        Top = 40
        Width = 321
        Height = 21
        ButtonHint = 'Pesquisar Fornecedor (Ctrl+P)'#13#10#13#10'Limpar campo (Delete)'
        CharCase = ecUpperCase
        ClickKey = 16464
        Color = clMoneyGreen
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
        ShowHint = True
        TabOrder = 3
        OnButtonClick = edFornecedorButtonClick
        OnKeyDown = edFornecedorKeyDown
      end
    end
  end
  inherited PnlTabela: TPanel
    Width = 1116
    Height = 496
    inherited dbgDados: TDBGrid
      Width = 1108
      Height = 488
      OnDblClick = dbgDadosDblClick
      OnKeyDown = dbgDadosKeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'SELECIONAR'
          Title.Alignment = taCenter
          Title.Caption = 'S'
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NUMERO'
          Title.Caption = 'N'#250'mero'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EMISSAO_DATA'
          Title.Caption = 'Emiss'#227'o'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOMEFORN'
          Title.Caption = 'Fornecedor'
          Width = 300
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CNPJ'
          Title.Caption = 'CPF/CNPJ'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_CONTATO'
          Title.Caption = 'Contato'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ITENS'
          Title.Caption = 'Itens'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_TOTAL'
          Title.Caption = 'Valor (R$)'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STATUS'
          Title.Caption = 'Situa'#231#227'o'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          Title.Caption = 'XXX'
          Visible = False
        end>
    end
  end
  inherited QryPesquisa: TIBQuery
    SQL.Strings = (
      'Select'
      '    0 as selecionar'
      '  , r.ano'
      '  , r.codigo'
      '  , r.empresa'
      '  , r.numero'
      '  , r.fornecedor'
      '  , r.nome_contato'
      '  , r.tipo'
      '  , r.insercao_data'
      '  , r.emissao_data'
      '  , r.emissao_usuario'
      '  , r.validade'
      '  , r.competencia'
      '  , r.movito'
      '  , r.observacao'
      '  , r.cliente'
      '  , r.centro_custo'
      '  , r.endereco_entrega'
      '  , r.status'
      '  , r.recebedor_nome'
      '  , r.recebedor_cpf'
      '  , r.recebedor_funcao'
      '  , r.forma_pagto'
      '  , r.condicao_pagto'
      '  , r.transportador'
      
        '  , (Select count(x.seq) from TBREQUISITA_COMPRAITEM x WHERE x.a' +
        'no = r.ano and x.codigo = r.codigo and x.empresa = r.empresa) as' +
        ' itens'
      '  , r.valor_bruto'
      '  , r.valor_desconto'
      '  , r.valor_total_frete'
      '  , r.valor_total_ipi'
      '  , r.valor_total'
      '  , r.requisitado_data'
      '  , r.data_fatura'
      '  , r.requisitado_usuario'
      '  , r.cancelado_data'
      '  , r.cancelado_usuario'
      '  , r.cancelado_motivo'
      '  , f.nomeforn'
      '  , f.cnpj'
      '  , f.pessoa_fisica'
      '  , f.faturamento_minimo'
      '  , t.nomeforn as transportador_nome'
      '  , t.cnpj     as transportador_cpf_cnpj'
      '  , c.nome     as nomecliente'
      'from TBREQUISITA_COMPRA r'
      
        '  left join TBAUTORIZA_REQUISITA a on (a.requisicao_ano = r.ano ' +
        'and a.requisicao_cod = r.codigo and a.requisicao_emp = r.empresa' +
        ')'
      '  left join TBFORNECEDOR f on (f.codforn = r.fornecedor)'
      '  left join TBFORNECEDOR t on (t.codforn = r.transportador)'
      '  left join TBCLIENTE c on (c.codigo = r.cliente)'
      ''
      'where a.autorizacao_ano is null'
      '  and r.cancelado_data is null'
      '  and r.status = 2 -- Requisitada'
      '  and r.empresa = :empresa'
      '  and r.tipo = :tipo'
      '  and r.emissao_data between :data_inicial and :data_final'
      '  and ((r.fornecedor = :fornecedor) or (:todos = 1))'
      ''
      ''
      'order by'
      '    f.nomeforn'
      '  , f.cnpj'
      '  , r.ano'
      '  , r.codigo')
    ParamData = <
      item
        DataType = ftString
        Name = 'empresa'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftSmallint
        Name = 'tipo'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftDateTime
        Name = 'data_inicial'
        ParamType = ptInput
        Value = 0d
      end
      item
        DataType = ftDateTime
        Name = 'data_final'
        ParamType = ptInput
        Value = 0d
      end
      item
        DataType = ftInteger
        Name = 'fornecedor'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'todos'
        ParamType = ptInput
        Value = 0
      end>
  end
  inherited DtsPesquisa: TDataSource
    DataSet = CdsPesquisa
    Left = 456
  end
  object DspPesquisa: TDataSetProvider
    DataSet = QryPesquisa
    Left = 392
    Top = 177
  end
  object CdsPesquisa: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'empresa'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftSmallint
        Name = 'tipo'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftDateTime
        Name = 'data_inicial'
        ParamType = ptInput
        Value = 0d
      end
      item
        DataType = ftDateTime
        Name = 'data_final'
        ParamType = ptInput
        Value = 0d
      end
      item
        DataType = ftInteger
        Name = 'fornecedor'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'todos'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'DspPesquisa'
    Left = 424
    Top = 177
    object CdsPesquisaSELECIONAR: TIntegerField
      Alignment = taCenter
      FieldName = 'SELECIONAR'
      OnGetText = CdsPesquisaSELECIONARGetText
    end
    object CdsPesquisaANO: TSmallintField
      FieldName = 'ANO'
    end
    object CdsPesquisaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object CdsPesquisaEMPRESA: TStringField
      FieldName = 'EMPRESA'
      Required = True
      Size = 18
    end
    object CdsPesquisaNUMERO: TStringField
      FieldName = 'NUMERO'
      Required = True
    end
    object CdsPesquisaFORNECEDOR: TIntegerField
      FieldName = 'FORNECEDOR'
      Required = True
    end
    object CdsPesquisaNOME_CONTATO: TStringField
      FieldName = 'NOME_CONTATO'
      Size = 100
    end
    object CdsPesquisaTIPO: TSmallintField
      FieldName = 'TIPO'
    end
    object CdsPesquisaINSERCAO_DATA: TDateTimeField
      FieldName = 'INSERCAO_DATA'
    end
    object CdsPesquisaEMISSAO_DATA: TDateField
      FieldName = 'EMISSAO_DATA'
      Required = True
    end
    object CdsPesquisaEMISSAO_USUARIO: TStringField
      FieldName = 'EMISSAO_USUARIO'
      Size = 12
    end
    object CdsPesquisaVALIDADE: TDateField
      FieldName = 'VALIDADE'
    end
    object CdsPesquisaCOMPETENCIA: TIntegerField
      FieldName = 'COMPETENCIA'
    end
    object CdsPesquisaMOVITO: TMemoField
      FieldName = 'MOVITO'
      BlobType = ftMemo
      Size = 8
    end
    object CdsPesquisaOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
      Size = 8
    end
    object CdsPesquisaCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
    end
    object CdsPesquisaCENTRO_CUSTO: TIntegerField
      FieldName = 'CENTRO_CUSTO'
    end
    object CdsPesquisaENDERECO_ENTREGA: TMemoField
      FieldName = 'ENDERECO_ENTREGA'
      BlobType = ftMemo
      Size = 8
    end
    object CdsPesquisaSTATUS: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'STATUS'
      OnGetText = CdsPesquisaSTATUSGetText
    end
    object CdsPesquisaRECEBEDOR_NOME: TStringField
      FieldName = 'RECEBEDOR_NOME'
      Size = 100
    end
    object CdsPesquisaRECEBEDOR_CPF: TStringField
      FieldName = 'RECEBEDOR_CPF'
      Size = 18
    end
    object CdsPesquisaRECEBEDOR_FUNCAO: TStringField
      FieldName = 'RECEBEDOR_FUNCAO'
      Size = 50
    end
    object CdsPesquisaFORMA_PAGTO: TSmallintField
      FieldName = 'FORMA_PAGTO'
    end
    object CdsPesquisaCONDICAO_PAGTO: TSmallintField
      FieldName = 'CONDICAO_PAGTO'
    end
    object CdsPesquisaTRANSPORTADOR: TIntegerField
      FieldName = 'TRANSPORTADOR'
    end
    object CdsPesquisaITENS: TIntegerField
      FieldName = 'ITENS'
      DisplayFormat = ',0.###'
    end
    object CdsPesquisaVALOR_BRUTO: TBCDField
      FieldName = 'VALOR_BRUTO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object CdsPesquisaVALOR_DESCONTO: TBCDField
      FieldName = 'VALOR_DESCONTO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object CdsPesquisaVALOR_TOTAL_FRETE: TBCDField
      FieldName = 'VALOR_TOTAL_FRETE'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object CdsPesquisaVALOR_TOTAL_IPI: TBCDField
      FieldName = 'VALOR_TOTAL_IPI'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object CdsPesquisaVALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object CdsPesquisaREQUISITADO_DATA: TDateField
      FieldName = 'REQUISITADO_DATA'
    end
    object CdsPesquisaDATA_FATURA: TDateField
      FieldName = 'DATA_FATURA'
    end
    object CdsPesquisaREQUISITADO_USUARIO: TStringField
      FieldName = 'REQUISITADO_USUARIO'
      Size = 12
    end
    object CdsPesquisaCANCELADO_DATA: TDateField
      FieldName = 'CANCELADO_DATA'
    end
    object CdsPesquisaCANCELADO_USUARIO: TStringField
      FieldName = 'CANCELADO_USUARIO'
      Size = 12
    end
    object CdsPesquisaCANCELADO_MOTIVO: TMemoField
      FieldName = 'CANCELADO_MOTIVO'
      BlobType = ftMemo
      Size = 8
    end
    object CdsPesquisaNOMEFORN: TStringField
      FieldName = 'NOMEFORN'
      Size = 100
    end
    object CdsPesquisaCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 18
    end
    object CdsPesquisaPESSOA_FISICA: TSmallintField
      FieldName = 'PESSOA_FISICA'
    end
    object CdsPesquisaFATURAMENTO_MINIMO: TBCDField
      FieldName = 'FATURAMENTO_MINIMO'
      Precision = 18
      Size = 2
    end
    object CdsPesquisaTRANSPORTADOR_NOME: TStringField
      FieldName = 'TRANSPORTADOR_NOME'
      Size = 100
    end
    object CdsPesquisaTRANSPORTADOR_CPF_CNPJ: TStringField
      FieldName = 'TRANSPORTADOR_CPF_CNPJ'
      Size = 18
    end
    object CdsPesquisaNOMECLIENTE: TStringField
      FieldName = 'NOMECLIENTE'
      Size = 100
    end
  end
  object tblTipoRequisicao: TIBTable
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    TableName = 'VW_TIPO_REQUISICAO'
    TableTypes = [ttView]
    Left = 104
    Top = 208
  end
  object cdsAutorizacao: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    ForcedRefresh = True
    CachedUpdates = True
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'Select'
      '    a.ano'
      '  , a.codigo'
      '  , a.empresa'
      '  , a.numero'
      '  , a.fornecedor'
      '  , a.nome_contato'
      '  , a.tipo'
      '  , a.insercao_data'
      '  , a.emissao_data'
      '  , a.emissao_usuario'
      '  , a.validade'
      '  , a.competencia'
      '  , a.movito'
      '  , a.observacao'
      '  , a.cliente'
      '  , a.centro_custo'
      '  , a.endereco_entrega'
      '  , a.status'
      '  , a.recebedor_nome'
      '  , a.recebedor_cpf'
      '  , a.recebedor_funcao'
      '  , a.forma_pagto'
      '  , a.condicao_pagto'
      '  , a.transportador'
      '  , a.valor_bruto'
      '  , a.valor_desconto'
      '  , a.valor_total_frete'
      '  , a.valor_total_ipi'
      '  , a.valor_total'
      '  , a.autorizado_data'
      '  , a.data_fatura'
      '  , a.autorizado_usuario'
      '  , a.cancelado_data'
      '  , a.cancelado_usuario'
      '  , a.cancelado_motivo'
      'from TBAUTORIZA_COMPRA a'
      'where a.ano = :ano'
      '  and a.codigo = :codigo'
      '  and a.empresa = :empresa')
    ModifySQL.Strings = (
      '')
    GeneratorField.Field = 'NUMERO'
    GeneratorField.Generator = 'GEN_REQUISICAO_2013'
    GeneratorField.ApplyEvent = gamOnPost
    UpdateObject = updAutorizacao
    Left = 680
    Top = 392
    object cdsAutorizacaoANO: TSmallintField
      FieldName = 'ANO'
      Origin = '"TBAUTORIZA_COMPRA"."ANO"'
      ProviderFlags = [pfInUpdate, pfInKey]
    end
    object cdsAutorizacaoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = '"TBAUTORIZA_COMPRA"."CODIGO"'
      ProviderFlags = [pfInUpdate, pfInKey]
      Required = True
      DisplayFormat = '###0000000'
    end
    object cdsAutorizacaoEMPRESA: TIBStringField
      FieldName = 'EMPRESA'
      Origin = '"TBAUTORIZA_COMPRA"."EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInKey]
      Required = True
      Size = 18
    end
    object cdsAutorizacaoNUMERO: TIBStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUMERO'
      Origin = '"TBAUTORIZA_COMPRA"."NUMERO"'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsAutorizacaoFORNECEDOR: TIntegerField
      DisplayLabel = 'Fornecedor'
      FieldName = 'FORNECEDOR'
      Origin = '"TBAUTORIZA_COMPRA"."FORNECEDOR"'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsAutorizacaoNOME_CONTATO: TIBStringField
      DisplayLabel = 'Nome Contato'
      FieldName = 'NOME_CONTATO'
      Origin = '"TBAUTORIZA_COMPRA"."NOME_CONTATO"'
      Size = 100
    end
    object cdsAutorizacaoTIPO: TSmallintField
      Alignment = taLeftJustify
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Origin = '"TBAUTORIZA_COMPRA"."TIPO"'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsAutorizacaoINSERCAO_DATA: TDateTimeField
      FieldName = 'INSERCAO_DATA'
      Origin = '"TBAUTORIZA_COMPRA"."INSERCAO_DATA"'
      ProviderFlags = [pfInUpdate]
    end
    object cdsAutorizacaoEMISSAO_DATA: TDateField
      DisplayLabel = 'Data de Emiss'#227'o'
      FieldName = 'EMISSAO_DATA'
      Origin = '"TBAUTORIZA_COMPRA"."EMISSAO_DATA"'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsAutorizacaoEMISSAO_USUARIO: TIBStringField
      FieldName = 'EMISSAO_USUARIO'
      Origin = '"TBAUTORIZA_COMPRA"."EMISSAO_USUARIO"'
      ProviderFlags = [pfInUpdate]
      Size = 12
    end
    object cdsAutorizacaoVALIDADE: TDateField
      DisplayLabel = 'Data de Validade'
      FieldName = 'VALIDADE'
      Origin = '"TBAUTORIZA_COMPRA"."VALIDADE"'
      ProviderFlags = [pfInUpdate]
    end
    object cdsAutorizacaoCOMPETENCIA: TIntegerField
      FieldName = 'COMPETENCIA'
      Origin = '"TBAUTORIZA_COMPRA"."COMPETENCIA"'
      ProviderFlags = [pfInUpdate]
    end
    object cdsAutorizacaoCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
      Origin = '"TBAUTORIZA_COMPRA"."CLIENTE"'
    end
    object cdsAutorizacaoCENTRO_CUSTO: TIntegerField
      FieldName = 'CENTRO_CUSTO'
      Origin = '"TBAUTORIZA_COMPRA"."CENTRO_CUSTO"'
      ProviderFlags = [pfInUpdate]
    end
    object cdsAutorizacaoMOVITO: TMemoField
      FieldName = 'MOVITO'
      Origin = '"TBAUTORIZA_COMPRA"."MOVITO"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object cdsAutorizacaoOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      Origin = '"TBAUTORIZA_COMPRA"."OBSERVACAO"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object cdsAutorizacaoENDERECO_ENTREGA: TMemoField
      FieldName = 'ENDERECO_ENTREGA'
      Origin = '"TBAUTORIZA_COMPRA"."ENDERECO_ENTREGA"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object cdsAutorizacaoSTATUS: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'STATUS'
      Origin = '"TBAUTORIZA_COMPRA"."STATUS"'
      ProviderFlags = [pfInUpdate]
    end
    object cdsAutorizacaoRECEBEDOR_NOME: TIBStringField
      FieldName = 'RECEBEDOR_NOME'
      Origin = '"TBAUTORIZA_COMPRA"."RECEBEDOR_NOME"'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsAutorizacaoRECEBEDOR_CPF: TIBStringField
      FieldName = 'RECEBEDOR_CPF'
      Origin = '"TBAUTORIZA_COMPRA"."RECEBEDOR_CPF"'
      ProviderFlags = [pfInUpdate]
      Size = 18
    end
    object cdsAutorizacaoRECEBEDOR_FUNCAO: TIBStringField
      FieldName = 'RECEBEDOR_FUNCAO'
      Origin = '"TBAUTORIZA_COMPRA"."RECEBEDOR_FUNCAO"'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsAutorizacaoFORMA_PAGTO: TSmallintField
      DisplayLabel = 'Forma de Pagamento'
      FieldName = 'FORMA_PAGTO'
      Origin = '"TBAUTORIZA_COMPRA"."FORMA_PAGTO"'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsAutorizacaoCONDICAO_PAGTO: TSmallintField
      DisplayLabel = 'Condi'#231#227'o de Pagamento'
      FieldName = 'CONDICAO_PAGTO'
      Origin = '"TBAUTORIZA_COMPRA"."CONDICAO_PAGTO"'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsAutorizacaoTRANSPORTADOR: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Transportador'
      FieldName = 'TRANSPORTADOR'
      Origin = '"TBAUTORIZA_COMPRA"."TRANSPORTADOR"'
      ProviderFlags = [pfInUpdate]
    end
    object cdsAutorizacaoVALOR_BRUTO: TIBBCDField
      FieldName = 'VALOR_BRUTO'
      Origin = '"TBAUTORIZA_COMPRA"."VALOR_BRUTO"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsAutorizacaoVALOR_DESCONTO: TIBBCDField
      FieldName = 'VALOR_DESCONTO'
      Origin = '"TBAUTORIZA_COMPRA"."VALOR_DESCONTO"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsAutorizacaoVALOR_TOTAL_FRETE: TIBBCDField
      FieldName = 'VALOR_TOTAL_FRETE'
      Origin = '"TBAUTORIZA_COMPRA"."VALOR_TOTAL_FRETE"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsAutorizacaoVALOR_TOTAL_IPI: TIBBCDField
      FieldName = 'VALOR_TOTAL_IPI'
      Origin = '"TBAUTORIZA_COMPRA"."VALOR_TOTAL_IPI"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsAutorizacaoVALOR_TOTAL: TIBBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = '"TBAUTORIZA_COMPRA"."VALOR_TOTAL"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsAutorizacaoAUTORIZADO_DATA: TDateField
      FieldName = 'AUTORIZADO_DATA'
      Origin = '"TBAUTORIZA_COMPRA"."AUTORIZADO_DATA"'
      ProviderFlags = [pfInUpdate]
    end
    object cdsAutorizacaoDATA_FATURA: TDateField
      FieldName = 'DATA_FATURA'
      Origin = '"TBAUTORIZA_COMPRA"."DATA_FATURA"'
      ProviderFlags = [pfInUpdate]
    end
    object cdsAutorizacaoAUTORIZADO_USUARIO: TIBStringField
      FieldName = 'AUTORIZADO_USUARIO'
      Origin = '"TBAUTORIZA_COMPRA"."AUTORIZADO_USUARIO"'
      ProviderFlags = [pfInUpdate]
      Size = 12
    end
    object cdsAutorizacaoCANCELADO_DATA: TDateField
      FieldName = 'CANCELADO_DATA'
      Origin = '"TBAUTORIZA_COMPRA"."CANCELADO_DATA"'
      ProviderFlags = [pfInUpdate]
    end
    object cdsAutorizacaoCANCELADO_USUARIO: TIBStringField
      FieldName = 'CANCELADO_USUARIO'
      Origin = '"TBAUTORIZA_COMPRA"."CANCELADO_USUARIO"'
      ProviderFlags = [pfInUpdate]
      Size = 12
    end
    object cdsAutorizacaoCANCELADO_MOTIVO: TMemoField
      FieldName = 'CANCELADO_MOTIVO'
      Origin = '"TBAUTORIZA_COMPRA"."CANCELADO_MOTIVO"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
  end
  object updAutorizacao: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  ANO,'
      '  CODIGO,'
      '  EMPRESA,'
      '  NUMERO,'
      '  FORNECEDOR,'
      '  NOME_CONTATO,'
      '  TIPO,'
      '  INSERCAO_DATA,'
      '  EMISSAO_DATA,'
      '  EMISSAO_USUARIO,'
      '  VALIDADE,'
      '  COMPETENCIA,'
      '  DATA_FATURA,'
      '  MOVITO,'
      '  OBSERVACAO,'
      '  CLIENTE,'
      '  CENTRO_CUSTO,'
      '  ENDERECO_ENTREGA,'
      '  STATUS,'
      '  AUTORIZADO_DATA,'
      '  AUTORIZADO_USUARIO,'
      '  CANCELADO_DATA,'
      '  CANCELADO_USUARIO,'
      '  CANCELADO_MOTIVO,'
      '  RECEBEDOR_NOME,'
      '  RECEBEDOR_CPF,'
      '  RECEBEDOR_FUNCAO,'
      '  FORMA_PAGTO,'
      '  CONDICAO_PAGTO,'
      '  TRANSPORTADOR,'
      '  VALOR_BRUTO,'
      '  VALOR_DESCONTO,'
      '  VALOR_TOTAL_FRETE,'
      '  VALOR_TOTAL_IPI,'
      '  VALOR_TOTAL'
      'from TBAUTORIZA_COMPRA '
      'where'
      '  ANO = :ANO and'
      '  CODIGO = :CODIGO and'
      '  EMPRESA = :EMPRESA')
    ModifySQL.Strings = (
      'update TBAUTORIZA_COMPRA'
      'set'
      '  ANO = :ANO,'
      '  AUTORIZADO_DATA = :AUTORIZADO_DATA,'
      '  AUTORIZADO_USUARIO = :AUTORIZADO_USUARIO,'
      '  CANCELADO_DATA = :CANCELADO_DATA,'
      '  CANCELADO_MOTIVO = :CANCELADO_MOTIVO,'
      '  CANCELADO_USUARIO = :CANCELADO_USUARIO,'
      '  CENTRO_CUSTO = :CENTRO_CUSTO,'
      '  CLIENTE = :CLIENTE,'
      '  CODIGO = :CODIGO,'
      '  COMPETENCIA = :COMPETENCIA,'
      '  CONDICAO_PAGTO = :CONDICAO_PAGTO,'
      '  DATA_FATURA = :DATA_FATURA,'
      '  EMISSAO_DATA = :EMISSAO_DATA,'
      '  EMISSAO_USUARIO = :EMISSAO_USUARIO,'
      '  EMPRESA = :EMPRESA,'
      '  ENDERECO_ENTREGA = :ENDERECO_ENTREGA,'
      '  FORMA_PAGTO = :FORMA_PAGTO,'
      '  FORNECEDOR = :FORNECEDOR,'
      '  INSERCAO_DATA = :INSERCAO_DATA,'
      '  MOVITO = :MOVITO,'
      '  NOME_CONTATO = :NOME_CONTATO,'
      '  NUMERO = :NUMERO,'
      '  OBSERVACAO = :OBSERVACAO,'
      '  RECEBEDOR_CPF = :RECEBEDOR_CPF,'
      '  RECEBEDOR_FUNCAO = :RECEBEDOR_FUNCAO,'
      '  RECEBEDOR_NOME = :RECEBEDOR_NOME,'
      '  STATUS = :STATUS,'
      '  TIPO = :TIPO,'
      '  TRANSPORTADOR = :TRANSPORTADOR,'
      '  VALIDADE = :VALIDADE,'
      '  VALOR_BRUTO = :VALOR_BRUTO,'
      '  VALOR_DESCONTO = :VALOR_DESCONTO,'
      '  VALOR_TOTAL = :VALOR_TOTAL,'
      '  VALOR_TOTAL_FRETE = :VALOR_TOTAL_FRETE,'
      '  VALOR_TOTAL_IPI = :VALOR_TOTAL_IPI'
      'where'
      '  ANO = :OLD_ANO and'
      '  CODIGO = :OLD_CODIGO and'
      '  EMPRESA = :OLD_EMPRESA')
    InsertSQL.Strings = (
      'insert into TBAUTORIZA_COMPRA'
      
        '  (ANO, AUTORIZADO_DATA, AUTORIZADO_USUARIO, CANCELADO_DATA, CAN' +
        'CELADO_MOTIVO, '
      
        '   CANCELADO_USUARIO, CENTRO_CUSTO, CLIENTE, CODIGO, COMPETENCIA' +
        ', CONDICAO_PAGTO, '
      
        '   DATA_FATURA, EMISSAO_DATA, EMISSAO_USUARIO, EMPRESA, ENDERECO' +
        '_ENTREGA, '
      
        '   FORMA_PAGTO, FORNECEDOR, INSERCAO_DATA, MOVITO, NOME_CONTATO,' +
        ' NUMERO, '
      
        '   OBSERVACAO, RECEBEDOR_CPF, RECEBEDOR_FUNCAO, RECEBEDOR_NOME, ' +
        'STATUS, '
      
        '   TIPO, TRANSPORTADOR, VALIDADE, VALOR_BRUTO, VALOR_DESCONTO, V' +
        'ALOR_TOTAL, '
      '   VALOR_TOTAL_FRETE, VALOR_TOTAL_IPI)'
      'values'
      
        '  (:ANO, :AUTORIZADO_DATA, :AUTORIZADO_USUARIO, :CANCELADO_DATA,' +
        ' :CANCELADO_MOTIVO, '
      
        '   :CANCELADO_USUARIO, :CENTRO_CUSTO, :CLIENTE, :CODIGO, :COMPET' +
        'ENCIA, '
      
        '   :CONDICAO_PAGTO, :DATA_FATURA, :EMISSAO_DATA, :EMISSAO_USUARI' +
        'O, :EMPRESA, '
      
        '   :ENDERECO_ENTREGA, :FORMA_PAGTO, :FORNECEDOR, :INSERCAO_DATA,' +
        ' :MOVITO, '
      
        '   :NOME_CONTATO, :NUMERO, :OBSERVACAO, :RECEBEDOR_CPF, :RECEBED' +
        'OR_FUNCAO, '
      
        '   :RECEBEDOR_NOME, :STATUS, :TIPO, :TRANSPORTADOR, :VALIDADE, :' +
        'VALOR_BRUTO, '
      
        '   :VALOR_DESCONTO, :VALOR_TOTAL, :VALOR_TOTAL_FRETE, :VALOR_TOT' +
        'AL_IPI)')
    DeleteSQL.Strings = (
      'delete from TBAUTORIZA_COMPRA'
      'where'
      '  ANO = :OLD_ANO and'
      '  CODIGO = :OLD_CODIGO and'
      '  EMPRESA = :OLD_EMPRESA')
    Left = 712
    Top = 392
  end
  object stpGerarAutorizacaoItens: TIBStoredProc
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    StoredProcName = 'SET_AUTORIZACAO_ITENS_REQ'
    Left = 680
    Top = 440
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'AUTORIZACAO_ANO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'AUTORIZACAO_COD'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'AUTORIZACAO_EMP'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'USUARIO'
        ParamType = ptInput
      end>
  end
end
