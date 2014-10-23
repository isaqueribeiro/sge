object DMCupom: TDMCupom
  OldCreateOrder = False
  Left = 544
  Top = 307
  Height = 414
  Width = 793
  object cdsVenda: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    ForcedRefresh = True
    OnCalcFields = cdsVendaCalcFields
    CachedUpdates = True
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
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
    ModifySQL.Strings = (
      '')
    UpdateObject = updVenda
    Left = 80
    Top = 80
    object cdsVendaANO: TSmallintField
      FieldName = 'ANO'
      Origin = 'TBVENDAS.ANO'
    end
    object cdsVendaCODCONTROL: TIntegerField
      DisplayLabel = 'No. Venda'
      FieldName = 'CODCONTROL'
      Origin = 'TBVENDAS.CODCONTROL'
    end
    object cdsVendaCODEMP: TIBStringField
      DisplayLabel = 'Empresa'
      FieldName = 'CODEMP'
      Origin = 'TBVENDAS.CODEMP'
      Size = 18
    end
    object cdsVendaCODCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CODCLIENTE'
      Origin = '"TBVENDAS"."CODCLIENTE"'
    end
    object cdsVendaCODCLI: TIBStringField
      DisplayLabel = 'Cliente'
      FieldName = 'CODCLI'
      Origin = 'TBVENDAS.CODCLI'
      Size = 18
    end
    object cdsVendaDTVENDA: TDateTimeField
      DisplayLabel = 'D. Venda'
      FieldName = 'DTVENDA'
      Origin = 'TBVENDAS.DTVENDA'
      DisplayFormat = 'dd/mm/yyyy hh:mm'
    end
    object cdsVendaSTATUS: TSmallintField
      Alignment = taLeftJustify
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Origin = 'TBVENDAS.STATUS'
    end
    object cdsVendaTOTALVENDA_BRUTA: TIBBCDField
      DisplayLabel = 'Total Bruto (R$)'
      FieldName = 'TOTALVENDA_BRUTA'
      Origin = '"TBVENDAS"."TOTALVENDA_BRUTA"'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsVendaDESCONTO: TIBBCDField
      DisplayLabel = 'Desconto (R$)'
      FieldName = 'DESCONTO'
      Origin = '"TBVENDAS"."DESCONTO"'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 4
    end
    object cdsVendaDESCONTO_CUPOM: TIBBCDField
      FieldName = 'DESCONTO_CUPOM'
      Origin = '"TBVENDAS"."DESCONTO_CUPOM"'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object cdsVendaTOTALVENDA: TIBBCDField
      DisplayLabel = 'Valor Total (R$)'
      FieldName = 'TOTALVENDA'
      Origin = 'TBVENDAS.TOTALVENDA'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsVendaDTFINALIZACAO_VENDA: TDateField
      FieldName = 'DTFINALIZACAO_VENDA'
      Origin = 'TBVENDAS.DTFINALIZACAO_VENDA'
    end
    object cdsVendaOBS: TMemoField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBS'
      Origin = 'TBVENDAS.OBS'
      BlobType = ftMemo
      Size = 8
    end
    object cdsVendaFORMAPAG: TIBStringField
      DisplayLabel = 'Forma de Pagamento'
      FieldName = 'FORMAPAG'
      Origin = 'TBVENDAS.FORMAPAG'
      Size = 35
    end
    object cdsVendaFATDIAS: TSmallintField
      DisplayLabel = 'Fatura Dias'
      FieldName = 'FATDIAS'
      Origin = 'TBVENDAS.FATDIAS'
    end
    object cdsVendaSERIE: TIBStringField
      Alignment = taCenter
      DisplayLabel = 'S'#233'rie'
      FieldName = 'SERIE'
      Origin = 'TBVENDAS.SERIE'
      Size = 4
    end
    object cdsVendaNFE: TLargeintField
      DisplayLabel = 'NF-e'
      FieldName = 'NFE'
      Origin = 'TBVENDAS.NFE'
      DisplayFormat = '###0000000'
    end
    object cdsVendaLOTE_NFE_ANO: TSmallintField
      FieldName = 'LOTE_NFE_ANO'
      Origin = 'TBVENDAS.LOTE_NFE_ANO'
    end
    object cdsVendaLOTE_NFE_NUMERO: TIntegerField
      FieldName = 'LOTE_NFE_NUMERO'
      Origin = 'TBVENDAS.LOTE_NFE_NUMERO'
    end
    object cdsVendaLOTE_NFE_RECIBO: TIBStringField
      FieldName = 'LOTE_NFE_RECIBO'
      Origin = '"TBVENDAS"."LOTE_NFE_RECIBO"'
      ProviderFlags = []
      Size = 250
    end
    object cdsVendaNFE_ENVIADA: TSmallintField
      FieldName = 'NFE_ENVIADA'
      Origin = 'TBVENDAS.NFE_ENVIADA'
    end
    object cdsVendaNFE_DENEGADA: TSmallintField
      FieldName = 'NFE_DENEGADA'
      Origin = '"TBVENDAS"."NFE_DENEGADA"'
      ProviderFlags = [pfInUpdate]
    end
    object cdsVendaNFE_DENEGADA_MOTIVO: TIBStringField
      FieldName = 'NFE_DENEGADA_MOTIVO'
      Origin = '"TBVENDAS"."NFE_DENEGADA_MOTIVO"'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsVendaDATAEMISSAO: TDateField
      DisplayLabel = 'D. Emiss'#227'o'
      FieldName = 'DATAEMISSAO'
      Origin = 'TBVENDAS.DATAEMISSAO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsVendaHORAEMISSAO: TTimeField
      DisplayLabel = 'Hora Emiss'#227'o'
      FieldName = 'HORAEMISSAO'
      Origin = 'TBVENDAS.HORAEMISSAO'
      DisplayFormat = 'hh:mm'
    end
    object cdsVendaCFOP: TIntegerField
      FieldName = 'CFOP'
      Origin = 'TBVENDAS.CFOP'
    end
    object cdsVendaCANCEL_DATAHORA: TDateTimeField
      FieldName = 'CANCEL_DATAHORA'
      Origin = 'TBVENDAS.CANCEL_DATAHORA'
    end
    object cdsVendaCANCEL_MOTIVO: TMemoField
      FieldName = 'CANCEL_MOTIVO'
      Origin = 'TBVENDAS.CANCEL_MOTIVO'
      BlobType = ftMemo
      Size = 8
    end
    object cdsVendaVERIFICADOR_NFE: TIBStringField
      DisplayLabel = 'Verificador'
      FieldName = 'VERIFICADOR_NFE'
      Origin = 'TBVENDAS.VERIFICADOR_NFE'
      Size = 250
    end
    object cdsVendaXML_NFE_FILENAME: TIBStringField
      FieldName = 'XML_NFE_FILENAME'
      Origin = 'TBVENDAS.XML_NFE_FILENAME'
      Size = 250
    end
    object cdsVendaXML_NFE: TMemoField
      DisplayLabel = 'XML NF-e'
      FieldName = 'XML_NFE'
      Origin = 'TBVENDAS.XML_NFE'
      BlobType = ftMemo
      Size = 8
    end
    object cdsVendaVENDEDOR_COD: TIntegerField
      DisplayLabel = 'Vendedor'
      FieldName = 'VENDEDOR_COD'
      Origin = 'TBVENDAS.VENDEDOR_COD'
    end
    object cdsVendaUSUARIO: TIBStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'USUARIO'
      Origin = 'TBVENDAS.USUARIO'
      Size = 50
    end
    object cdsVendaFORMAPAGTO_COD: TSmallintField
      DisplayLabel = 'Forma de Pagamento'
      FieldName = 'FORMAPAGTO_COD'
      Origin = 'TBVENDAS.FORMAPAGTO_COD'
    end
    object cdsVendaCONDICAOPAGTO_COD: TSmallintField
      DisplayLabel = 'Condi'#231#227'o de Pagamento'
      FieldName = 'CONDICAOPAGTO_COD'
      Origin = 'TBVENDAS.CONDICAOPAGTO_COD'
    end
    object cdsVendaVENDA_PRAZO: TSmallintField
      DisplayLabel = 'A Prazo?'
      FieldName = 'VENDA_PRAZO'
      Origin = 'TBVENDAS.VENDA_PRAZO'
    end
    object cdsVendaPRAZO_01: TSmallintField
      DisplayLabel = 'Prazo 01'
      FieldName = 'PRAZO_01'
      Origin = 'TBVENDAS.PRAZO_01'
    end
    object cdsVendaPRAZO_02: TSmallintField
      DisplayLabel = 'Prazo 02'
      FieldName = 'PRAZO_02'
      Origin = 'TBVENDAS.PRAZO_02'
    end
    object cdsVendaPRAZO_03: TSmallintField
      DisplayLabel = 'Prazo 03'
      FieldName = 'PRAZO_03'
      Origin = 'TBVENDAS.PRAZO_03'
    end
    object cdsVendaPRAZO_04: TSmallintField
      DisplayLabel = 'Prazo 04'
      FieldName = 'PRAZO_04'
      Origin = 'TBVENDAS.PRAZO_04'
    end
    object cdsVendaPRAZO_05: TSmallintField
      DisplayLabel = 'Prazo 05'
      FieldName = 'PRAZO_05'
      Origin = 'TBVENDAS.PRAZO_05'
    end
    object cdsVendaPRAZO_06: TSmallintField
      DisplayLabel = 'Prazo 06'
      FieldName = 'PRAZO_06'
      Origin = 'TBVENDAS.PRAZO_06'
    end
    object cdsVendaPRAZO_07: TSmallintField
      DisplayLabel = 'Prazo 07'
      FieldName = 'PRAZO_07'
      Origin = 'TBVENDAS.PRAZO_07'
    end
    object cdsVendaPRAZO_08: TSmallintField
      DisplayLabel = 'Prazo 08'
      FieldName = 'PRAZO_08'
      Origin = 'TBVENDAS.PRAZO_08'
    end
    object cdsVendaPRAZO_09: TSmallintField
      DisplayLabel = 'Prazo 09'
      FieldName = 'PRAZO_09'
      Origin = 'TBVENDAS.PRAZO_09'
    end
    object cdsVendaPRAZO_10: TSmallintField
      DisplayLabel = 'Prazo 10'
      FieldName = 'PRAZO_10'
      Origin = 'TBVENDAS.PRAZO_10'
    end
    object cdsVendaPRAZO_11: TSmallintField
      DisplayLabel = 'Prazo 11'
      FieldName = 'PRAZO_11'
      Origin = 'TBVENDAS.PRAZO_11'
    end
    object cdsVendaPRAZO_12: TSmallintField
      DisplayLabel = 'Prazo 12'
      FieldName = 'PRAZO_12'
      Origin = 'TBVENDAS.PRAZO_12'
    end
    object cdsVendaNFE_MODALIDADE_FRETE: TSmallintField
      DisplayLabel = 'Modalidade do Frete'
      FieldName = 'NFE_MODALIDADE_FRETE'
      Origin = '"TBVENDAS"."NFE_MODALIDADE_FRETE"'
    end
    object cdsVendaNFE_TRANSPORTADORA: TIntegerField
      DisplayLabel = 'Transportadora'
      FieldName = 'NFE_TRANSPORTADORA'
      Origin = '"TBVENDAS"."NFE_TRANSPORTADORA"'
    end
    object cdsVendaNFE_PLACA_VEICULO: TIBStringField
      DisplayLabel = 'Placa do Ve'#237'culo'
      FieldName = 'NFE_PLACA_VEICULO'
      Origin = '"TBVENDAS"."NFE_PLACA_VEICULO"'
      Size = 10
    end
    object cdsVendaNFE_PLACA_UF: TIBStringField
      DisplayLabel = 'UF da Placa'
      FieldName = 'NFE_PLACA_UF'
      Origin = '"TBVENDAS"."NFE_PLACA_UF"'
      Size = 2
    end
    object cdsVendaNFE_PLACA_RNTC: TIBStringField
      DisplayLabel = 'RNTC (Registro Nacional de Transporte de Carga)'
      FieldName = 'NFE_PLACA_RNTC'
      Origin = '"TBVENDAS"."NFE_PLACA_RNTC"'
      Size = 10
    end
    object cdsVendaGERAR_ESTOQUE_CLIENTE: TSmallintField
      FieldName = 'GERAR_ESTOQUE_CLIENTE'
      Origin = '"TBVENDAS"."GERAR_ESTOQUE_CLIENTE"'
      ProviderFlags = [pfInUpdate]
    end
    object cdsVendaTRANSP_NOME: TIBStringField
      FieldName = 'TRANSP_NOME'
      Origin = '"TBFORNECEDOR"."NOMEFORN"'
      Size = 60
    end
    object cdsVendaTRANSP_CNPJ: TIBStringField
      FieldName = 'TRANSP_CNPJ'
      Origin = '"TBFORNECEDOR"."CNPJ"'
      Size = 18
    end
    object cdsVendaTRANSP_IEST: TIBStringField
      FieldName = 'TRANSP_IEST'
      Origin = '"TBFORNECEDOR"."INSCEST"'
    end
    object cdsVendaTRANSP_ENDERECO: TIBStringField
      FieldName = 'TRANSP_ENDERECO'
      ProviderFlags = []
      Size = 283
    end
    object cdsVendaNOME: TIBStringField
      DisplayLabel = 'Cliente'
      FieldName = 'NOME'
      Origin = 'TBCLIENTE.NOME'
      Size = 60
    end
    object cdsVendaBLOQUEADO: TSmallintField
      FieldName = 'BLOQUEADO'
      Origin = 'TBCLIENTE.BLOQUEADO'
    end
    object cdsVendaBLOQUEADO_MOTIVO: TMemoField
      FieldName = 'BLOQUEADO_MOTIVO'
      Origin = 'TBCLIENTE.BLOQUEADO_MOTIVO'
      BlobType = ftMemo
      Size = 8
    end
    object cdsVendaLUCRO_CALCULADO: TIBBCDField
      DisplayLabel = '% Lucro'
      FieldName = 'LUCRO_CALCULADO'
      ProviderFlags = []
      DisplayFormat = ',0.00##'
      Precision = 18
      Size = 4
    end
    object cdsVendaDESCONTO_TOTAL: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'DESCONTO_TOTAL'
      DisplayFormat = ',0.00'
      Calculated = True
    end
  end
  object updVenda: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  ANO,'
      '  CODCONTROL,'
      '  CODEMP,'
      '  CODCLIENTE,'
      '  CODCLI,'
      '  DTVENDA,'
      '  COMPETENCIA,'
      '  STATUS,'
      '  TOTALVENDA_BRUTA,'
      '  DESCONTO,'
      '  DESCONTO_CUPOM,'
      '  TOTALVENDA,'
      '  TOTALCUSTO,'
      '  DTFINALIZACAO_VENDA,'
      '  OBS,'
      '  FORMAPAG,'
      '  FATDIAS,'
      '  SERIE,'
      '  NFE,'
      '  DATAEMISSAO,'
      '  HORAEMISSAO,'
      '  CFOP,'
      '  VERIFICADOR_NFE,'
      '  XML_NFE,'
      '  VENDEDOR_COD,'
      '  USUARIO,'
      '  FORMAPAGTO_COD,'
      '  CONDICAOPAGTO_COD,'
      '  VENDA_PRAZO,'
      '  PRAZO_01,'
      '  PRAZO_02,'
      '  PRAZO_03,'
      '  PRAZO_04,'
      '  PRAZO_05,'
      '  PRAZO_06,'
      '  PRAZO_07,'
      '  PRAZO_08,'
      '  PRAZO_09,'
      '  PRAZO_10,'
      '  PRAZO_11,'
      '  PRAZO_12,'
      '  LOTE_NFE_ANO,'
      '  LOTE_NFE_NUMERO,'
      '  LOTE_NFE_RECIBO,'
      '  NFE_ENVIADA,'
      '  NFE_DENEGADA,'
      '  NFE_DENEGADA_MOTIVO,'
      '  CANCEL_USUARIO,'
      '  CANCEL_DATAHORA,'
      '  CANCEL_MOTIVO,'
      '  XML_NFE_FILENAME,'
      '  NFE_MODALIDADE_FRETE,'
      '  NFE_TRANSPORTADORA,'
      '  NFE_PLACA_VEICULO,'
      '  NFE_PLACA_UF,'
      '  NFE_PLACA_RNTC,'
      '  NFE_VALOR_BASE_ICMS,'
      '  NFE_VALOR_ICMS,'
      '  NFE_VALOR_BASE_ICMS_SUBST,'
      '  NFE_VALOR_ICMS_SUBST,'
      '  NFE_VALOR_TOTAL_PRODUTO,'
      '  NFE_VALOR_FRETE,'
      '  NFE_VALOR_SEGURO,'
      '  NFE_VALOR_DESCONTO,'
      '  NFE_VALOR_TOTAL_II,'
      '  NFE_VALOR_TOTAL_IPI,'
      '  NFE_VALOR_PIS,'
      '  NFE_VALOR_COFINS,'
      '  NFE_VALOR_OUTROS,'
      '  NFE_VALOR_TOTAL_NOTA,'
      '  CUSTO_OPER_PERCENTUAL,'
      '  CUSTO_OPER_FRETE,'
      '  CUSTO_OPER_OUTROS,'
      '  GERAR_ESTOQUE_CLIENTE'
      'from TBVENDAS '
      'where'
      '  ANO = :ANO and'
      '  CODCONTROL = :CODCONTROL')
    ModifySQL.Strings = (
      'update TBVENDAS'
      'set'
      '  ANO = :ANO,'
      '  CANCEL_DATAHORA = :CANCEL_DATAHORA,'
      '  CANCEL_MOTIVO = :CANCEL_MOTIVO,'
      '  CFOP = :CFOP,'
      '  CODCLI = :CODCLI,'
      '  CODCLIENTE = :CODCLIENTE,'
      '  CODCONTROL = :CODCONTROL,'
      '  CODEMP = :CODEMP,'
      '  CONDICAOPAGTO_COD = :CONDICAOPAGTO_COD,'
      '  DATAEMISSAO = :DATAEMISSAO,'
      '  DESCONTO = :DESCONTO,'
      '  DESCONTO_CUPOM = :DESCONTO_CUPOM,'
      '  DTFINALIZACAO_VENDA = :DTFINALIZACAO_VENDA,'
      '  DTVENDA = :DTVENDA,'
      '  FATDIAS = :FATDIAS,'
      '  FORMAPAG = :FORMAPAG,'
      '  FORMAPAGTO_COD = :FORMAPAGTO_COD,'
      '  GERAR_ESTOQUE_CLIENTE = :GERAR_ESTOQUE_CLIENTE,'
      '  HORAEMISSAO = :HORAEMISSAO,'
      '  LOTE_NFE_ANO = :LOTE_NFE_ANO,'
      '  LOTE_NFE_NUMERO = :LOTE_NFE_NUMERO,'
      '  LOTE_NFE_RECIBO = :LOTE_NFE_RECIBO,'
      '  NFE = :NFE,'
      '  NFE_DENEGADA = :NFE_DENEGADA,'
      '  NFE_DENEGADA_MOTIVO = :NFE_DENEGADA_MOTIVO,'
      '  NFE_ENVIADA = :NFE_ENVIADA,'
      '  NFE_MODALIDADE_FRETE = :NFE_MODALIDADE_FRETE,'
      '  NFE_PLACA_RNTC = :NFE_PLACA_RNTC,'
      '  NFE_PLACA_UF = :NFE_PLACA_UF,'
      '  NFE_PLACA_VEICULO = :NFE_PLACA_VEICULO,'
      '  NFE_TRANSPORTADORA = :NFE_TRANSPORTADORA,'
      '  OBS = :OBS,'
      '  PRAZO_01 = :PRAZO_01,'
      '  PRAZO_02 = :PRAZO_02,'
      '  PRAZO_03 = :PRAZO_03,'
      '  PRAZO_04 = :PRAZO_04,'
      '  PRAZO_05 = :PRAZO_05,'
      '  PRAZO_06 = :PRAZO_06,'
      '  PRAZO_07 = :PRAZO_07,'
      '  PRAZO_08 = :PRAZO_08,'
      '  PRAZO_09 = :PRAZO_09,'
      '  PRAZO_10 = :PRAZO_10,'
      '  PRAZO_11 = :PRAZO_11,'
      '  PRAZO_12 = :PRAZO_12,'
      '  SERIE = :SERIE,'
      '  STATUS = :STATUS,'
      '  TOTALVENDA = :TOTALVENDA,'
      '  TOTALVENDA_BRUTA = :TOTALVENDA_BRUTA,'
      '  USUARIO = :USUARIO,'
      '  VENDA_PRAZO = :VENDA_PRAZO,'
      '  VENDEDOR_COD = :VENDEDOR_COD,'
      '  VERIFICADOR_NFE = :VERIFICADOR_NFE,'
      '  XML_NFE = :XML_NFE,'
      '  XML_NFE_FILENAME = :XML_NFE_FILENAME'
      'where'
      '  ANO = :OLD_ANO and'
      '  CODCONTROL = :OLD_CODCONTROL')
    InsertSQL.Strings = (
      'insert into TBVENDAS'
      
        '  (ANO, CANCEL_DATAHORA, CANCEL_MOTIVO, CFOP, CODCLI, CODCLIENTE' +
        ', CODCONTROL, '
      
        '   CODEMP, CONDICAOPAGTO_COD, DATAEMISSAO, DESCONTO, DESCONTO_CU' +
        'POM, DTFINALIZACAO_VENDA, '
      
        '   DTVENDA, FATDIAS, FORMAPAG, FORMAPAGTO_COD, GERAR_ESTOQUE_CLI' +
        'ENTE, HORAEMISSAO, '
      
        '   LOTE_NFE_ANO, LOTE_NFE_NUMERO, LOTE_NFE_RECIBO, NFE, NFE_DENE' +
        'GADA, NFE_DENEGADA_MOTIVO, '
      
        '   NFE_ENVIADA, NFE_MODALIDADE_FRETE, NFE_PLACA_RNTC, NFE_PLACA_' +
        'UF, NFE_PLACA_VEICULO, '
      
        '   NFE_TRANSPORTADORA, OBS, PRAZO_01, PRAZO_02, PRAZO_03, PRAZO_' +
        '04, PRAZO_05, '
      
        '   PRAZO_06, PRAZO_07, PRAZO_08, PRAZO_09, PRAZO_10, PRAZO_11, P' +
        'RAZO_12, '
      
        '   SERIE, STATUS, TOTALVENDA, TOTALVENDA_BRUTA, USUARIO, VENDA_P' +
        'RAZO, VENDEDOR_COD, '
      '   VERIFICADOR_NFE, XML_NFE, XML_NFE_FILENAME)'
      'values'
      
        '  (:ANO, :CANCEL_DATAHORA, :CANCEL_MOTIVO, :CFOP, :CODCLI, :CODC' +
        'LIENTE, '
      
        '   :CODCONTROL, :CODEMP, :CONDICAOPAGTO_COD, :DATAEMISSAO, :DESC' +
        'ONTO, :DESCONTO_CUPOM, '
      
        '   :DTFINALIZACAO_VENDA, :DTVENDA, :FATDIAS, :FORMAPAG, :FORMAPA' +
        'GTO_COD, '
      
        '   :GERAR_ESTOQUE_CLIENTE, :HORAEMISSAO, :LOTE_NFE_ANO, :LOTE_NF' +
        'E_NUMERO, '
      
        '   :LOTE_NFE_RECIBO, :NFE, :NFE_DENEGADA, :NFE_DENEGADA_MOTIVO, ' +
        ':NFE_ENVIADA, '
      
        '   :NFE_MODALIDADE_FRETE, :NFE_PLACA_RNTC, :NFE_PLACA_UF, :NFE_P' +
        'LACA_VEICULO, '
      
        '   :NFE_TRANSPORTADORA, :OBS, :PRAZO_01, :PRAZO_02, :PRAZO_03, :' +
        'PRAZO_04, '
      
        '   :PRAZO_05, :PRAZO_06, :PRAZO_07, :PRAZO_08, :PRAZO_09, :PRAZO' +
        '_10, :PRAZO_11, '
      
        '   :PRAZO_12, :SERIE, :STATUS, :TOTALVENDA, :TOTALVENDA_BRUTA, :' +
        'USUARIO, '
      
        '   :VENDA_PRAZO, :VENDEDOR_COD, :VERIFICADOR_NFE, :XML_NFE, :XML' +
        '_NFE_FILENAME)')
    DeleteSQL.Strings = (
      'delete from TBVENDAS'
      'where'
      '  ANO = :OLD_ANO and'
      '  CODCONTROL = :OLD_CODCONTROL')
    Left = 112
    Top = 80
  end
  object cdsVendaItem: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    CachedUpdates = True
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'Select'
      '    i.Ano'
      '  , i.Codcontrol'
      '  , i.Seq'
      '  , i.Codprod'
      '  , i.Codemp'
      '  , i.Codcli'
      '  , i.Codcliente'
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
      '  , p.Cst'
      '  , p.Csosn'
      '  , p.Movimenta_Estoque'
      'from TVENDASITENS i'
      '  inner join TBPRODUTO p on (p.Cod = i.Codprod)'
      '  left join TBUNIDADEPROD u on (u.Unp_cod = p.Codunidade)'
      '  left join TBCFOP o on (o.Cfop_cod = i.Cfop_cod)'
      ''
      'where i.codemp     = :empresa'
      '  and i.ano        = :ano'
      '  and i.codcontrol = :controle')
    ModifySQL.Strings = (
      '')
    UpdateObject = updVendaItem
    Left = 80
    Top = 128
    object cdsVendaItemANO: TSmallintField
      FieldName = 'ANO'
      Origin = 'TVENDASITENS.ANO'
    end
    object cdsVendaItemCODCONTROL: TIntegerField
      FieldName = 'CODCONTROL'
      Origin = 'TVENDASITENS.CODCONTROL'
    end
    object cdsVendaItemSEQ: TSmallintField
      Alignment = taCenter
      DisplayLabel = '#'
      FieldName = 'SEQ'
      Origin = 'TVENDASITENS.SEQ'
      DisplayFormat = '00'
    end
    object cdsVendaItemCODPROD: TIBStringField
      DisplayLabel = 'Produto'
      FieldName = 'CODPROD'
      Origin = 'TVENDASITENS.CODPROD'
      Size = 10
    end
    object cdsVendaItemCODEMP: TIBStringField
      FieldName = 'CODEMP'
      Origin = 'TVENDASITENS.CODEMP'
      Size = 18
    end
    object cdsVendaItemCODCLI: TIBStringField
      FieldName = 'CODCLI'
      Origin = 'TVENDASITENS.CODCLI'
      ProviderFlags = [pfInUpdate]
      Size = 18
    end
    object cdsVendaItemCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
      Origin = '"TVENDASITENS"."CODCLIENTE"'
      ProviderFlags = [pfInUpdate]
    end
    object cdsVendaItemDTVENDA: TDateTimeField
      FieldName = 'DTVENDA'
      Origin = 'TVENDASITENS.DTVENDA'
    end
    object cdsVendaItemQTDE: TIBBCDField
      DisplayLabel = 'Quantidade'
      FieldName = 'QTDE'
      Origin = '"TVENDASITENS"."QTDE"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.###'
      Precision = 18
      Size = 3
    end
    object cdsVendaItemPUNIT: TIBBCDField
      DisplayLabel = 'Valor Unit'#225'rio'
      FieldName = 'PUNIT'
      Origin = 'TVENDASITENS.PUNIT'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsVendaItemPUNIT_PROMOCAO: TIBBCDField
      FieldName = 'PUNIT_PROMOCAO'
      Origin = 'TVENDASITENS.PUNIT_PROMOCAO'
      Precision = 18
      Size = 2
    end
    object cdsVendaItemDESCONTO: TIBBCDField
      DisplayLabel = '% Desconto'
      FieldName = 'DESCONTO'
      Origin = '"TVENDASITENS"."DESCONTO"'
      DisplayFormat = ',0.00#'
      Precision = 18
      Size = 3
    end
    object cdsVendaItemDESCONTO_VALOR: TIBBCDField
      DisplayLabel = 'Valor Desconto (R$)'
      FieldName = 'DESCONTO_VALOR'
      Origin = '"TVENDASITENS"."DESCONTO_VALOR"'
      DisplayFormat = ',0.00##'
      Precision = 18
      Size = 4
    end
    object cdsVendaItemPFINAL: TIBBCDField
      DisplayLabel = 'Valor L'#237'quido'
      FieldName = 'PFINAL'
      Origin = '"TVENDASITENS"."PFINAL"'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsVendaItemQTDEFINAL: TIBBCDField
      FieldName = 'QTDEFINAL'
      Origin = '"TVENDASITENS"."QTDEFINAL"'
      DisplayFormat = ',0.###'
      Precision = 18
      Size = 3
    end
    object cdsVendaItemUNID_COD: TSmallintField
      FieldName = 'UNID_COD'
      Origin = 'TVENDASITENS.UNID_COD'
    end
    object cdsVendaItemCFOP_COD: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'CFOP'
      FieldName = 'CFOP_COD'
      Origin = 'TVENDASITENS.CFOP_COD'
    end
    object cdsVendaItemCST: TIBStringField
      Alignment = taCenter
      FieldName = 'CST'
      Origin = 'TVENDASITENS.CST'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object cdsVendaItemALIQUOTA: TIBBCDField
      FieldName = 'ALIQUOTA'
      Origin = 'TVENDASITENS.ALIQUOTA'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsVendaItemALIQUOTA_CSOSN: TIBBCDField
      FieldName = 'ALIQUOTA_CSOSN'
      Origin = 'TVENDASITENS.ALIQUOTA_CSOSN'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsVendaItemALIQUOTA_PIS: TIBBCDField
      FieldName = 'ALIQUOTA_PIS'
      Origin = 'TVENDASITENS.ALIQUOTA_PIS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsVendaItemALIQUOTA_COFINS: TIBBCDField
      FieldName = 'ALIQUOTA_COFINS'
      Origin = 'TVENDASITENS.ALIQUOTA_COFINS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsVendaItemVALOR_IPI: TIBBCDField
      FieldName = 'VALOR_IPI'
      Origin = 'TVENDASITENS.VALOR_IPI'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsVendaItemPERCENTUAL_REDUCAO_BC: TIBBCDField
      FieldName = 'PERCENTUAL_REDUCAO_BC'
      Origin = 'TVENDASITENS.PERCENTUAL_REDUCAO_BC'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsVendaItemTOTAL_BRUTO: TIBBCDField
      DisplayLabel = 'Total Bruto'
      FieldName = 'TOTAL_BRUTO'
      Origin = '"TVENDASITENS"."TOTAL_BRUTO"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsVendaItemTOTAL_DESCONTO: TIBBCDField
      DisplayLabel = 'Total Desc.'
      FieldName = 'TOTAL_DESCONTO'
      Origin = '"TVENDASITENS"."TOTAL_DESCONTO"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsVendaItemTOTAL_LIQUIDO: TIBBCDField
      DisplayLabel = 'Total L'#237'quido'
      FieldName = 'TOTAL_LIQUIDO'
      Origin = '"TVENDASITENS"."TOTAL_LIQUIDO"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsVendaItemDESCRI: TIBStringField
      DisplayLabel = 'Nome do produto'
      FieldName = 'DESCRI'
      Origin = 'TBPRODUTO.DESCRI'
      Size = 50
    end
    object cdsVendaItemUNP_SIGLA: TIBStringField
      DisplayLabel = 'Und.'
      FieldName = 'UNP_SIGLA'
      Origin = 'TBUNIDADEPROD.UNP_SIGLA'
      Size = 5
    end
    object cdsVendaItemCFOP_DESCRICAO: TIBStringField
      FieldName = 'CFOP_DESCRICAO'
      Origin = 'TBCFOP.CFOP_DESCRICAO'
      Size = 250
    end
    object cdsVendaItemCSOSN: TIBStringField
      Alignment = taCenter
      FieldName = 'CSOSN'
      Origin = 'TBPRODUTO.CSOSN'
      Size = 3
    end
    object cdsVendaItemESTOQUE: TIBBCDField
      FieldName = 'ESTOQUE'
      Origin = '"TBPRODUTO"."QTDE"'
      ProviderFlags = []
      Precision = 18
      Size = 3
    end
    object cdsVendaItemRESERVA: TIBBCDField
      FieldName = 'RESERVA'
      Origin = '"TBPRODUTO"."RESERVA"'
      ProviderFlags = []
      Precision = 18
      Size = 3
    end
    object cdsVendaItemMOVIMENTA_ESTOQUE: TSmallintField
      FieldName = 'MOVIMENTA_ESTOQUE'
      Origin = '"TBPRODUTO"."MOVIMENTA_ESTOQUE"'
      ProviderFlags = []
    end
  end
  object updVendaItem: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  ANO,'
      '  CODCONTROL,'
      '  SEQ,'
      '  CODPROD,'
      '  CODEMP,'
      '  CODCLIENTE,'
      '  CODCLI,'
      '  DTVENDA,'
      '  QTDE,'
      '  PUNIT,'
      '  PUNIT_PROMOCAO,'
      '  DESCONTO,'
      '  DESCONTO_VALOR,'
      '  PFINAL,'
      '  QTDEFINAL,'
      '  UNID_COD,'
      '  CFOP_COD,'
      '  CST,'
      '  CSOSN,'
      '  ALIQUOTA,'
      '  ALIQUOTA_CSOSN,'
      '  ALIQUOTA_PIS,'
      '  ALIQUOTA_COFINS,'
      '  VALOR_IPI,'
      '  PERCENTUAL_REDUCAO_BC,'
      '  TOTAL_BRUTO,'
      '  TOTAL_DESCONTO,'
      '  TOTAL_LIQUIDO'
      'from TVENDASITENS '
      'where'
      '  ANO = :ANO and'
      '  CODCONTROL = :CODCONTROL and'
      '  CODPROD = :CODPROD and'
      '  SEQ = :SEQ')
    ModifySQL.Strings = (
      'update TVENDASITENS'
      'set'
      '  ALIQUOTA = :ALIQUOTA,'
      '  ALIQUOTA_COFINS = :ALIQUOTA_COFINS,'
      '  ALIQUOTA_CSOSN = :ALIQUOTA_CSOSN,'
      '  ALIQUOTA_PIS = :ALIQUOTA_PIS,'
      '  ANO = :ANO,'
      '  CFOP_COD = :CFOP_COD,'
      '  CODCLI = :CODCLI,'
      '  CODCLIENTE = :CODCLIENTE,'
      '  CODCONTROL = :CODCONTROL,'
      '  CODEMP = :CODEMP,'
      '  CODPROD = :CODPROD,'
      '  CST = :CST,'
      '  DESCONTO = :DESCONTO,'
      '  DESCONTO_VALOR = :DESCONTO_VALOR,'
      '  DTVENDA = :DTVENDA,'
      '  PERCENTUAL_REDUCAO_BC = :PERCENTUAL_REDUCAO_BC,'
      '  PFINAL = :PFINAL,'
      '  PUNIT = :PUNIT,'
      '  PUNIT_PROMOCAO = :PUNIT_PROMOCAO,'
      '  QTDE = :QTDE,'
      '  QTDEFINAL = :QTDEFINAL,'
      '  SEQ = :SEQ,'
      '  TOTAL_BRUTO = :TOTAL_BRUTO,'
      '  TOTAL_DESCONTO = :TOTAL_DESCONTO,'
      '  TOTAL_LIQUIDO = :TOTAL_LIQUIDO,'
      '  UNID_COD = :UNID_COD,'
      '  VALOR_IPI = :VALOR_IPI'
      'where'
      '  ANO = :OLD_ANO and'
      '  CODCONTROL = :OLD_CODCONTROL and'
      '  CODPROD = :OLD_CODPROD and'
      '  SEQ = :OLD_SEQ')
    InsertSQL.Strings = (
      'insert into TVENDASITENS'
      
        '  (ALIQUOTA, ALIQUOTA_COFINS, ALIQUOTA_CSOSN, ALIQUOTA_PIS, ANO,' +
        ' CFOP_COD, '
      
        '   CODCLI, CODCLIENTE, CODCONTROL, CODEMP, CODPROD, CST, DESCONT' +
        'O, DESCONTO_VALOR, '
      
        '   DTVENDA, PERCENTUAL_REDUCAO_BC, PFINAL, PUNIT, PUNIT_PROMOCAO' +
        ', QTDE, '
      
        '   QTDEFINAL, SEQ, TOTAL_BRUTO, TOTAL_DESCONTO, TOTAL_LIQUIDO, U' +
        'NID_COD, '
      '   VALOR_IPI)'
      'values'
      
        '  (:ALIQUOTA, :ALIQUOTA_COFINS, :ALIQUOTA_CSOSN, :ALIQUOTA_PIS, ' +
        ':ANO, :CFOP_COD, '
      
        '   :CODCLI, :CODCLIENTE, :CODCONTROL, :CODEMP, :CODPROD, :CST, :' +
        'DESCONTO, '
      
        '   :DESCONTO_VALOR, :DTVENDA, :PERCENTUAL_REDUCAO_BC, :PFINAL, :' +
        'PUNIT, '
      
        '   :PUNIT_PROMOCAO, :QTDE, :QTDEFINAL, :SEQ, :TOTAL_BRUTO, :TOTA' +
        'L_DESCONTO, '
      '   :TOTAL_LIQUIDO, :UNID_COD, :VALOR_IPI)')
    DeleteSQL.Strings = (
      'delete from TVENDASITENS'
      'where'
      '  ANO = :OLD_ANO and'
      '  CODCONTROL = :OLD_CODCONTROL and'
      '  CODPROD = :OLD_CODPROD and'
      '  SEQ = :OLD_SEQ')
    Left = 112
    Top = 128
  end
  object cdsVendaFormaPagto: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    CachedUpdates = True
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'Select'
      '    f.ano_venda'
      '  , f.controle_venda'
      '  , f.formapagto_cod'
      '  , f.condicaopagto_cod'
      '  , f.venda_prazo'
      '  , f.valor_fpagto'
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
      'from TBVENDAS_FORMAPAGTO f'
      ''
      'where f.ano_venda = :ano'
      '  and f.controle_venda = :controle')
    ModifySQL.Strings = (
      '')
    UpdateObject = updVendaFormaPagto
    Left = 80
    Top = 176
    object cdsVendaFormaPagtoANO_VENDA: TSmallintField
      FieldName = 'ANO_VENDA'
      Origin = '"TBVENDAS_FORMAPAGTO"."ANO_VENDA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsVendaFormaPagtoCONTROLE_VENDA: TIntegerField
      FieldName = 'CONTROLE_VENDA'
      Origin = '"TBVENDAS_FORMAPAGTO"."CONTROLE_VENDA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsVendaFormaPagtoFORMAPAGTO_COD: TSmallintField
      DisplayLabel = 'Forma de Pagamento'
      FieldName = 'FORMAPAGTO_COD'
      Origin = '"TBVENDAS_FORMAPAGTO"."FORMAPAGTO_COD"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsVendaFormaPagtoCONDICAOPAGTO_COD: TSmallintField
      DisplayLabel = 'Condi'#231#227'o de Pagamento'
      FieldName = 'CONDICAOPAGTO_COD'
      Origin = '"TBVENDAS_FORMAPAGTO"."CONDICAOPAGTO_COD"'
    end
    object cdsVendaFormaPagtoVENDA_PRAZO: TSmallintField
      FieldName = 'VENDA_PRAZO'
      Origin = '"TBVENDAS_FORMAPAGTO"."VENDA_PRAZO"'
    end
    object cdsVendaFormaPagtoVALOR_FPAGTO: TIBBCDField
      DisplayLabel = 'Valor (R$)'
      FieldName = 'VALOR_FPAGTO'
      Origin = '"TBVENDAS_FORMAPAGTO"."VALOR_FPAGTO"'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsVendaFormaPagtoPRAZO_01: TSmallintField
      FieldName = 'PRAZO_01'
      Origin = '"TBVENDAS_FORMAPAGTO"."PRAZO_01"'
    end
    object cdsVendaFormaPagtoPRAZO_02: TSmallintField
      FieldName = 'PRAZO_02'
      Origin = '"TBVENDAS_FORMAPAGTO"."PRAZO_02"'
    end
    object cdsVendaFormaPagtoPRAZO_03: TSmallintField
      FieldName = 'PRAZO_03'
      Origin = '"TBVENDAS_FORMAPAGTO"."PRAZO_03"'
    end
    object cdsVendaFormaPagtoPRAZO_04: TSmallintField
      FieldName = 'PRAZO_04'
      Origin = '"TBVENDAS_FORMAPAGTO"."PRAZO_04"'
    end
    object cdsVendaFormaPagtoPRAZO_05: TSmallintField
      FieldName = 'PRAZO_05'
      Origin = '"TBVENDAS_FORMAPAGTO"."PRAZO_05"'
    end
    object cdsVendaFormaPagtoPRAZO_06: TSmallintField
      FieldName = 'PRAZO_06'
      Origin = '"TBVENDAS_FORMAPAGTO"."PRAZO_06"'
    end
    object cdsVendaFormaPagtoPRAZO_07: TSmallintField
      FieldName = 'PRAZO_07'
      Origin = '"TBVENDAS_FORMAPAGTO"."PRAZO_07"'
    end
    object cdsVendaFormaPagtoPRAZO_08: TSmallintField
      FieldName = 'PRAZO_08'
      Origin = '"TBVENDAS_FORMAPAGTO"."PRAZO_08"'
    end
    object cdsVendaFormaPagtoPRAZO_09: TSmallintField
      FieldName = 'PRAZO_09'
      Origin = '"TBVENDAS_FORMAPAGTO"."PRAZO_09"'
    end
    object cdsVendaFormaPagtoPRAZO_10: TSmallintField
      FieldName = 'PRAZO_10'
      Origin = '"TBVENDAS_FORMAPAGTO"."PRAZO_10"'
    end
    object cdsVendaFormaPagtoPRAZO_11: TSmallintField
      FieldName = 'PRAZO_11'
      Origin = '"TBVENDAS_FORMAPAGTO"."PRAZO_11"'
    end
    object cdsVendaFormaPagtoPRAZO_12: TSmallintField
      FieldName = 'PRAZO_12'
      Origin = '"TBVENDAS_FORMAPAGTO"."PRAZO_12"'
    end
  end
  object updVendaFormaPagto: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  ANO_VENDA,'
      '  CONTROLE_VENDA,'
      '  FORMAPAGTO_COD,'
      '  CONDICAOPAGTO_COD,'
      '  VENDA_PRAZO,'
      '  VALOR_FPAGTO,'
      '  PRAZO_01,'
      '  PRAZO_02,'
      '  PRAZO_03,'
      '  PRAZO_04,'
      '  PRAZO_05,'
      '  PRAZO_06,'
      '  PRAZO_07,'
      '  PRAZO_08,'
      '  PRAZO_09,'
      '  PRAZO_10,'
      '  PRAZO_11,'
      '  PRAZO_12'
      'from TBVENDAS_FORMAPAGTO '
      'where'
      '  ANO_VENDA = :ANO_VENDA and'
      '  CONTROLE_VENDA = :CONTROLE_VENDA and'
      '  FORMAPAGTO_COD = :FORMAPAGTO_COD')
    ModifySQL.Strings = (
      'update TBVENDAS_FORMAPAGTO'
      'set'
      '  ANO_VENDA = :ANO_VENDA,'
      '  CONDICAOPAGTO_COD = :CONDICAOPAGTO_COD,'
      '  CONTROLE_VENDA = :CONTROLE_VENDA,'
      '  FORMAPAGTO_COD = :FORMAPAGTO_COD,'
      '  PRAZO_01 = :PRAZO_01,'
      '  PRAZO_02 = :PRAZO_02,'
      '  PRAZO_03 = :PRAZO_03,'
      '  PRAZO_04 = :PRAZO_04,'
      '  PRAZO_05 = :PRAZO_05,'
      '  PRAZO_06 = :PRAZO_06,'
      '  PRAZO_07 = :PRAZO_07,'
      '  PRAZO_08 = :PRAZO_08,'
      '  PRAZO_09 = :PRAZO_09,'
      '  PRAZO_10 = :PRAZO_10,'
      '  PRAZO_11 = :PRAZO_11,'
      '  PRAZO_12 = :PRAZO_12,'
      '  VALOR_FPAGTO = :VALOR_FPAGTO,'
      '  VENDA_PRAZO = :VENDA_PRAZO'
      'where'
      '  ANO_VENDA = :OLD_ANO_VENDA and'
      '  CONTROLE_VENDA = :OLD_CONTROLE_VENDA and'
      '  FORMAPAGTO_COD = :OLD_FORMAPAGTO_COD')
    InsertSQL.Strings = (
      'insert into TBVENDAS_FORMAPAGTO'
      
        '  (ANO_VENDA, CONDICAOPAGTO_COD, CONTROLE_VENDA, FORMAPAGTO_COD,' +
        ' PRAZO_01, '
      
        '   PRAZO_02, PRAZO_03, PRAZO_04, PRAZO_05, PRAZO_06, PRAZO_07, P' +
        'RAZO_08, '
      
        '   PRAZO_09, PRAZO_10, PRAZO_11, PRAZO_12, VALOR_FPAGTO, VENDA_P' +
        'RAZO)'
      'values'
      
        '  (:ANO_VENDA, :CONDICAOPAGTO_COD, :CONTROLE_VENDA, :FORMAPAGTO_' +
        'COD, :PRAZO_01, '
      
        '   :PRAZO_02, :PRAZO_03, :PRAZO_04, :PRAZO_05, :PRAZO_06, :PRAZO' +
        '_07, :PRAZO_08, '
      
        '   :PRAZO_09, :PRAZO_10, :PRAZO_11, :PRAZO_12, :VALOR_FPAGTO, :V' +
        'ENDA_PRAZO)')
    DeleteSQL.Strings = (
      'delete from TBVENDAS_FORMAPAGTO'
      'where'
      '  ANO_VENDA = :OLD_ANO_VENDA and'
      '  CONTROLE_VENDA = :OLD_CONTROLE_VENDA and'
      '  FORMAPAGTO_COD = :OLD_FORMAPAGTO_COD')
    Left = 112
    Top = 176
  end
  object cdsVendaVolume: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    CachedUpdates = True
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
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
    ModifySQL.Strings = (
      '')
    UpdateObject = updVendaVolume
    Left = 80
    Top = 224
    object cdsVendaVolumeANO_VENDA: TSmallintField
      FieldName = 'ANO_VENDA'
      Origin = '"TBVENDAS_VOLUME"."ANO_VENDA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsVendaVolumeCONTROLE_VENDA: TIntegerField
      FieldName = 'CONTROLE_VENDA'
      Origin = '"TBVENDAS_VOLUME"."CONTROLE_VENDA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsVendaVolumeSEQUENCIAL: TSmallintField
      FieldName = 'SEQUENCIAL'
      Origin = '"TBVENDAS_VOLUME"."SEQUENCIAL"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsVendaVolumeNUMERO: TIBStringField
      DisplayLabel = 'N'#250'mero do Volume'
      FieldName = 'NUMERO'
      Origin = '"TBVENDAS_VOLUME"."NUMERO"'
      Size = 50
    end
    object cdsVendaVolumeQUANTIDADE: TSmallintField
      DisplayLabel = 'Quantidade de Volumes'
      FieldName = 'QUANTIDADE'
      Origin = '"TBVENDAS_VOLUME"."QUANTIDADE"'
    end
    object cdsVendaVolumeESPECIE: TIBStringField
      DisplayLabel = 'Esp'#233'cie'
      FieldName = 'ESPECIE'
      Origin = '"TBVENDAS_VOLUME"."ESPECIE"'
      Size = 50
    end
    object cdsVendaVolumeMARCA: TIBStringField
      DisplayLabel = 'Marca'
      FieldName = 'MARCA'
      Origin = '"TBVENDAS_VOLUME"."MARCA"'
      Size = 50
    end
    object cdsVendaVolumePESO_BRUTO: TIBBCDField
      DisplayLabel = 'Peso Bruto'
      FieldName = 'PESO_BRUTO'
      Origin = '"TBVENDAS_VOLUME"."PESO_BRUTO"'
      DisplayFormat = ',0.##'
      Precision = 18
      Size = 3
    end
    object cdsVendaVolumePESO_LIQUIDO: TIBBCDField
      DisplayLabel = 'Peso L'#237'quido'
      FieldName = 'PESO_LIQUIDO'
      Origin = '"TBVENDAS_VOLUME"."PESO_LIQUIDO"'
      DisplayFormat = ',0.##'
      Precision = 18
      Size = 3
    end
  end
  object updVendaVolume: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  ANO_VENDA,'
      '  CONTROLE_VENDA,'
      '  SEQUENCIAL,'
      '  NUMERO,'
      '  QUANTIDADE,'
      '  ESPECIE,'
      '  MARCA,'
      '  PESO_BRUTO,'
      '  PESO_LIQUIDO'
      'from TBVENDAS_VOLUME '
      'where'
      '  ANO_VENDA = :ANO_VENDA and'
      '  CONTROLE_VENDA = :CONTROLE_VENDA and'
      '  SEQUENCIAL = :SEQUENCIAL')
    ModifySQL.Strings = (
      'update TBVENDAS_VOLUME'
      'set'
      '  ANO_VENDA = :ANO_VENDA,'
      '  CONTROLE_VENDA = :CONTROLE_VENDA,'
      '  ESPECIE = :ESPECIE,'
      '  MARCA = :MARCA,'
      '  NUMERO = :NUMERO,'
      '  PESO_BRUTO = :PESO_BRUTO,'
      '  PESO_LIQUIDO = :PESO_LIQUIDO,'
      '  QUANTIDADE = :QUANTIDADE,'
      '  SEQUENCIAL = :SEQUENCIAL'
      'where'
      '  ANO_VENDA = :OLD_ANO_VENDA and'
      '  CONTROLE_VENDA = :OLD_CONTROLE_VENDA and'
      '  SEQUENCIAL = :OLD_SEQUENCIAL')
    InsertSQL.Strings = (
      'insert into TBVENDAS_VOLUME'
      
        '  (ANO_VENDA, CONTROLE_VENDA, ESPECIE, MARCA, NUMERO, PESO_BRUTO' +
        ', PESO_LIQUIDO, '
      '   QUANTIDADE, SEQUENCIAL)'
      'values'
      
        '  (:ANO_VENDA, :CONTROLE_VENDA, :ESPECIE, :MARCA, :NUMERO, :PESO' +
        '_BRUTO, '
      '   :PESO_LIQUIDO, :QUANTIDADE, :SEQUENCIAL)')
    DeleteSQL.Strings = (
      'delete from TBVENDAS_VOLUME'
      'where'
      '  ANO_VENDA = :OLD_ANO_VENDA and'
      '  CONTROLE_VENDA = :OLD_CONTROLE_VENDA and'
      '  SEQUENCIAL = :OLD_SEQUENCIAL')
    Left = 112
    Top = 224
  end
  object qryCFOP: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'Select'
      '    c.Cfop_cod'
      '  , c.Cfop_descricao'
      '  , c.Cfop_cst_padrao_entrada'
      '  , c.Cfop_cst_padrao_saida'
      'from TBCFOP c'
      'where c.Cfop_cod = :Cfop_cod')
    ModifySQL.Strings = (
      '')
    Left = 384
    Top = 56
  end
  object qryProduto: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
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
    ModifySQL.Strings = (
      '')
    Left = 384
    Top = 104
  end
  object qryUltimoVenda: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'Select'
      '  max(v.codcontrol) as orcamento'
      'from TBVENDAS v'
      'where v.codemp  = :empresa'
      '  and v.usuario = :usuario'
      '  and v.ano     = :ano'
      '  and v.status  = :status')
    ModifySQL.Strings = (
      '')
    Left = 384
    Top = 152
  end
  object cdsVendaTitulo: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
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
    ModifySQL.Strings = (
      '')
    Left = 80
    Top = 272
  end
end
