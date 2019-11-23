object DMCupom: TDMCupom
  OldCreateOrder = False
  Height = 631
  Width = 1015
  object qryCFOP: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    c.Cfop_cod'
      '  , c.Cfop_descricao'
      '  , c.Cfop_cst_padrao_entrada'
      '  , c.Cfop_cst_padrao_saida'
      'from TBCFOP c'
      'where c.Cfop_cod = :Cfop_cod')
    Left = 520
    Top = 216
    ParamData = <
      item
        Name = 'CFOP_COD'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object FDQuery2: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    Left = 688
    Top = 80
  end
  object qryProduto: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    p.Codigo'
      '  , p.Cod'
      '  , p.Descri'
      '  , p.Modelo'
      '  , p.Preco'
      '  , p.Preco_Promocao'
      '  , p.Referencia'
      '  , p.Secao'
      '  , p.Qtde'
      '  , p.Unidade'
      '  , p.Estoqmin'
      '  , p.Codgrupo'
      '  , p.Customedio'
      '  , p.Codemp'
      '  , p.Codsecao'
      '  , p.Codorigem'
      '  , p.Codtributacao'
      '  , p.Cst'
      '  , p.Csosn'
      '  , p.Codcfop'
      '  , p.Codbarra_ean'
      '  , p.Codunidade'
      '  , p.Aliquota_tipo'
      '  , p.Aliquota'
      '  , p.Aliquota_csosn'
      '  , p.Aliquota_pis'
      '  , p.Aliquota_cofins'
      '  , p.Percentual_reducao_BC'
      '  , p.Valor_ipi'
      '  , p.Reserva'
      '  , p.Movimenta_Estoque'
      '  , case when coalesce(p.Reserva, 0) > 0'
      '      then coalesce(p.Qtde, 0) - coalesce(p.Reserva, 0)'
      '      else coalesce(p.Qtde, 0)'
      '    end as Disponivel'
      '  , g.Descri as Descricao_Grupo'
      '  , coalesce(s.Scp_descricao, p.Secao) as Descricao_Secao'
      '  , coalesce(u.Unp_descricao, p.Unidade) as Descricao_Unidade'
      '  , u.Unp_sigla'
      '  , c.Cfop_descricao'
      '  , c.Cfop_especificacao'
      'from TBPRODUTO p'
      '  left join TBGRUPOPROD g on (g.Cod = p.Codgrupo)'
      '  left join TBSECAOPROD s on (s.Scp_cod = p.Codsecao)'
      '  left join TBUNIDADEPROD u on (u.Unp_cod = p.Codunidade)'
      '  left join TBCFOP c on (c.Cfop_cod = p.Codcfop)'
      'where p.Codigo = :Codigo'
      '  or p.Codbarra_ean = :CodigoBarra')
    Left = 520
    Top = 264
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CODIGOBARRA'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end>
  end
  object qryUltimoVenda: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '  max(v.codcontrol) as orcamento'
      'from TBVENDAS v'
      'where v.codemp  = :empresa'
      '  and v.usuario = :usuario'
      '  and v.ano     = :ano'
      '  and v.status  = :status')
    Left = 520
    Top = 312
    ParamData = <
      item
        Name = 'EMPRESA'
        DataType = ftString
        ParamType = ptInput
        Size = 18
        Value = Null
      end
      item
        Name = 'USUARIO'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Name = 'ANO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Name = 'STATUS'
        DataType = ftSmallint
        ParamType = ptInput
      end>
  end
  object cdsVendaTitulo: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    r.Anolanc'
      '  , r.numlanc'
      '  , r.parcela'
      '  , r.codbanco'
      '  , r.nossonumero'
      '  , r.cnpj'
      '  , r.tippag'
      '  , r.dtemiss'
      '  , r.dtvenc'
      '  , r.valorrec'
      '  , r.percentjuros'
      '  , r.percentmulta'
      '  , r.percentdesconto'
      '  , r.valorrectot'
      '  , r.valorsaldo'
      '  , r.dataprocessoboleto'
      '  , r.Baixado'
      '  , Case when r.Baixado = 1 then '#39'X'#39' else '#39'.'#39' end as Baixado_'
      '  , r.Dtrec'
      '  , r.forma_pagto'
      '  , r.status'
      'from TBCONTREC r'
      ''
      'where r.anovenda = :anovenda'
      '  and r.numvenda = :numvenda')
    Left = 224
    Top = 272
    ParamData = <
      item
        Name = 'ANOVENDA'
        DataType = ftSmallint
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'NUMVENDA'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object cdsVendaNFCe: TFDQuery
    CachedUpdates = True
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    UpdateObject = updVendaNFCe
    SQL.Strings = (
      'Select'
      '    n.EMPRESA'
      '  , n.ANOVENDA'
      '  , n.NUMVENDA'
      '  , n.DATAEMISSAO'
      '  , n.HORAEMISSAO'
      '  , n.SERIE'
      '  , n.NUMERO'
      '  , n.NFC_NUMERO'
      '  , n.MODELO'
      '  , n.VERSAO'
      '  , n.CHAVE'
      '  , n.PROTOCOLO'
      '  , n.RECIBO'
      '  , n.XML_FILENAME'
      '  , n.XML_FILE'
      '  , n.LOTE_ANO'
      '  , n.LOTE_NUM'
      'from TBNFE_ENVIADA n'
      'where n.EMPRESA = :empresa'
      '  and n.ANOVENDA = :ano'
      '  and n.NUMVENDA = :controle')
    Left = 224
    Top = 320
    ParamData = <
      item
        Name = 'EMPRESA'
        DataType = ftString
        ParamType = ptInput
        Size = 18
        Value = Null
      end
      item
        Name = 'ANO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Name = 'CONTROLE'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object cdsVendaNFCeEMPRESA: TStringField
      FieldName = 'EMPRESA'
      Origin = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 18
    end
    object cdsVendaNFCeANOVENDA: TSmallintField
      FieldName = 'ANOVENDA'
      Origin = 'ANOVENDA'
    end
    object cdsVendaNFCeNUMVENDA: TIntegerField
      FieldName = 'NUMVENDA'
      Origin = 'NUMVENDA'
    end
    object cdsVendaNFCeDATAEMISSAO: TDateField
      FieldName = 'DATAEMISSAO'
      Origin = 'DATAEMISSAO'
    end
    object cdsVendaNFCeHORAEMISSAO: TTimeField
      FieldName = 'HORAEMISSAO'
      Origin = 'HORAEMISSAO'
    end
    object cdsVendaNFCeSERIE: TStringField
      FieldName = 'SERIE'
      Origin = 'SERIE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 4
    end
    object cdsVendaNFCeNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsVendaNFCeNFC_NUMERO: TIntegerField
      FieldName = 'NFC_NUMERO'
      Origin = 'NFC_NUMERO'
    end
    object cdsVendaNFCeMODELO: TSmallintField
      FieldName = 'MODELO'
      Origin = 'MODELO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsVendaNFCeVERSAO: TSmallintField
      FieldName = 'VERSAO'
      Origin = 'VERSAO'
    end
    object cdsVendaNFCeCHAVE: TStringField
      FieldName = 'CHAVE'
      Origin = 'CHAVE'
      Size = 250
    end
    object cdsVendaNFCePROTOCOLO: TStringField
      FieldName = 'PROTOCOLO'
      Origin = 'PROTOCOLO'
      Size = 250
    end
    object cdsVendaNFCeRECIBO: TStringField
      FieldName = 'RECIBO'
      Origin = 'RECIBO'
      Size = 250
    end
    object cdsVendaNFCeXML_FILENAME: TStringField
      FieldName = 'XML_FILENAME'
      Origin = 'XML_FILENAME'
      Size = 250
    end
    object cdsVendaNFCeXML_FILE: TMemoField
      FieldName = 'XML_FILE'
      Origin = 'XML_FILE'
      BlobType = ftMemo
    end
    object cdsVendaNFCeLOTE_ANO: TSmallintField
      FieldName = 'LOTE_ANO'
      Origin = 'LOTE_ANO'
    end
    object cdsVendaNFCeLOTE_NUM: TIntegerField
      FieldName = 'LOTE_NUM'
      Origin = 'LOTE_NUM'
    end
  end
  object updVendaNFCe: TFDUpdateSQL
    Connection = DMBusiness.fdConexao
    InsertSQL.Strings = (
      'INSERT INTO TBNFE_ENVIADA'
      '(EMPRESA, SERIE, NUMERO, MODELO, VERSAO, '
      '  ANOVENDA, NUMVENDA, NFC_NUMERO, DATAEMISSAO, '
      '  HORAEMISSAO, CHAVE, PROTOCOLO, RECIBO, '
      '  XML_FILENAME, XML_FILE, LOTE_ANO, LOTE_NUM)'
      
        'VALUES (:NEW_EMPRESA, :NEW_SERIE, :NEW_NUMERO, :NEW_MODELO, :NEW' +
        '_VERSAO, '
      
        '  :NEW_ANOVENDA, :NEW_NUMVENDA, :NEW_NFC_NUMERO, :NEW_DATAEMISSA' +
        'O, '
      '  :NEW_HORAEMISSAO, :NEW_CHAVE, :NEW_PROTOCOLO, :NEW_RECIBO, '
      
        '  :NEW_XML_FILENAME, :NEW_XML_FILE, :NEW_LOTE_ANO, :NEW_LOTE_NUM' +
        ')')
    ModifySQL.Strings = (
      'UPDATE TBNFE_ENVIADA'
      
        'SET EMPRESA = :NEW_EMPRESA, SERIE = :NEW_SERIE, NUMERO = :NEW_NU' +
        'MERO, '
      
        '  MODELO = :NEW_MODELO, VERSAO = :NEW_VERSAO, ANOVENDA = :NEW_AN' +
        'OVENDA, '
      '  NUMVENDA = :NEW_NUMVENDA, NFC_NUMERO = :NEW_NFC_NUMERO, '
      
        '  DATAEMISSAO = :NEW_DATAEMISSAO, HORAEMISSAO = :NEW_HORAEMISSAO' +
        ', '
      
        '  CHAVE = :NEW_CHAVE, PROTOCOLO = :NEW_PROTOCOLO, RECIBO = :NEW_' +
        'RECIBO, '
      '  XML_FILENAME = :NEW_XML_FILENAME, XML_FILE = :NEW_XML_FILE, '
      '  LOTE_ANO = :NEW_LOTE_ANO, LOTE_NUM = :NEW_LOTE_NUM'
      
        'WHERE EMPRESA = :OLD_EMPRESA AND SERIE = :OLD_SERIE AND NUMERO =' +
        ' :OLD_NUMERO AND '
      '  MODELO = :OLD_MODELO')
    DeleteSQL.Strings = (
      'DELETE FROM TBNFE_ENVIADA'
      
        'WHERE EMPRESA = :OLD_EMPRESA AND SERIE = :OLD_SERIE AND NUMERO =' +
        ' :OLD_NUMERO AND '
      '  MODELO = :OLD_MODELO')
    FetchRowSQL.Strings = (
      
        'SELECT EMPRESA, SERIE, NUMERO, MODELO, VERSAO, ANOVENDA, NUMVEND' +
        'A, '
      '  ANOCOMPRA, NUMCOMPRA, NFC_NUMERO, DATAEMISSAO, HORAEMISSAO, '
      '  CHAVE, PROTOCOLO, RECIBO, XML_FILENAME, XML_FILE, LOTE_ANO, '
      '  LOTE_NUM, CANCELADA'
      'FROM TBNFE_ENVIADA'
      
        'WHERE EMPRESA = :EMPRESA AND SERIE = :SERIE AND NUMERO = :NUMERO' +
        ' AND '
      '  MODELO = :MODELO')
    Left = 256
    Top = 320
  end
  object cdsVendaVolume: TFDQuery
    CachedUpdates = True
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    UpdateObject = updVendaVolume
    SQL.Strings = (
      'Select'
      '    v.ano_venda'
      '  , v.controle_venda'
      '  , v.sequencial'
      '  , v.numero'
      '  , v.quantidade'
      '  , v.especie'
      '  , v.marca'
      '  , v.peso_bruto'
      '  , v.peso_liquido'
      'from TBVENDAS_VOLUME v')
    Left = 224
    Top = 224
    object cdsVendaVolumeANO_VENDA: TSmallintField
      FieldName = 'ANO_VENDA'
      Origin = 'ANO_VENDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsVendaVolumeCONTROLE_VENDA: TIntegerField
      FieldName = 'CONTROLE_VENDA'
      Origin = 'CONTROLE_VENDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsVendaVolumeSEQUENCIAL: TSmallintField
      FieldName = 'SEQUENCIAL'
      Origin = 'SEQUENCIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsVendaVolumeNUMERO: TStringField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Size = 50
    end
    object cdsVendaVolumeQUANTIDADE: TSmallintField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
    end
    object cdsVendaVolumeESPECIE: TStringField
      FieldName = 'ESPECIE'
      Origin = 'ESPECIE'
      Size = 50
    end
    object cdsVendaVolumeMARCA: TStringField
      FieldName = 'MARCA'
      Origin = 'MARCA'
      Size = 50
    end
    object cdsVendaVolumePESO_BRUTO: TBCDField
      FieldName = 'PESO_BRUTO'
      Origin = 'PESO_BRUTO'
      Precision = 18
      Size = 3
    end
    object cdsVendaVolumePESO_LIQUIDO: TBCDField
      FieldName = 'PESO_LIQUIDO'
      Origin = 'PESO_LIQUIDO'
      Precision = 18
      Size = 3
    end
  end
  object updVendaVolume: TFDUpdateSQL
    Connection = DMBusiness.fdConexao
    InsertSQL.Strings = (
      'INSERT INTO TBVENDAS_VOLUME'
      '(ANO_VENDA, CONTROLE_VENDA, SEQUENCIAL, NUMERO, '
      '  QUANTIDADE, ESPECIE, MARCA, PESO_BRUTO, '
      '  PESO_LIQUIDO)'
      
        'VALUES (:NEW_ANO_VENDA, :NEW_CONTROLE_VENDA, :NEW_SEQUENCIAL, :N' +
        'EW_NUMERO, '
      '  :NEW_QUANTIDADE, :NEW_ESPECIE, :NEW_MARCA, :NEW_PESO_BRUTO, '
      '  :NEW_PESO_LIQUIDO)')
    ModifySQL.Strings = (
      'UPDATE TBVENDAS_VOLUME'
      
        'SET ANO_VENDA = :NEW_ANO_VENDA, CONTROLE_VENDA = :NEW_CONTROLE_V' +
        'ENDA, '
      
        '  SEQUENCIAL = :NEW_SEQUENCIAL, NUMERO = :NEW_NUMERO, QUANTIDADE' +
        ' = :NEW_QUANTIDADE, '
      
        '  ESPECIE = :NEW_ESPECIE, MARCA = :NEW_MARCA, PESO_BRUTO = :NEW_' +
        'PESO_BRUTO, '
      '  PESO_LIQUIDO = :NEW_PESO_LIQUIDO'
      
        'WHERE ANO_VENDA = :OLD_ANO_VENDA AND CONTROLE_VENDA = :OLD_CONTR' +
        'OLE_VENDA AND '
      '  SEQUENCIAL = :OLD_SEQUENCIAL')
    DeleteSQL.Strings = (
      'DELETE FROM TBVENDAS_VOLUME'
      
        'WHERE ANO_VENDA = :OLD_ANO_VENDA AND CONTROLE_VENDA = :OLD_CONTR' +
        'OLE_VENDA AND '
      '  SEQUENCIAL = :OLD_SEQUENCIAL')
    FetchRowSQL.Strings = (
      
        'SELECT ANO_VENDA, CONTROLE_VENDA, SEQUENCIAL, NUMERO, QUANTIDADE' +
        ', ESPECIE, '
      '  MARCA, PESO_BRUTO, PESO_LIQUIDO'
      'FROM TBVENDAS_VOLUME'
      
        'WHERE ANO_VENDA = :ANO_VENDA AND CONTROLE_VENDA = :CONTROLE_VEND' +
        'A AND '
      '  SEQUENCIAL = :SEQUENCIAL')
    Left = 256
    Top = 224
  end
  object cdsVendaFormaPagto: TFDQuery
    OnCalcFields = cdsVendaFormaPagtoCalcFields
    CachedUpdates = True
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    UpdateObject = updVendaFormaPagto
    SQL.Strings = (
      'Select'
      '    f.ano_venda'
      '  , f.controle_venda'
      '  , f.formapagto_cod'
      '  , f.condicaopagto_cod'
      '  , f.venda_prazo'
      '  , f.valor_fpagto'
      '  , f.valor_recebido'
      '  , f.prazo_01'
      '  , f.prazo_02'
      '  , f.prazo_03'
      '  , f.prazo_04'
      '  , f.prazo_05'
      '  , f.prazo_06'
      '  , f.prazo_07'
      '  , f.prazo_08'
      '  , f.prazo_09'
      '  , f.prazo_10'
      '  , f.prazo_11'
      '  , f.prazo_12'
      '  , cast('#39' '#39' as varchar(50)) as formapagto_descricao'
      '  , cast('#39' '#39' as varchar(50)) as condicaopagto_descricao'
      'from TBVENDAS_FORMAPAGTO f'
      ''
      'where f.ano_venda = :ano'
      '  and f.controle_venda = :controle')
    Left = 224
    Top = 176
    ParamData = <
      item
        Name = 'ANO'
        DataType = ftSmallint
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CONTROLE'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object cdsVendaFormaPagtoANO_VENDA: TSmallintField
      FieldName = 'ANO_VENDA'
      Origin = 'ANO_VENDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsVendaFormaPagtoCONTROLE_VENDA: TIntegerField
      FieldName = 'CONTROLE_VENDA'
      Origin = 'CONTROLE_VENDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsVendaFormaPagtoFORMAPAGTO_COD: TSmallintField
      DisplayLabel = 'Forma de Pagamento'
      FieldName = 'FORMAPAGTO_COD'
      Origin = 'FORMAPAGTO_COD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsVendaFormaPagtoCONDICAOPAGTO_COD: TSmallintField
      DisplayLabel = 'Condi'#231#227'o de Pagamento'
      FieldName = 'CONDICAOPAGTO_COD'
      Origin = 'CONDICAOPAGTO_COD'
    end
    object cdsVendaFormaPagtoVENDA_PRAZO: TSmallintField
      FieldName = 'VENDA_PRAZO'
      Origin = 'VENDA_PRAZO'
    end
    object cdsVendaFormaPagtoVALOR_FPAGTO: TBCDField
      DisplayLabel = 'Valor (R$)'
      FieldName = 'VALOR_FPAGTO'
      Origin = 'VALOR_FPAGTO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsVendaFormaPagtoVALOR_RECEBIDO: TBCDField
      FieldName = 'VALOR_RECEBIDO'
      Origin = 'VALOR_RECEBIDO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsVendaFormaPagtoPRAZO_01: TSmallintField
      FieldName = 'PRAZO_01'
      Origin = 'PRAZO_01'
    end
    object cdsVendaFormaPagtoPRAZO_02: TSmallintField
      FieldName = 'PRAZO_02'
      Origin = 'PRAZO_02'
    end
    object cdsVendaFormaPagtoPRAZO_03: TSmallintField
      FieldName = 'PRAZO_03'
      Origin = 'PRAZO_03'
    end
    object cdsVendaFormaPagtoPRAZO_04: TSmallintField
      FieldName = 'PRAZO_04'
      Origin = 'PRAZO_04'
    end
    object cdsVendaFormaPagtoPRAZO_05: TSmallintField
      FieldName = 'PRAZO_05'
      Origin = 'PRAZO_05'
    end
    object cdsVendaFormaPagtoPRAZO_06: TSmallintField
      FieldName = 'PRAZO_06'
      Origin = 'PRAZO_06'
    end
    object cdsVendaFormaPagtoPRAZO_07: TSmallintField
      FieldName = 'PRAZO_07'
      Origin = 'PRAZO_07'
    end
    object cdsVendaFormaPagtoPRAZO_08: TSmallintField
      FieldName = 'PRAZO_08'
      Origin = 'PRAZO_08'
    end
    object cdsVendaFormaPagtoPRAZO_09: TSmallintField
      FieldName = 'PRAZO_09'
      Origin = 'PRAZO_09'
    end
    object cdsVendaFormaPagtoPRAZO_10: TSmallintField
      FieldName = 'PRAZO_10'
      Origin = 'PRAZO_10'
    end
    object cdsVendaFormaPagtoPRAZO_11: TSmallintField
      FieldName = 'PRAZO_11'
      Origin = 'PRAZO_11'
    end
    object cdsVendaFormaPagtoPRAZO_12: TSmallintField
      FieldName = 'PRAZO_12'
      Origin = 'PRAZO_12'
    end
    object cdsVendaFormaPagtoFORMAPAGTO_DESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'FORMAPAGTO_DESCRICAO'
      Origin = 'FORMAPAGTO_DESCRICAO'
      ProviderFlags = []
      Size = 50
    end
    object cdsVendaFormaPagtoCONDICAOPAGTO_DESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CONDICAOPAGTO_DESCRICAO'
      Origin = 'CONDICAOPAGTO_DESCRICAO'
      ProviderFlags = []
      Size = 50
    end
    object cdsVendaFormaPagtoValorTroco: TCurrencyField
      FieldKind = fkInternalCalc
      FieldName = 'ValorTroco'
      DisplayFormat = ',0.00'
    end
  end
  object updVendaFormaPagto: TFDUpdateSQL
    Connection = DMBusiness.fdConexao
    InsertSQL.Strings = (
      'INSERT INTO TBVENDAS_FORMAPAGTO'
      '(ANO_VENDA, CONTROLE_VENDA, FORMAPAGTO_COD, CONDICAOPAGTO_COD, '
      '  VENDA_PRAZO, VALOR_FPAGTO, VALOR_RECEBIDO, '
      '  PRAZO_01, PRAZO_02, PRAZO_03, PRAZO_04, '
      '  PRAZO_05, PRAZO_06, PRAZO_07, PRAZO_08, '
      '  PRAZO_09, PRAZO_10, PRAZO_11, PRAZO_12)'
      
        'VALUES (:NEW_ANO_VENDA, :NEW_CONTROLE_VENDA, :NEW_FORMAPAGTO_COD' +
        ', :NEW_CONDICAOPAGTO_COD, '
      '  :NEW_VENDA_PRAZO, :NEW_VALOR_FPAGTO, :NEW_VALOR_RECEBIDO, '
      '  :NEW_PRAZO_01, :NEW_PRAZO_02, :NEW_PRAZO_03, :NEW_PRAZO_04, '
      '  :NEW_PRAZO_05, :NEW_PRAZO_06, :NEW_PRAZO_07, :NEW_PRAZO_08, '
      '  :NEW_PRAZO_09, :NEW_PRAZO_10, :NEW_PRAZO_11, :NEW_PRAZO_12)')
    ModifySQL.Strings = (
      'UPDATE TBVENDAS_FORMAPAGTO'
      
        'SET ANO_VENDA = :NEW_ANO_VENDA, CONTROLE_VENDA = :NEW_CONTROLE_V' +
        'ENDA, '
      
        '  FORMAPAGTO_COD = :NEW_FORMAPAGTO_COD, CONDICAOPAGTO_COD = :NEW' +
        '_CONDICAOPAGTO_COD, '
      
        '  VENDA_PRAZO = :NEW_VENDA_PRAZO, VALOR_FPAGTO = :NEW_VALOR_FPAG' +
        'TO, '
      
        '  VALOR_RECEBIDO = :NEW_VALOR_RECEBIDO, PRAZO_01 = :NEW_PRAZO_01' +
        ', '
      
        '  PRAZO_02 = :NEW_PRAZO_02, PRAZO_03 = :NEW_PRAZO_03, PRAZO_04 =' +
        ' :NEW_PRAZO_04, '
      
        '  PRAZO_05 = :NEW_PRAZO_05, PRAZO_06 = :NEW_PRAZO_06, PRAZO_07 =' +
        ' :NEW_PRAZO_07, '
      
        '  PRAZO_08 = :NEW_PRAZO_08, PRAZO_09 = :NEW_PRAZO_09, PRAZO_10 =' +
        ' :NEW_PRAZO_10, '
      '  PRAZO_11 = :NEW_PRAZO_11, PRAZO_12 = :NEW_PRAZO_12'
      
        'WHERE ANO_VENDA = :OLD_ANO_VENDA AND CONTROLE_VENDA = :OLD_CONTR' +
        'OLE_VENDA AND '
      '  FORMAPAGTO_COD = :OLD_FORMAPAGTO_COD')
    DeleteSQL.Strings = (
      'DELETE FROM TBVENDAS_FORMAPAGTO'
      
        'WHERE ANO_VENDA = :OLD_ANO_VENDA AND CONTROLE_VENDA = :OLD_CONTR' +
        'OLE_VENDA AND '
      '  FORMAPAGTO_COD = :OLD_FORMAPAGTO_COD')
    FetchRowSQL.Strings = (
      'Select'
      '    f.ano_venda'
      '  , f.controle_venda'
      '  , f.formapagto_cod'
      '  , f.condicaopagto_cod'
      '  , f.venda_prazo'
      '  , f.valor_fpagto'
      '  , f.valor_recebido'
      '  , f.prazo_01'
      '  , f.prazo_02'
      '  , f.prazo_03'
      '  , f.prazo_04'
      '  , f.prazo_05'
      '  , f.prazo_06'
      '  , f.prazo_07'
      '  , f.prazo_08'
      '  , f.prazo_09'
      '  , f.prazo_10'
      '  , f.prazo_11'
      '  , f.prazo_12'
      '  , cast('#39' '#39' as varchar(50)) as formapagto_descricao'
      '  , cast('#39' '#39' as varchar(50)) as condicaopagto_descricao'
      'from TBVENDAS_FORMAPAGTO f'
      
        'WHERE ANO_VENDA = :ANO_VENDA AND CONTROLE_VENDA = :CONTROLE_VEND' +
        'A AND '
      '  FORMAPAGTO_COD = :FORMAPAGTO_COD')
    Left = 256
    Top = 176
  end
  object cdsVendaItem: TFDQuery
    CachedUpdates = True
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    UpdateObject = updVendaItem
    SQL.Strings = (
      'Select'
      '    i.Ano'
      '  , i.Codcontrol'
      '  , i.Seq'
      '  , i.Codprod'
      '  , i.Codemp'
      '  , i.Codcli'
      '  , i.Codcliente'
      '  , i.Codvendedor'
      '  , i.Dtvenda'
      '  , i.Qtde'
      '  , i.Punit'
      '  , i.Punit_Promocao'
      '  , i.Desconto'
      '  , i.Desconto_valor'
      '  , i.Pfinal'
      '  , i.Qtdefinal'
      '  , i.Unid_cod'
      '  , i.Cfop_cod'
      '  , coalesce(i.Cst, p.Cst) as Cst'
      '  , coalesce(i.Csosn, p.Csosn) as Csosn'
      '  , i.Aliquota'
      '  , i.Aliquota_csosn'
      '  , i.Aliquota_pis'
      '  , i.Aliquota_cofins'
      '  , i.Valor_ipi'
      '  , i.Percentual_reducao_BC'
      '  , i.Total_bruto'
      '  , i.Total_desconto'
      '  , i.Total_liquido'
      '  , p.Descri'
      '  , p.Qtde as Estoque'
      '  , p.Reserva'
      '  , u.Unp_sigla'
      '  , o.Cfop_descricao'
      '  , p.Cst   as Cst_produto'
      '  , p.Csosn as Csosn_produto'
      '  , p.Movimenta_Estoque'
      'from TVENDASITENS i'
      '  inner join TBPRODUTO p on (p.Cod = i.Codprod)'
      '  left join TBUNIDADEPROD u on (u.Unp_cod = p.Codunidade)'
      '  left join TBCFOP o on (o.Cfop_cod = i.Cfop_cod)'
      ''
      'where i.codemp     = :empresa'
      '  and i.ano        = :ano'
      '  and i.codcontrol = :controle')
    Left = 224
    Top = 128
    ParamData = <
      item
        Name = 'EMPRESA'
        DataType = ftString
        ParamType = ptInput
        Size = 18
        Value = Null
      end
      item
        Name = 'ANO'
        DataType = ftSmallint
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CONTROLE'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object cdsVendaItemANO: TSmallintField
      FieldName = 'ANO'
      Origin = 'ANO'
    end
    object cdsVendaItemCODCONTROL: TIntegerField
      FieldName = 'CODCONTROL'
      Origin = 'CODCONTROL'
    end
    object cdsVendaItemSEQ: TSmallintField
      Alignment = taCenter
      DisplayLabel = '#'
      FieldName = 'SEQ'
      Origin = 'SEQ'
      OnGetText = cdsVendaItemSEQGetText
      DisplayFormat = '00'
    end
    object cdsVendaItemCODPROD: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'CODPROD'
      Origin = 'CODPROD'
      Size = 10
    end
    object cdsVendaItemCODEMP: TStringField
      FieldName = 'CODEMP'
      Origin = 'CODEMP'
      Size = 18
    end
    object cdsVendaItemCODCLI: TStringField
      FieldName = 'CODCLI'
      Origin = 'CODCLI'
      Size = 18
    end
    object cdsVendaItemCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
      Origin = 'CODCLIENTE'
    end
    object cdsVendaItemCODVENDEDOR: TIntegerField
      FieldName = 'CODVENDEDOR'
      Origin = 'CODVENDEDOR'
    end
    object cdsVendaItemDTVENDA: TSQLTimeStampField
      FieldName = 'DTVENDA'
      Origin = 'DTVENDA'
    end
    object cdsVendaItemQTDE: TBCDField
      DisplayLabel = 'Quantidade'
      FieldName = 'QTDE'
      Origin = 'QTDE'
      DisplayFormat = ',0.###'
      Precision = 18
      Size = 3
    end
    object cdsVendaItemPUNIT: TBCDField
      DisplayLabel = 'Valor Unit'#225'rio'
      FieldName = 'PUNIT'
      Origin = 'PUNIT'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsVendaItemPUNIT_PROMOCAO: TBCDField
      FieldName = 'PUNIT_PROMOCAO'
      Origin = 'PUNIT_PROMOCAO'
      Precision = 18
      Size = 2
    end
    object cdsVendaItemDESCONTO: TBCDField
      DisplayLabel = '% Desconto'
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      DisplayFormat = ',0.00#'
      Precision = 18
      Size = 3
    end
    object cdsVendaItemDESCONTO_VALOR: TBCDField
      DisplayLabel = 'Valor Desconto (R$)'
      FieldName = 'DESCONTO_VALOR'
      Origin = 'DESCONTO_VALOR'
      DisplayFormat = ',0.00#'
      Precision = 18
    end
    object cdsVendaItemPFINAL: TBCDField
      DisplayLabel = 'Valor L'#237'quido'
      FieldName = 'PFINAL'
      Origin = 'PFINAL'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsVendaItemQTDEFINAL: TBCDField
      FieldName = 'QTDEFINAL'
      Origin = 'QTDEFINAL'
      DisplayFormat = ',0.###'
      Precision = 18
      Size = 3
    end
    object cdsVendaItemUNID_COD: TSmallintField
      FieldName = 'UNID_COD'
      Origin = 'UNID_COD'
    end
    object cdsVendaItemCFOP_COD: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'CFOP'
      FieldName = 'CFOP_COD'
      Origin = 'CFOP_COD'
    end
    object cdsVendaItemCST: TStringField
      Alignment = taCenter
      AutoGenerateValue = arDefault
      FieldName = 'CST'
      Origin = 'CST'
      ProviderFlags = []
      Size = 3
    end
    object cdsVendaItemCSOSN: TStringField
      Alignment = taCenter
      AutoGenerateValue = arDefault
      FieldName = 'CSOSN'
      Origin = 'CSOSN'
      ProviderFlags = []
      Size = 3
    end
    object cdsVendaItemALIQUOTA: TBCDField
      FieldName = 'ALIQUOTA'
      Origin = 'ALIQUOTA'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsVendaItemALIQUOTA_CSOSN: TBCDField
      FieldName = 'ALIQUOTA_CSOSN'
      Origin = 'ALIQUOTA_CSOSN'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsVendaItemALIQUOTA_PIS: TBCDField
      FieldName = 'ALIQUOTA_PIS'
      Origin = 'ALIQUOTA_PIS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsVendaItemALIQUOTA_COFINS: TBCDField
      FieldName = 'ALIQUOTA_COFINS'
      Origin = 'ALIQUOTA_COFINS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsVendaItemVALOR_IPI: TBCDField
      FieldName = 'VALOR_IPI'
      Origin = 'VALOR_IPI'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsVendaItemPERCENTUAL_REDUCAO_BC: TBCDField
      FieldName = 'PERCENTUAL_REDUCAO_BC'
      Origin = 'PERCENTUAL_REDUCAO_BC'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsVendaItemTOTAL_BRUTO: TBCDField
      DisplayLabel = 'Total Bruto'
      FieldName = 'TOTAL_BRUTO'
      Origin = 'TOTAL_BRUTO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsVendaItemTOTAL_DESCONTO: TBCDField
      DisplayLabel = 'Total Desc.'
      FieldName = 'TOTAL_DESCONTO'
      Origin = 'TOTAL_DESCONTO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsVendaItemTOTAL_LIQUIDO: TBCDField
      DisplayLabel = 'Total L'#237'quido'
      FieldName = 'TOTAL_LIQUIDO'
      Origin = 'TOTAL_LIQUIDO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsVendaItemDESCRI: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Nome do produto'
      FieldName = 'DESCRI'
      Origin = 'DESCRI'
      ProviderFlags = []
      Size = 50
    end
    object cdsVendaItemESTOQUE: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'ESTOQUE'
      Origin = 'QTDE'
      ProviderFlags = []
      Precision = 18
      Size = 3
    end
    object cdsVendaItemRESERVA: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'RESERVA'
      Origin = 'RESERVA'
      ProviderFlags = []
      Precision = 18
      Size = 3
    end
    object cdsVendaItemUNP_SIGLA: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Und.'
      FieldName = 'UNP_SIGLA'
      Origin = 'UNP_SIGLA'
      ProviderFlags = []
      Size = 5
    end
    object cdsVendaItemCFOP_DESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CFOP_DESCRICAO'
      Origin = 'CFOP_DESCRICAO'
      ProviderFlags = []
      Size = 250
    end
    object cdsVendaItemMOVIMENTA_ESTOQUE: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'MOVIMENTA_ESTOQUE'
      Origin = 'MOVIMENTA_ESTOQUE'
      ProviderFlags = []
    end
    object cdsVendaItemCST_PRODUTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CST_PRODUTO'
      Origin = 'CST'
      ProviderFlags = []
      Size = 3
    end
    object cdsVendaItemCSOSN_PRODUTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CSOSN_PRODUTO'
      Origin = 'CSOSN'
      ProviderFlags = []
      Size = 3
    end
  end
  object updVendaItem: TFDUpdateSQL
    Connection = DMBusiness.fdConexao
    InsertSQL.Strings = (
      'INSERT INTO TVENDASITENS'
      '(ANO, CODCONTROL, CODEMP, SEQ, CODPROD, '
      '  CODCLIENTE, CODCLI, CODVENDEDOR, DTVENDA, '
      '  QTDE, PUNIT, PUNIT_PROMOCAO, DESCONTO, '
      '  DESCONTO_VALOR, PFINAL, QTDEFINAL, UNID_COD, '
      '  CFOP_COD, CST, CSOSN, ALIQUOTA, ALIQUOTA_CSOSN, '
      '  ALIQUOTA_PIS, ALIQUOTA_COFINS, VALOR_IPI, '
      '  PERCENTUAL_REDUCAO_BC, TOTAL_BRUTO, TOTAL_DESCONTO, '
      '  TOTAL_LIQUIDO)'
      
        'VALUES (:NEW_ANO, :NEW_CODCONTROL, :NEW_CODEMP, :NEW_SEQ, :NEW_C' +
        'ODPROD, '
      '  :NEW_CODCLIENTE, :NEW_CODCLI, :NEW_CODVENDEDOR, :NEW_DTVENDA, '
      '  :NEW_QTDE, :NEW_PUNIT, :NEW_PUNIT_PROMOCAO, :NEW_DESCONTO, '
      
        '  :NEW_DESCONTO_VALOR, :NEW_PFINAL, :NEW_QTDEFINAL, :NEW_UNID_CO' +
        'D, '
      
        '  :NEW_CFOP_COD, :NEW_CST, :NEW_CSOSN, :NEW_ALIQUOTA, :NEW_ALIQU' +
        'OTA_CSOSN, '
      '  :NEW_ALIQUOTA_PIS, :NEW_ALIQUOTA_COFINS, :NEW_VALOR_IPI, '
      
        '  :NEW_PERCENTUAL_REDUCAO_BC, :NEW_TOTAL_BRUTO, :NEW_TOTAL_DESCO' +
        'NTO, '
      '  :NEW_TOTAL_LIQUIDO)'
      'RETURNING QTDE, CST, CSOSN')
    ModifySQL.Strings = (
      'UPDATE TVENDASITENS'
      
        'SET ANO = :NEW_ANO, CODCONTROL = :NEW_CODCONTROL, CODEMP = :NEW_' +
        'CODEMP, '
      
        '  SEQ = :NEW_SEQ, CODPROD = :NEW_CODPROD, CODCLIENTE = :NEW_CODC' +
        'LIENTE, '
      
        '  CODCLI = :NEW_CODCLI, CODVENDEDOR = :NEW_CODVENDEDOR, DTVENDA ' +
        '= :NEW_DTVENDA, '
      
        '  QTDE = :NEW_QTDE, PUNIT = :NEW_PUNIT, PUNIT_PROMOCAO = :NEW_PU' +
        'NIT_PROMOCAO, '
      
        '  DESCONTO = :NEW_DESCONTO, DESCONTO_VALOR = :NEW_DESCONTO_VALOR' +
        ', '
      
        '  PFINAL = :NEW_PFINAL, QTDEFINAL = :NEW_QTDEFINAL, UNID_COD = :' +
        'NEW_UNID_COD, '
      '  CFOP_COD = :NEW_CFOP_COD, CST = :NEW_CST, CSOSN = :NEW_CSOSN, '
      
        '  ALIQUOTA = :NEW_ALIQUOTA, ALIQUOTA_CSOSN = :NEW_ALIQUOTA_CSOSN' +
        ', '
      
        '  ALIQUOTA_PIS = :NEW_ALIQUOTA_PIS, ALIQUOTA_COFINS = :NEW_ALIQU' +
        'OTA_COFINS, '
      
        '  VALOR_IPI = :NEW_VALOR_IPI, PERCENTUAL_REDUCAO_BC = :NEW_PERCE' +
        'NTUAL_REDUCAO_BC, '
      
        '  TOTAL_BRUTO = :NEW_TOTAL_BRUTO, TOTAL_DESCONTO = :NEW_TOTAL_DE' +
        'SCONTO, '
      '  TOTAL_LIQUIDO = :NEW_TOTAL_LIQUIDO'
      
        'WHERE ANO = :OLD_ANO AND CODCONTROL = :OLD_CODCONTROL AND CODEMP' +
        ' = :OLD_CODEMP AND '
      '  SEQ = :OLD_SEQ'
      'RETURNING QTDE, CST, CSOSN')
    DeleteSQL.Strings = (
      'DELETE FROM TVENDASITENS'
      
        'WHERE ANO = :OLD_ANO AND CODCONTROL = :OLD_CODCONTROL AND CODEMP' +
        ' = :OLD_CODEMP AND '
      '  SEQ = :OLD_SEQ')
    FetchRowSQL.Strings = (
      'Select'
      '    i.Ano'
      '  , i.Codcontrol'
      '  , i.Seq'
      '  , i.Codprod'
      '  , i.Codemp'
      '  , i.Codcli'
      '  , i.Codcliente'
      '  , i.Codvendedor'
      '  , i.Dtvenda'
      '  , i.Qtde'
      '  , i.Punit'
      '  , i.Punit_Promocao'
      '  , i.Desconto'
      '  , i.Desconto_valor'
      '  , i.Pfinal'
      '  , i.Qtdefinal'
      '  , i.Unid_cod'
      '  , i.Cfop_cod'
      '  , coalesce(i.Cst, p.Cst) as Cst'
      '  , coalesce(i.Csosn, p.Csosn) as Csosn'
      '  , i.Aliquota'
      '  , i.Aliquota_csosn'
      '  , i.Aliquota_pis'
      '  , i.Aliquota_cofins'
      '  , i.Valor_ipi'
      '  , i.Percentual_reducao_BC'
      '  , i.Total_bruto'
      '  , i.Total_desconto'
      '  , i.Total_liquido'
      '  , p.Descri'
      '  , p.Qtde as Estoque'
      '  , p.Reserva'
      '  , u.Unp_sigla'
      '  , o.Cfop_descricao'
      '  , p.Cst   as Cst_produto'
      '  , p.Csosn as Csosn_produto'
      '  , p.Movimenta_Estoque'
      'from TVENDASITENS i'
      '  inner join TBPRODUTO p on (p.Cod = i.Codprod)'
      '  left join TBUNIDADEPROD u on (u.Unp_cod = p.Codunidade)'
      '  left join TBCFOP o on (o.Cfop_cod = i.Cfop_cod)'
      
        'WHERE ANO = :ANO AND CODCONTROL = :CODCONTROL AND CODEMP = :CODE' +
        'MP AND'
      '  SEQ = :SEQ')
    Left = 256
    Top = 128
  end
  object cdsVenda: TFDQuery
    Active = True
    OnCalcFields = cdsVendaCalcFields
    CachedUpdates = True
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    UpdateObject = updVenda
    SQL.Strings = (
      'Select'
      '    v.Ano'
      '  , v.Codcontrol'
      '  , v.Codemp'
      '  , v.Codcliente'
      '  , v.Codcli'
      '  , v.Dtvenda'
      '  , v.Status'
      '  , v.Totalvenda_bruta'
      '  , v.Desconto'
      '  , v.Desconto_cupom'
      '  , v.Totalvenda'
      '  , v.Dtfinalizacao_venda'
      '  , v.Obs'
      '  , v.Formapag'
      '  , v.Fatdias'
      '  , v.Serie'
      '  , v.Nfe'
      '  , v.Lote_nfe_ano'
      '  , v.Lote_nfe_numero'
      '  , v.Lote_nfe_Recibo'
      '  , v.Lote_nfe_codigo'
      '  , v.Nfe_enviada'
      '  , v.Nfe_denegada'
      '  , v.Nfe_denegada_motivo'
      '  , v.Dataemissao'
      '  , v.Horaemissao'
      '  , v.Cancel_datahora'
      '  , v.Cancel_motivo'
      '  , v.Cfop'
      '  , v.Verificador_nfe'
      '  , v.Xml_nfe_filename'
      '  , v.Xml_nfe'
      '  , v.Vendedor_cod'
      '  , v.Usuario'
      '  , v.Formapagto_cod'
      '  , v.Condicaopagto_cod'
      '  , v.Venda_prazo'
      '  , v.Prazo_01'
      '  , v.Prazo_02'
      '  , v.Prazo_03'
      '  , v.Prazo_04'
      '  , v.Prazo_05'
      '  , v.Prazo_06'
      '  , v.Prazo_07'
      '  , v.Prazo_08'
      '  , v.Prazo_09'
      '  , v.Prazo_10'
      '  , v.Prazo_11'
      '  , v.Prazo_12'
      '  , v.nfe_modalidade_frete'
      '  , v.nfe_transportadora'
      '  , v.nfe_placa_veiculo'
      '  , v.nfe_placa_uf'
      '  , v.nfe_placa_rntc'
      '  , v.nfe_valor_total_produto'
      '  , v.nfe_valor_desconto'
      '  , v.nfe_valor_total_nota'
      '  , v.gerar_estoque_cliente'
      '  , t.nomeforn as transp_nome'
      '  , t.cnpj     as transp_cnpj'
      '  , t.inscest  as transp_iest'
      
        '  , t.ender || coalesce('#39' - '#39' || t.cidade, '#39#39') as transp_enderec' +
        'o'
      '  , c.Nome'
      '  , c.Bloqueado'
      '  , c.Bloqueado_motivo'
      '  , Case when coalesce(v.totalcusto, 0) > 0'
      
        '      then ((v.totalvenda / coalesce(v.totalcusto, 0)) - 1) * 10' +
        '0'
      '      else 0.0'
      '    end Lucro_Calculado'
      'from TBVENDAS v'
      '  inner join TBCLIENTE c on (c.Codigo = v.Codcliente)'
      '  left join TBFORNECEDOR t on (t.codforn = v.nfe_transportadora)'
      ''
      'where v.codemp     = :empresa'
      '  and v.ano        = :ano'
      '  and v.codcontrol = :controle')
    Left = 224
    Top = 80
    ParamData = <
      item
        Name = 'EMPRESA'
        DataType = ftString
        ParamType = ptInput
        Size = 18
        Value = Null
      end
      item
        Name = 'ANO'
        DataType = ftSmallint
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CONTROLE'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object cdsVendaANO: TSmallintField
      FieldName = 'ANO'
      Origin = 'ANO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsVendaCODCONTROL: TIntegerField
      DisplayLabel = 'No. Venda'
      FieldName = 'CODCONTROL'
      Origin = 'CODCONTROL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsVendaCODEMP: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'CODEMP'
      Origin = 'CODEMP'
      Size = 18
    end
    object cdsVendaCODCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CODCLIENTE'
      Origin = 'CODCLIENTE'
    end
    object cdsVendaCODCLI: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'CODCLI'
      Origin = 'CODCLI'
      Size = 18
    end
    object cdsVendaDTVENDA: TSQLTimeStampField
      DisplayLabel = 'D. Venda'
      FieldName = 'DTVENDA'
      Origin = 'DTVENDA'
      DisplayFormat = 'dd/mm/yyyy hh:mm'
    end
    object cdsVendaSTATUS: TSmallintField
      Alignment = taLeftJustify
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Origin = 'STATUS'
    end
    object cdsVendaTOTALVENDA_BRUTA: TBCDField
      DisplayLabel = 'Total Bruto (R$)'
      FieldName = 'TOTALVENDA_BRUTA'
      Origin = 'TOTALVENDA_BRUTA'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsVendaDESCONTO: TBCDField
      DisplayLabel = 'Desconto (R$)'
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      DisplayFormat = ',0.00'
      Precision = 18
    end
    object cdsVendaDESCONTO_CUPOM: TBCDField
      FieldName = 'DESCONTO_CUPOM'
      Origin = 'DESCONTO_CUPOM'
      Precision = 18
      Size = 2
    end
    object cdsVendaTOTALVENDA: TBCDField
      DisplayLabel = 'Valor Total (R$)'
      FieldName = 'TOTALVENDA'
      Origin = 'TOTALVENDA'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsVendaDTFINALIZACAO_VENDA: TDateField
      FieldName = 'DTFINALIZACAO_VENDA'
      Origin = 'DTFINALIZACAO_VENDA'
    end
    object cdsVendaOBS: TMemoField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBS'
      Origin = 'OBS'
      BlobType = ftMemo
    end
    object cdsVendaFORMAPAG: TStringField
      DisplayLabel = 'Forma de Pagamento'
      FieldName = 'FORMAPAG'
      Origin = 'FORMAPAG'
      Size = 35
    end
    object cdsVendaFATDIAS: TSmallintField
      DisplayLabel = 'Fatura Dias'
      FieldName = 'FATDIAS'
      Origin = 'FATDIAS'
    end
    object cdsVendaSERIE: TStringField
      Alignment = taCenter
      DisplayLabel = 'S'#233'rie'
      FieldName = 'SERIE'
      Origin = 'SERIE'
      Size = 4
    end
    object cdsVendaNFE: TLargeintField
      DisplayLabel = 'NF-e'
      FieldName = 'NFE'
      Origin = 'NFE'
      DisplayFormat = '###0000000'
    end
    object cdsVendaLOTE_NFE_ANO: TSmallintField
      FieldName = 'LOTE_NFE_ANO'
      Origin = 'LOTE_NFE_ANO'
    end
    object cdsVendaLOTE_NFE_NUMERO: TIntegerField
      FieldName = 'LOTE_NFE_NUMERO'
      Origin = 'LOTE_NFE_NUMERO'
    end
    object cdsVendaLOTE_NFE_RECIBO: TStringField
      FieldName = 'LOTE_NFE_RECIBO'
      Origin = 'LOTE_NFE_RECIBO'
      Size = 250
    end
    object cdsVendaLOTE_NFE_CODIGO: TIntegerField
      FieldName = 'LOTE_NFE_CODIGO'
      Origin = 'LOTE_NFE_CODIGO'
    end
    object cdsVendaNFE_ENVIADA: TSmallintField
      FieldName = 'NFE_ENVIADA'
      Origin = 'NFE_ENVIADA'
    end
    object cdsVendaNFE_DENEGADA: TSmallintField
      FieldName = 'NFE_DENEGADA'
      Origin = 'NFE_DENEGADA'
    end
    object cdsVendaNFE_DENEGADA_MOTIVO: TStringField
      FieldName = 'NFE_DENEGADA_MOTIVO'
      Origin = 'NFE_DENEGADA_MOTIVO'
      Size = 100
    end
    object cdsVendaDATAEMISSAO: TDateField
      DisplayLabel = 'D. Emiss'#227'o'
      FieldName = 'DATAEMISSAO'
      Origin = 'DATAEMISSAO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsVendaHORAEMISSAO: TTimeField
      DisplayLabel = 'Hora Emiss'#227'o'
      FieldName = 'HORAEMISSAO'
      Origin = 'HORAEMISSAO'
      DisplayFormat = 'hh:mm'
    end
    object cdsVendaCANCEL_DATAHORA: TSQLTimeStampField
      FieldName = 'CANCEL_DATAHORA'
      Origin = 'CANCEL_DATAHORA'
    end
    object cdsVendaCANCEL_MOTIVO: TMemoField
      FieldName = 'CANCEL_MOTIVO'
      Origin = 'CANCEL_MOTIVO'
      BlobType = ftMemo
    end
    object cdsVendaCFOP: TIntegerField
      FieldName = 'CFOP'
      Origin = 'CFOP'
    end
    object cdsVendaVERIFICADOR_NFE: TStringField
      DisplayLabel = 'Verificador'
      FieldName = 'VERIFICADOR_NFE'
      Origin = 'VERIFICADOR_NFE'
      Size = 250
    end
    object cdsVendaXML_NFE_FILENAME: TStringField
      FieldName = 'XML_NFE_FILENAME'
      Origin = 'XML_NFE_FILENAME'
      Size = 250
    end
    object cdsVendaXML_NFE: TMemoField
      DisplayLabel = 'XML NF-e'
      FieldName = 'XML_NFE'
      Origin = 'XML_NFE'
      BlobType = ftMemo
    end
    object cdsVendaVENDEDOR_COD: TIntegerField
      DisplayLabel = 'Vendedor'
      FieldName = 'VENDEDOR_COD'
      Origin = 'VENDEDOR_COD'
    end
    object cdsVendaUSUARIO: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'USUARIO'
      Origin = 'USUARIO'
      Size = 50
    end
    object cdsVendaFORMAPAGTO_COD: TSmallintField
      DisplayLabel = 'Forma de Pagamento'
      FieldName = 'FORMAPAGTO_COD'
      Origin = 'FORMAPAGTO_COD'
    end
    object cdsVendaCONDICAOPAGTO_COD: TSmallintField
      DisplayLabel = 'Condi'#231#227'o de Pagamento'
      FieldName = 'CONDICAOPAGTO_COD'
      Origin = 'CONDICAOPAGTO_COD'
    end
    object cdsVendaVENDA_PRAZO: TSmallintField
      DisplayLabel = 'A Prazo?'
      FieldName = 'VENDA_PRAZO'
      Origin = 'VENDA_PRAZO'
    end
    object cdsVendaPRAZO_01: TSmallintField
      DisplayLabel = 'Prazo 01'
      FieldName = 'PRAZO_01'
      Origin = 'PRAZO_01'
    end
    object cdsVendaPRAZO_02: TSmallintField
      DisplayLabel = 'Prazo 02'
      FieldName = 'PRAZO_02'
      Origin = 'PRAZO_02'
    end
    object cdsVendaPRAZO_03: TSmallintField
      DisplayLabel = 'Prazo 03'
      FieldName = 'PRAZO_03'
      Origin = 'PRAZO_03'
    end
    object cdsVendaPRAZO_04: TSmallintField
      DisplayLabel = 'Prazo 04'
      FieldName = 'PRAZO_04'
      Origin = 'PRAZO_04'
    end
    object cdsVendaPRAZO_05: TSmallintField
      DisplayLabel = 'Prazo 05'
      FieldName = 'PRAZO_05'
      Origin = 'PRAZO_05'
    end
    object cdsVendaPRAZO_06: TSmallintField
      DisplayLabel = 'Prazo 06'
      FieldName = 'PRAZO_06'
      Origin = 'PRAZO_06'
    end
    object cdsVendaPRAZO_07: TSmallintField
      DisplayLabel = 'Prazo 07'
      FieldName = 'PRAZO_07'
      Origin = 'PRAZO_07'
    end
    object cdsVendaPRAZO_08: TSmallintField
      DisplayLabel = 'Prazo 08'
      FieldName = 'PRAZO_08'
      Origin = 'PRAZO_08'
    end
    object cdsVendaPRAZO_09: TSmallintField
      DisplayLabel = 'Prazo 09'
      FieldName = 'PRAZO_09'
      Origin = 'PRAZO_09'
    end
    object cdsVendaPRAZO_10: TSmallintField
      DisplayLabel = 'Prazo 10'
      FieldName = 'PRAZO_10'
      Origin = 'PRAZO_10'
    end
    object cdsVendaPRAZO_11: TSmallintField
      DisplayLabel = 'Prazo 11'
      FieldName = 'PRAZO_11'
      Origin = 'PRAZO_11'
    end
    object cdsVendaPRAZO_12: TSmallintField
      DisplayLabel = 'Prazo 12'
      FieldName = 'PRAZO_12'
      Origin = 'PRAZO_12'
    end
    object cdsVendaNFE_MODALIDADE_FRETE: TSmallintField
      DisplayLabel = 'Modalidade do Frete'
      FieldName = 'NFE_MODALIDADE_FRETE'
      Origin = 'NFE_MODALIDADE_FRETE'
    end
    object cdsVendaNFE_TRANSPORTADORA: TIntegerField
      DisplayLabel = 'Transportadora'
      FieldName = 'NFE_TRANSPORTADORA'
      Origin = 'NFE_TRANSPORTADORA'
    end
    object cdsVendaNFE_PLACA_VEICULO: TStringField
      DisplayLabel = 'Placa do Ve'#237'culo'
      FieldName = 'NFE_PLACA_VEICULO'
      Origin = 'NFE_PLACA_VEICULO'
      Size = 10
    end
    object cdsVendaNFE_PLACA_UF: TStringField
      DisplayLabel = 'UF da Placa'
      FieldName = 'NFE_PLACA_UF'
      Origin = 'NFE_PLACA_UF'
      Size = 2
    end
    object cdsVendaNFE_PLACA_RNTC: TStringField
      DisplayLabel = 'RNTC (Registro Nacional de Transporte de Carga)'
      FieldName = 'NFE_PLACA_RNTC'
      Origin = 'NFE_PLACA_RNTC'
      Size = 10
    end
    object cdsVendaNFE_VALOR_TOTAL_PRODUTO: TBCDField
      FieldName = 'NFE_VALOR_TOTAL_PRODUTO'
      Origin = 'NFE_VALOR_TOTAL_PRODUTO'
      Precision = 18
      Size = 2
    end
    object cdsVendaNFE_VALOR_DESCONTO: TBCDField
      FieldName = 'NFE_VALOR_DESCONTO'
      Origin = 'NFE_VALOR_DESCONTO'
      Precision = 18
      Size = 2
    end
    object cdsVendaNFE_VALOR_TOTAL_NOTA: TBCDField
      FieldName = 'NFE_VALOR_TOTAL_NOTA'
      Origin = 'NFE_VALOR_TOTAL_NOTA'
      Precision = 18
      Size = 2
    end
    object cdsVendaGERAR_ESTOQUE_CLIENTE: TSmallintField
      FieldName = 'GERAR_ESTOQUE_CLIENTE'
      Origin = 'GERAR_ESTOQUE_CLIENTE'
    end
    object cdsVendaTRANSP_NOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TRANSP_NOME'
      Origin = 'NOMEFORN'
      ProviderFlags = []
      Size = 100
    end
    object cdsVendaTRANSP_CNPJ: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TRANSP_CNPJ'
      Origin = 'CNPJ'
      ProviderFlags = []
      Size = 18
    end
    object cdsVendaTRANSP_IEST: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TRANSP_IEST'
      Origin = 'INSCEST'
      ProviderFlags = []
    end
    object cdsVendaTRANSP_ENDERECO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TRANSP_ENDERECO'
      Origin = 'TRANSP_ENDERECO'
      ProviderFlags = []
      Size = 283
    end
    object cdsVendaNOME: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Cliente'
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object cdsVendaBLOQUEADO: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'BLOQUEADO'
      Origin = 'BLOQUEADO'
      ProviderFlags = []
    end
    object cdsVendaBLOQUEADO_MOTIVO: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'BLOQUEADO_MOTIVO'
      Origin = 'BLOQUEADO_MOTIVO'
      ProviderFlags = []
      BlobType = ftMemo
    end
    object cdsVendaLUCRO_CALCULADO: TBCDField
      AutoGenerateValue = arDefault
      DisplayLabel = '% Lucro'
      FieldName = 'LUCRO_CALCULADO'
      Origin = 'LUCRO_CALCULADO'
      ProviderFlags = []
      DisplayFormat = ',0.00##'
      Precision = 18
    end
    object cdsVendaDESCONTO_TOTAL: TCurrencyField
      FieldKind = fkInternalCalc
      FieldName = 'DESCONTO_TOTAL'
      DisplayFormat = ',0.00'
    end
  end
  object updVenda: TFDUpdateSQL
    Connection = DMBusiness.fdConexao
    InsertSQL.Strings = (
      'INSERT INTO TBVENDAS'
      '(ANO, CODCONTROL, CODEMP, CODCLIENTE, CODCLI, '
      '  DTVENDA, STATUS, TOTALVENDA_BRUTA, DESCONTO, '
      '  DESCONTO_CUPOM, TOTALVENDA, DTFINALIZACAO_VENDA, '
      '  OBS, FORMAPAG, FATDIAS, SERIE, NFE, '
      '  DATAEMISSAO, HORAEMISSAO, CFOP, VERIFICADOR_NFE, '
      '  XML_NFE, XML_NFE_FILENAME, VENDEDOR_COD, '
      '  USUARIO, FORMAPAGTO_COD, CONDICAOPAGTO_COD, '
      '  VENDA_PRAZO, PRAZO_01, PRAZO_02, PRAZO_03, '
      '  PRAZO_04, PRAZO_05, PRAZO_06, PRAZO_07, '
      '  PRAZO_08, PRAZO_09, PRAZO_10, PRAZO_11, '
      '  PRAZO_12, LOTE_NFE_ANO, LOTE_NFE_NUMERO, '
      '  LOTE_NFE_CODIGO, LOTE_NFE_RECIBO, NFE_ENVIADA, '
      '  NFE_DENEGADA, NFE_DENEGADA_MOTIVO, CANCEL_DATAHORA, '
      '  CANCEL_MOTIVO, NFE_MODALIDADE_FRETE, NFE_TRANSPORTADORA, '
      '  NFE_PLACA_VEICULO, NFE_PLACA_UF, NFE_PLACA_RNTC, '
      
        '  NFE_VALOR_TOTAL_PRODUTO, NFE_VALOR_DESCONTO, NFE_VALOR_TOTAL_N' +
        'OTA, '
      '  GERAR_ESTOQUE_CLIENTE)'
      
        'VALUES (:NEW_ANO, :NEW_CODCONTROL, :NEW_CODEMP, :NEW_CODCLIENTE,' +
        ' :NEW_CODCLI, '
      
        '  :NEW_DTVENDA, :NEW_STATUS, :NEW_TOTALVENDA_BRUTA, :NEW_DESCONT' +
        'O, '
      
        '  :NEW_DESCONTO_CUPOM, :NEW_TOTALVENDA, :NEW_DTFINALIZACAO_VENDA' +
        ', '
      '  :NEW_OBS, :NEW_FORMAPAG, :NEW_FATDIAS, :NEW_SERIE, :NEW_NFE, '
      
        '  :NEW_DATAEMISSAO, :NEW_HORAEMISSAO, :NEW_CFOP, :NEW_VERIFICADO' +
        'R_NFE, '
      '  :NEW_XML_NFE, :NEW_XML_NFE_FILENAME, :NEW_VENDEDOR_COD, '
      '  :NEW_USUARIO, :NEW_FORMAPAGTO_COD, :NEW_CONDICAOPAGTO_COD, '
      
        '  :NEW_VENDA_PRAZO, :NEW_PRAZO_01, :NEW_PRAZO_02, :NEW_PRAZO_03,' +
        ' '
      '  :NEW_PRAZO_04, :NEW_PRAZO_05, :NEW_PRAZO_06, :NEW_PRAZO_07, '
      '  :NEW_PRAZO_08, :NEW_PRAZO_09, :NEW_PRAZO_10, :NEW_PRAZO_11, '
      '  :NEW_PRAZO_12, :NEW_LOTE_NFE_ANO, :NEW_LOTE_NFE_NUMERO, '
      '  :NEW_LOTE_NFE_CODIGO, :NEW_LOTE_NFE_RECIBO, :NEW_NFE_ENVIADA, '
      
        '  :NEW_NFE_DENEGADA, :NEW_NFE_DENEGADA_MOTIVO, :NEW_CANCEL_DATAH' +
        'ORA, '
      
        '  :NEW_CANCEL_MOTIVO, :NEW_NFE_MODALIDADE_FRETE, :NEW_NFE_TRANSP' +
        'ORTADORA, '
      
        '  :NEW_NFE_PLACA_VEICULO, :NEW_NFE_PLACA_UF, :NEW_NFE_PLACA_RNTC' +
        ', '
      
        '  :NEW_NFE_VALOR_TOTAL_PRODUTO, :NEW_NFE_VALOR_DESCONTO, :NEW_NF' +
        'E_VALOR_TOTAL_NOTA, '
      '  :NEW_GERAR_ESTOQUE_CLIENTE)')
    ModifySQL.Strings = (
      'UPDATE TBVENDAS'
      
        'SET ANO = :NEW_ANO, CODCONTROL = :NEW_CODCONTROL, CODEMP = :NEW_' +
        'CODEMP, '
      
        '  CODCLIENTE = :NEW_CODCLIENTE, CODCLI = :NEW_CODCLI, DTVENDA = ' +
        ':NEW_DTVENDA, '
      
        '  STATUS = :NEW_STATUS, TOTALVENDA_BRUTA = :NEW_TOTALVENDA_BRUTA' +
        ', '
      
        '  DESCONTO = :NEW_DESCONTO, DESCONTO_CUPOM = :NEW_DESCONTO_CUPOM' +
        ', '
      
        '  TOTALVENDA = :NEW_TOTALVENDA, DTFINALIZACAO_VENDA = :NEW_DTFIN' +
        'ALIZACAO_VENDA, '
      
        '  OBS = :NEW_OBS, FORMAPAG = :NEW_FORMAPAG, FATDIAS = :NEW_FATDI' +
        'AS, '
      
        '  SERIE = :NEW_SERIE, NFE = :NEW_NFE, DATAEMISSAO = :NEW_DATAEMI' +
        'SSAO, '
      
        '  HORAEMISSAO = :NEW_HORAEMISSAO, CFOP = :NEW_CFOP, VERIFICADOR_' +
        'NFE = :NEW_VERIFICADOR_NFE, '
      
        '  XML_NFE = :NEW_XML_NFE, XML_NFE_FILENAME = :NEW_XML_NFE_FILENA' +
        'ME, '
      '  VENDEDOR_COD = :NEW_VENDEDOR_COD, USUARIO = :NEW_USUARIO, '
      
        '  FORMAPAGTO_COD = :NEW_FORMAPAGTO_COD, CONDICAOPAGTO_COD = :NEW' +
        '_CONDICAOPAGTO_COD, '
      '  VENDA_PRAZO = :NEW_VENDA_PRAZO, PRAZO_01 = :NEW_PRAZO_01, '
      
        '  PRAZO_02 = :NEW_PRAZO_02, PRAZO_03 = :NEW_PRAZO_03, PRAZO_04 =' +
        ' :NEW_PRAZO_04, '
      
        '  PRAZO_05 = :NEW_PRAZO_05, PRAZO_06 = :NEW_PRAZO_06, PRAZO_07 =' +
        ' :NEW_PRAZO_07, '
      
        '  PRAZO_08 = :NEW_PRAZO_08, PRAZO_09 = :NEW_PRAZO_09, PRAZO_10 =' +
        ' :NEW_PRAZO_10, '
      
        '  PRAZO_11 = :NEW_PRAZO_11, PRAZO_12 = :NEW_PRAZO_12, LOTE_NFE_A' +
        'NO = :NEW_LOTE_NFE_ANO, '
      
        '  LOTE_NFE_NUMERO = :NEW_LOTE_NFE_NUMERO, LOTE_NFE_CODIGO = :NEW' +
        '_LOTE_NFE_CODIGO, '
      
        '  LOTE_NFE_RECIBO = :NEW_LOTE_NFE_RECIBO, NFE_ENVIADA = :NEW_NFE' +
        '_ENVIADA, '
      
        '  NFE_DENEGADA = :NEW_NFE_DENEGADA, NFE_DENEGADA_MOTIVO = :NEW_N' +
        'FE_DENEGADA_MOTIVO, '
      
        '  CANCEL_DATAHORA = :NEW_CANCEL_DATAHORA, CANCEL_MOTIVO = :NEW_C' +
        'ANCEL_MOTIVO, '
      
        '  NFE_MODALIDADE_FRETE = :NEW_NFE_MODALIDADE_FRETE, NFE_TRANSPOR' +
        'TADORA = :NEW_NFE_TRANSPORTADORA, '
      
        '  NFE_PLACA_VEICULO = :NEW_NFE_PLACA_VEICULO, NFE_PLACA_UF = :NE' +
        'W_NFE_PLACA_UF, '
      
        '  NFE_PLACA_RNTC = :NEW_NFE_PLACA_RNTC, NFE_VALOR_TOTAL_PRODUTO ' +
        '= :NEW_NFE_VALOR_TOTAL_PRODUTO, '
      
        '  NFE_VALOR_DESCONTO = :NEW_NFE_VALOR_DESCONTO, NFE_VALOR_TOTAL_' +
        'NOTA = :NEW_NFE_VALOR_TOTAL_NOTA, '
      '  GERAR_ESTOQUE_CLIENTE = :NEW_GERAR_ESTOQUE_CLIENTE'
      
        'WHERE ANO = :OLD_ANO AND CODCONTROL = :OLD_CODCONTROL AND CODEMP' +
        ' = :OLD_CODEMP')
    DeleteSQL.Strings = (
      'DELETE FROM TBVENDAS'
      
        'WHERE ANO = :OLD_ANO AND CODCONTROL = :OLD_CODCONTROL AND CODEMP' +
        ' = :OLD_CODEMP')
    FetchRowSQL.Strings = (
      'Select'
      '    v.Ano'
      '  , v.Codcontrol'
      '  , v.Codemp'
      '  , v.Codcliente'
      '  , v.Codcli'
      '  , v.Dtvenda'
      '  , v.Status'
      '  , v.Totalvenda_bruta'
      '  , v.Desconto'
      '  , v.Desconto_cupom'
      '  , v.Totalvenda'
      '  , v.Dtfinalizacao_venda'
      '  , v.Obs'
      '  , v.Formapag'
      '  , v.Fatdias'
      '  , v.Serie'
      '  , v.Nfe'
      '  , v.Lote_nfe_ano'
      '  , v.Lote_nfe_numero'
      '  , v.Lote_nfe_Recibo'
      '  , v.Lote_nfe_codigo'
      '  , v.Nfe_enviada'
      '  , v.Nfe_denegada'
      '  , v.Nfe_denegada_motivo'
      '  , v.Dataemissao'
      '  , v.Horaemissao'
      '  , v.Cancel_datahora'
      '  , v.Cancel_motivo'
      '  , v.Cfop'
      '  , v.Verificador_nfe'
      '  , v.Xml_nfe_filename'
      '  , v.Xml_nfe'
      '  , v.Vendedor_cod'
      '  , v.Usuario'
      '  , v.Formapagto_cod'
      '  , v.Condicaopagto_cod'
      '  , v.Venda_prazo'
      '  , v.Prazo_01'
      '  , v.Prazo_02'
      '  , v.Prazo_03'
      '  , v.Prazo_04'
      '  , v.Prazo_05'
      '  , v.Prazo_06'
      '  , v.Prazo_07'
      '  , v.Prazo_08'
      '  , v.Prazo_09'
      '  , v.Prazo_10'
      '  , v.Prazo_11'
      '  , v.Prazo_12'
      '  , v.nfe_modalidade_frete'
      '  , v.nfe_transportadora'
      '  , v.nfe_placa_veiculo'
      '  , v.nfe_placa_uf'
      '  , v.nfe_placa_rntc'
      '  , v.nfe_valor_total_produto'
      '  , v.nfe_valor_desconto'
      '  , v.nfe_valor_total_nota'
      '  , v.gerar_estoque_cliente'
      '  , t.nomeforn as transp_nome'
      '  , t.cnpj     as transp_cnpj'
      '  , t.inscest  as transp_iest'
      
        '  , t.ender || coalesce('#39' - '#39' || t.cidade, '#39#39') as transp_enderec' +
        'o'
      '  , c.Nome'
      '  , c.Bloqueado'
      '  , c.Bloqueado_motivo'
      '  , Case when coalesce(v.totalcusto, 0) > 0'
      
        '      then ((v.totalvenda / coalesce(v.totalcusto, 0)) - 1) * 10' +
        '0'
      '      else 0.0'
      '    end Lucro_Calculado'
      'from TBVENDAS v'
      '  inner join TBCLIENTE c on (c.Codigo = v.Codcliente)'
      '  left join TBFORNECEDOR t on (t.codforn = v.nfe_transportadora)'
      
        'WHERE v.ANO = :ANO AND v.CODCONTROL = :CODCONTROL AND v.CODEMP =' +
        ' :CODEMP')
    Left = 256
    Top = 80
  end
end
