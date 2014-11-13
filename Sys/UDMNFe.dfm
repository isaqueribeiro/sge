object DMNFe: TDMNFe
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 409
  Top = 217
  Height = 704
  Width = 931
  object ACBrNFe: TACBrNFe
    Configuracoes.Geral.PathSalvar = '..\Bin\'
    Configuracoes.Geral.ExibirErroSchema = True
    Configuracoes.Geral.FormatoAlerta = 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.'
    Configuracoes.Geral.VersaoDF = ve310
    Configuracoes.WebServices.UF = 'PA'
    Configuracoes.WebServices.AguardarConsultaRet = 0
    Configuracoes.WebServices.IntervaloTentativas = 0
    Configuracoes.WebServices.AjustaAguardaConsultaRet = False
    DANFE = rvDANFE
    Left = 24
    Top = 24
  end
  object rvDANFE: TACBrNFeDANFERave
    ACBrNFe = ACBrNFe
    Sistema = 'Masterdados - Contatos: (91) 8717-1057/8129-1567'
    PathPDF = '..\Bin\'
    MostrarPreview = True
    MostrarStatus = True
    TipoDANFE = tiRetrato
    NumCopias = 1
    ImprimirDescPorc = False
    ImprimirTotalLiquido = False
    MargemInferior = 0.800000000000000000
    MargemSuperior = 0.800000000000000000
    MargemEsquerda = 0.600000000000000000
    MargemDireita = 0.510000000000000000
    CasasDecimais._qCom = 2
    CasasDecimais._vUnCom = 2
    ExibirResumoCanhoto = False
    FormularioContinuo = False
    TamanhoFonte_DemaisCampos = 10
    ProdutosPorPagina = 0
    ImprimirDetalhamentoEspecifico = True
    NFeCancelada = False
    LocalImpCanhoto = 0
    ImprimeItens = True
    EspessuraBorda = 1
    TamanhoFonte_RazaoSocial = 12
    TamanhoFonte_ANTT = 10
    TributosPercentual = ptValorProdutos
    Left = 24
    Top = 72
  end
  object qryDestinatario: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    SQL.Strings = (
      'Select'
      '    c.Codigo'
      '  , c.Pessoa_fisica'
      '  , c.Cnpj'
      '  , c.Nome'
      '  , c.Inscest'
      '  , c.Inscmun'
      ''
      '  , c.Fone'
      '  , c.Email'
      '  , c.Site'
      ''
      '  , c.Tlg_tipo'
      '  , tl.Tlg_descricao'
      '  , tl.Tlg_sigla'
      '  , c.Log_cod'
      '  , lg.Log_nome'
      '  , c.Complemento'
      '  , c.Numero_end'
      '  , c.Cep'
      ''
      '  , c.Bai_cod'
      '  , br.Bai_nome'
      ''
      '  , c.Cid_cod'
      '  , cd.Cid_nome'
      '  , cd.Cid_siafi'
      '  , cd.Cid_ibge'
      '  , cd.Cid_ddd'
      ''
      '  , c.Est_cod'
      '  , uf.Est_nome'
      '  , uf.Est_sigla'
      '  , uf.Est_siafi'
      ''
      '  , c.Pais_id'
      '  , pa.Pais_nome'
      'from TBCLIENTE c'
      '  left join TBESTADO uf on (uf.Est_cod = c.Est_cod)'
      '  left join TBCIDADE cd on (cd.Cid_cod = c.Cid_cod)'
      '  left join TBBAIRRO br on (br.Bai_cod = c.Bai_cod)'
      '  left join TBLOGRADOURO lg on (lg.Log_cod = c.Log_cod)'
      '  left join TBTIPO_LoGRADOURO tl on (tl.Tlg_cod = c.Tlg_tipo)'
      '  left Join TBPAIS pa on (pa.Pais_id = c.Pais_id)'
      'where c.Codigo = :Codigo')
    Left = 144
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Codigo'
        ParamType = ptUnknown
      end>
    object qryDestinatarioCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'TBCLIENTE.CODIGO'
      Required = True
    end
    object qryDestinatarioPESSOA_FISICA: TSmallintField
      FieldName = 'PESSOA_FISICA'
      Origin = 'TBCLIENTE.PESSOA_FISICA'
      Required = True
    end
    object qryDestinatarioCNPJ: TIBStringField
      FieldName = 'CNPJ'
      Origin = 'TBCLIENTE.CNPJ'
      Required = True
      Size = 18
    end
    object qryDestinatarioNOME: TIBStringField
      FieldName = 'NOME'
      Origin = 'TBCLIENTE.NOME'
      Size = 60
    end
    object qryDestinatarioINSCEST: TIBStringField
      FieldName = 'INSCEST'
      Origin = 'TBCLIENTE.INSCEST'
    end
    object qryDestinatarioINSCMUN: TIBStringField
      FieldName = 'INSCMUN'
      Origin = 'TBCLIENTE.INSCMUN'
    end
    object qryDestinatarioFONE: TIBStringField
      FieldName = 'FONE'
      Origin = 'TBCLIENTE.FONE'
      Size = 11
    end
    object qryDestinatarioEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = 'TBCLIENTE.EMAIL'
      Size = 60
    end
    object qryDestinatarioSITE: TIBStringField
      FieldName = 'SITE'
      Origin = 'TBCLIENTE.SITE'
      Size = 40
    end
    object qryDestinatarioTLG_TIPO: TSmallintField
      FieldName = 'TLG_TIPO'
      Origin = 'TBCLIENTE.TLG_TIPO'
    end
    object qryDestinatarioTLG_DESCRICAO: TIBStringField
      FieldName = 'TLG_DESCRICAO'
      Origin = 'TBTIPO_LOGRADOURO.TLG_DESCRICAO'
      Size = 50
    end
    object qryDestinatarioTLG_SIGLA: TIBStringField
      FieldName = 'TLG_SIGLA'
      Origin = 'TBTIPO_LOGRADOURO.TLG_SIGLA'
      Size = 10
    end
    object qryDestinatarioLOG_COD: TIntegerField
      FieldName = 'LOG_COD'
      Origin = 'TBCLIENTE.LOG_COD'
    end
    object qryDestinatarioLOG_NOME: TIBStringField
      FieldName = 'LOG_NOME'
      Origin = 'TBLOGRADOURO.LOG_NOME'
      Size = 250
    end
    object qryDestinatarioCOMPLEMENTO: TIBStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'TBCLIENTE.COMPLEMENTO'
      Size = 50
    end
    object qryDestinatarioNUMERO_END: TIBStringField
      FieldName = 'NUMERO_END'
      Origin = 'TBCLIENTE.NUMERO_END'
      Size = 10
    end
    object qryDestinatarioCEP: TIBStringField
      FieldName = 'CEP'
      Origin = 'TBCLIENTE.CEP'
      Size = 8
    end
    object qryDestinatarioBAI_COD: TIntegerField
      FieldName = 'BAI_COD'
      Origin = 'TBCLIENTE.BAI_COD'
    end
    object qryDestinatarioBAI_NOME: TIBStringField
      FieldName = 'BAI_NOME'
      Origin = 'TBBAIRRO.BAI_NOME'
      Size = 100
    end
    object qryDestinatarioCID_COD: TIntegerField
      FieldName = 'CID_COD'
      Origin = 'TBCLIENTE.CID_COD'
    end
    object qryDestinatarioCID_NOME: TIBStringField
      FieldName = 'CID_NOME'
      Origin = 'TBCIDADE.CID_NOME'
      Size = 100
    end
    object qryDestinatarioCID_SIAFI: TIntegerField
      FieldName = 'CID_SIAFI'
      Origin = 'TBCIDADE.CID_SIAFI'
    end
    object qryDestinatarioCID_IBGE: TIntegerField
      FieldName = 'CID_IBGE'
      Origin = 'TBCIDADE.CID_IBGE'
    end
    object qryDestinatarioCID_DDD: TSmallintField
      FieldName = 'CID_DDD'
      Origin = 'TBCIDADE.CID_DDD'
    end
    object qryDestinatarioEST_COD: TSmallintField
      FieldName = 'EST_COD'
      Origin = 'TBCLIENTE.EST_COD'
    end
    object qryDestinatarioEST_NOME: TIBStringField
      FieldName = 'EST_NOME'
      Origin = 'TBESTADO.EST_NOME'
      Size = 100
    end
    object qryDestinatarioEST_SIGLA: TIBStringField
      FieldName = 'EST_SIGLA'
      Origin = 'TBESTADO.EST_SIGLA'
      Size = 2
    end
    object qryDestinatarioEST_SIAFI: TIntegerField
      FieldName = 'EST_SIAFI'
      Origin = 'TBESTADO.EST_SIAFI'
    end
    object qryDestinatarioPAIS_ID: TIBStringField
      FieldName = 'PAIS_ID'
      Origin = 'TBCLIENTE.PAIS_ID'
      Size = 5
    end
    object qryDestinatarioPAIS_NOME: TIBStringField
      FieldName = 'PAIS_NOME'
      Origin = 'TBPAIS.PAIS_NOME'
      Size = 150
    end
  end
  object qryDuplicatas: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    SQL.Strings = (
      'Select'
      '    r.Anolanc'
      '  , r.Numlanc'
      '  , r.Parcela'
      '  , r.Dtemiss'
      '  , r.Dtvenc'
      '  , r.Valorrec'
      '  , r.Valormulta'
      '  , r.Percentdesconto'
      'from TBCONTREC r'
      'where r.Anovenda = :AnoVenda'
      '  and r.Numvenda = :NumVenda')
    Left = 144
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'AnoVenda'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'NumVenda'
        ParamType = ptInput
        Value = 0
      end>
    object qryDuplicatasANOLANC: TSmallintField
      FieldName = 'ANOLANC'
      Origin = 'TBCONTREC.ANOLANC'
      Required = True
    end
    object qryDuplicatasNUMLANC: TIntegerField
      FieldName = 'NUMLANC'
      Origin = 'TBCONTREC.NUMLANC'
      Required = True
    end
    object qryDuplicatasPARCELA: TSmallintField
      FieldName = 'PARCELA'
      Origin = 'TBCONTREC.PARCELA'
    end
    object qryDuplicatasDTEMISS: TDateField
      FieldName = 'DTEMISS'
      Origin = 'TBCONTREC.DTEMISS'
    end
    object qryDuplicatasDTVENC: TDateField
      FieldName = 'DTVENC'
      Origin = 'TBCONTREC.DTVENC'
    end
    object qryDuplicatasVALORREC: TIBBCDField
      FieldName = 'VALORREC'
      Origin = 'TBCONTREC.VALORREC'
      Precision = 18
      Size = 2
    end
    object qryDuplicatasVALORMULTA: TIBBCDField
      FieldName = 'VALORMULTA'
      Origin = 'TBCONTREC.VALORMULTA'
      Precision = 18
      Size = 2
    end
    object qryDuplicatasPERCENTDESCONTO: TIBBCDField
      FieldName = 'PERCENTDESCONTO'
      Origin = 'TBCONTREC.PERCENTDESCONTO'
      Precision = 9
      Size = 2
    end
  end
  object qryDadosProduto: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    SQL.Strings = (
      'Select'
      '    i.Ano'
      '  , i.Codcontrol'
      '  , i.Seq'
      '  , i.Codprod'
      '  , p.Codbarra_ean'
      '  , p.Descri'
      '  , p.Apresentacao'
      
        '  , coalesce(p.Descri_apresentacao, p.Descri) as Descri_apresent' +
        'acao'
      '  , p.Modelo'
      '  , p.Referencia'
      
        '  , coalesce(nullif(trim(p.ncm_sh), '#39'00000000'#39'), '#39'10203000'#39') as ' +
        'Ncm_sh'
      '  , coalesce(ib.ncm_aliquota_nac, 0.0) as Ncm_aliquota_nac'
      '  , coalesce(ib.ncm_aliquota_imp, 0.0) as Ncm_aliquota_imp'
      '  , p.Codorigem'
      '  , p.Codtributacao'
      '  , p.Cst_pis'
      '  , p.Cst_cofins'
      '  , coalesce(ps.Indice_acbr, 32) as Cst_pis_indice_ACBr'
      '  , coalesce(cs.Indice_acbr, 32) as Cst_cofins_indice_ACBr'
      '  , i.Codemp'
      '  , i.Codcli'
      '  , i.Dtvenda'
      '  , i.Qtde'
      '  , i.Punit'
      '  , i.Punit_promocao'
      '  , i.Desconto'
      '  , i.Desconto_valor'
      '  , i.Pfinal'
      '  , i.Qtdefinal'
      '  , i.Unid_cod'
      '  , u.Unp_descricao'
      '  , u.Unp_sigla'
      '  , i.Cfop_cod'
      '  , coalesce(i.Cst, p.Cst) as Cst'
      '  , coalesce(i.Csosn, p.Csosn) as Csosn'
      '  , i.Aliquota'
      '  , i.Aliquota_csosn'
      '  , coalesce(i.Aliquota_pis, 0.0) as Aliquota_pis'
      '  , coalesce(i.Aliquota_cofins, 0.0) as Aliquota_cofins'
      '  , i.Valor_ipi'
      
        '  , coalesce(i.Percentual_reducao_bc, 0.0) as Percentual_reducao' +
        '_bc'
      
        '  , coalesce(i.Pfinal, 0) * coalesce(i.Percentual_reducao_bc, 0.' +
        '0) / 100 as valor_reducao_bc'
      '  , i.Total_bruto'
      '  , i.Total_desconto'
      '  , i.Total_liquido'
      '  , p.Qtde as Estoque'
      '  , p.Reserva'
      '  , p.Produto_novo'
      '  , p.Cor_veiculo'
      '  , cr.Descricao as Cor_veiculo_descricao'
      '  , p.Combustivel_veiculo'
      '  , cb.Descricao as Combustivel_veiculo_descricao'
      '  , p.Ano_fabricacao_veiculo'
      '  , p.Ano_modelo_veiculo'
      
        '  , p.Ano_fabricacao_veiculo || '#39'/'#39' || p.Ano_modelo_veiculo as a' +
        'no_fab_modelo_veiculo'
      '  , p.Tipo_veiculo'
      '  , tv.Descricao as Tipo_veiculo_descricao'
      '  , p.Renavam_veiculo'
      '  , p.Chassi_veiculo'
      '  , p.Kilometragem_veiculo'
      '  , coalesce(p.Qtde, 0) - coalesce(p.Reserva, 0) as Disponivel'
      'from TVENDASITENS i'
      '  inner join TBPRODUTO p on (p.Cod = i.Codprod)'
      '  inner join TBUNIDADEPROD u on (u.Unp_cod = i.Unid_cod)'
      '  left join RENAVAM_COR cr on (cr.Codigo = p.Cor_veiculo)'
      
        '  left join RENAVAM_COBUSTIVEL cb on (cb.Codigo = p.Combustivel_' +
        'veiculo)'
      
        '  left join RENAVAM_TIPOVEICULO tv on (tv.Codigo = p.Tipo_veicul' +
        'o)'
      '  left join TBCST_PIS ps on (ps.Codigo = p.Cst_pis)'
      '  left join TBCST_COFINS cs on (cs.Codigo = p.Cst_cofins)'
      
        '  left join VW_TABELA_IBPT ib on (ib.ncm_sh = coalesce(nullif(tr' +
        'im(p.ncm_sh), '#39'00000000'#39'), '#39'10203000'#39'))'
      ''
      'where i.Ano = :anovenda'
      '  and i.Codcontrol = :numvenda'
      ''
      'order by'
      '    i.Ano'
      '  , i.Codcontrol'
      '  , i.Seq')
    Left = 144
    Top = 168
    ParamData = <
      item
        DataType = ftInteger
        Name = 'anovenda'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'numvenda'
        ParamType = ptInput
        Value = 0
      end>
    object qryDadosProdutoANO: TSmallintField
      FieldName = 'ANO'
      Origin = '"TVENDASITENS"."ANO"'
      Required = True
    end
    object qryDadosProdutoCODCONTROL: TIntegerField
      FieldName = 'CODCONTROL'
      Origin = '"TVENDASITENS"."CODCONTROL"'
      Required = True
    end
    object qryDadosProdutoSEQ: TSmallintField
      FieldName = 'SEQ'
      Origin = '"TVENDASITENS"."SEQ"'
      Required = True
    end
    object qryDadosProdutoCODPROD: TIBStringField
      FieldName = 'CODPROD'
      Origin = '"TVENDASITENS"."CODPROD"'
      Required = True
      Size = 10
    end
    object qryDadosProdutoCODBARRA_EAN: TIBStringField
      FieldName = 'CODBARRA_EAN'
      Origin = '"TBPRODUTO"."CODBARRA_EAN"'
      Size = 15
    end
    object qryDadosProdutoDESCRI: TIBStringField
      FieldName = 'DESCRI'
      Origin = '"TBPRODUTO"."DESCRI"'
      Size = 50
    end
    object qryDadosProdutoAPRESENTACAO: TIBStringField
      FieldName = 'APRESENTACAO'
      Origin = '"TBPRODUTO"."APRESENTACAO"'
      Size = 50
    end
    object qryDadosProdutoDESCRI_APRESENTACAO: TIBStringField
      FieldName = 'DESCRI_APRESENTACAO'
      ProviderFlags = []
      Size = 100
    end
    object qryDadosProdutoMODELO: TIBStringField
      FieldName = 'MODELO'
      Origin = '"TBPRODUTO"."MODELO"'
      Size = 40
    end
    object qryDadosProdutoREFERENCIA: TIBStringField
      FieldName = 'REFERENCIA'
      Origin = '"TBPRODUTO"."REFERENCIA"'
      Size = 15
    end
    object qryDadosProdutoNCM_SH: TIBStringField
      FieldName = 'NCM_SH'
      Origin = '"TBPRODUTO"."NCM_SH"'
      Size = 10
    end
    object qryDadosProdutoNCM_ALIQUOTA_NAC: TIBBCDField
      FieldName = 'NCM_ALIQUOTA_NAC'
      Origin = '"SYS_IBPT"."ALIQNACIONAL_IBPT"'
      Precision = 18
      Size = 2
    end
    object qryDadosProdutoNCM_ALIQUOTA_IMP: TIBBCDField
      FieldName = 'NCM_ALIQUOTA_IMP'
      Origin = '"SYS_IBPT"."ALIQINTERNACIONAL_IBPT"'
      Precision = 18
      Size = 2
    end
    object qryDadosProdutoCODORIGEM: TIBStringField
      FieldName = 'CODORIGEM'
      Origin = '"TBPRODUTO"."CODORIGEM"'
      Size = 1
    end
    object qryDadosProdutoCODTRIBUTACAO: TIBStringField
      FieldName = 'CODTRIBUTACAO'
      Origin = '"TBPRODUTO"."CODTRIBUTACAO"'
      Size = 2
    end
    object qryDadosProdutoCST: TIBStringField
      FieldName = 'CST'
      Origin = '"TBPRODUTO"."CST"'
      Size = 3
    end
    object qryDadosProdutoCSOSN: TIBStringField
      FieldName = 'CSOSN'
      Origin = '"TBPRODUTO"."CSOSN"'
      Size = 3
    end
    object qryDadosProdutoCST_PIS: TIBStringField
      FieldName = 'CST_PIS'
      Origin = '"TBPRODUTO"."CST_PIS"'
      Size = 3
    end
    object qryDadosProdutoCST_COFINS: TIBStringField
      FieldName = 'CST_COFINS'
      Origin = '"TBPRODUTO"."CST_COFINS"'
      Size = 3
    end
    object qryDadosProdutoCST_PIS_INDICE_ACBR: TIntegerField
      FieldName = 'CST_PIS_INDICE_ACBR'
      ProviderFlags = []
    end
    object qryDadosProdutoCST_COFINS_INDICE_ACBR: TIntegerField
      FieldName = 'CST_COFINS_INDICE_ACBR'
      ProviderFlags = []
    end
    object qryDadosProdutoCODEMP: TIBStringField
      FieldName = 'CODEMP'
      Origin = '"TVENDASITENS"."CODEMP"'
      Size = 18
    end
    object qryDadosProdutoCODCLI: TIBStringField
      FieldName = 'CODCLI'
      Origin = '"TVENDASITENS"."CODCLI"'
      Size = 18
    end
    object qryDadosProdutoDTVENDA: TDateTimeField
      FieldName = 'DTVENDA'
      Origin = '"TVENDASITENS"."DTVENDA"'
    end
    object qryDadosProdutoQTDE: TIBBCDField
      FieldName = 'QTDE'
      Origin = '"TVENDASITENS"."QTDE"'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 3
    end
    object qryDadosProdutoPUNIT: TIBBCDField
      FieldName = 'PUNIT'
      Origin = '"TVENDASITENS"."PUNIT"'
      Precision = 18
      Size = 2
    end
    object qryDadosProdutoPUNIT_PROMOCAO: TIBBCDField
      FieldName = 'PUNIT_PROMOCAO'
      Origin = '"TVENDASITENS"."PUNIT_PROMOCAO"'
      Precision = 18
      Size = 2
    end
    object qryDadosProdutoDESCONTO: TIBBCDField
      FieldName = 'DESCONTO'
      Origin = '"TVENDASITENS"."DESCONTO"'
      Precision = 18
      Size = 3
    end
    object qryDadosProdutoDESCONTO_VALOR: TIBBCDField
      FieldName = 'DESCONTO_VALOR'
      Origin = '"TVENDASITENS"."DESCONTO_VALOR"'
      Precision = 18
      Size = 4
    end
    object qryDadosProdutoPFINAL: TIBBCDField
      FieldName = 'PFINAL'
      Origin = '"TVENDASITENS"."PFINAL"'
      Precision = 18
      Size = 2
    end
    object qryDadosProdutoQTDEFINAL: TIBBCDField
      FieldName = 'QTDEFINAL'
      Origin = '"TVENDASITENS"."QTDEFINAL"'
      Precision = 18
      Size = 3
    end
    object qryDadosProdutoUNID_COD: TSmallintField
      FieldName = 'UNID_COD'
      Origin = '"TVENDASITENS"."UNID_COD"'
    end
    object qryDadosProdutoUNP_DESCRICAO: TIBStringField
      FieldName = 'UNP_DESCRICAO'
      Origin = '"TBUNIDADEPROD"."UNP_DESCRICAO"'
      Size = 50
    end
    object qryDadosProdutoUNP_SIGLA: TIBStringField
      FieldName = 'UNP_SIGLA'
      Origin = '"TBUNIDADEPROD"."UNP_SIGLA"'
      Size = 5
    end
    object qryDadosProdutoCFOP_COD: TIntegerField
      FieldName = 'CFOP_COD'
      Origin = '"TVENDASITENS"."CFOP_COD"'
    end
    object qryDadosProdutoALIQUOTA: TIBBCDField
      FieldName = 'ALIQUOTA'
      Origin = '"TVENDASITENS"."ALIQUOTA"'
      Precision = 18
      Size = 2
    end
    object qryDadosProdutoALIQUOTA_CSOSN: TIBBCDField
      FieldName = 'ALIQUOTA_CSOSN'
      Origin = '"TVENDASITENS"."ALIQUOTA_CSOSN"'
      Precision = 18
      Size = 2
    end
    object qryDadosProdutoALIQUOTA_PIS: TIBBCDField
      FieldName = 'ALIQUOTA_PIS'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
    object qryDadosProdutoALIQUOTA_COFINS: TIBBCDField
      FieldName = 'ALIQUOTA_COFINS'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
    object qryDadosProdutoVALOR_IPI: TIBBCDField
      FieldName = 'VALOR_IPI'
      Origin = '"TVENDASITENS"."VALOR_IPI"'
      Precision = 18
      Size = 2
    end
    object qryDadosProdutoPERCENTUAL_REDUCAO_BC: TIBBCDField
      FieldName = 'PERCENTUAL_REDUCAO_BC'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
    object qryDadosProdutoVALOR_REDUCAO_BC: TIBBCDField
      FieldName = 'VALOR_REDUCAO_BC'
      ProviderFlags = []
      Precision = 18
      Size = 4
    end
    object qryDadosProdutoTOTAL_BRUTO: TIBBCDField
      FieldName = 'TOTAL_BRUTO'
      Origin = '"TVENDASITENS"."TOTAL_BRUTO"'
      Precision = 18
      Size = 2
    end
    object qryDadosProdutoTOTAL_DESCONTO: TIBBCDField
      FieldName = 'TOTAL_DESCONTO'
      Origin = '"TVENDASITENS"."TOTAL_DESCONTO"'
      Precision = 18
      Size = 2
    end
    object qryDadosProdutoTOTAL_LIQUIDO: TIBBCDField
      FieldName = 'TOTAL_LIQUIDO'
      Origin = '"TVENDASITENS"."TOTAL_LIQUIDO"'
      Precision = 18
      Size = 2
    end
    object qryDadosProdutoPRODUTO_NOVO: TSmallintField
      FieldName = 'PRODUTO_NOVO'
      Origin = '"TBPRODUTO"."PRODUTO_NOVO"'
    end
    object qryDadosProdutoCOR_VEICULO: TIBStringField
      FieldName = 'COR_VEICULO'
      Origin = '"TBPRODUTO"."COR_VEICULO"'
      Size = 3
    end
    object qryDadosProdutoCOR_VEICULO_DESCRICAO: TIBStringField
      FieldName = 'COR_VEICULO_DESCRICAO'
      Origin = '"RENAVAM_COR"."DESCRICAO"'
      Size = 50
    end
    object qryDadosProdutoCOMBUSTIVEL_VEICULO: TIBStringField
      FieldName = 'COMBUSTIVEL_VEICULO'
      Origin = '"TBPRODUTO"."COMBUSTIVEL_VEICULO"'
      Size = 3
    end
    object qryDadosProdutoCOMBUSTIVEL_VEICULO_DESCRICAO: TIBStringField
      FieldName = 'COMBUSTIVEL_VEICULO_DESCRICAO'
      Origin = '"RENAVAM_COBUSTIVEL"."DESCRICAO"'
      Size = 100
    end
    object qryDadosProdutoANO_FABRICACAO_VEICULO: TSmallintField
      FieldName = 'ANO_FABRICACAO_VEICULO'
      Origin = '"TBPRODUTO"."ANO_FABRICACAO_VEICULO"'
    end
    object qryDadosProdutoANO_MODELO_VEICULO: TSmallintField
      FieldName = 'ANO_MODELO_VEICULO'
      Origin = '"TBPRODUTO"."ANO_MODELO_VEICULO"'
    end
    object qryDadosProdutoANO_FAB_MODELO_VEICULO: TIBStringField
      FieldName = 'ANO_FAB_MODELO_VEICULO'
      ProviderFlags = []
      Size = 13
    end
    object qryDadosProdutoTIPO_VEICULO: TIBStringField
      FieldName = 'TIPO_VEICULO'
      Origin = '"TBPRODUTO"."TIPO_VEICULO"'
      Size = 3
    end
    object qryDadosProdutoTIPO_VEICULO_DESCRICAO: TIBStringField
      FieldName = 'TIPO_VEICULO_DESCRICAO'
      Origin = '"RENAVAM_TIPOVEICULO"."DESCRICAO"'
      Size = 100
    end
    object qryDadosProdutoRENAVAM_VEICULO: TIBStringField
      FieldName = 'RENAVAM_VEICULO'
      Origin = '"TBPRODUTO"."RENAVAM_VEICULO"'
      Size = 50
    end
    object qryDadosProdutoCHASSI_VEICULO: TIBStringField
      FieldName = 'CHASSI_VEICULO'
      Origin = '"TBPRODUTO"."CHASSI_VEICULO"'
      Size = 50
    end
    object qryDadosProdutoKILOMETRAGEM_VEICULO: TIntegerField
      FieldName = 'KILOMETRAGEM_VEICULO'
      Origin = '"TBPRODUTO"."KILOMETRAGEM_VEICULO"'
    end
    object qryDadosProdutoESTOQUE: TIBBCDField
      FieldName = 'ESTOQUE'
      Origin = '"TBPRODUTO"."QTDE"'
      ProviderFlags = []
      Precision = 18
      Size = 3
    end
    object qryDadosProdutoRESERVA: TIBBCDField
      FieldName = 'RESERVA'
      Origin = '"TBPRODUTO"."RESERVA"'
      ProviderFlags = []
      Precision = 18
      Size = 3
    end
    object qryDadosProdutoDISPONIVEL: TIBBCDField
      FieldName = 'DISPONIVEL'
      ProviderFlags = []
      Precision = 18
      Size = 3
    end
  end
  object frdEmpresa: TfrxDBDataset
    UserName = 'frdEmpresa'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CODIGO=CODIGO'
      'PESSOA_FISICA=PESSOA_FISICA'
      'CNPJ=CNPJ'
      'RZSOC=RZSOC'
      'NMFANT=NMFANT'
      'IE=IE'
      'IM=IM'
      'FONE=FONE'
      'LOGO=LOGO'
      'TLG_TIPO=TLG_TIPO'
      'TLG_DESCRICAO=TLG_DESCRICAO'
      'TLG_SIGLA=TLG_SIGLA'
      'LOG_COD=LOG_COD'
      'LOG_NOME=LOG_NOME'
      'COMPLEMENTO=COMPLEMENTO'
      'NUMERO_END=NUMERO_END'
      'CEP=CEP'
      'BAI_COD=BAI_COD'
      'BAI_NOME=BAI_NOME'
      'CID_COD=CID_COD'
      'CID_NOME=CID_NOME'
      'CID_SIAFI=CID_SIAFI'
      'CID_IBGE=CID_IBGE'
      'CID_DDD=CID_DDD'
      'EST_COD=EST_COD'
      'EST_NOME=EST_NOME'
      'EST_SIGLA=EST_SIGLA'
      'EST_SIAFI=EST_SIAFI'
      'EMAIL=EMAIL'
      'HOME_PAGE=HOME_PAGE'
      'CHAVE_ACESSO_NFE=CHAVE_ACESSO_NFE'
      'PAIS_ID=PAIS_ID'
      'PAIS_NOME=PAIS_NOME')
    DataSet = qryEmitente
    BCDToCurrency = False
    Left = 184
    Top = 24
  end
  object frdCliente: TfrxDBDataset
    UserName = 'frdCliente'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CODIGO=CODIGO'
      'PESSOA_FISICA=PESSOA_FISICA'
      'CNPJ=CNPJ'
      'NOME=NOME'
      'INSCEST=INSCEST'
      'INSCMUN=INSCMUN'
      'FONE=FONE'
      'EMAIL=EMAIL'
      'SITE=SITE'
      'TLG_TIPO=TLG_TIPO'
      'TLG_DESCRICAO=TLG_DESCRICAO'
      'TLG_SIGLA=TLG_SIGLA'
      'LOG_COD=LOG_COD'
      'LOG_NOME=LOG_NOME'
      'COMPLEMENTO=COMPLEMENTO'
      'NUMERO_END=NUMERO_END'
      'CEP=CEP'
      'BAI_COD=BAI_COD'
      'BAI_NOME=BAI_NOME'
      'CID_COD=CID_COD'
      'CID_NOME=CID_NOME'
      'CID_SIAFI=CID_SIAFI'
      'CID_IBGE=CID_IBGE'
      'CID_DDD=CID_DDD'
      'EST_COD=EST_COD'
      'EST_NOME=EST_NOME'
      'EST_SIGLA=EST_SIGLA'
      'EST_SIAFI=EST_SIAFI'
      'PAIS_ID=PAIS_ID'
      'PAIS_NOME=PAIS_NOME')
    DataSet = qryDestinatario
    BCDToCurrency = False
    Left = 184
    Top = 72
  end
  object frrVenda: TfrxReport
    Version = '4.9.72'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40928.407150601900000000
    ReportOptions.LastChange = 41856.560478368050000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 24
    Top = 120
    Datasets = <
      item
        DataSet = frdCliente
        DataSetName = 'frdCliente'
      end
      item
        DataSet = frdEmpresa
        DataSetName = 'frdEmpresa'
      end
      item
        DataSet = frdFormaPagtos
        DataSetName = 'frdFormaPagtos'
      end
      item
        DataSet = frdItens
        DataSetName = 'frdItens'
      end
      item
        DataSet = frdTitulo
        DataSetName = 'frdTitulo'
      end
      item
        DataSet = frdVenda
        DataSetName = 'frdVenda'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Lucida Console'
      Font.Style = []
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object bndReportTitle: TfrxReportTitle
        Height = 90.401670000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object frdVendaCODCONTROL: TfrxMemoView
          Left = 559.370440000000000000
          Top = 18.897650000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.UTF8 = (
            
              '[frdVenda."ANO"]/[FormatFloat('#39'0000000'#39',<frdVenda."CODCONTROL">)' +
              ']')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 559.370440000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            'N '#195#186' m e r o   C o n t r o l e :')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 559.370440000000000000
          Top = 37.795300000000000000
          Width = 158.740260000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            
              '[IIF(<frdVenda."STATUS">=1,'#39'Or'#195#167'amento'#39',IIF(<frdVenda."STATUS">=' +
              '2,'#39'Or'#195#167'amento'#39',IIF(<frdVenda."STATUS">=3,'#39'Finalizada'#39',IIF(<frdVe' +
              'nda."STATUS">=4,'#39'Gerada NF-e'#39','#39'Cancelada'#39'))))]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Picture1: TfrxPictureView
          Left = 3.779530000000000000
          Width = 139.842610000000000000
          Height = 79.370130000000000000
          ShowHint = False
          DataField = 'LOGO'
          DataSet = frdEmpresa
          DataSetName = 'frdEmpresa'
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object frdEmpresaRZSOC: TfrxMemoView
          Left = 143.622140000000000000
          Width = 411.968770000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frdEmpresa."RZSOC"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frdEmpresaNMFANT: TfrxMemoView
          Left = 143.622140000000000000
          Top = 18.897650000000000000
          Width = 411.968770000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            
              'CNPJ.: [FormatMaskText('#39'##.###.###/####-##;0;'#39',<frdEmpresa."CNPJ' +
              '">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdFone: TfrxMemoView
          Left = 143.622140000000000000
          Top = 34.015770000000000000
          Width = 411.968770000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            'FONE: [FormatMaskText('#39'(##)####.####;0;'#39',<frdEmpresa."FONE">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 143.622140000000000000
          Top = 49.133890000000000000
          Width = 411.968770000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            
              '[frdEmpresa."TLG_SIGLA"] [frdEmpresa."LOG_NOME"], [frdEmpresa."N' +
              'UMERO_END"], [frdEmpresa."BAI_NOME"] - [frdEmpresa."CID_NOME"]/[' +
              'frdEmpresa."EST_SIGLA"] CEP.: [FormatMaskText('#39'##.###-###;0;'#39',<f' +
              'rdEmpresa."CEP">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Line1: TfrxLineView
          Top = 83.149660000000000000
          Width = 718.110700000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo44: TfrxMemoView
          Left = 143.622140000000000000
          Top = 64.252010000000000000
          Width = 574.488560000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            '[frdEmpresa."HOME_PAGE"] / [frdEmpresa."EMAIL"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndMasterData: TfrxMasterData
        Height = 18.897650000000000000
        Top = 275.905690000000000000
        Width = 718.110700000000000000
        DataSet = frdItens
        DataSetName = 'frdItens'
        RowCount = 0
        object frdItensCODPROD: TfrxMemoView
          Left = 22.677180000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            ' [frdItens."CODPROD"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdItensSEQ: TfrxMemoView
          Width = 22.677180000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[Line]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdItensDESCRI: TfrxMemoView
          Left = 75.590600000000000000
          Width = 291.023639130000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            ' [frdItens."DESCRI"] (Ref.: [frdItens."REFERENCIA"])')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 366.614410000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39'###,###,##0'#39',<frdItens."QTDE">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 642.520100000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<frdItens."TOTAL_LIQUIDO">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 411.968770000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            ' [frdItens."UNP_SIGLA"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 449.764070000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<frdItens."PUNIT">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 514.016080000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<frdItens."DESCONTO_VALOR">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 578.268090000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<frdItens."PFINAL">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndPageFooter: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 710.551640000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 566.929500000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            'P '#195#161' g i n a :  [Page#]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndHeader: TfrxHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Lucida Console'
        Font.Style = []
        Height = 83.149660000000000000
        ParentFont = False
        Top = 170.078850000000000000
        Width = 718.110700000000000000
        object frdVendaNOME: TfrxMemoView
          Top = 11.338590000000000000
          Width = 415.748300000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            
              ' [FormatFloat('#39'##0000'#39',<frdCliente."CODIGO">)] - [frdCliente."NO' +
              'ME"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Width = 415.748300000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' Cliente:')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 415.748300000000000000
          Width = 207.874150000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' CPF/CNPJ.:')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 415.748300000000000000
          Top = 11.338590000000000000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            
              ' [IIF(<frdCliente."PESSOA_FISICA">=1,FormatMaskText('#39'###.###.###' +
              '-##;0;'#39',<frdCliente."CNPJ">),FormatMaskText('#39'##.###.###/####-##;' +
              '0;'#39',<frdCliente."CNPJ">))]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 623.622450000000000000
          Width = 94.488250000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'Data: ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 623.622450000000000000
          Top = 11.338590000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            ' [FormatDateTime('#39'dd/mm/yyyy'#39',<frdVenda."DTVENDA">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Line2: TfrxLineView
          Top = 79.370130000000000000
          Width = 718.110700000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo23: TfrxMemoView
          Top = 64.252010000000000000
          Width = 22.677180000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '#')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 22.677180000000000000
          Top = 64.252010000000000000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' C'#195#179'digo')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 75.590600000000000000
          Top = 64.252010000000000000
          Width = 291.023639130000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' Descri'#195#167#195#163'o')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Top = 41.574830000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            
              ' [Trim(<frdCliente."TLG_SIGLA"> + '#39' '#39' + <frdCliente."LOG_NOME">)' +
              '], [frdCliente."NUMERO_END"], [frdCliente."BAI_NOME"] - [frdClie' +
              'nte."CID_NOME"]/[frdCliente."EST_SIGLA"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Top = 30.236240000000000000
          Width = 718.110700000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' Endere'#195#167'o:')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 411.968770000000000000
          Top = 64.252010000000000000
          Width = 37.795300000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' Und.')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 449.764070000000000000
          Top = 64.252010000000000000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'V. Bruto ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 514.016080000000000000
          Top = 64.252010000000000000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'V. Desc. ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 578.268090000000000000
          Top = 64.252010000000000000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'V. L'#195#173'quido ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 642.520100000000000000
          Top = 64.252010000000000000
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'T O T A L ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 366.614410000000000000
          Top = 64.252010000000000000
          Width = 45.354323390000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'Qtde.')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndReportSummary: TfrxReportSummary
        Height = 332.598640000000000000
        Top = 355.275820000000000000
        Width = 718.110700000000000000
        object SysMemo1: TfrxSysMemoView
          Left = 623.622450000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',SUM(<frdItens."TOTAL_LIQUIDO">,bndMasterDat' +
              'a,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo14: TfrxMemoView
          Left = 480.000310000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          HAlign = haRight
          Memo.UTF8 = (
            'T O T A L    G E R A L :')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Top = 98.267780000000000000
          Width = 366.614410000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            ' [frdVenda."VENDEDOR_NOME"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Top = 86.929190000000000000
          Width = 366.614410000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' Vendedor:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line3: TfrxLineView
          Top = 22.677180000000000000
          Width = 718.110700000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo30: TfrxMemoView
          Top = 37.795300000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            ' [frdVenda."LISTA_FORMA_PAGO"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Top = 26.456710000000000000
          Width = 718.110700000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' Forma de Pagamento:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Top = 68.031540000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            ' [frdVenda."LISTA_COND_PAGO"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Top = 56.692950000000000000
          Width = 718.110700000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' Condi'#195#167#195#163'o de Pagamento:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 366.614410000000000000
          Top = 98.267780000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<frdVenda."TOTALVENDABRUTA">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 366.614410000000000000
          Top = 86.929190000000000000
          Width = 128.504020000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            ' Total Venda: ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Left = 495.118430000000000000
          Top = 98.267780000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<frdVenda."DESCONTO">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Left = 495.118430000000000000
          Top = 86.929190000000000000
          Width = 94.488250000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            ' Desconto: ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Left = 589.606680000000000000
          Top = 98.267780000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<frdVenda."TOTALVENDA">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          Left = 589.606680000000000000
          Top = 86.929190000000000000
          Width = 128.504020000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            ' Total L'#195#173'quido: ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Top = 132.283550000000000000
          Width = 718.110700000000000000
          Height = 45.354360000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frdVenda."OBS"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          Top = 117.165430000000000000
          Width = 718.110700000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Memo.UTF8 = (
            ' Observa'#195#167#195#163'o:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Left = 234.330860000000000000
          Top = 308.921460000000000000
          Width = 249.448980000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            'Assinatura do Cliente')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          Left = 37.795300000000000000
          Top = 192.756030000000000000
          Width = 623.622450000000000000
          Height = 45.354360000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial Narrow'
          Font.Style = []
          HAlign = haBlock
          Memo.UTF8 = (
            
              '                 Autorizamos a [frdEmpresa."NMFANT"] executar o ' +
              'presente or'#195#167'amento, na sua totalidade, e na forma/condi'#195#167#195#163'o de' +
              ' pagamentos estabelecida.')
          ParentFont = False
        end
      end
    end
  end
  object frdVenda: TfrxDBDataset
    UserName = 'frdVenda'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ANO=ANO'
      'CODCONTROL=CODCONTROL'
      'CODEMP=CODEMP'
      'CODCLI=CODCLI'
      'DTVENDA=DTVENDA'
      'STATUS=STATUS'
      'DESCONTO=DESCONTO'
      'TOTALVENDA=TOTALVENDA'
      'TOTALVENDABRUTA=TOTALVENDABRUTA'
      'DTFINALIZACAO_VENDA=DTFINALIZACAO_VENDA'
      'OBS=OBS'
      'SERIE=SERIE'
      'NFE=NFE'
      'LOTE_NFE_ANO=LOTE_NFE_ANO'
      'LOTE_NFE_NUMERO=LOTE_NFE_NUMERO'
      'NFE_ENVIADA=NFE_ENVIADA'
      'DATAEMISSAO=DATAEMISSAO'
      'HORAEMISSAO=HORAEMISSAO'
      'CANCEL_USUARIO=CANCEL_USUARIO'
      'CANCEL_DATAHORA=CANCEL_DATAHORA'
      'CANCEL_MOTIVO=CANCEL_MOTIVO'
      'CFOP=CFOP'
      'CFOP_DESCRICAO=CFOP_DESCRICAO'
      'VERIFICADOR_NFE=VERIFICADOR_NFE'
      'XML_NFE_FILENAME=XML_NFE_FILENAME'
      'XML_NFE=XML_NFE'
      'VENDEDOR_COD=VENDEDOR_COD'
      'VENDEDOR_NOME=VENDEDOR_NOME'
      'VENDEDOR_CPF=VENDEDOR_CPF'
      'USUARIO=USUARIO'
      'LISTA_FORMA_PAGO=LISTA_FORMA_PAGO'
      'LISTA_COND_PAGO=LISTA_COND_PAGO'
      'LISTA_COND_PAGO_FULL=LISTA_COND_PAGO_FULL'
      'VENDA_PRAZO=VENDA_PRAZO'
      'NFE_VALOR_BASE_ICMS=NFE_VALOR_BASE_ICMS'
      'NFE_VALOR_ICMS=NFE_VALOR_ICMS'
      'NFE_VALOR_BASE_ICMS_SUBST=NFE_VALOR_BASE_ICMS_SUBST'
      'NFE_VALOR_ICMS_SUBST=NFE_VALOR_ICMS_SUBST'
      'NFE_VALOR_TOTAL_PRODUTO=NFE_VALOR_TOTAL_PRODUTO'
      'NFE_VALOR_FRETE=NFE_VALOR_FRETE'
      'NFE_VALOR_SEGURO=NFE_VALOR_SEGURO'
      'NFE_VALOR_DESCONTO=NFE_VALOR_DESCONTO'
      'NFE_VALOR_TOTAL_II=NFE_VALOR_TOTAL_II'
      'NFE_VALOR_TOTAL_IPI=NFE_VALOR_TOTAL_IPI'
      'NFE_VALOR_PIS=NFE_VALOR_PIS'
      'NFE_VALOR_COFINS=NFE_VALOR_COFINS'
      'NFE_VALOR_OUTROS=NFE_VALOR_OUTROS'
      'NFE_VALOR_TOTAL_NOTA=NFE_VALOR_TOTAL_NOTA')
    DataSet = qryCalculoImporto
    BCDToCurrency = False
    Left = 184
    Top = 120
  end
  object frdItens: TfrxDBDataset
    UserName = 'frdItens'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ANO=ANO'
      'CODCONTROL=CODCONTROL'
      'SEQ=SEQ'
      'CODPROD=CODPROD'
      'CODBARRA_EAN=CODBARRA_EAN'
      'DESCRI=DESCRI'
      'APRESENTACAO=APRESENTACAO'
      'DESCRI_APRESENTACAO=DESCRI_APRESENTACAO'
      'MODELO=MODELO'
      'REFERENCIA=REFERENCIA'
      'NCM_SH=NCM_SH'
      'NCM_ALIQUOTA_NAC=NCM_ALIQUOTA_NAC'
      'NCM_ALIQUOTA_IMP=NCM_ALIQUOTA_IMP'
      'CODORIGEM=CODORIGEM'
      'CODTRIBUTACAO=CODTRIBUTACAO'
      'CST=CST'
      'CSOSN=CSOSN'
      'CST_PIS=CST_PIS'
      'CST_COFINS=CST_COFINS'
      'CST_PIS_INDICE_ACBR=CST_PIS_INDICE_ACBR'
      'CST_COFINS_INDICE_ACBR=CST_COFINS_INDICE_ACBR'
      'CODEMP=CODEMP'
      'CODCLI=CODCLI'
      'DTVENDA=DTVENDA'
      'QTDE=QTDE'
      'PUNIT=PUNIT'
      'PUNIT_PROMOCAO=PUNIT_PROMOCAO'
      'DESCONTO=DESCONTO'
      'DESCONTO_VALOR=DESCONTO_VALOR'
      'PFINAL=PFINAL'
      'QTDEFINAL=QTDEFINAL'
      'UNID_COD=UNID_COD'
      'UNP_DESCRICAO=UNP_DESCRICAO'
      'UNP_SIGLA=UNP_SIGLA'
      'CFOP_COD=CFOP_COD'
      'ALIQUOTA=ALIQUOTA'
      'ALIQUOTA_CSOSN=ALIQUOTA_CSOSN'
      'ALIQUOTA_PIS=ALIQUOTA_PIS'
      'ALIQUOTA_COFINS=ALIQUOTA_COFINS'
      'VALOR_IPI=VALOR_IPI'
      'PERCENTUAL_REDUCAO_BC=PERCENTUAL_REDUCAO_BC'
      'VALOR_REDUCAO_BC=VALOR_REDUCAO_BC'
      'TOTAL_BRUTO=TOTAL_BRUTO'
      'TOTAL_DESCONTO=TOTAL_DESCONTO'
      'TOTAL_LIQUIDO=TOTAL_LIQUIDO'
      'PRODUTO_NOVO=PRODUTO_NOVO'
      'COR_VEICULO=COR_VEICULO'
      'COR_VEICULO_DESCRICAO=COR_VEICULO_DESCRICAO'
      'COMBUSTIVEL_VEICULO=COMBUSTIVEL_VEICULO'
      'COMBUSTIVEL_VEICULO_DESCRICAO=COMBUSTIVEL_VEICULO_DESCRICAO'
      'ANO_FABRICACAO_VEICULO=ANO_FABRICACAO_VEICULO'
      'ANO_MODELO_VEICULO=ANO_MODELO_VEICULO'
      'ANO_FAB_MODELO_VEICULO=ANO_FAB_MODELO_VEICULO'
      'TIPO_VEICULO=TIPO_VEICULO'
      'TIPO_VEICULO_DESCRICAO=TIPO_VEICULO_DESCRICAO'
      'RENAVAM_VEICULO=RENAVAM_VEICULO'
      'CHASSI_VEICULO=CHASSI_VEICULO'
      'KILOMETRAGEM_VEICULO=KILOMETRAGEM_VEICULO'
      'ESTOQUE=ESTOQUE'
      'RESERVA=RESERVA'
      'DISPONIVEL=DISPONIVEL')
    DataSet = qryDadosProduto
    BCDToCurrency = False
    Left = 180
    Top = 169
  end
  object frdTitulo: TfrxDBDataset
    UserName = 'frdTitulo'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ANOLANC=ANOLANC'
      'NUMLANC=NUMLANC'
      'PARCELA=PARCELA'
      'DTEMISS=DTEMISS'
      'DTVENC=DTVENC'
      'VALORREC=VALORREC'
      'VALORMULTA=VALORMULTA'
      'PERCENTDESCONTO=PERCENTDESCONTO')
    DataSet = qryDuplicatas
    BCDToCurrency = False
    Left = 180
    Top = 217
  end
  object qryEmitente: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    ForcedRefresh = True
    CachedUpdates = True
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'Select'
      '    e.Codigo'
      '  , e.Pessoa_fisica'
      '  , e.Cnpj'
      '  , e.Rzsoc'
      '  , e.Nmfant'
      '  , e.Ie'
      '  , e.Im'
      '  , e.Cnae'
      ''
      '  , e.Fone'
      '  , e.Logo'
      ''
      '  , e.Tlg_tipo'
      '  , tl.Tlg_descricao'
      '  , tl.Tlg_sigla'
      '  , e.Log_cod'
      '  , lg.Log_nome'
      '  , e.Complemento'
      '  , e.Numero_end'
      '  , e.Cep'
      ''
      '  , e.Bai_cod'
      '  , br.Bai_nome'
      ''
      '  , e.Cid_cod'
      '  , cd.Cid_nome'
      '  , cd.Cid_siafi'
      '  , cd.Cid_ibge'
      '  , cd.Cid_ddd'
      ''
      '  , e.Est_cod'
      '  , uf.Est_nome'
      '  , uf.Est_sigla'
      '  , uf.Est_siafi'
      ''
      '  , e.Email'
      '  , e.Home_page'
      '  , e.Chave_acesso_nfe'
      '  , e.Tipo_Regime_nfe'
      '  , e.Serie_nfe'
      '  , e.Numero_nfe'
      '  , e.Lote_Ano_nfe'
      '  , e.Lote_Num_nfe'
      '  , e.Pais_id'
      '  , pa.Pais_nome'
      'from TBEMPRESA e'
      '  left join TBESTADO uf on (uf.Est_cod = e.Est_cod)'
      '  left join TBCIDADE cd on (cd.Cid_cod = e.Cid_cod)'
      '  left join TBBAIRRO br on (br.Bai_cod = e.Bai_cod)'
      '  left join TBLOGRADOURO lg on (lg.Log_cod = e.Log_cod)'
      '  left join TBTIPO_LoGRADOURO tl on (tl.Tlg_cod = e.Tlg_tipo)'
      '  left Join TBPAIS pa on (pa.Pais_id = e.Pais_id)'
      'where e.Cnpj = :Cnpj')
    ModifySQL.Strings = (
      '')
    GeneratorField.ApplyEvent = gamOnPost
    Left = 144
    Top = 24
    object qryEmitenteCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'TBEMPRESA.CODIGO'
    end
    object qryEmitentePESSOA_FISICA: TSmallintField
      FieldName = 'PESSOA_FISICA'
      Origin = 'TBEMPRESA.PESSOA_FISICA'
    end
    object qryEmitenteCNPJ: TIBStringField
      FieldName = 'CNPJ'
      Origin = 'TBEMPRESA.CNPJ'
      Size = 18
    end
    object qryEmitenteRZSOC: TIBStringField
      FieldName = 'RZSOC'
      Origin = 'TBEMPRESA.RZSOC'
      Size = 60
    end
    object qryEmitenteNMFANT: TIBStringField
      FieldName = 'NMFANT'
      Origin = 'TBEMPRESA.NMFANT'
      Size = 25
    end
    object qryEmitenteIE: TIBStringField
      FieldName = 'IE'
      Origin = 'TBEMPRESA.IE'
      Size = 11
    end
    object qryEmitenteIM: TIBStringField
      FieldName = 'IM'
      Origin = 'TBEMPRESA.IM'
      Size = 12
    end
    object qryEmitenteCNAE: TIBStringField
      FieldName = 'CNAE'
      Origin = 'TBEMPRESA.CNAE'
      Size = 11
    end
    object qryEmitenteFONE: TIBStringField
      FieldName = 'FONE'
      Origin = 'TBEMPRESA.FONE'
      Size = 11
    end
    object qryEmitenteLOGO: TBlobField
      FieldName = 'LOGO'
      Origin = 'TBEMPRESA.LOGO'
      Size = 8
    end
    object qryEmitenteTLG_TIPO: TSmallintField
      FieldName = 'TLG_TIPO'
      Origin = 'TBEMPRESA.TLG_TIPO'
    end
    object qryEmitenteTLG_DESCRICAO: TIBStringField
      FieldName = 'TLG_DESCRICAO'
      Origin = 'TBTIPO_LOGRADOURO.TLG_DESCRICAO'
      Size = 50
    end
    object qryEmitenteTLG_SIGLA: TIBStringField
      FieldName = 'TLG_SIGLA'
      Origin = 'TBTIPO_LOGRADOURO.TLG_SIGLA'
      Size = 10
    end
    object qryEmitenteLOG_COD: TIntegerField
      FieldName = 'LOG_COD'
      Origin = 'TBEMPRESA.LOG_COD'
    end
    object qryEmitenteLOG_NOME: TIBStringField
      FieldName = 'LOG_NOME'
      Origin = 'TBLOGRADOURO.LOG_NOME'
      Size = 250
    end
    object qryEmitenteCOMPLEMENTO: TIBStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'TBEMPRESA.COMPLEMENTO'
      Size = 50
    end
    object qryEmitenteNUMERO_END: TIBStringField
      FieldName = 'NUMERO_END'
      Origin = 'TBEMPRESA.NUMERO_END'
      Size = 10
    end
    object qryEmitenteCEP: TIBStringField
      FieldName = 'CEP'
      Origin = 'TBEMPRESA.CEP'
      Size = 8
    end
    object qryEmitenteBAI_COD: TIntegerField
      FieldName = 'BAI_COD'
      Origin = 'TBEMPRESA.BAI_COD'
    end
    object qryEmitenteBAI_NOME: TIBStringField
      FieldName = 'BAI_NOME'
      Origin = 'TBBAIRRO.BAI_NOME'
      Size = 100
    end
    object qryEmitenteCID_COD: TIntegerField
      FieldName = 'CID_COD'
      Origin = 'TBEMPRESA.CID_COD'
    end
    object qryEmitenteCID_NOME: TIBStringField
      FieldName = 'CID_NOME'
      Origin = 'TBCIDADE.CID_NOME'
      Size = 100
    end
    object qryEmitenteCID_SIAFI: TIntegerField
      FieldName = 'CID_SIAFI'
      Origin = 'TBCIDADE.CID_SIAFI'
    end
    object qryEmitenteCID_IBGE: TIntegerField
      FieldName = 'CID_IBGE'
      Origin = 'TBCIDADE.CID_IBGE'
    end
    object qryEmitenteCID_DDD: TSmallintField
      FieldName = 'CID_DDD'
      Origin = 'TBCIDADE.CID_DDD'
    end
    object qryEmitenteEST_COD: TSmallintField
      FieldName = 'EST_COD'
      Origin = 'TBEMPRESA.EST_COD'
    end
    object qryEmitenteEST_NOME: TIBStringField
      FieldName = 'EST_NOME'
      Origin = 'TBESTADO.EST_NOME'
      Size = 100
    end
    object qryEmitenteEST_SIGLA: TIBStringField
      FieldName = 'EST_SIGLA'
      Origin = 'TBESTADO.EST_SIGLA'
      Size = 2
    end
    object qryEmitenteEST_SIAFI: TIntegerField
      FieldName = 'EST_SIAFI'
      Origin = 'TBESTADO.EST_SIAFI'
    end
    object qryEmitenteEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = 'TBEMPRESA.EMAIL'
      Size = 100
    end
    object qryEmitenteHOME_PAGE: TIBStringField
      FieldName = 'HOME_PAGE'
      Origin = 'TBEMPRESA.HOME_PAGE'
      Size = 100
    end
    object qryEmitenteCHAVE_ACESSO_NFE: TIBStringField
      FieldName = 'CHAVE_ACESSO_NFE'
      Origin = 'TBEMPRESA.CHAVE_ACESSO_NFE'
      Size = 250
    end
    object qryEmitenteTIPO_REGIME_NFE: TSmallintField
      FieldName = 'TIPO_REGIME_NFE'
      Origin = 'TBEMPRESA.TIPO_REGIME_NFE'
    end
    object qryEmitenteSERIE_NFE: TSmallintField
      FieldName = 'SERIE_NFE'
      Origin = 'TBEMPRESA.SERIE_NFE'
    end
    object qryEmitenteNUMERO_NFE: TIntegerField
      FieldName = 'NUMERO_NFE'
      Origin = 'TBEMPRESA.NUMERO_NFE'
    end
    object qryEmitenteLOTE_ANO_NFE: TSmallintField
      FieldName = 'LOTE_ANO_NFE'
      Origin = 'TBEMPRESA.LOTE_ANO_NFE'
    end
    object qryEmitenteLOTE_NUM_NFE: TIntegerField
      FieldName = 'LOTE_NUM_NFE'
      Origin = 'TBEMPRESA.LOTE_NUM_NFE'
    end
    object qryEmitentePAIS_ID: TIBStringField
      FieldName = 'PAIS_ID'
      Origin = 'TBEMPRESA.PAIS_ID'
      Size = 5
    end
    object qryEmitentePAIS_NOME: TIBStringField
      FieldName = 'PAIS_NOME'
      Origin = 'TBPAIS.PAIS_NOME'
      Size = 150
    end
  end
  object qryCalculoImporto: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    ForcedRefresh = True
    CachedUpdates = True
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'Select'
      '    v.Ano'
      '  , v.Codcontrol'
      '  , v.Codemp'
      '  , v.Codcli'
      '  , v.Dtvenda'
      '  , v.Status'
      '  , v.totalvenda_bruta as TotalvendaBruta'
      '  , v.Desconto'
      '  , v.Desconto_Cupom'
      '  , v.Totalvenda'
      '  , v.Dtfinalizacao_venda'
      '  , v.Obs'
      '  , v.Serie'
      '  , v.Nfe'
      '  , v.Lote_nfe_ano'
      '  , v.Lote_nfe_numero'
      '  , v.Nfe_enviada'
      '  , v.Dataemissao'
      '  , v.Horaemissao'
      '  , v.Cancel_usuario'
      '  , v.Cancel_datahora'
      '  , v.Cancel_motivo'
      '  , v.Cfop'
      '  , cf.Cfop_descricao'
      '  , cf.cfop_informacao_fisco'
      '  , v.Verificador_nfe'
      '  , v.Xml_nfe_filename'
      '  , v.Xml_nfe'
      '  , v.Vendedor_cod'
      '  , vd.Nome as vendedor_nome'
      '  , vd.Cpf as vendedor_cpf'
      '  , v.Usuario'
      ''
      '  , ('
      '    Select list(fp.descri)'
      '    from TBVENDAS_FORMAPAGTO x'
      '      inner join TBFORMPAGTO fp on (fp.cod = x.formapagto_cod)'
      '    where x.ano_venda = v.ano'
      '      and x.controle_venda = v.codcontrol'
      '    ) as lista_forma_pago'
      ''
      '  , ('
      '    Select list(cp.cond_descricao)'
      '    from TBVENDAS_FORMAPAGTO y'
      
        '      inner join VW_CONDICAOPAGTO cp on (cp.cond_cod = y.condica' +
        'opagto_cod)'
      '    where y.ano_venda = v.ano'
      '      and y.controle_venda = v.codcontrol'
      '    ) as lista_cond_pago'
      ''
      '  , ('
      '    Select list(cp.cond_descricao_full)'
      '    from TBVENDAS_FORMAPAGTO y'
      
        '      inner join VW_CONDICAOPAGTO cp on (cp.cond_cod = y.condica' +
        'opagto_cod)'
      '    where y.ano_venda = v.ano'
      '      and y.controle_venda = v.codcontrol'
      '    ) as lista_cond_pago_full'
      ''
      '  , v.Venda_prazo'
      '  , v.Nfe_valor_base_icms'
      '  , v.Nfe_valor_icms'
      '  , v.Nfe_valor_base_icms_subst'
      '  , v.Nfe_valor_icms_subst'
      '  , v.Nfe_valor_total_produto'
      '  , v.Nfe_valor_frete'
      '  , v.Nfe_valor_seguro'
      '  , v.Nfe_valor_desconto'
      '  , v.Nfe_valor_total_ii'
      '  , v.Nfe_valor_total_ipi'
      '  , v.Nfe_valor_pis'
      '  , v.Nfe_valor_cofins'
      '  , v.Nfe_valor_outros'
      '  , v.Nfe_valor_total_nota'
      ''
      '  , v.nfe_modalidade_frete'
      '  , v.nfe_transportadora'
      '  , tr.nomeforn as nfe_transportadora_nome'
      '  , tr.cnpj     as nfe_transportadora_cnpj'
      '  , tr.inscest  as nfe_transportadora_iest'
      '  , tr.ender    as nfe_transportadora_ender'
      '  , tc.cid_nome as nfe_transportadora_cidade'
      '  , tr.uf       as nfe_transportadora_uf'
      '  , v.nfe_placa_veiculo'
      '  , v.nfe_placa_uf'
      '  , v.nfe_placa_rntc'
      'from TBVENDAS v'
      '  inner join TBCFOP cf on (cf.Cfop_cod = v.Cfop)'
      '  inner join TBVENDEDOR vd on (vd.Cod = v.Vendedor_cod)'
      
        '  left join TBFORNECEDOR tr on (tr.codforn = v.nfe_transportador' +
        'a)'
      '  left join TBCIDADE tc on (tc.cid_cod = tr.cid_cod)'
      'where v.Ano = :anovenda'
      '  and v.Codcontrol = :numvenda')
    ModifySQL.Strings = (
      '')
    GeneratorField.ApplyEvent = gamOnPost
    Left = 144
    Top = 120
    object qryCalculoImportoANO: TSmallintField
      FieldName = 'ANO'
      Origin = '"TBVENDAS"."ANO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCalculoImportoCODCONTROL: TIntegerField
      FieldName = 'CODCONTROL'
      Origin = '"TBVENDAS"."CODCONTROL"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCalculoImportoCODEMP: TIBStringField
      FieldName = 'CODEMP'
      Origin = '"TBVENDAS"."CODEMP"'
      Size = 18
    end
    object qryCalculoImportoCODCLI: TIBStringField
      FieldName = 'CODCLI'
      Origin = '"TBVENDAS"."CODCLI"'
      Size = 18
    end
    object qryCalculoImportoDTVENDA: TDateTimeField
      FieldName = 'DTVENDA'
      Origin = '"TBVENDAS"."DTVENDA"'
    end
    object qryCalculoImportoSTATUS: TSmallintField
      FieldName = 'STATUS'
      Origin = '"TBVENDAS"."STATUS"'
    end
    object qryCalculoImportoTOTALVENDABRUTA: TIBBCDField
      FieldName = 'TOTALVENDABRUTA'
      Origin = '"TBVENDAS"."TOTALVENDA_BRUTA"'
      Precision = 18
      Size = 2
    end
    object qryCalculoImportoDESCONTO: TIBBCDField
      FieldName = 'DESCONTO'
      Origin = '"TBVENDAS"."DESCONTO"'
      Precision = 18
      Size = 4
    end
    object qryCalculoImportoDESCONTO_CUPOM: TIBBCDField
      FieldName = 'DESCONTO_CUPOM'
      Origin = '"TBVENDAS"."DESCONTO_CUPOM"'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
    object qryCalculoImportoTOTALVENDA: TIBBCDField
      FieldName = 'TOTALVENDA'
      Origin = '"TBVENDAS"."TOTALVENDA"'
      Precision = 18
      Size = 2
    end
    object qryCalculoImportoDTFINALIZACAO_VENDA: TDateField
      FieldName = 'DTFINALIZACAO_VENDA'
      Origin = '"TBVENDAS"."DTFINALIZACAO_VENDA"'
    end
    object qryCalculoImportoOBS: TMemoField
      FieldName = 'OBS'
      Origin = '"TBVENDAS"."OBS"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object qryCalculoImportoSERIE: TIBStringField
      FieldName = 'SERIE'
      Origin = '"TBVENDAS"."SERIE"'
      Size = 4
    end
    object qryCalculoImportoNFE: TLargeintField
      FieldName = 'NFE'
      Origin = '"TBVENDAS"."NFE"'
    end
    object qryCalculoImportoLOTE_NFE_ANO: TSmallintField
      FieldName = 'LOTE_NFE_ANO'
      Origin = '"TBVENDAS"."LOTE_NFE_ANO"'
    end
    object qryCalculoImportoLOTE_NFE_NUMERO: TIntegerField
      FieldName = 'LOTE_NFE_NUMERO'
      Origin = '"TBVENDAS"."LOTE_NFE_NUMERO"'
    end
    object qryCalculoImportoNFE_ENVIADA: TSmallintField
      FieldName = 'NFE_ENVIADA'
      Origin = '"TBVENDAS"."NFE_ENVIADA"'
    end
    object qryCalculoImportoDATAEMISSAO: TDateField
      FieldName = 'DATAEMISSAO'
      Origin = '"TBVENDAS"."DATAEMISSAO"'
    end
    object qryCalculoImportoHORAEMISSAO: TTimeField
      FieldName = 'HORAEMISSAO'
      Origin = '"TBVENDAS"."HORAEMISSAO"'
    end
    object qryCalculoImportoCANCEL_USUARIO: TIBStringField
      FieldName = 'CANCEL_USUARIO'
      Origin = '"TBVENDAS"."CANCEL_USUARIO"'
      Size = 50
    end
    object qryCalculoImportoCANCEL_DATAHORA: TDateTimeField
      FieldName = 'CANCEL_DATAHORA'
      Origin = '"TBVENDAS"."CANCEL_DATAHORA"'
    end
    object qryCalculoImportoCANCEL_MOTIVO: TMemoField
      FieldName = 'CANCEL_MOTIVO'
      Origin = '"TBVENDAS"."CANCEL_MOTIVO"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object qryCalculoImportoCFOP: TIntegerField
      FieldName = 'CFOP'
      Origin = '"TBVENDAS"."CFOP"'
    end
    object qryCalculoImportoCFOP_DESCRICAO: TIBStringField
      FieldName = 'CFOP_DESCRICAO'
      Origin = '"TBCFOP"."CFOP_DESCRICAO"'
      Size = 250
    end
    object qryCalculoImportoCFOP_INFORMACAO_FISCO: TIBStringField
      FieldName = 'CFOP_INFORMACAO_FISCO'
      Origin = '"TBCFOP"."CFOP_INFORMACAO_FISCO"'
      ProviderFlags = []
      Size = 250
    end
    object qryCalculoImportoVERIFICADOR_NFE: TIBStringField
      FieldName = 'VERIFICADOR_NFE'
      Origin = '"TBVENDAS"."VERIFICADOR_NFE"'
      Size = 250
    end
    object qryCalculoImportoXML_NFE_FILENAME: TIBStringField
      FieldName = 'XML_NFE_FILENAME'
      Origin = '"TBVENDAS"."XML_NFE_FILENAME"'
      Size = 250
    end
    object qryCalculoImportoXML_NFE: TMemoField
      FieldName = 'XML_NFE'
      Origin = '"TBVENDAS"."XML_NFE"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object qryCalculoImportoVENDEDOR_COD: TIntegerField
      FieldName = 'VENDEDOR_COD'
      Origin = '"TBVENDAS"."VENDEDOR_COD"'
    end
    object qryCalculoImportoVENDEDOR_NOME: TIBStringField
      FieldName = 'VENDEDOR_NOME'
      Origin = '"TBVENDEDOR"."NOME"'
      Size = 60
    end
    object qryCalculoImportoVENDEDOR_CPF: TIBStringField
      FieldName = 'VENDEDOR_CPF'
      Origin = '"TBVENDEDOR"."CPF"'
      Required = True
      Size = 12
    end
    object qryCalculoImportoUSUARIO: TIBStringField
      FieldName = 'USUARIO'
      Origin = '"TBVENDAS"."USUARIO"'
      Size = 50
    end
    object qryCalculoImportoLISTA_FORMA_PAGO: TMemoField
      FieldName = 'LISTA_FORMA_PAGO'
      ProviderFlags = []
      BlobType = ftMemo
      Size = 8
    end
    object qryCalculoImportoLISTA_COND_PAGO: TMemoField
      FieldName = 'LISTA_COND_PAGO'
      ProviderFlags = []
      BlobType = ftMemo
      Size = 8
    end
    object qryCalculoImportoLISTA_COND_PAGO_FULL: TMemoField
      FieldName = 'LISTA_COND_PAGO_FULL'
      ProviderFlags = []
      BlobType = ftMemo
      Size = 8
    end
    object qryCalculoImportoVENDA_PRAZO: TSmallintField
      FieldName = 'VENDA_PRAZO'
      Origin = '"TBVENDAS"."VENDA_PRAZO"'
    end
    object qryCalculoImportoNFE_VALOR_BASE_ICMS: TIBBCDField
      FieldName = 'NFE_VALOR_BASE_ICMS'
      Origin = '"TBVENDAS"."NFE_VALOR_BASE_ICMS"'
      Precision = 18
      Size = 2
    end
    object qryCalculoImportoNFE_VALOR_ICMS: TIBBCDField
      FieldName = 'NFE_VALOR_ICMS'
      Origin = '"TBVENDAS"."NFE_VALOR_ICMS"'
      Precision = 18
      Size = 2
    end
    object qryCalculoImportoNFE_VALOR_BASE_ICMS_SUBST: TIBBCDField
      FieldName = 'NFE_VALOR_BASE_ICMS_SUBST'
      Origin = '"TBVENDAS"."NFE_VALOR_BASE_ICMS_SUBST"'
      Precision = 18
      Size = 2
    end
    object qryCalculoImportoNFE_VALOR_ICMS_SUBST: TIBBCDField
      FieldName = 'NFE_VALOR_ICMS_SUBST'
      Origin = '"TBVENDAS"."NFE_VALOR_ICMS_SUBST"'
      Precision = 18
      Size = 2
    end
    object qryCalculoImportoNFE_VALOR_TOTAL_PRODUTO: TIBBCDField
      FieldName = 'NFE_VALOR_TOTAL_PRODUTO'
      Origin = '"TBVENDAS"."NFE_VALOR_TOTAL_PRODUTO"'
      Precision = 18
      Size = 2
    end
    object qryCalculoImportoNFE_VALOR_FRETE: TIBBCDField
      FieldName = 'NFE_VALOR_FRETE'
      Origin = '"TBVENDAS"."NFE_VALOR_FRETE"'
      Precision = 18
      Size = 2
    end
    object qryCalculoImportoNFE_VALOR_SEGURO: TIBBCDField
      FieldName = 'NFE_VALOR_SEGURO'
      Origin = '"TBVENDAS"."NFE_VALOR_SEGURO"'
      Precision = 18
      Size = 2
    end
    object qryCalculoImportoNFE_VALOR_DESCONTO: TIBBCDField
      FieldName = 'NFE_VALOR_DESCONTO'
      Origin = '"TBVENDAS"."NFE_VALOR_DESCONTO"'
      Precision = 18
      Size = 2
    end
    object qryCalculoImportoNFE_VALOR_TOTAL_II: TIBBCDField
      FieldName = 'NFE_VALOR_TOTAL_II'
      Origin = '"TBVENDAS"."NFE_VALOR_TOTAL_II"'
      Precision = 18
      Size = 2
    end
    object qryCalculoImportoNFE_VALOR_TOTAL_IPI: TIBBCDField
      FieldName = 'NFE_VALOR_TOTAL_IPI'
      Origin = '"TBVENDAS"."NFE_VALOR_TOTAL_IPI"'
      Precision = 18
      Size = 2
    end
    object qryCalculoImportoNFE_VALOR_PIS: TIBBCDField
      FieldName = 'NFE_VALOR_PIS'
      Origin = '"TBVENDAS"."NFE_VALOR_PIS"'
      Precision = 18
      Size = 2
    end
    object qryCalculoImportoNFE_VALOR_COFINS: TIBBCDField
      FieldName = 'NFE_VALOR_COFINS'
      Origin = '"TBVENDAS"."NFE_VALOR_COFINS"'
      Precision = 18
      Size = 2
    end
    object qryCalculoImportoNFE_VALOR_OUTROS: TIBBCDField
      FieldName = 'NFE_VALOR_OUTROS'
      Origin = '"TBVENDAS"."NFE_VALOR_OUTROS"'
      Precision = 18
      Size = 2
    end
    object qryCalculoImportoNFE_VALOR_TOTAL_NOTA: TIBBCDField
      FieldName = 'NFE_VALOR_TOTAL_NOTA'
      Origin = '"TBVENDAS"."NFE_VALOR_TOTAL_NOTA"'
      Precision = 18
      Size = 2
    end
    object qryCalculoImportoNFE_MODALIDADE_FRETE: TSmallintField
      FieldName = 'NFE_MODALIDADE_FRETE'
      Origin = '"TBVENDAS"."NFE_MODALIDADE_FRETE"'
    end
    object qryCalculoImportoNFE_TRANSPORTADORA: TIntegerField
      FieldName = 'NFE_TRANSPORTADORA'
      Origin = '"TBVENDAS"."NFE_TRANSPORTADORA"'
    end
    object qryCalculoImportoNFE_TRANSPORTADORA_NOME: TIBStringField
      FieldName = 'NFE_TRANSPORTADORA_NOME'
      Origin = '"TBFORNECEDOR"."NOMEFORN"'
      Size = 60
    end
    object qryCalculoImportoNFE_TRANSPORTADORA_CNPJ: TIBStringField
      FieldName = 'NFE_TRANSPORTADORA_CNPJ'
      Origin = '"TBFORNECEDOR"."CNPJ"'
      Size = 18
    end
    object qryCalculoImportoNFE_TRANSPORTADORA_IEST: TIBStringField
      FieldName = 'NFE_TRANSPORTADORA_IEST'
      Origin = '"TBFORNECEDOR"."INSCEST"'
    end
    object qryCalculoImportoNFE_TRANSPORTADORA_ENDER: TIBStringField
      FieldName = 'NFE_TRANSPORTADORA_ENDER'
      Origin = '"TBFORNECEDOR"."ENDER"'
      Size = 250
    end
    object qryCalculoImportoNFE_TRANSPORTADORA_CIDADE: TIBStringField
      FieldName = 'NFE_TRANSPORTADORA_CIDADE'
      Origin = '"TBCIDADE"."CID_NOME"'
      Size = 100
    end
    object qryCalculoImportoNFE_TRANSPORTADORA_UF: TIBStringField
      FieldName = 'NFE_TRANSPORTADORA_UF'
      Origin = '"TBFORNECEDOR"."UF"'
      FixedChar = True
      Size = 2
    end
    object qryCalculoImportoNFE_PLACA_VEICULO: TIBStringField
      FieldName = 'NFE_PLACA_VEICULO'
      Origin = '"TBVENDAS"."NFE_PLACA_VEICULO"'
      Size = 10
    end
    object qryCalculoImportoNFE_PLACA_UF: TIBStringField
      FieldName = 'NFE_PLACA_UF'
      Origin = '"TBVENDAS"."NFE_PLACA_UF"'
      Size = 2
    end
    object qryCalculoImportoNFE_PLACA_RNTC: TIBStringField
      FieldName = 'NFE_PLACA_RNTC'
      Origin = '"TBVENDAS"."NFE_PLACA_RNTC"'
      Size = 10
    end
  end
  object IBSQL: TIBSQL
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    Left = 40
    Top = 328
  end
  object FrECFPooler: TfrxReport
    Version = '4.9.72'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40958.629806064810000000
    ReportOptions.LastChange = 40960.806519317130000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    OnGetValue = FrECFPoolerGetValue
    Left = 56
    Top = 120
    Datasets = <
      item
        DataSet = frdCliente
        DataSetName = 'frdCliente'
      end
      item
        DataSet = frdEmpresa
        DataSetName = 'frdEmpresa'
      end
      item
        DataSet = frdFormaPagtos
        DataSetName = 'frdFormaPagtos'
      end
      item
        DataSet = frdItens
        DataSetName = 'frdItens'
      end
      item
        DataSet = frdTitulo
        DataSetName = 'frdTitulo'
      end
      item
        DataSet = frdVenda
        DataSetName = 'frdVenda'
      end>
    Variables = <
      item
        Name = ' Local'
        Value = Null
      end
      item
        Name = 'CEPEmissor'
        Value = #39'00.000-000'#39
      end
      item
        Name = 'CNPJEmissor'
        Value = #39'00.000.000/0000-00'#39
      end
      item
        Name = 'FONEEmissor'
        Value = #39'(91)0000-0000'#39
      end
      item
        Name = 'CNPJCliente'
        Value = #39'00.000.000/0000-00'#39
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Lucida Console'
      Font.Style = []
      PaperWidth = 74.000000000000000000
      PaperHeight = 306.000000000000000000
      PaperSize = 161
      LeftMargin = 4.000000000000000000
      RightMargin = 4.000000000000000000
      TopMargin = 4.000000000000000000
      BottomMargin = 4.000000000000000000
      object bndReportTitle: TfrxReportTitle
        Height = 98.267780000000000000
        Top = 18.897650000000000000
        Width = 249.448980000000000000
        object frdEmpresaNMFANT: TfrxMemoView
          Width = 249.448980000000000000
          Height = 30.236240000000000000
          ShowHint = False
          DataField = 'NMFANT'
          DataSet = frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frdEmpresa."NMFANT"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo1: TfrxMemoView
          Top = 30.236240000000000000
          Width = 249.448980000000000000
          Height = 45.354360000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            
              '[frdEmpresa."TLG_SIGLA"] [frdEmpresa."LOG_NOME"], [frdEmpresa."N' +
              'UMERO_END"], [frdEmpresa."BAI_NOME"] [frdEmpresa."CID_NOME"]/[fr' +
              'dEmpresa."EST_SIGLA"] CEP.: [CEPEmissor]'
            'Fone: [FONEEmissor]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Top = 75.590600000000000000
          Width = 249.448980000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            'CNPJ: [CNPJEmissor] IE: [frdEmpresa."IE"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndMasterData: TfrxMasterData
        Height = 30.236240000000000000
        Top = 347.716760000000000000
        Width = 249.448980000000000000
        DataSet = frdItens
        DataSetName = 'frdItens'
        RowCount = 0
        object Memo7: TfrxMemoView
          Width = 22.677180000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Memo.UTF8 = (
            '[FormatFloat('#39'#00'#39',<Line>)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 22.677180000000000000
          Width = 37.795300000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Memo.UTF8 = (
            '[frdItens."CODPROD"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 60.472480000000000000
          Width = 188.976500000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Memo.UTF8 = (
            '[frdItens."DESCRI"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 192.756030000000000000
          Top = 15.118120000000000000
          Width = 56.692950000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<frdItens."TOTAL_LIQUIDO">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 136.063080000000000000
          Top = 15.118120000000000000
          Width = 56.692950000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<frdItens."PFINAL">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 79.370130000000000000
          Top = 15.118120000000000000
          Width = 56.692950000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.##'#39',<frdItens."QTDE">)]   x ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndHeader: TfrxHeader
        Height = 147.401670000000000000
        Top = 177.637910000000000000
        Width = 249.448980000000000000
        object Memo13: TfrxMemoView
          Top = 75.590600000000000000
          Width = 249.448980000000000000
          Height = 30.236240000000000000
          ShowHint = False
          DataSet = frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Lucida Console'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            
              '[IIF(<frdVenda."STATUS">=1,'#39'ORCAMENTO'#39',IIF(<frdVenda."STATUS">=2' +
              ','#39'ORCAMENTO'#39',IIF(<frdVenda."STATUS">=3,'#39'CUPOM NAO FISCAL'#39',IIF(<f' +
              'rdVenda."STATUS">=4,'#39'CUPOM NAO FISCAL'#39','#39'CUPOM CANCELADO'#39'))))]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'Data/Hora:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 52.913420000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Memo.UTF8 = (
            '[frdVenda."DTVENDA"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 143.622140000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'Controle:')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 185.196970000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            
              '[frdItens."ANO"][FormatFloat('#39'"/"###0000000'#39',<frdVenda."CODCONTR' +
              'OL">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Top = 18.897650000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            'Vendedor:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 52.913420000000000000
          Top = 18.897650000000000000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[frdVenda."VENDEDOR_NOME"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Top = 37.795300000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'Cliente:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 52.913420000000000000
          Top = 37.795300000000000000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Memo.UTF8 = (
            '[frdCliente."NOME"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Top = 105.826840000000000000
          Width = 22.677180000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '#')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 22.677180000000000000
          Top = 105.826840000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'C'#195#179'digo')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 60.472480000000000000
          Top = 105.826840000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'Descri'#195#167#195#163'o')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Top = 124.724490000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            'Quant. ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 136.063080000000000000
          Top = 124.724490000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            'Valor Un. ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 192.756030000000000000
          Top = 124.724490000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            'Total ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Top = 56.692950000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'CPF/CNPJ:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Left = 52.913420000000000000
          Top = 56.692950000000000000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Memo.UTF8 = (
            '[CNPJCliente]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndReportSummary: TfrxReportSummary
        Height = 117.165430000000000000
        Top = 438.425480000000000000
        Width = 249.448980000000000000
        object Memo17: TfrxMemoView
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftTop]
          Memo.UTF8 = (
            'TOTAL')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 132.283550000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<frdVenda."TOTALVENDABRUTA">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Top = 18.897650000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            'TOTAL DESCONTO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 132.283550000000000000
          Top = 18.897650000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Lucida Console'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<frdVenda."DESCONTO">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Top = 37.795300000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[IIF(<frdVenda."STATUS">>2,'#39'TOTAL PAGO'#39','#39'TOTAL A PAGAR'#39')]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 132.283550000000000000
          Top = 37.795300000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<frdVenda."TOTALVENDA">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Top = 56.692950000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'Forma Pagto.:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 64.252010000000000000
          Top = 56.692950000000000000
          Width = 185.196970000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Memo.UTF8 = (
            '[frdVenda."LISTA_FORMA_PAGO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Top = 75.590600000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            'Cond. Pagto.:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 64.252010000000000000
          Top = 75.590600000000000000
          Width = 185.196970000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[frdVenda."LISTA_COND_PAGO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Top = 94.488250000000000000
          Width = 249.448980000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            'Impresso em [Date] '#195#160's [Time]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
    end
  end
  object qryFormaPagtos: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    SQL.Strings = (
      'Select'
      '    v.formapagto_cod'
      '  , fp.Descri'
      '  , fp.Acrescimo'
      '  , fp.FormaPagto_NFCe'
      '  , fp.Formapagto_PDV'
      '  , fp.Formapagto_PDV_Cupom_Extra'
      '  , v.Condicaopagto_cod'
      '  , cp.Cond_descricao'
      '  , cp.Cond_descricao_full'
      '  , cp.Cond_descricao_pdv'
      '  , v.Venda_prazo'
      '  , v.valor_fpagto'
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
      ''
      'from TBVENDAS_FORMAPAGTO v'
      '  inner join TBFORMPAGTO fp on (fp.Cod = v.Formapagto_cod)'
      
        '  inner join VW_CONDICAOPAGTO cp on (cp.Cond_cod = v.Condicaopag' +
        'to_cod)'
      'where v.ano_venda      = :anovenda'
      '  and v.controle_venda = :numvenda')
    Left = 144
    Top = 264
    ParamData = <
      item
        DataType = ftInteger
        Name = 'AnoVenda'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'NumVenda'
        ParamType = ptInput
        Value = 0
      end>
    object qryFormaPagtosFORMAPAGTO_COD: TSmallintField
      FieldName = 'FORMAPAGTO_COD'
      Origin = '"TBVENDAS_FORMAPAGTO"."FORMAPAGTO_COD"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryFormaPagtosDESCRI: TIBStringField
      FieldName = 'DESCRI'
      Origin = '"TBFORMPAGTO"."DESCRI"'
      Size = 30
    end
    object qryFormaPagtosACRESCIMO: TFloatField
      FieldName = 'ACRESCIMO'
      Origin = '"TBFORMPAGTO"."ACRESCIMO"'
    end
    object qryFormaPagtosFORMAPAGTO_NFCE: TIBStringField
      FieldName = 'FORMAPAGTO_NFCE'
      Origin = '"TBFORMPAGTO"."FORMAPAGTO_NFCE"'
      Size = 2
    end
    object qryFormaPagtosFORMAPAGTO_PDV: TSmallintField
      FieldName = 'FORMAPAGTO_PDV'
      Origin = '"TBFORMPAGTO"."FORMAPAGTO_PDV"'
    end
    object qryFormaPagtosFORMAPAGTO_PDV_CUPOM_EXTRA: TSmallintField
      FieldName = 'FORMAPAGTO_PDV_CUPOM_EXTRA'
      Origin = '"TBFORMPAGTO"."FORMAPAGTO_PDV_CUPOM_EXTRA"'
    end
    object qryFormaPagtosCONDICAOPAGTO_COD: TSmallintField
      FieldName = 'CONDICAOPAGTO_COD'
      Origin = '"TBVENDAS_FORMAPAGTO"."CONDICAOPAGTO_COD"'
    end
    object qryFormaPagtosCOND_DESCRICAO: TIBStringField
      FieldName = 'COND_DESCRICAO'
      Origin = '"VW_CONDICAOPAGTO"."COND_DESCRICAO"'
      Size = 80
    end
    object qryFormaPagtosCOND_DESCRICAO_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'COND_DESCRICAO_FULL'
      Origin = '"VW_CONDICAOPAGTO"."COND_DESCRICAO_FULL"'
      ProviderFlags = []
      ReadOnly = True
      Size = 177
    end
    object qryFormaPagtosCOND_DESCRICAO_PDV: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'COND_DESCRICAO_PDV'
      Origin = '"VW_CONDICAOPAGTO"."COND_DESCRICAO_PDV"'
      ProviderFlags = []
      ReadOnly = True
      Size = 12
    end
    object qryFormaPagtosVENDA_PRAZO: TSmallintField
      FieldName = 'VENDA_PRAZO'
      Origin = '"TBVENDAS_FORMAPAGTO"."VENDA_PRAZO"'
    end
    object qryFormaPagtosVALOR_FPAGTO: TIBBCDField
      FieldName = 'VALOR_FPAGTO'
      Origin = '"TBVENDAS_FORMAPAGTO"."VALOR_FPAGTO"'
      Precision = 18
      Size = 2
    end
    object qryFormaPagtosPRAZO_01: TSmallintField
      FieldName = 'PRAZO_01'
      Origin = '"TBVENDAS_FORMAPAGTO"."PRAZO_01"'
    end
    object qryFormaPagtosPRAZO_02: TSmallintField
      FieldName = 'PRAZO_02'
      Origin = '"TBVENDAS_FORMAPAGTO"."PRAZO_02"'
    end
    object qryFormaPagtosPRAZO_03: TSmallintField
      FieldName = 'PRAZO_03'
      Origin = '"TBVENDAS_FORMAPAGTO"."PRAZO_03"'
    end
    object qryFormaPagtosPRAZO_04: TSmallintField
      FieldName = 'PRAZO_04'
      Origin = '"TBVENDAS_FORMAPAGTO"."PRAZO_04"'
    end
    object qryFormaPagtosPRAZO_05: TSmallintField
      FieldName = 'PRAZO_05'
      Origin = '"TBVENDAS_FORMAPAGTO"."PRAZO_05"'
    end
    object qryFormaPagtosPRAZO_06: TSmallintField
      FieldName = 'PRAZO_06'
      Origin = '"TBVENDAS_FORMAPAGTO"."PRAZO_06"'
    end
    object qryFormaPagtosPRAZO_07: TSmallintField
      FieldName = 'PRAZO_07'
      Origin = '"TBVENDAS_FORMAPAGTO"."PRAZO_07"'
    end
    object qryFormaPagtosPRAZO_08: TSmallintField
      FieldName = 'PRAZO_08'
      Origin = '"TBVENDAS_FORMAPAGTO"."PRAZO_08"'
    end
    object qryFormaPagtosPRAZO_09: TSmallintField
      FieldName = 'PRAZO_09'
      Origin = '"TBVENDAS_FORMAPAGTO"."PRAZO_09"'
    end
    object qryFormaPagtosPRAZO_10: TSmallintField
      FieldName = 'PRAZO_10'
      Origin = '"TBVENDAS_FORMAPAGTO"."PRAZO_10"'
    end
    object qryFormaPagtosPRAZO_11: TSmallintField
      FieldName = 'PRAZO_11'
      Origin = '"TBVENDAS_FORMAPAGTO"."PRAZO_11"'
    end
    object qryFormaPagtosPRAZO_12: TSmallintField
      FieldName = 'PRAZO_12'
      Origin = '"TBVENDAS_FORMAPAGTO"."PRAZO_12"'
    end
  end
  object frdFormaPagtos: TfrxDBDataset
    UserName = 'frdFormaPagtos'
    CloseDataSource = False
    FieldAliases.Strings = (
      'FORMAPAGTO_COD=FORMAPAGTO_COD'
      'DESCRI=DESCRI'
      'ACRESCIMO=ACRESCIMO'
      'FORMAPAGTO_NFCE=FORMAPAGTO_NFCE'
      'FORMAPAGTO_PDV=FORMAPAGTO_PDV'
      'FORMAPAGTO_PDV_CUPOM_EXTRA=FORMAPAGTO_PDV_CUPOM_EXTRA'
      'CONDICAOPAGTO_COD=CONDICAOPAGTO_COD'
      'COND_DESCRICAO=COND_DESCRICAO'
      'COND_DESCRICAO_FULL=COND_DESCRICAO_FULL'
      'VENDA_PRAZO=VENDA_PRAZO'
      'VALOR_FPAGTO=VALOR_FPAGTO'
      'PRAZO_01=PRAZO_01'
      'PRAZO_02=PRAZO_02'
      'PRAZO_03=PRAZO_03'
      'PRAZO_04=PRAZO_04'
      'PRAZO_05=PRAZO_05'
      'PRAZO_06=PRAZO_06'
      'PRAZO_07=PRAZO_07'
      'PRAZO_08=PRAZO_08'
      'PRAZO_09=PRAZO_09'
      'PRAZO_10=PRAZO_10'
      'PRAZO_11=PRAZO_11'
      'PRAZO_12=PRAZO_12')
    DataSet = qryFormaPagtos
    BCDToCurrency = False
    Left = 180
    Top = 265
  end
  object qryFornecedorDestinatario: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    SQL.Strings = (
      'Select'
      '    f.codforn as Codigo'
      '  , f.pessoa_fisica'
      '  , f.cnpj'
      '  , f.nomeforn as Nome'
      '  , f.inscest'
      '  , f.inscmun'
      ''
      '  , f.fone'
      '  , f.email'
      '  , f.site'
      ''
      '  , f.tlg_tipo'
      '  , tl.Tlg_descricao'
      '  , tl.Tlg_sigla'
      '  , f.log_cod'
      '  , lg.Log_nome'
      '  , f.complemento'
      '  , f.numero_end'
      '  , f.cep'
      ''
      '  , f.bai_cod'
      '  , br.Bai_nome'
      ''
      '  , f.cid_cod'
      '  , cd.Cid_nome'
      '  , cd.Cid_siafi'
      '  , cd.Cid_ibge'
      '  , cd.Cid_ddd'
      ''
      '  , f.est_cod'
      '  , uf.Est_nome'
      '  , uf.Est_sigla'
      '  , uf.Est_siafi'
      ''
      '  , f.pais_id'
      '  , pa.Pais_nome'
      'from TBFORNECEDOR f'
      '  left join TBESTADO uf on (uf.Est_cod = f.Est_cod)'
      '  left join TBCIDADE cd on (cd.Cid_cod = f.Cid_cod)'
      '  left join TBBAIRRO br on (br.Bai_cod = f.Bai_cod)'
      '  left join TBLOGRADOURO lg on (lg.Log_cod = f.Log_cod)'
      '  left join TBTIPO_LoGRADOURO tl on (tl.Tlg_cod = f.Tlg_tipo)'
      '  left Join TBPAIS pa on (pa.Pais_id = f.Pais_id)'
      'where f.Codforn = :Codigo')
    Left = 224
    Top = 72
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Codigo'
        ParamType = ptInput
        Value = 0
      end>
    object qryFornecedorDestinatarioCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = '"TBFORNECEDOR"."CODFORN"'
      Required = True
    end
    object qryFornecedorDestinatarioPESSOA_FISICA: TSmallintField
      FieldName = 'PESSOA_FISICA'
      Origin = '"TBFORNECEDOR"."PESSOA_FISICA"'
    end
    object qryFornecedorDestinatarioCNPJ: TIBStringField
      FieldName = 'CNPJ'
      Origin = '"TBFORNECEDOR"."CNPJ"'
      Size = 18
    end
    object qryFornecedorDestinatarioNOME: TIBStringField
      FieldName = 'NOME'
      Origin = '"TBFORNECEDOR"."NOMEFORN"'
      Size = 60
    end
    object qryFornecedorDestinatarioINSCEST: TIBStringField
      FieldName = 'INSCEST'
      Origin = '"TBFORNECEDOR"."INSCEST"'
    end
    object qryFornecedorDestinatarioINSCMUN: TIBStringField
      FieldName = 'INSCMUN'
      Origin = '"TBFORNECEDOR"."INSCMUN"'
    end
    object qryFornecedorDestinatarioFONE: TIBStringField
      FieldName = 'FONE'
      Origin = '"TBFORNECEDOR"."FONE"'
      Size = 11
    end
    object qryFornecedorDestinatarioEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = '"TBFORNECEDOR"."EMAIL"'
      Size = 40
    end
    object qryFornecedorDestinatarioSITE: TIBStringField
      FieldName = 'SITE'
      Origin = '"TBFORNECEDOR"."SITE"'
      Size = 35
    end
    object qryFornecedorDestinatarioTLG_TIPO: TSmallintField
      FieldName = 'TLG_TIPO'
      Origin = '"TBFORNECEDOR"."TLG_TIPO"'
    end
    object qryFornecedorDestinatarioTLG_DESCRICAO: TIBStringField
      FieldName = 'TLG_DESCRICAO'
      Origin = '"TBTIPO_LOGRADOURO"."TLG_DESCRICAO"'
      Size = 50
    end
    object qryFornecedorDestinatarioTLG_SIGLA: TIBStringField
      FieldName = 'TLG_SIGLA'
      Origin = '"TBTIPO_LOGRADOURO"."TLG_SIGLA"'
      Size = 10
    end
    object qryFornecedorDestinatarioLOG_COD: TIntegerField
      FieldName = 'LOG_COD'
      Origin = '"TBFORNECEDOR"."LOG_COD"'
    end
    object qryFornecedorDestinatarioLOG_NOME: TIBStringField
      FieldName = 'LOG_NOME'
      Origin = '"TBLOGRADOURO"."LOG_NOME"'
      Size = 250
    end
    object qryFornecedorDestinatarioCOMPLEMENTO: TIBStringField
      FieldName = 'COMPLEMENTO'
      Origin = '"TBFORNECEDOR"."COMPLEMENTO"'
      Size = 50
    end
    object qryFornecedorDestinatarioNUMERO_END: TIBStringField
      FieldName = 'NUMERO_END'
      Origin = '"TBFORNECEDOR"."NUMERO_END"'
      Size = 10
    end
    object qryFornecedorDestinatarioCEP: TIBStringField
      FieldName = 'CEP'
      Origin = '"TBFORNECEDOR"."CEP"'
      Size = 8
    end
    object qryFornecedorDestinatarioBAI_COD: TIntegerField
      FieldName = 'BAI_COD'
      Origin = '"TBFORNECEDOR"."BAI_COD"'
    end
    object qryFornecedorDestinatarioBAI_NOME: TIBStringField
      FieldName = 'BAI_NOME'
      Origin = '"TBBAIRRO"."BAI_NOME"'
      Size = 100
    end
    object qryFornecedorDestinatarioCID_COD: TIntegerField
      FieldName = 'CID_COD'
      Origin = '"TBFORNECEDOR"."CID_COD"'
    end
    object qryFornecedorDestinatarioCID_NOME: TIBStringField
      FieldName = 'CID_NOME'
      Origin = '"TBCIDADE"."CID_NOME"'
      Size = 100
    end
    object qryFornecedorDestinatarioCID_SIAFI: TIntegerField
      FieldName = 'CID_SIAFI'
      Origin = '"TBCIDADE"."CID_SIAFI"'
    end
    object qryFornecedorDestinatarioCID_IBGE: TIntegerField
      FieldName = 'CID_IBGE'
      Origin = '"TBCIDADE"."CID_IBGE"'
    end
    object qryFornecedorDestinatarioCID_DDD: TSmallintField
      FieldName = 'CID_DDD'
      Origin = '"TBCIDADE"."CID_DDD"'
    end
    object qryFornecedorDestinatarioEST_COD: TSmallintField
      FieldName = 'EST_COD'
      Origin = '"TBFORNECEDOR"."EST_COD"'
    end
    object qryFornecedorDestinatarioEST_NOME: TIBStringField
      FieldName = 'EST_NOME'
      Origin = '"TBESTADO"."EST_NOME"'
      Size = 100
    end
    object qryFornecedorDestinatarioEST_SIGLA: TIBStringField
      FieldName = 'EST_SIGLA'
      Origin = '"TBESTADO"."EST_SIGLA"'
      Size = 2
    end
    object qryFornecedorDestinatarioEST_SIAFI: TIntegerField
      FieldName = 'EST_SIAFI'
      Origin = '"TBESTADO"."EST_SIAFI"'
    end
    object qryFornecedorDestinatarioPAIS_ID: TIBStringField
      FieldName = 'PAIS_ID'
      Origin = '"TBFORNECEDOR"."PAIS_ID"'
      Size = 5
    end
    object qryFornecedorDestinatarioPAIS_NOME: TIBStringField
      FieldName = 'PAIS_NOME'
      Origin = '"TBPAIS"."PAIS_NOME"'
      Size = 150
    end
  end
  object frdFornecedor: TfrxDBDataset
    UserName = 'frdFornecedor'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CODIGO=CODIGO'
      'PESSOA_FISICA=PESSOA_FISICA'
      'CNPJ=CNPJ'
      'NOME=NOME'
      'INSCEST=INSCEST'
      'INSCMUN=INSCMUN'
      'FONE=FONE'
      'EMAIL=EMAIL'
      'SITE=SITE'
      'TLG_TIPO=TLG_TIPO'
      'TLG_DESCRICAO=TLG_DESCRICAO'
      'TLG_SIGLA=TLG_SIGLA'
      'LOG_COD=LOG_COD'
      'LOG_NOME=LOG_NOME'
      'COMPLEMENTO=COMPLEMENTO'
      'NUMERO_END=NUMERO_END'
      'CEP=CEP'
      'BAI_COD=BAI_COD'
      'BAI_NOME=BAI_NOME'
      'CID_COD=CID_COD'
      'CID_NOME=CID_NOME'
      'CID_SIAFI=CID_SIAFI'
      'CID_IBGE=CID_IBGE'
      'CID_DDD=CID_DDD'
      'EST_COD=EST_COD'
      'EST_NOME=EST_NOME'
      'EST_SIGLA=EST_SIGLA'
      'EST_SIAFI=EST_SIAFI'
      'PAIS_ID=PAIS_ID'
      'PAIS_NOME=PAIS_NOME')
    DataSet = qryFornecedorDestinatario
    BCDToCurrency = False
    Left = 264
    Top = 72
  end
  object frdEntrada: TfrxDBDataset
    UserName = 'frdEntrada'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ANO=ANO'
      'CODCONTROL=CODCONTROL'
      'CODEMP=CODEMP'
      'CODFORN=CODFORN'
      'CODFORN_CNPJ=CODFORN_CNPJ'
      'DTENT=DTENT'
      'STATUS=STATUS'
      'DESCONTO=DESCONTO'
      'DTFINALIZACAO_COMPRA=DTFINALIZACAO_COMPRA'
      'OBS=OBS'
      'SERIE=SERIE'
      'NF=NF'
      'LOTE_NFE_ANO=LOTE_NFE_ANO'
      'LOTE_NFE_NUMERO=LOTE_NFE_NUMERO'
      'NFE_ENVIADA=NFE_ENVIADA'
      'DATAEMISSAO=DATAEMISSAO'
      'HORAEMISSAO=HORAEMISSAO'
      'CANCEL_USUARIO=CANCEL_USUARIO'
      'CANCEL_DATAHORA=CANCEL_DATAHORA'
      'CANCEL_MOTIVO=CANCEL_MOTIVO'
      'CFOP=CFOP'
      'CFOP_DESCRICAO=CFOP_DESCRICAO'
      'VERIFICADOR_NFE=VERIFICADOR_NFE'
      'XML_NFE_FILENAME=XML_NFE_FILENAME'
      'XML_NFE=XML_NFE'
      'USUARIO=USUARIO'
      'USUARIO_NOME_COMPLETO=USUARIO_NOME_COMPLETO'
      'USUARIO_FUNCAO=USUARIO_FUNCAO'
      'FORMA_PAGO=FORMA_PAGO'
      'COND_PAGO=COND_PAGO'
      'COND_PAGO_FULL=COND_PAGO_FULL'
      'COMPRA_PRAZO=COMPRA_PRAZO'
      'NFE_VALOR_BASE_ICMS=NFE_VALOR_BASE_ICMS'
      'NFE_VALOR_ICMS=NFE_VALOR_ICMS'
      'NFE_VALOR_BASE_ICMS_SUBST=NFE_VALOR_BASE_ICMS_SUBST'
      'NFE_VALOR_ICMS_SUBST=NFE_VALOR_ICMS_SUBST'
      'NFE_VALOR_TOTAL_PRODUTO=NFE_VALOR_TOTAL_PRODUTO'
      'NFE_VALOR_FRETE=NFE_VALOR_FRETE'
      'NFE_VALOR_SEGURO=NFE_VALOR_SEGURO'
      'NFE_VALOR_DESCONTO=NFE_VALOR_DESCONTO'
      'NFE_VALOR_TOTAL_II=NFE_VALOR_TOTAL_II'
      'NFE_VALOR_TOTAL_IPI=NFE_VALOR_TOTAL_IPI'
      'NFE_VALOR_PIS=NFE_VALOR_PIS'
      'NFE_VALOR_COFINS=NFE_VALOR_COFINS'
      'NFE_VALOR_OUTROS=NFE_VALOR_OUTROS'
      'NFE_VALOR_TOTAL_NOTA=NFE_VALOR_TOTAL_NOTA')
    DataSet = qryEntradaCalculoImporto
    BCDToCurrency = False
    Left = 264
    Top = 120
  end
  object qryEntradaCalculoImporto: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    ForcedRefresh = True
    CachedUpdates = True
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'Select'
      '    c.Ano'
      '  , c.Codcontrol'
      '  , c.Codemp'
      '  , c.codforn'
      '  , f.cnpj as codforn_cnpj'
      '  , c.dtent'
      '  , c.status'
      '  , c.desconto'
      '  , c.dtfinalizacao_compra'
      '  , c.obs'
      '  , c.nfserie as Serie'
      '  , c.nf'
      '  , c.Lote_nfe_ano'
      '  , c.Lote_nfe_numero'
      '  , c.Nfe_enviada'
      '  , c.dtemiss as Dataemissao'
      '  , c.hremiss as Horaemissao'
      '  , c.Cancel_usuario'
      '  , c.Cancel_datahora'
      '  , c.Cancel_motivo'
      '  , c.nfcfop as Cfop'
      '  , cf.Cfop_descricao'
      '  , cf.cfop_informacao_fisco'
      '  , c.Verificador_nfe'
      '  , c.Xml_nfe_filename'
      '  , c.Xml_nfe'
      '  , c.Usuario'
      '  , usr.nome_completo  as usuario_nome_completo'
      '  , usr.funcao_usuario as usuario_funcao'
      ''
      '  , fp.descri as forma_pago'
      '  , cp.cond_descricao as cond_pago'
      '  , cp.cond_descricao_full as cond_pago_full'
      ''
      '  , c.compra_prazo'
      '  , c.icmsbase  as Nfe_valor_base_icms'
      '  , c.icmsvalor as Nfe_valor_icms'
      '  , c.icmssubstbase  as Nfe_valor_base_icms_subst'
      '  , c.icmssubstvalor as Nfe_valor_icms_subst'
      '  , c.totalprod   as Nfe_valor_total_produto'
      '  , c.frete       as Nfe_valor_frete'
      '  , c.valorseguro as Nfe_valor_seguro'
      '  , c.desconto    as Nfe_valor_desconto'
      '  , c.valortotal_ii  as Nfe_valor_total_ii'
      '  , c.valortotal_ipi as Nfe_valor_total_ipi'
      '  , c.valorpis     as Nfe_valor_pis'
      '  , c.valorcofins  as Nfe_valor_cofins'
      '  , c.outroscustos as Nfe_valor_outros'
      '  , c.totalnf      as Nfe_valor_total_nota'
      ''
      'from TBCOMPRAS c'
      '  inner join TBCFOP cf on (cf.Cfop_cod = c.nfcfop)'
      '  inner join TBFORMPAGTO fp on (fp.cod = c.formapagto_cod)'
      
        '  inner join VW_CONDICAOPAGTO cp on (cp.cond_cod = c.condicaopag' +
        'to_cod)'
      '  inner join TBFORNECEDOR f on (f.codforn = c.codforn)'
      '  left join ('
      '    Select'
      '        cast(u.nome as varchar(50)) as Usuario'
      '      , u.nomecompleto as nome_completo'
      '      , fu.funcao as funcao_usuario'
      '    from TBUSERS u'
      '      left join TBFUNCAO fu on (fu.cod = u.codfuncao)'
      '  ) usr on (usr.usuario = c.usuario)'
      'where c.ano = :anocompra'
      '  and c.codcontrol = :numcompra')
    ModifySQL.Strings = (
      '')
    GeneratorField.ApplyEvent = gamOnPost
    Left = 224
    Top = 120
    object qryEntradaCalculoImportoANO: TSmallintField
      FieldName = 'ANO'
      Origin = '"TBCOMPRAS"."ANO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryEntradaCalculoImportoCODCONTROL: TIntegerField
      FieldName = 'CODCONTROL'
      Origin = '"TBCOMPRAS"."CODCONTROL"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryEntradaCalculoImportoCODEMP: TIBStringField
      FieldName = 'CODEMP'
      Origin = '"TBCOMPRAS"."CODEMP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 18
    end
    object qryEntradaCalculoImportoCODFORN: TIntegerField
      FieldName = 'CODFORN'
      Origin = '"TBCOMPRAS"."CODFORN"'
    end
    object qryEntradaCalculoImportoCODFORN_CNPJ: TIBStringField
      FieldName = 'CODFORN_CNPJ'
      Origin = '"TBFORNECEDOR"."CNPJ"'
      Size = 18
    end
    object qryEntradaCalculoImportoDTENT: TDateField
      FieldName = 'DTENT'
      Origin = '"TBCOMPRAS"."DTENT"'
    end
    object qryEntradaCalculoImportoSTATUS: TSmallintField
      FieldName = 'STATUS'
      Origin = '"TBCOMPRAS"."STATUS"'
    end
    object qryEntradaCalculoImportoDESCONTO: TIBBCDField
      FieldName = 'DESCONTO'
      Origin = '"TBCOMPRAS"."DESCONTO"'
      Precision = 18
      Size = 2
    end
    object qryEntradaCalculoImportoDTFINALIZACAO_COMPRA: TDateTimeField
      FieldName = 'DTFINALIZACAO_COMPRA'
      Origin = '"TBCOMPRAS"."DTFINALIZACAO_COMPRA"'
    end
    object qryEntradaCalculoImportoOBS: TMemoField
      FieldName = 'OBS'
      Origin = '"TBCOMPRAS"."OBS"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object qryEntradaCalculoImportoSERIE: TIBStringField
      FieldName = 'SERIE'
      Origin = '"TBCOMPRAS"."NFSERIE"'
      FixedChar = True
      Size = 1
    end
    object qryEntradaCalculoImportoNF: TIntegerField
      FieldName = 'NF'
      Origin = '"TBCOMPRAS"."NF"'
      Required = True
    end
    object qryEntradaCalculoImportoLOTE_NFE_ANO: TSmallintField
      FieldName = 'LOTE_NFE_ANO'
      Origin = '"TBCOMPRAS"."LOTE_NFE_ANO"'
    end
    object qryEntradaCalculoImportoLOTE_NFE_NUMERO: TIntegerField
      FieldName = 'LOTE_NFE_NUMERO'
      Origin = '"TBCOMPRAS"."LOTE_NFE_NUMERO"'
    end
    object qryEntradaCalculoImportoNFE_ENVIADA: TSmallintField
      FieldName = 'NFE_ENVIADA'
      Origin = '"TBCOMPRAS"."NFE_ENVIADA"'
    end
    object qryEntradaCalculoImportoDATAEMISSAO: TDateField
      FieldName = 'DATAEMISSAO'
      Origin = '"TBCOMPRAS"."DTEMISS"'
    end
    object qryEntradaCalculoImportoHORAEMISSAO: TTimeField
      FieldName = 'HORAEMISSAO'
      ProviderFlags = []
    end
    object qryEntradaCalculoImportoCANCEL_USUARIO: TIBStringField
      FieldName = 'CANCEL_USUARIO'
      Origin = '"TBCOMPRAS"."CANCEL_USUARIO"'
      Size = 50
    end
    object qryEntradaCalculoImportoCANCEL_DATAHORA: TDateTimeField
      FieldName = 'CANCEL_DATAHORA'
      Origin = '"TBCOMPRAS"."CANCEL_DATAHORA"'
    end
    object qryEntradaCalculoImportoCANCEL_MOTIVO: TMemoField
      FieldName = 'CANCEL_MOTIVO'
      Origin = '"TBCOMPRAS"."CANCEL_MOTIVO"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object qryEntradaCalculoImportoCFOP: TIntegerField
      FieldName = 'CFOP'
      Origin = '"TBCOMPRAS"."NFCFOP"'
    end
    object qryEntradaCalculoImportoCFOP_DESCRICAO: TIBStringField
      FieldName = 'CFOP_DESCRICAO'
      Origin = '"TBCFOP"."CFOP_DESCRICAO"'
      Size = 250
    end
    object qryEntradaCalculoImportoCFOP_INFORMACAO_FISCO: TIBStringField
      FieldName = 'CFOP_INFORMACAO_FISCO'
      Origin = '"TBCFOP"."CFOP_INFORMACAO_FISCO"'
      ProviderFlags = []
      Size = 250
    end
    object qryEntradaCalculoImportoVERIFICADOR_NFE: TIBStringField
      FieldName = 'VERIFICADOR_NFE'
      Origin = '"TBCOMPRAS"."VERIFICADOR_NFE"'
      Size = 250
    end
    object qryEntradaCalculoImportoXML_NFE_FILENAME: TIBStringField
      FieldName = 'XML_NFE_FILENAME'
      Origin = '"TBCOMPRAS"."XML_NFE_FILENAME"'
      Size = 250
    end
    object qryEntradaCalculoImportoXML_NFE: TMemoField
      FieldName = 'XML_NFE'
      Origin = '"TBCOMPRAS"."XML_NFE"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object qryEntradaCalculoImportoUSUARIO: TIBStringField
      FieldName = 'USUARIO'
      Origin = '"TBCOMPRAS"."USUARIO"'
      Size = 50
    end
    object qryEntradaCalculoImportoUSUARIO_NOME_COMPLETO: TIBStringField
      FieldName = 'USUARIO_NOME_COMPLETO'
      ProviderFlags = []
      Size = 60
    end
    object qryEntradaCalculoImportoUSUARIO_FUNCAO: TIBStringField
      FieldName = 'USUARIO_FUNCAO'
      ProviderFlags = []
      Size = 25
    end
    object qryEntradaCalculoImportoFORMA_PAGO: TIBStringField
      FieldName = 'FORMA_PAGO'
      Origin = '"TBFORMPAGTO"."DESCRI"'
      Size = 30
    end
    object qryEntradaCalculoImportoCOND_PAGO: TIBStringField
      FieldName = 'COND_PAGO'
      Origin = '"VW_CONDICAOPAGTO"."COND_DESCRICAO"'
      Size = 80
    end
    object qryEntradaCalculoImportoCOND_PAGO_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'COND_PAGO_FULL'
      Origin = '"VW_CONDICAOPAGTO"."COND_DESCRICAO_FULL"'
      ReadOnly = True
      Size = 177
    end
    object qryEntradaCalculoImportoCOMPRA_PRAZO: TSmallintField
      FieldName = 'COMPRA_PRAZO'
      Origin = '"TBCOMPRAS"."COMPRA_PRAZO"'
    end
    object qryEntradaCalculoImportoNFE_VALOR_BASE_ICMS: TIBBCDField
      FieldName = 'NFE_VALOR_BASE_ICMS'
      Origin = '"TBCOMPRAS"."ICMSBASE"'
      Precision = 18
      Size = 2
    end
    object qryEntradaCalculoImportoNFE_VALOR_ICMS: TIBBCDField
      FieldName = 'NFE_VALOR_ICMS'
      Origin = '"TBCOMPRAS"."ICMSVALOR"'
      Precision = 18
      Size = 2
    end
    object qryEntradaCalculoImportoNFE_VALOR_BASE_ICMS_SUBST: TIBBCDField
      FieldName = 'NFE_VALOR_BASE_ICMS_SUBST'
      Origin = '"TBCOMPRAS"."ICMSSUBSTBASE"'
      Precision = 18
      Size = 2
    end
    object qryEntradaCalculoImportoNFE_VALOR_ICMS_SUBST: TIBBCDField
      FieldName = 'NFE_VALOR_ICMS_SUBST'
      Origin = '"TBCOMPRAS"."ICMSSUBSTVALOR"'
      Precision = 18
      Size = 2
    end
    object qryEntradaCalculoImportoNFE_VALOR_TOTAL_PRODUTO: TIBBCDField
      FieldName = 'NFE_VALOR_TOTAL_PRODUTO'
      Origin = '"TBCOMPRAS"."TOTALPROD"'
      Precision = 18
      Size = 2
    end
    object qryEntradaCalculoImportoNFE_VALOR_FRETE: TIBBCDField
      FieldName = 'NFE_VALOR_FRETE'
      Origin = '"TBCOMPRAS"."FRETE"'
      Precision = 18
      Size = 2
    end
    object qryEntradaCalculoImportoNFE_VALOR_SEGURO: TIBBCDField
      FieldName = 'NFE_VALOR_SEGURO'
      Origin = '"TBCOMPRAS"."VALORSEGURO"'
      Precision = 18
      Size = 2
    end
    object qryEntradaCalculoImportoNFE_VALOR_DESCONTO: TIBBCDField
      FieldName = 'NFE_VALOR_DESCONTO'
      Origin = '"TBCOMPRAS"."DESCONTO"'
      Precision = 18
      Size = 2
    end
    object qryEntradaCalculoImportoNFE_VALOR_TOTAL_II: TIBBCDField
      FieldName = 'NFE_VALOR_TOTAL_II'
      Origin = '"TBCOMPRAS"."VALORTOTAL_II"'
      Precision = 18
      Size = 2
    end
    object qryEntradaCalculoImportoNFE_VALOR_TOTAL_IPI: TIBBCDField
      FieldName = 'NFE_VALOR_TOTAL_IPI'
      Origin = '"TBCOMPRAS"."VALORTOTAL_IPI"'
      Precision = 18
      Size = 2
    end
    object qryEntradaCalculoImportoNFE_VALOR_PIS: TIBBCDField
      FieldName = 'NFE_VALOR_PIS'
      Origin = '"TBCOMPRAS"."VALORPIS"'
      Precision = 18
      Size = 2
    end
    object qryEntradaCalculoImportoNFE_VALOR_COFINS: TIBBCDField
      FieldName = 'NFE_VALOR_COFINS'
      Origin = '"TBCOMPRAS"."VALORCOFINS"'
      Precision = 18
      Size = 2
    end
    object qryEntradaCalculoImportoNFE_VALOR_OUTROS: TIBBCDField
      FieldName = 'NFE_VALOR_OUTROS'
      Origin = '"TBCOMPRAS"."OUTROSCUSTOS"'
      Precision = 18
      Size = 2
    end
    object qryEntradaCalculoImportoNFE_VALOR_TOTAL_NOTA: TIBBCDField
      FieldName = 'NFE_VALOR_TOTAL_NOTA'
      Origin = '"TBCOMPRAS"."TOTALNF"'
      Precision = 18
      Size = 2
    end
  end
  object qryEntradaDadosProduto: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    SQL.Strings = (
      'Select'
      '    i.Ano'
      '  , i.Codcontrol'
      '  , i.Seq'
      '  , i.Codprod'
      '  , p.Codbarra_ean'
      '  , p.Descri'
      '  , p.Apresentacao'
      
        '  , coalesce(p.Descri_apresentacao, p.Descri) as Descri_apresent' +
        'acao'
      '  , p.Modelo'
      '  , p.Referencia'
      '  , p.Ncm_sh'
      '  , ib.aliqnacional_ibpt as Ncm_aliquota_nac'
      '  , ib.aliqinternacional_ibpt as Ncm_aliquota_imp'
      '  , p.Codorigem'
      '  , p.Codtributacao'
      '  , p.Cst'
      '  , p.Csosn'
      '  , p.Cst_pis'
      '  , p.Cst_cofins'
      '  , coalesce(ps.Indice_acbr, 32) as Cst_pis_indice_ACBr'
      '  , coalesce(cs.Indice_acbr, 32) as Cst_cofins_indice_ACBr'
      '  , i.Codemp'
      '  , i.codforn'
      '  , f.cnpj as codforn_cnpj'
      '  , i.dtent'
      '  , i.Qtde'
      
        '--  , ( coalesce(i.precounit, 0) + (coalesce(i.valor_desconto, 0' +
        ') / coalesce(i.Qtde, 1)) ) as PUNIT'
      '  , i.precounit as PUNIT'
      
        '  , ( (coalesce(i.valor_desconto, 0) / coalesce(i.Qtde, 1)) / (c' +
        'oalesce(i.precounit, 0) + (coalesce(i.valor_desconto, 0) / coale' +
        'sce(i.Qtde, 1))) * 100 ) as Desconto'
      
        '  , ( coalesce(i.valor_desconto, 0) / coalesce(i.Qtde, 1) ) as d' +
        'esconto_valor'
      '  , i.customedio as PFINAL'
      '  , i.Qtdefinal'
      '  , i.Unid_cod'
      '  , u.Unp_descricao'
      '  , u.Unp_sigla'
      '  , i.Cfop as Cfop_cod'
      '  , i.Aliquota'
      '  , i.Aliquota_csosn'
      '  , coalesce(i.Aliquota_pis, 0.0) as Aliquota_pis'
      '  , coalesce(i.Aliquota_cofins, 0.0) as Aliquota_cofins'
      '  , i.Valor_ipi'
      
        '  , coalesce(i.Percentual_reducao_bc, 0.0) as Percentual_reducao' +
        '_bc'
      
        '  , coalesce(i.customedio, 0) * coalesce(i.Percentual_reducao_bc' +
        ', 0.0) / 100 as valor_reducao_bc'
      
        '--  , (i.Qtde * coalesce(i.precounit, 0)) + i.valor_desconto as ' +
        'Total_bruto'
      '  , i.Qtde * i.precounit as Total_Bruto'
      '  , i.Qtde * i.customedio as Total_liquido'
      '  , i.valor_desconto as Total_desconto'
      '  , p.Qtde as Estoque'
      '  , p.Reserva'
      '  , p.Produto_novo'
      '  , p.Cor_veiculo'
      '  , cr.Descricao as Cor_veiculo_descricao'
      '  , p.Combustivel_veiculo'
      '  , cb.Descricao as Combustivel_veiculo_descricao'
      '  , p.Ano_fabricacao_veiculo'
      '  , p.Ano_modelo_veiculo'
      
        '  , p.Ano_fabricacao_veiculo || '#39'/'#39' || p.Ano_modelo_veiculo as a' +
        'no_fab_modelo_veiculo'
      '  , p.Tipo_veiculo'
      '  , tv.Descricao as Tipo_veiculo_descricao'
      '  , p.Renavam_veiculo'
      '  , p.Chassi_veiculo'
      '  , p.Kilometragem_veiculo'
      '  , coalesce(p.Qtde, 0) - coalesce(p.Reserva, 0) as Disponivel'
      'from TBCOMPRASITENS i'
      '  inner join TBPRODUTO p on (p.Cod = i.codprod)'
      '  inner join TBUNIDADEPROD u on (u.Unp_cod = i.unid_cod)'
      '  inner join TBFORNECEDOR f on (f.codforn = i.codforn)'
      '  left join RENAVAM_COR cr on (cr.Codigo = p.Cor_veiculo)'
      
        '  left join RENAVAM_COBUSTIVEL cb on (cb.Codigo = p.Combustivel_' +
        'veiculo)'
      
        '  left join RENAVAM_TIPOVEICULO tv on (tv.Codigo = p.Tipo_veicul' +
        'o)'
      '  left join TBCST_PIS ps on (ps.Codigo = p.Cst_pis)'
      '  left join TBCST_COFINS cs on (cs.Codigo = p.Cst_cofins)'
      '  left join SYS_IBPT ib on (ib.ncm_ibpt = p.ncm_sh)'
      ''
      'where i.Ano = :anoCompra'
      '  and i.Codcontrol = :numCompra'
      ''
      'order by '
      '    i.Ano'
      '  , i.Codcontrol'
      '  , i.Seq')
    Left = 224
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'anoCompra'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numCompra'
        ParamType = ptUnknown
      end>
    object qryEntradaDadosProdutoANO: TSmallintField
      FieldName = 'ANO'
      Origin = '"TBCOMPRASITENS"."ANO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryEntradaDadosProdutoCODCONTROL: TIntegerField
      FieldName = 'CODCONTROL'
      Origin = '"TBCOMPRASITENS"."CODCONTROL"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryEntradaDadosProdutoSEQ: TSmallintField
      FieldName = 'SEQ'
      Origin = '"TBCOMPRASITENS"."SEQ"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryEntradaDadosProdutoCODPROD: TIBStringField
      FieldName = 'CODPROD'
      Origin = '"TBCOMPRASITENS"."CODPROD"'
      Size = 10
    end
    object qryEntradaDadosProdutoCODBARRA_EAN: TIBStringField
      FieldName = 'CODBARRA_EAN'
      Origin = '"TBPRODUTO"."CODBARRA_EAN"'
      Size = 15
    end
    object qryEntradaDadosProdutoDESCRI: TIBStringField
      FieldName = 'DESCRI'
      Origin = '"TBPRODUTO"."DESCRI"'
      Size = 50
    end
    object qryEntradaDadosProdutoAPRESENTACAO: TIBStringField
      FieldName = 'APRESENTACAO'
      Origin = '"TBPRODUTO"."APRESENTACAO"'
      Size = 50
    end
    object qryEntradaDadosProdutoDESCRI_APRESENTACAO: TIBStringField
      FieldName = 'DESCRI_APRESENTACAO'
      ProviderFlags = []
      Size = 100
    end
    object qryEntradaDadosProdutoMODELO: TIBStringField
      FieldName = 'MODELO'
      Origin = '"TBPRODUTO"."MODELO"'
      Size = 40
    end
    object qryEntradaDadosProdutoREFERENCIA: TIBStringField
      FieldName = 'REFERENCIA'
      Origin = '"TBPRODUTO"."REFERENCIA"'
      Size = 15
    end
    object qryEntradaDadosProdutoNCM_SH: TIBStringField
      FieldName = 'NCM_SH'
      Origin = '"TBPRODUTO"."NCM_SH"'
      Size = 10
    end
    object qryEntradaDadosProdutoNCM_ALIQUOTA_NAC: TIBBCDField
      FieldName = 'NCM_ALIQUOTA_NAC'
      Origin = '"SYS_IBPT"."ALIQNACIONAL_IBPT"'
      Precision = 18
      Size = 2
    end
    object qryEntradaDadosProdutoNCM_ALIQUOTA_IMP: TIBBCDField
      FieldName = 'NCM_ALIQUOTA_IMP'
      Origin = '"SYS_IBPT"."ALIQINTERNACIONAL_IBPT"'
      Precision = 18
      Size = 2
    end
    object qryEntradaDadosProdutoCODORIGEM: TIBStringField
      FieldName = 'CODORIGEM'
      Origin = '"TBPRODUTO"."CODORIGEM"'
      Size = 1
    end
    object qryEntradaDadosProdutoCODTRIBUTACAO: TIBStringField
      FieldName = 'CODTRIBUTACAO'
      Origin = '"TBPRODUTO"."CODTRIBUTACAO"'
      Size = 2
    end
    object qryEntradaDadosProdutoCST: TIBStringField
      FieldName = 'CST'
      Origin = '"TBPRODUTO"."CST"'
      Size = 3
    end
    object qryEntradaDadosProdutoCSOSN: TIBStringField
      FieldName = 'CSOSN'
      Origin = '"TBPRODUTO"."CSOSN"'
      Size = 3
    end
    object qryEntradaDadosProdutoCST_PIS: TIBStringField
      FieldName = 'CST_PIS'
      Origin = '"TBPRODUTO"."CST_PIS"'
      Size = 3
    end
    object qryEntradaDadosProdutoCST_COFINS: TIBStringField
      FieldName = 'CST_COFINS'
      Origin = '"TBPRODUTO"."CST_COFINS"'
      Size = 3
    end
    object qryEntradaDadosProdutoCST_PIS_INDICE_ACBR: TIntegerField
      FieldName = 'CST_PIS_INDICE_ACBR'
      ProviderFlags = []
    end
    object qryEntradaDadosProdutoCST_COFINS_INDICE_ACBR: TIntegerField
      FieldName = 'CST_COFINS_INDICE_ACBR'
      ProviderFlags = []
    end
    object qryEntradaDadosProdutoCODEMP: TIBStringField
      FieldName = 'CODEMP'
      Origin = '"TBCOMPRASITENS"."CODEMP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 18
    end
    object qryEntradaDadosProdutoCODFORN: TIntegerField
      FieldName = 'CODFORN'
      Origin = '"TBCOMPRASITENS"."CODFORN"'
    end
    object qryEntradaDadosProdutoCODFORN_CNPJ: TIBStringField
      FieldName = 'CODFORN_CNPJ'
      Origin = '"TBFORNECEDOR"."CNPJ"'
      Size = 18
    end
    object qryEntradaDadosProdutoDTENT: TDateField
      FieldName = 'DTENT'
      Origin = '"TBCOMPRASITENS"."DTENT"'
    end
    object qryEntradaDadosProdutoQTDE: TIBBCDField
      FieldName = 'QTDE'
      Origin = '"TBCOMPRASITENS"."QTDE"'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 3
    end
    object qryEntradaDadosProdutoPUNIT: TIBBCDField
      FieldName = 'PUNIT'
      Origin = '"TBCOMPRASITENS"."PRECOUNIT"'
      Precision = 18
      Size = 2
    end
    object qryEntradaDadosProdutoDESCONTO: TIBBCDField
      FieldName = 'DESCONTO'
      ProviderFlags = []
      Precision = 18
      Size = 4
    end
    object qryEntradaDadosProdutoDESCONTO_VALOR: TIBBCDField
      FieldName = 'DESCONTO_VALOR'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
    object qryEntradaDadosProdutoPFINAL: TIBBCDField
      FieldName = 'PFINAL'
      Origin = '"TBCOMPRASITENS"."CUSTOMEDIO"'
      Precision = 18
      Size = 2
    end
    object qryEntradaDadosProdutoQTDEFINAL: TIBBCDField
      FieldName = 'QTDEFINAL'
      Origin = '"TBCOMPRASITENS"."QTDEFINAL"'
      Precision = 18
      Size = 3
    end
    object qryEntradaDadosProdutoUNID_COD: TSmallintField
      FieldName = 'UNID_COD'
      Origin = '"TBCOMPRASITENS"."UNID_COD"'
    end
    object qryEntradaDadosProdutoUNP_DESCRICAO: TIBStringField
      FieldName = 'UNP_DESCRICAO'
      Origin = '"TBUNIDADEPROD"."UNP_DESCRICAO"'
      Size = 50
    end
    object qryEntradaDadosProdutoUNP_SIGLA: TIBStringField
      FieldName = 'UNP_SIGLA'
      Origin = '"TBUNIDADEPROD"."UNP_SIGLA"'
      Size = 5
    end
    object qryEntradaDadosProdutoCFOP_COD: TIntegerField
      FieldName = 'CFOP_COD'
      Origin = '"TBCOMPRASITENS"."CFOP"'
    end
    object qryEntradaDadosProdutoALIQUOTA: TIBBCDField
      FieldName = 'ALIQUOTA'
      Origin = '"TBCOMPRASITENS"."ALIQUOTA"'
      Precision = 18
      Size = 2
    end
    object qryEntradaDadosProdutoALIQUOTA_CSOSN: TIBBCDField
      FieldName = 'ALIQUOTA_CSOSN'
      Origin = '"TBCOMPRASITENS"."ALIQUOTA_CSOSN"'
      Precision = 18
      Size = 2
    end
    object qryEntradaDadosProdutoALIQUOTA_PIS: TIBBCDField
      FieldName = 'ALIQUOTA_PIS'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
    object qryEntradaDadosProdutoALIQUOTA_COFINS: TIBBCDField
      FieldName = 'ALIQUOTA_COFINS'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
    object qryEntradaDadosProdutoVALOR_IPI: TIBBCDField
      FieldName = 'VALOR_IPI'
      Origin = '"TBCOMPRASITENS"."VALOR_IPI"'
      Precision = 18
      Size = 2
    end
    object qryEntradaDadosProdutoPERCENTUAL_REDUCAO_BC: TIBBCDField
      FieldName = 'PERCENTUAL_REDUCAO_BC'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
    object qryEntradaDadosProdutoVALOR_REDUCAO_BC: TIBBCDField
      FieldName = 'VALOR_REDUCAO_BC'
      ProviderFlags = []
      Precision = 18
      Size = 4
    end
    object qryEntradaDadosProdutoTOTAL_BRUTO: TIBBCDField
      FieldName = 'TOTAL_BRUTO'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
    object qryEntradaDadosProdutoTOTAL_LIQUIDO: TIBBCDField
      FieldName = 'TOTAL_LIQUIDO'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
    object qryEntradaDadosProdutoTOTAL_DESCONTO: TIBBCDField
      FieldName = 'TOTAL_DESCONTO'
      Origin = '"TBCOMPRASITENS"."VALOR_DESCONTO"'
      Precision = 18
      Size = 2
    end
    object qryEntradaDadosProdutoPRODUTO_NOVO: TSmallintField
      FieldName = 'PRODUTO_NOVO'
      Origin = '"TBPRODUTO"."PRODUTO_NOVO"'
    end
    object qryEntradaDadosProdutoCOR_VEICULO: TIBStringField
      FieldName = 'COR_VEICULO'
      Origin = '"TBPRODUTO"."COR_VEICULO"'
      Size = 3
    end
    object qryEntradaDadosProdutoCOR_VEICULO_DESCRICAO: TIBStringField
      FieldName = 'COR_VEICULO_DESCRICAO'
      Origin = '"RENAVAM_COR"."DESCRICAO"'
      Size = 50
    end
    object qryEntradaDadosProdutoCOMBUSTIVEL_VEICULO: TIBStringField
      FieldName = 'COMBUSTIVEL_VEICULO'
      Origin = '"TBPRODUTO"."COMBUSTIVEL_VEICULO"'
      Size = 3
    end
    object qryEntradaDadosProdutoCOMBUSTIVEL_VEICULO_DESCRICAO: TIBStringField
      FieldName = 'COMBUSTIVEL_VEICULO_DESCRICAO'
      Origin = '"RENAVAM_COBUSTIVEL"."DESCRICAO"'
      Size = 100
    end
    object qryEntradaDadosProdutoANO_FABRICACAO_VEICULO: TSmallintField
      FieldName = 'ANO_FABRICACAO_VEICULO'
      Origin = '"TBPRODUTO"."ANO_FABRICACAO_VEICULO"'
    end
    object qryEntradaDadosProdutoANO_MODELO_VEICULO: TSmallintField
      FieldName = 'ANO_MODELO_VEICULO'
      Origin = '"TBPRODUTO"."ANO_MODELO_VEICULO"'
    end
    object qryEntradaDadosProdutoANO_FAB_MODELO_VEICULO: TIBStringField
      FieldName = 'ANO_FAB_MODELO_VEICULO'
      ProviderFlags = []
      Size = 13
    end
    object qryEntradaDadosProdutoTIPO_VEICULO: TIBStringField
      FieldName = 'TIPO_VEICULO'
      Origin = '"TBPRODUTO"."TIPO_VEICULO"'
      Size = 3
    end
    object qryEntradaDadosProdutoTIPO_VEICULO_DESCRICAO: TIBStringField
      FieldName = 'TIPO_VEICULO_DESCRICAO'
      Origin = '"RENAVAM_TIPOVEICULO"."DESCRICAO"'
      Size = 100
    end
    object qryEntradaDadosProdutoRENAVAM_VEICULO: TIBStringField
      FieldName = 'RENAVAM_VEICULO'
      Origin = '"TBPRODUTO"."RENAVAM_VEICULO"'
      Size = 50
    end
    object qryEntradaDadosProdutoCHASSI_VEICULO: TIBStringField
      FieldName = 'CHASSI_VEICULO'
      Origin = '"TBPRODUTO"."CHASSI_VEICULO"'
      Size = 50
    end
    object qryEntradaDadosProdutoKILOMETRAGEM_VEICULO: TIntegerField
      FieldName = 'KILOMETRAGEM_VEICULO'
      Origin = '"TBPRODUTO"."KILOMETRAGEM_VEICULO"'
    end
    object qryEntradaDadosProdutoESTOQUE: TIBBCDField
      FieldName = 'ESTOQUE'
      Origin = '"TBPRODUTO"."QTDE"'
      ProviderFlags = []
      Precision = 18
      Size = 3
    end
    object qryEntradaDadosProdutoRESERVA: TIBBCDField
      FieldName = 'RESERVA'
      Origin = '"TBPRODUTO"."RESERVA"'
      ProviderFlags = []
      Precision = 18
      Size = 3
    end
    object qryEntradaDadosProdutoDISPONIVEL: TIBBCDField
      FieldName = 'DISPONIVEL'
      ProviderFlags = []
      Precision = 18
      Size = 3
    end
  end
  object frdEntradaItens: TfrxDBDataset
    UserName = 'frdEntradaItens'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ANO=ANO'
      'CODCONTROL=CODCONTROL'
      'SEQ=SEQ'
      'CODPROD=CODPROD'
      'CODBARRA_EAN=CODBARRA_EAN'
      'DESCRI=DESCRI'
      'APRESENTACAO=APRESENTACAO'
      'DESCRI_APRESENTACAO=DESCRI_APRESENTACAO'
      'MODELO=MODELO'
      'REFERENCIA=REFERENCIA'
      'NCM_SH=NCM_SH'
      'CODORIGEM=CODORIGEM'
      'CODTRIBUTACAO=CODTRIBUTACAO'
      'CST=CST'
      'CSOSN=CSOSN'
      'CST_PIS=CST_PIS'
      'CST_COFINS=CST_COFINS'
      'CST_PIS_INDICE_ACBR=CST_PIS_INDICE_ACBR'
      'CST_COFINS_INDICE_ACBR=CST_COFINS_INDICE_ACBR'
      'CODEMP=CODEMP'
      'CODFORN=CODFORN'
      'CODFORN_CNPJ=CODFORN_CNPJ'
      'DTENT=DTENT'
      'QTDE=QTDE'
      'PUNIT=PUNIT'
      'DESCONTO=DESCONTO'
      'DESCONTO_VALOR=DESCONTO_VALOR'
      'PFINAL=PFINAL'
      'QTDEFINAL=QTDEFINAL'
      'UNID_COD=UNID_COD'
      'UNP_DESCRICAO=UNP_DESCRICAO'
      'UNP_SIGLA=UNP_SIGLA'
      'CFOP_COD=CFOP_COD'
      'ALIQUOTA=ALIQUOTA'
      'ALIQUOTA_CSOSN=ALIQUOTA_CSOSN'
      'ALIQUOTA_PIS=ALIQUOTA_PIS'
      'ALIQUOTA_COFINS=ALIQUOTA_COFINS'
      'VALOR_IPI=VALOR_IPI'
      'PERCENTUAL_REDUCAO_BC=PERCENTUAL_REDUCAO_BC'
      'VALOR_REDUCAO_BC=VALOR_REDUCAO_BC'
      'TOTAL_LIQUIDO=TOTAL_LIQUIDO'
      'TOTAL_LIQUIDO1=TOTAL_LIQUIDO1'
      'TOTAL_DESCONTO=TOTAL_DESCONTO'
      'ESTOQUE=ESTOQUE'
      'RESERVA=RESERVA'
      'PRODUTO_NOVO=PRODUTO_NOVO'
      'COR_VEICULO=COR_VEICULO'
      'COR_VEICULO_DESCRICAO=COR_VEICULO_DESCRICAO'
      'COMBUSTIVEL_VEICULO=COMBUSTIVEL_VEICULO'
      'COMBUSTIVEL_VEICULO_DESCRICAO=COMBUSTIVEL_VEICULO_DESCRICAO'
      'ANO_FABRICACAO_VEICULO=ANO_FABRICACAO_VEICULO'
      'ANO_MODELO_VEICULO=ANO_MODELO_VEICULO'
      'ANO_FAB_MODELO_VEICULO=ANO_FAB_MODELO_VEICULO'
      'TIPO_VEICULO=TIPO_VEICULO'
      'TIPO_VEICULO_DESCRICAO=TIPO_VEICULO_DESCRICAO'
      'RENAVAM_VEICULO=RENAVAM_VEICULO'
      'CHASSI_VEICULO=CHASSI_VEICULO'
      'KILOMETRAGEM_VEICULO=KILOMETRAGEM_VEICULO'
      'DISPONIVEL=DISPONIVEL')
    DataSet = qryEntradaDadosProduto
    BCDToCurrency = False
    Left = 260
    Top = 169
  end
  object qryEntradaDuplicatas: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    SQL.Strings = (
      'Select'
      '    p.anolanc'
      '  , p.numlanc'
      '  , p.Parcela'
      '  , p.Dtemiss'
      '  , p.Dtvenc'
      '  , p.valorpag'
      '  , 0.0 as Valormulta'
      '  , 0.0 as Percentdesconto'
      'from TBCONTPAG p'
      'where p.anocompra = :AnoCompra'
      '  and p.numcompra = :NumCompra')
    Left = 224
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'AnoCompra'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NumCompra'
        ParamType = ptUnknown
      end>
    object qryEntradaDuplicatasANOLANC: TSmallintField
      FieldName = 'ANOLANC'
      Origin = '"TBCONTPAG"."ANOLANC"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryEntradaDuplicatasNUMLANC: TIntegerField
      FieldName = 'NUMLANC'
      Origin = '"TBCONTPAG"."NUMLANC"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryEntradaDuplicatasPARCELA: TSmallintField
      FieldName = 'PARCELA'
      Origin = '"TBCONTPAG"."PARCELA"'
    end
    object qryEntradaDuplicatasDTEMISS: TDateField
      FieldName = 'DTEMISS'
      Origin = '"TBCONTPAG"."DTEMISS"'
    end
    object qryEntradaDuplicatasDTVENC: TDateField
      FieldName = 'DTVENC'
      Origin = '"TBCONTPAG"."DTVENC"'
    end
    object qryEntradaDuplicatasVALORPAG: TIBBCDField
      FieldName = 'VALORPAG'
      Origin = '"TBCONTPAG"."VALORPAG"'
      Precision = 18
      Size = 2
    end
    object qryEntradaDuplicatasVALORMULTA: TIBBCDField
      FieldName = 'VALORMULTA'
      ProviderFlags = []
      Precision = 18
      Size = 1
    end
    object qryEntradaDuplicatasPERCENTDESCONTO: TIBBCDField
      FieldName = 'PERCENTDESCONTO'
      ProviderFlags = []
      Precision = 18
      Size = 1
    end
  end
  object frdEntradaDuplicata: TfrxDBDataset
    UserName = 'frdEntradaDuplicata'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ANOLANC=ANOLANC'
      'NUMLANC=NUMLANC'
      'PARCELA=PARCELA'
      'DTEMISS=DTEMISS'
      'DTVENC=DTVENC'
      'VALORREC=VALORREC'
      'VALORMULTA=VALORMULTA'
      'PERCENTDESCONTO=PERCENTDESCONTO')
    DataSet = qryEntradaDuplicatas
    BCDToCurrency = False
    Left = 260
    Top = 217
  end
  object qryNFeEmitida: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    SQL.Strings = (
      'Select'
      '    n.ANOVENDA'
      '  , n.NUMVENDA'
      '  , n.EMPRESA'
      '  , n.DATAEMISSAO'
      '  , n.HORAEMISSAO'
      '  , n.SERIE'
      '  , n.NUMERO'
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
      'where n.ANOVENDA = :anovenda'
      '  and n.NUMVENDA = :numvenda')
    Left = 144
    Top = 360
    ParamData = <
      item
        DataType = ftInteger
        Name = 'AnoVenda'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'NumVenda'
        ParamType = ptInput
        Value = 0
      end>
    object qryNFeEmitidaANOVENDA: TSmallintField
      FieldName = 'ANOVENDA'
      Origin = '"TBNFE_ENVIADA"."ANOVENDA"'
    end
    object qryNFeEmitidaNUMVENDA: TIntegerField
      FieldName = 'NUMVENDA'
      Origin = '"TBNFE_ENVIADA"."NUMVENDA"'
    end
    object qryNFeEmitidaEMPRESA: TIBStringField
      FieldName = 'EMPRESA'
      Origin = '"TBNFE_ENVIADA"."EMPRESA"'
      Size = 18
    end
    object qryNFeEmitidaDATAEMISSAO: TDateField
      FieldName = 'DATAEMISSAO'
      Origin = '"TBNFE_ENVIADA"."DATAEMISSAO"'
    end
    object qryNFeEmitidaHORAEMISSAO: TTimeField
      FieldName = 'HORAEMISSAO'
      Origin = '"TBNFE_ENVIADA"."HORAEMISSAO"'
    end
    object qryNFeEmitidaSERIE: TIBStringField
      FieldName = 'SERIE'
      Origin = '"TBNFE_ENVIADA"."SERIE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object qryNFeEmitidaNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = '"TBNFE_ENVIADA"."NUMERO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryNFeEmitidaMODELO: TSmallintField
      FieldName = 'MODELO'
      Origin = '"TBNFE_ENVIADA"."MODELO"'
    end
    object qryNFeEmitidaVERSAO: TSmallintField
      FieldName = 'VERSAO'
      Origin = '"TBNFE_ENVIADA"."VERSAO"'
    end
    object qryNFeEmitidaCHAVE: TIBStringField
      FieldName = 'CHAVE'
      Origin = '"TBNFE_ENVIADA"."CHAVE"'
      Size = 250
    end
    object qryNFeEmitidaPROTOCOLO: TIBStringField
      FieldName = 'PROTOCOLO'
      Origin = '"TBNFE_ENVIADA"."PROTOCOLO"'
      Size = 250
    end
    object qryNFeEmitidaRECIBO: TIBStringField
      FieldName = 'RECIBO'
      Origin = '"TBNFE_ENVIADA"."RECIBO"'
      Size = 250
    end
    object qryNFeEmitidaXML_FILENAME: TIBStringField
      FieldName = 'XML_FILENAME'
      Origin = '"TBNFE_ENVIADA"."XML_FILENAME"'
      Size = 250
    end
    object qryNFeEmitidaXML_FILE: TMemoField
      FieldName = 'XML_FILE'
      Origin = '"TBNFE_ENVIADA"."XML_FILE"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object qryNFeEmitidaLOTE_ANO: TSmallintField
      FieldName = 'LOTE_ANO'
      Origin = '"TBNFE_ENVIADA"."LOTE_ANO"'
    end
    object qryNFeEmitidaLOTE_NUM: TIntegerField
      FieldName = 'LOTE_NUM'
      Origin = '"TBNFE_ENVIADA"."LOTE_NUM"'
      Required = True
    end
  end
  object qryDadosVolume: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    SQL.Strings = (
      'Select'
      '    v.sequencial'
      '  , v.numero'
      '  , v.quantidade'
      '  , v.especie'
      '  , v.marca'
      '  , v.peso_bruto'
      '  , v.peso_liquido'
      'from TBVENDAS_VOLUME v'
      'where v.ano_venda = :anovenda'
      '  and v.controle_venda = :numvenda'
      '')
    Left = 144
    Top = 312
    ParamData = <
      item
        DataType = ftInteger
        Name = 'AnoVenda'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'NumVenda'
        ParamType = ptInput
        Value = 0
      end>
    object qryDadosVolumeSEQUENCIAL: TSmallintField
      FieldName = 'SEQUENCIAL'
      Origin = '"TBVENDAS_VOLUME"."SEQUENCIAL"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryDadosVolumeNUMERO: TIBStringField
      FieldName = 'NUMERO'
      Origin = '"TBVENDAS_VOLUME"."NUMERO"'
      Size = 50
    end
    object qryDadosVolumeQUANTIDADE: TSmallintField
      FieldName = 'QUANTIDADE'
      Origin = '"TBVENDAS_VOLUME"."QUANTIDADE"'
    end
    object qryDadosVolumeESPECIE: TIBStringField
      FieldName = 'ESPECIE'
      Origin = '"TBVENDAS_VOLUME"."ESPECIE"'
      Size = 50
    end
    object qryDadosVolumeMARCA: TIBStringField
      FieldName = 'MARCA'
      Origin = '"TBVENDAS_VOLUME"."MARCA"'
      Size = 50
    end
    object qryDadosVolumePESO_BRUTO: TIBBCDField
      FieldName = 'PESO_BRUTO'
      Origin = '"TBVENDAS_VOLUME"."PESO_BRUTO"'
      Precision = 18
      Size = 3
    end
    object qryDadosVolumePESO_LIQUIDO: TIBBCDField
      FieldName = 'PESO_LIQUIDO'
      Origin = '"TBVENDAS_VOLUME"."PESO_LIQUIDO"'
      Precision = 18
      Size = 3
    end
  end
  object qryLoteNFePendente: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    SQL.Strings = (
      'Select'
      '    v.ano        as Ano'
      '  , v.codcontrol as Numero'
      '  , 1            as TipoNFE'
      '  , '#39'Sa'#237'da/Venda'#39'     as Tipo'
      '  , v.lote_nfe_numero as Lote'
      '  , v.lote_nfe_recibo as Recibo'
      'from TBVENDAS v'
      'where v.codemp = :empresa'
      '  and v.lote_nfe_numero is not null'
      '  and v.nfe is null'
      '  and v.nfe_enviada = 0'
      ''
      'union'
      ''
      'Select'
      '    c.ano        as Ano'
      '  , c.codcontrol as Numero'
      '  , 0            as TipoNFE'
      '  , '#39'Entrada/Compra'#39'  as Tipo'
      '  , c.lote_nfe_numero as Lote'
      '  , c.lote_nfe_recibo as Recibo'
      'from TBCOMPRAS c'
      'where c.codemp = :empresa'
      '  and c.lote_nfe_numero is not null'
      '  and c.nf is null'
      '  and C.nfe_enviada = 0'
      ''
      'order by 5')
    Left = 144
    Top = 456
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'empresa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'empresa'
        ParamType = ptUnknown
      end>
    object SmallintField1: TSmallintField
      FieldName = 'ANOVENDA'
      Origin = '"TBNFE_ENVIADA"."ANOVENDA"'
    end
    object IntegerField1: TIntegerField
      FieldName = 'NUMVENDA'
      Origin = '"TBNFE_ENVIADA"."NUMVENDA"'
    end
    object DateField1: TDateField
      FieldName = 'DATAEMISSAO'
      Origin = '"TBNFE_ENVIADA"."DATAEMISSAO"'
    end
    object TimeField1: TTimeField
      FieldName = 'HORAEMISSAO'
      Origin = '"TBNFE_ENVIADA"."HORAEMISSAO"'
    end
    object IBStringField1: TIBStringField
      FieldName = 'SERIE'
      Origin = '"TBNFE_ENVIADA"."SERIE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object IntegerField2: TIntegerField
      FieldName = 'NUMERO'
      Origin = '"TBNFE_ENVIADA"."NUMERO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBStringField2: TIBStringField
      FieldName = 'CHAVE'
      Origin = '"TBNFE_ENVIADA"."CHAVE"'
      Size = 250
    end
    object IBStringField3: TIBStringField
      FieldName = 'PROTOCOLO'
      Origin = '"TBNFE_ENVIADA"."PROTOCOLO"'
      Size = 250
    end
    object IBStringField4: TIBStringField
      FieldName = 'RECIBO'
      Origin = '"TBNFE_ENVIADA"."RECIBO"'
      Size = 250
    end
    object IBStringField5: TIBStringField
      FieldName = 'XML_FILENAME'
      Origin = '"TBNFE_ENVIADA"."XML_FILENAME"'
      Size = 250
    end
    object MemoField1: TMemoField
      FieldName = 'XML_FILE'
      Origin = '"TBNFE_ENVIADA"."XML_FILE"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object SmallintField2: TSmallintField
      FieldName = 'LOTE_ANO'
      Origin = '"TBNFE_ENVIADA"."LOTE_ANO"'
    end
    object IntegerField3: TIntegerField
      FieldName = 'LOTE_NUM'
      Origin = '"TBNFE_ENVIADA"."LOTE_NUM"'
      Required = True
    end
  end
  object frrBoletoEntrega: TfrxReport
    Version = '4.9.72'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40401.475989294000000000
    ReportOptions.LastChange = 41534.390999918980000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'procedure MDOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if Trim(<Banco."DirLogo">) <> '#39#39' then'
      '  begin              '
      
        '     Logo_1.Picture.LoadFromFile(<Banco."DirLogo"> + '#39'\'#39' + <Banc' +
        'o."Numero"> + '#39'.bmp'#39');'
      '     Logo_2.Picture.Assign(Logo_1.Picture);'
      '     Logo_3.Picture.Assign(Logo_1.Picture);'
      '  end;                   '
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 304
    Top = 336
    Datasets = <
      item
      end
      item
      end
      item
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MD: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Height = 1028.032160000000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'MDOnBeforePrint'
        RowCount = 0
        object Memo37: TfrxMemoView
          Left = 275.000000000000000000
          Top = 210.897637800000000000
          Width = 442.895795450000000000
          Height = 37.039370080000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'MS sans Serif'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo1: TfrxMemoView
          Left = 180.417440000000000000
          Width = 94.488250000000000000
          Height = 37.039370080000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[Banco."Numero"]-[Banco."Digito"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Logo_1: TfrxPictureView
          Align = baLeft
          Top = 0.102350000000001000
          Width = 180.060606060000000000
          Height = 37.000000000000000000
          ShowHint = False
          Frame.Typ = [ftRight, ftBottom]
          Frame.Width = 0.500000000000000000
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Memo2: TfrxMemoView
          Left = 274.994434550000000000
          Width = 442.895795450000000000
          Height = 37.039370080000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'MS sans Serif'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Align = baRight
          Left = 521.575140000000000000
          Top = 17.140074240000000000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'Comprovante de Entrega  ')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Top = 37.795275590000000000
          Width = 274.771653540000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            ' Cedente')
          ParentFont = False
        end
        object CedenteNome: TfrxMemoView
          Top = 49.398268480000000000
          Width = 274.771653540000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            '[Cedente."Nome"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 274.771653540000000000
          Top = 37.795275590000000000
          Width = 170.078740160000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            ' Ag'#195#170'ncia / C'#195#179'digo Cedente')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Top = 68.223562130000000000
          Width = 274.771653540000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            ' Sacado')
          ParentFont = False
        end
        object TituloSacado_NomeSacado: TfrxMemoView
          Top = 79.587198490000000000
          Width = 274.872604240000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'Sacado_NomeSacado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            '[Titulo."Sacado_NomeSacado"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 444.454545450000000000
          Top = 37.795275590000000000
          Width = 273.109153030000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'Motivo de n'#195#163'o entrega. (Para uso da empresa entregadora)')
          ParentFont = False
        end
        object CedenteAgencia: TfrxMemoView
          Left = 274.771653540000000000
          Top = 49.398268480000000000
          Width = 170.078740160000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[Cedente."Agencia"]-[Cedente."AgenciaDigito"]/[Cedente."CodigoCe' +
              'dente"]')
          ParentFont = False
          WordWrap = False
        end
        object TituloNossoNum: TfrxMemoView
          Left = 274.771653540000000000
          Top = 79.587198490000000000
          Width = 170.078740160000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'NossoNum'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[Titulo."NossoNum"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 274.771653540000000000
          Top = 68.223562130000000000
          Width = 170.078740160000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            ' Nosso N'#195#186'mero ')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 451.515151520000000000
          Top = 56.102349990000000000
          Width = 71.217609160000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            '(  ) Mudou-se')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 451.757575760000000000
          Top = 86.209973760000000000
          Width = 71.217609160000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            '(  ) Recusado')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 451.515151520000000000
          Top = 115.193259090000000000
          Width = 71.217609160000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            '(  ) Desconhecido')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Top = 98.526592420000000000
          Width = 70.677642570000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            ' Vencimento')
          ParentFont = False
        end
        object TituloVencimento: TfrxMemoView
          Top = 109.647804540000000000
          Width = 70.677165350000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[Titulo."Vencimento"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo13: TfrxMemoView
          Left = 70.696969700000000000
          Top = 98.526592420000000000
          Width = 144.162491050000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            ' N'#195#186'mero do Documento')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 214.677165350000000000
          Top = 98.526592420000000000
          Width = 60.071581970000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            ' Esp'#195#169'cie')
          ParentFont = False
        end
        object TituloNumeroDocumento: TfrxMemoView
          Left = 70.696969690000000000
          Top = 109.606299210000000000
          Width = 144.000000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'NumeroDocumento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[Titulo."NumeroDocumento"]')
          ParentFont = False
          WordWrap = False
        end
        object TituloEspecieDoc: TfrxMemoView
          Left = 214.677165350000000000
          Top = 109.606299210000000000
          Width = 60.094488190000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[Titulo."EspecieMod"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo15: TfrxMemoView
          Left = 274.771653540000000000
          Top = 98.526592420000000000
          Width = 170.078740160000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            ' Valor do Documento')
          ParentFont = False
        end
        object TituloValorDocumento: TfrxMemoView
          Left = 274.771653540000000000
          Top = 109.606299210000000000
          Width = 170.078740160000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ValorDocumento'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[Titulo."ValorDocumento"]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Top = 128.829622730000000000
          Width = 156.283703170000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            ' Recebemos o T'#195#173'tulo')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 156.060606060000000000
          Top = 128.829622730000000000
          Width = 78.253400150000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            ' Data')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 234.090909090000000000
          Top = 128.829622730000000000
          Width = 210.897637800000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            ' Assinatura')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 530.303030300000000000
          Top = 56.102350000000000000
          Width = 71.217609160000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            '(  ) Ausente')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 530.545454540000000000
          Top = 86.209973770000000000
          Width = 71.217609160000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            '(  ) N'#195#163'o procurado')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 530.303030300000000000
          Top = 115.193259100000000000
          Width = 71.217609160000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            '(  ) Falecido')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 609.090909090000000000
          Top = 56.102350000000000000
          Width = 71.217609160000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            '(  ) N'#195#163'o existe No indicado')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 609.333333330000000000
          Top = 86.209973770000000000
          Width = 93.187306130000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            '(  ) Endere'#195#167'o insuficiente')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 609.090909090000000000
          Top = 115.193259100000000000
          Width = 103.035790980000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            '(  ) Outros (anotar no verso)')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 444.472440940000000000
          Top = 128.829622730000000000
          Width = 78.253400150000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            ' Data')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Left = 522.727272730000000000
          Top = 128.829622730000000000
          Width = 195.711037710000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            ' Assinatura')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Top = 140.193259090000000000
          Width = 156.283703170000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            'com as caracteristicas acima')
          ParentFont = False
          WordWrap = False
        end
        object Memo29: TfrxMemoView
          Left = 156.060606060000000000
          Top = 140.193259090000000000
          Width = 78.236220470000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          ParentFont = False
          WordWrap = False
        end
        object Memo30: TfrxMemoView
          Left = 234.090909090000000000
          Top = 140.193259090000000000
          Width = 210.897637800000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          ParentFont = False
          WordWrap = False
        end
        object Memo31: TfrxMemoView
          Left = 444.472440940000000000
          Top = 140.193259090000000000
          Width = 78.236220470000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          ParentFont = False
          WordWrap = False
        end
        object Memo32: TfrxMemoView
          Left = 522.727272730000000000
          Top = 140.193259090000000000
          Width = 195.170686680000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          ParentFont = False
          WordWrap = False
        end
        object Memo19: TfrxMemoView
          Top = 159.132653030000000000
          Width = 600.980672870000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            ' Local de pagamento')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Left = 600.757575760000000000
          Top = 159.132653030000000000
          Width = 117.647339540000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            ' Data do processamento')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          Top = 170.496289390000000000
          Width = 600.980672870000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            '[Titulo."LocalPagamento"]')
          ParentFont = False
          WordWrap = False
        end
        object TituloDataProcessamento: TfrxMemoView
          Left = 601.757575760000000000
          Top = 170.496289390000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'DataProcessamento'
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            '[Titulo."DataProcessamento"]')
          ParentFont = False
          WordWrap = False
        end
        object Line1: TfrxLineView
          Align = baWidth
          Top = 200.548546670000000000
          Width = 718.110700000000000000
          ShowHint = False
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
        object Memo35: TfrxMemoView
          Left = 180.417440000000000000
          Top = 210.897637800000000000
          Width = 94.488250000000000000
          Height = 37.039370080000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[Banco."Numero"]-[Banco."Digito"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Logo_2: TfrxPictureView
          Align = baLeft
          Top = 210.750154550000000000
          Width = 180.060606060000000000
          Height = 37.000000000000000000
          ShowHint = False
          Frame.Typ = [ftRight, ftBottom]
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Memo36: TfrxMemoView
          Align = baRight
          Left = 536.693260000000000000
          Top = 228.545454550000000000
          Width = 181.417440000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            'Recibo do Sacado ')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          Top = 247.769016670000000000
          Width = 535.829157720000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Memo.UTF8 = (
            ' Local de pagamento')
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          Left = 535.606060610000000000
          Top = 247.769016670000000000
          Width = 184.372447710000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            ' Vencimento')
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          Top = 259.132653030000000000
          Width = 535.937007874016000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftBottom]
          Memo.UTF8 = (
            '[Titulo."LocalPagamento"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo41: TfrxMemoView
          Left = 535.606060610000000000
          Top = 259.132653030000000000
          Width = 167.923005760000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[Titulo."Vencimento"]')
          ParentFont = False
        end
        object Memo42: TfrxMemoView
          Top = 278.072046970000000000
          Width = 535.829157720000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Memo.UTF8 = (
            ' Cedente')
          ParentFont = False
        end
        object Memo43: TfrxMemoView
          Top = 289.435683330000000000
          Width = 535.937007870000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftBottom]
          Memo.UTF8 = (
            '[Cedente."Nome"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo44: TfrxMemoView
          Left = 535.606060610000000000
          Top = 278.072046970000000000
          Width = 195.711037710000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            ' Ag'#195#170'ncia / C'#195#179'digo Cedente')
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          Left = 535.606060610000000000
          Top = 289.435683330000000000
          Width = 167.923005760000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            
              '[Cedente."Agencia"]-[Cedente."AgenciaDigito"]/[Cedente."CodigoCe' +
              'dente"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo46: TfrxMemoView
          Left = 535.606060610000000000
          Top = 308.375077280000000000
          Width = 184.372447710000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          Memo.UTF8 = (
            ' Nosso N'#195#186'mero')
          ParentFont = False
        end
        object Memo47: TfrxMemoView
          Left = 535.606060610000000000
          Top = 318.981137880000000000
          Width = 167.923005760000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[Titulo."NossoNum"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo48: TfrxMemoView
          Left = 535.606060610000000000
          Top = 338.678107580000000000
          Width = 184.372447710000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          Memo.UTF8 = (
            ' ( = ) Valor do Documento')
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          Left = 535.606060610000000000
          Top = 349.284168180000000000
          Width = 167.923005760000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[Titulo."ValorDocumento"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo50: TfrxMemoView
          Left = 535.559055120000000000
          Top = 368.223562120000000000
          Width = 184.372447710000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop]
          Memo.UTF8 = (
            ' ( - ) Desconto / Abatimento')
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          Left = 535.559055118110000000
          Top = 379.587198480000000000
          Width = 167.923005760000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftBottom]
          HAlign = haRight
          ParentFont = False
          WordWrap = False
        end
        object Memo52: TfrxMemoView
          Left = 535.559055120000000000
          Top = 398.526592420000000000
          Width = 184.372447710000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft]
          Memo.UTF8 = (
            ' ( + ) Mora / Multa')
          ParentFont = False
        end
        object Memo53: TfrxMemoView
          Left = 535.559055118110000000
          Top = 409.890228780000000000
          Width = 167.923005760000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftBottom]
          HAlign = haRight
          ParentFont = False
          WordWrap = False
        end
        object Memo54: TfrxMemoView
          Left = 535.559055120000000000
          Top = 428.829622730000000000
          Width = 184.372447710000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft]
          Memo.UTF8 = (
            ' ( = ) Valor Cobrado')
          ParentFont = False
        end
        object Memo55: TfrxMemoView
          Left = 535.559055118110000000
          Top = 440.193259090000000000
          Width = 167.923005760000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft]
          HAlign = haRight
          ParentFont = False
          WordWrap = False
        end
        object Line2: TfrxLineView
          Align = baWidth
          Top = 459.132653030000000000
          Width = 718.110700000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo56: TfrxMemoView
          Left = 275.000000000000000000
          Top = 602.875683550000000000
          Width = 442.895795450000000000
          Height = 37.039370080000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '  [Titulo."LinhaDigitavel"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Line3: TfrxLineView
          Align = baWidth
          Top = 593.284168180000000000
          Width = 718.110700000000000000
          ShowHint = False
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
        object Memo57: TfrxMemoView
          Left = 180.417440000000000000
          Top = 602.875683540000000000
          Width = 94.488250000000000000
          Height = 37.039370080000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[Banco."Numero"]-[Banco."Digito"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Logo_3: TfrxPictureView
          Align = baLeft
          Top = 602.728200300000000000
          Width = 180.060606060000000000
          Height = 37.000000000000000000
          ShowHint = False
          Frame.Typ = [ftRight, ftBottom]
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Memo59: TfrxMemoView
          Top = 639.747062420000000000
          Width = 535.829157720000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Memo.UTF8 = (
            ' Local de pagamento')
          ParentFont = False
        end
        object Memo60: TfrxMemoView
          Left = 535.606060610000000000
          Top = 639.747062420000000000
          Width = 195.711037710000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            ' Vencimento')
          ParentFont = False
        end
        object Memo61: TfrxMemoView
          Top = 651.110698780000000000
          Width = 535.937007870000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftBottom]
          Memo.UTF8 = (
            '[Titulo."LocalPagamento"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo62: TfrxMemoView
          Left = 535.606060610000000000
          Top = 651.110698780000000000
          Width = 167.923005760000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[Titulo."Vencimento"]')
          ParentFont = False
        end
        object Memo63: TfrxMemoView
          Top = 670.050092720000000000
          Width = 535.829157720000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Memo.UTF8 = (
            ' Cedente')
          ParentFont = False
        end
        object Memo64: TfrxMemoView
          Top = 681.413729080000000000
          Width = 535.937007870000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftBottom]
          Memo.UTF8 = (
            '[Cedente."Nome"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo65: TfrxMemoView
          Left = 535.606060610000000000
          Top = 670.050092720000000000
          Width = 184.372447710000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            ' Ag'#195#170'ncia / C'#195#179'digo Cedente')
          ParentFont = False
        end
        object Memo66: TfrxMemoView
          Left = 535.606060610000000000
          Top = 681.413729080000000000
          Width = 167.923005760000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            
              '[Cedente."Agencia"]-[Cedente."AgenciaDigito"]/[Cedente."CodigoCe' +
              'dente"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo58: TfrxMemoView
          Top = 308.375077270000000000
          Width = 132.283464570000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Memo.UTF8 = (
            ' Data do Documento')
          ParentFont = False
        end
        object Memo77: TfrxMemoView
          Top = 319.496289390000000000
          Width = 132.283464570000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[Titulo."DataDocumento"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo78: TfrxMemoView
          Left = 132.909090910000000000
          Top = 308.375077270000000000
          Width = 132.283464570000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Memo.UTF8 = (
            ' N'#195#186'mero do Documento')
          ParentFont = False
        end
        object Memo79: TfrxMemoView
          Left = 132.909090910000000000
          Top = 319.496289390000000000
          Width = 132.283464566929000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[Titulo."NumeroDocumento"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo80: TfrxMemoView
          Left = 265.121212120000000000
          Top = 308.375077270000000000
          Width = 66.141732283464600000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Memo.UTF8 = (
            ' Esp'#195#169'cie Doc.')
          ParentFont = False
        end
        object Memo81: TfrxMemoView
          Left = 265.121212120000000000
          Top = 319.454784060000000000
          Width = 66.141732280000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[Titulo."EspecieDoc"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo82: TfrxMemoView
          Left = 331.030303030000000000
          Top = 308.375077270000000000
          Width = 66.141732280000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Memo.UTF8 = (
            ' Aceite')
          ParentFont = False
        end
        object Memo83: TfrxMemoView
          Left = 331.030303030000000000
          Top = 319.454784060000000000
          Width = 66.141732280000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[IIF(<Titulo."Aceite"> = 0, '#39'Sim'#39', '#39'N'#195#163'o'#39')]')
          ParentFont = False
          WordWrap = False
        end
        object Memo84: TfrxMemoView
          Left = 396.969696960000000000
          Top = 308.375077270000000000
          Width = 138.859460760000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Memo.UTF8 = (
            ' Data do Processamento')
          ParentFont = False
        end
        object Memo85: TfrxMemoView
          Left = 396.969696960000000000
          Top = 319.496289390000000000
          Width = 138.858983540000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[Titulo."DataProcessamento"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo86: TfrxMemoView
          Top = 338.678107580000000000
          Width = 132.283464570000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Memo.UTF8 = (
            ' Uso do Banco')
          ParentFont = False
        end
        object Memo87: TfrxMemoView
          Top = 349.799319700000000000
          Width = 132.283464570000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haCenter
          ParentFont = False
          WordWrap = False
        end
        object Memo88: TfrxMemoView
          Left = 132.575757580000000000
          Top = 338.678107580000000000
          Width = 66.141732280000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Memo.UTF8 = (
            ' Carteira')
          ParentFont = False
        end
        object Memo89: TfrxMemoView
          Left = 132.575757580000000000
          Top = 349.757814370000000000
          Width = 66.141732280000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[Titulo."Carteira"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo90: TfrxMemoView
          Left = 198.636363640000000000
          Top = 338.678107580000000000
          Width = 66.141732280000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Memo.UTF8 = (
            ' Esp'#195#169'cie')
          ParentFont = False
        end
        object Memo91: TfrxMemoView
          Left = 198.636363640000000000
          Top = 349.757814370000000000
          Width = 66.141732280000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[Titulo."EspecieMod"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo92: TfrxMemoView
          Left = 265.151515150000000000
          Top = 338.678107580000000000
          Width = 132.283464570000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Memo.UTF8 = (
            ' Quantidade')
          ParentFont = False
        end
        object Memo93: TfrxMemoView
          Left = 265.151515150000000000
          Top = 349.799319700000000000
          Width = 132.283464570000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haCenter
          ParentFont = False
          WordWrap = False
        end
        object Memo94: TfrxMemoView
          Left = 396.969696970000000000
          Top = 338.678107580000000000
          Width = 138.859460760000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Memo.UTF8 = (
            ' Valor')
          ParentFont = False
        end
        object Memo95: TfrxMemoView
          Left = 396.969696970000000000
          Top = 349.799319700000000000
          Width = 138.858983540000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haCenter
          ParentFont = False
          WordWrap = False
        end
        object Memo96: TfrxMemoView
          Top = 368.981137880000000000
          Width = 534.556191840000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              'Instru'#195#167#195#181'es (Todas as informa'#195#167#195#181'es deste bloqueto s'#195#163'o de excl' +
              'usiva responsabilidade do cedente.)')
          ParentFont = False
        end
        object TituloInstrucao1: TfrxMemoView
          Top = 380.344774250000000000
          Width = 533.963513330000000000
          Height = 78.746134840000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[Titulo."Mensagem"]')
          ParentFont = False
        end
        object Memo97: TfrxMemoView
          Top = 459.890228790000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Sacado:')
          ParentFont = False
        end
        object TituloSacado_NomeSacado1: TfrxMemoView
          Left = 95.454545450000000000
          Top = 459.890228790000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'Sacado_NomeSacado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[Titulo."Sacado_NomeSacado"]')
          ParentFont = False
        end
        object Memo98: TfrxMemoView
          Left = 537.121212120000000000
          Top = 459.890228790000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'CPF / CNPJ')
          ParentFont = False
        end
        object TituloSacado_CNPJCPF: TfrxMemoView
          Left = 537.121212120000000000
          Top = 478.829622720000000000
          Width = 166.416203030000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'Sacado_CNPJCPF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[Titulo."Sacado_CNPJCPF"]')
          ParentFont = False
          WordWrap = False
        end
        object TituloSacado_Logradouro: TfrxMemoView
          Left = 95.454545450000000000
          Top = 478.829622720000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[Titulo."Sacado_Logradouro"], [Titulo."Sacado_Numero"]')
          ParentFont = False
          WordWrap = False
        end
        object TituloSacado_Bairro: TfrxMemoView
          Left = 95.454545450000000000
          Top = 497.769016670000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'Sacado_Bairro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[Titulo."Sacado_Bairro"]')
          ParentFont = False
        end
        object TituloSacado_Cidade: TfrxMemoView
          Left = 95.454545450000000000
          Top = 516.708410600000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              '[FormatMaskText('#39'99.999-99;0; '#39', <Titulo."Sacado_CEP">)] - [Titu' +
              'lo."Sacado_Cidade"] / [Titulo."Sacado_UF"]')
          ParentFont = False
          WordWrap = False
        end
        object Line6: TfrxLineView
          Align = baWidth
          Top = 547.496289390000000000
          Width = 718.110700000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo99: TfrxMemoView
          Left = 537.121212120000000000
          Top = 516.708410600000000000
          Width = 132.283464570000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'C'#195#179'digo de Baixa')
          ParentFont = False
        end
        object Memo100: TfrxMemoView
          Top = 535.617501510000000000
          Width = 495.118344570000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            ' Sacador/Avalista: [Titulo."Sacado_Avalista"]')
          ParentFont = False
        end
        object Memo101: TfrxMemoView
          Top = 548.526592420000000000
          Width = 146.677403960000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            ' Recebemos atrav'#195#169's do cheque n'#195#186'mero')
          ParentFont = False
        end
        object Memo102: TfrxMemoView
          Left = 222.727272730000000000
          Top = 548.526592420000000000
          Width = 272.434979720000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'do banco')
          ParentFont = False
        end
        object Memo103: TfrxMemoView
          Left = 495.454545450000000000
          Top = 548.526592420000000000
          Width = 204.403439720000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Autentica'#195#167#195#163'o Mec'#195#162'nica')
          ParentFont = False
        end
        object Memo104: TfrxMemoView
          Top = 560.647804540000000000
          Width = 495.162252440000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              ' Esta quita'#195#167#195#163'o s'#195#179' ter'#195#161' validade ap'#195#179's o pagamento do cheque ' +
              'pelo')
          ParentFont = False
        end
        object Memo105: TfrxMemoView
          Top = 572.769016660000000000
          Width = 495.162252440000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            ' banco sacado.')
          ParentFont = False
        end
        object Memo67: TfrxMemoView
          Left = 535.606060610000000000
          Top = 700.041743940000000000
          Width = 184.372447710000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          Memo.UTF8 = (
            ' Nosso N'#195#186'mero')
          ParentFont = False
        end
        object Memo68: TfrxMemoView
          Left = 535.606060610000000000
          Top = 710.647804540000000000
          Width = 167.923005760000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[Titulo."NossoNum"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo69: TfrxMemoView
          Left = 535.606060610000000000
          Top = 730.344774240000000000
          Width = 184.372447710000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          Memo.UTF8 = (
            ' ( = ) Valor do Documento')
          ParentFont = False
        end
        object Memo70: TfrxMemoView
          Left = 535.606060610000000000
          Top = 740.950834840000000000
          Width = 167.923005760000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[Titulo."ValorDocumento"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo71: TfrxMemoView
          Left = 536.363636370000000000
          Top = 759.890228780000000000
          Width = 184.372447710000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop]
          Memo.UTF8 = (
            ' ( - ) Desconto / Abatimento')
          ParentFont = False
        end
        object Memo72: TfrxMemoView
          Left = 536.363636370000000000
          Top = 771.253865140000000000
          Width = 167.923005760000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftBottom]
          HAlign = haRight
          ParentFont = False
          WordWrap = False
        end
        object Memo73: TfrxMemoView
          Left = 536.363636370000000000
          Top = 790.193259080000000000
          Width = 184.372447710000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft]
          Memo.UTF8 = (
            ' ( + ) Mora / Multa')
          ParentFont = False
        end
        object Memo74: TfrxMemoView
          Left = 536.363636370000000000
          Top = 801.556895440000000000
          Width = 167.923005760000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftBottom]
          HAlign = haRight
          ParentFont = False
          WordWrap = False
        end
        object Memo75: TfrxMemoView
          Left = 536.363636370000000000
          Top = 820.496289390000000000
          Width = 184.372447710000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft]
          Memo.UTF8 = (
            ' ( = ) Valor Cobrado')
          ParentFont = False
        end
        object Memo76: TfrxMemoView
          Left = 536.363636370000000000
          Top = 831.859925750000000000
          Width = 167.923005760000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft]
          HAlign = haRight
          ParentFont = False
          WordWrap = False
        end
        object Line4: TfrxLineView
          Align = baWidth
          Top = 850.799319690000000000
          Width = 718.110700000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo106: TfrxMemoView
          Top = 700.041743930000000000
          Width = 132.283464570000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Memo.UTF8 = (
            ' Data do Documento')
          ParentFont = False
        end
        object Memo107: TfrxMemoView
          Top = 711.162956050000000000
          Width = 132.283464570000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[Titulo."DataDocumento"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo108: TfrxMemoView
          Left = 132.909090910000000000
          Top = 700.041743930000000000
          Width = 132.283464570000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Memo.UTF8 = (
            ' N'#195#186'mero do Documento')
          ParentFont = False
        end
        object Memo109: TfrxMemoView
          Left = 132.909090910000000000
          Top = 711.162956050000000000
          Width = 132.283464570000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[Titulo."NumeroDocumento"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo110: TfrxMemoView
          Left = 265.121212120000000000
          Top = 700.041743930000000000
          Width = 66.141732280000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Memo.UTF8 = (
            ' Esp'#195#169'cie Doc.')
          ParentFont = False
        end
        object Memo111: TfrxMemoView
          Left = 265.121212120000000000
          Top = 711.121450720000000000
          Width = 66.141732280000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[Titulo."EspecieDoc"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo112: TfrxMemoView
          Left = 331.030303030000000000
          Top = 700.041743930000000000
          Width = 66.141732280000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Memo.UTF8 = (
            ' Aceite')
          ParentFont = False
        end
        object Memo113: TfrxMemoView
          Left = 331.030303030000000000
          Top = 711.121450720000000000
          Width = 66.141732280000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[IIF(<Titulo."Aceite"> = 0, '#39'Sim'#39', '#39'N'#195#163'o'#39')]')
          ParentFont = False
          WordWrap = False
        end
        object Memo114: TfrxMemoView
          Left = 396.969696960000000000
          Top = 700.041743930000000000
          Width = 138.859460760000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Memo.UTF8 = (
            ' Data do Processamento')
          ParentFont = False
        end
        object Memo115: TfrxMemoView
          Left = 396.969696960000000000
          Top = 711.162956050000000000
          Width = 138.858983540000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[Titulo."DataProcessamento"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo116: TfrxMemoView
          Top = 730.344774240000000000
          Width = 132.283464570000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Memo.UTF8 = (
            ' Uso do Banco')
          ParentFont = False
        end
        object Memo117: TfrxMemoView
          Top = 741.465986360000000000
          Width = 132.283464570000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haCenter
          ParentFont = False
          WordWrap = False
        end
        object Memo118: TfrxMemoView
          Left = 132.575757580000000000
          Top = 730.344774240000000000
          Width = 66.141732280000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Memo.UTF8 = (
            ' Carteira')
          ParentFont = False
        end
        object Memo119: TfrxMemoView
          Left = 132.575757580000000000
          Top = 741.424481030000000000
          Width = 66.141732280000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[Titulo."Carteira"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo120: TfrxMemoView
          Left = 198.636363640000000000
          Top = 730.344774240000000000
          Width = 66.141732280000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Memo.UTF8 = (
            ' Esp'#195#169'cie')
          ParentFont = False
        end
        object Memo121: TfrxMemoView
          Left = 198.636363640000000000
          Top = 741.424481030000000000
          Width = 66.141732280000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[Titulo."EspecieMod"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo122: TfrxMemoView
          Left = 265.151515150000000000
          Top = 730.344774240000000000
          Width = 132.283464570000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Memo.UTF8 = (
            ' Quantidade')
          ParentFont = False
        end
        object Memo123: TfrxMemoView
          Left = 265.151515150000000000
          Top = 741.465986360000000000
          Width = 132.283464570000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haCenter
          ParentFont = False
          WordWrap = False
        end
        object Memo124: TfrxMemoView
          Left = 396.969696970000000000
          Top = 730.344774240000000000
          Width = 138.859460760000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Memo.UTF8 = (
            ' Valor')
          ParentFont = False
        end
        object Memo125: TfrxMemoView
          Left = 396.969696970000000000
          Top = 741.465986360000000000
          Width = 138.858983540000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haCenter
          ParentFont = False
          WordWrap = False
        end
        object Memo126: TfrxMemoView
          Top = 760.647804540000000000
          Width = 534.556191840000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              'Instru'#195#167#195#181'es (Todas as informa'#195#167#195#181'es deste bloqueto s'#195#163'o de excl' +
              'usiva responsabilidade do cedente.)')
          ParentFont = False
        end
        object Memo127: TfrxMemoView
          Top = 772.011440910000000000
          Width = 534.721089090000000000
          Height = 77.988559090000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[Titulo."Mensagem"]')
          ParentFont = False
        end
        object Memo128: TfrxMemoView
          Top = 851.556895450000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Sacado:')
          ParentFont = False
        end
        object Memo129: TfrxMemoView
          Left = 95.454545450000000000
          Top = 851.556895450000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'Sacado_NomeSacado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[Titulo."Sacado_NomeSacado"]')
          ParentFont = False
        end
        object Memo130: TfrxMemoView
          Left = 537.121212120000000000
          Top = 851.556895450000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'CPF / CNPJ')
          ParentFont = False
        end
        object Memo131: TfrxMemoView
          Left = 537.121212120000000000
          Top = 870.496289380000000000
          Width = 166.416203030000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'Sacado_CNPJCPF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[Titulo."Sacado_CNPJCPF"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo132: TfrxMemoView
          Left = 95.454545450000000000
          Top = 870.496289380000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[Titulo."Sacado_Logradouro"], [Titulo."Sacado_Numero"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo134: TfrxMemoView
          Left = 95.454545460000000000
          Top = 889.435683330000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'Sacado_Bairro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[Titulo."Sacado_Bairro"]')
          ParentFont = False
        end
        object Memo135: TfrxMemoView
          Left = 95.454545450000000000
          Top = 908.375077260000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              '[FormatMaskText('#39'99.999-99;0; '#39', <Titulo."Sacado_CEP">)] - [Titu' +
              'lo."Sacado_Cidade"] / [Titulo."Sacado_UF"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo136: TfrxMemoView
          Left = 537.121212120000000000
          Top = 908.375077260000000000
          Width = 132.283464570000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'C'#195#179'digo de Baixa')
          ParentFont = False
        end
        object Memo137: TfrxMemoView
          Top = 927.284168170000000000
          Width = 495.118344570000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            ' Sacador/Avalista: [Titulo."Sacado_Avalista"]')
          ParentFont = False
        end
        object Line5: TfrxLineView
          Align = baWidth
          Top = 939.435683330000000000
          Width = 718.110700000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo138: TfrxMemoView
          Left = 495.454545450000000000
          Top = 940.193259090000000000
          Width = 204.403439720000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Autentica'#195#167#195#163'o Mec'#195#162'nica - Ficha de Compensa'#195#167#195#163'o')
          ParentFont = False
        end
        object BarCode1: TfrxBarCodeView
          Left = 5.303030310000000000
          Top = 941.708410610000000000
          Width = 330.000000000000000000
          Height = 51.401574800000000000
          ShowHint = False
          BarType = bcCode_2_5_interleaved
          Expression = '<Titulo."CodBarras">'
          Rotation = 0
          ShowText = False
          Text = '75691028460042664431623456720012150740000010000'
          WideBarRatio = 2.000000000000000000
          Zoom = 1.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
        end
      end
    end
  end
  object frrRequisicaoCliente: TfrxReport
    Version = '4.9.72'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PreviewOptions.ZoomMode = zmPageWidth
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40928.407150601900000000
    ReportOptions.LastChange = 41856.560272638890000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 344
    Top = 400
    Datasets = <
      item
        DataSet = frdCliente
        DataSetName = 'frdCliente'
      end
      item
        DataSet = frdEmpresa
        DataSetName = 'frdEmpresa'
      end
      item
        DataSet = frdRequisicaoCliente
        DataSetName = 'frdRequisicaoCliente'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Requisicao: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Lucida Console'
      Font.Style = []
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object bndReportTitle: TfrxReportTitle
        Height = 116.858380000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object frdVendaCODCONTROL: TfrxMemoView
          Left = 559.370440000000000000
          Top = 18.897650000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.UTF8 = (
            
              '[frdRequisicaoCliente."ANO"]/[FormatFloat('#39'0000000'#39',<frdRequisic' +
              'aoCliente."NUMERO">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 559.370440000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            'N '#195#186' m e r o   C o n t r o l e :')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 559.370440000000000000
          Top = 37.795300000000000000
          Width = 158.740260000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frdRequisicaoCliente."SITUACAO_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Picture1: TfrxPictureView
          Left = 3.779530000000000000
          Width = 139.842610000000000000
          Height = 79.370130000000000000
          ShowHint = False
          DataField = 'LOGO'
          DataSet = frdEmpresa
          DataSetName = 'frdEmpresa'
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object frdEmpresaRZSOC: TfrxMemoView
          Left = 143.622140000000000000
          Width = 411.968770000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frdEmpresa."RZSOC"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frdEmpresaNMFANT: TfrxMemoView
          Left = 143.622140000000000000
          Top = 18.897650000000000000
          Width = 411.968770000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            
              'CNPJ.: [FormatMaskText('#39'##.###.###/####-##;0;'#39',<frdEmpresa."CNPJ' +
              '">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdFone: TfrxMemoView
          Left = 143.622140000000000000
          Top = 34.015770000000000000
          Width = 411.968770000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            'FONE: [FormatMaskText('#39'(##)####.####;0;'#39',<frdEmpresa."FONE">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 143.622140000000000000
          Top = 49.133890000000000000
          Width = 411.968770000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            
              '[frdEmpresa."TLG_SIGLA"] [frdEmpresa."LOG_NOME"], [frdEmpresa."N' +
              'UMERO_END"], [frdEmpresa."BAI_NOME"] - [frdEmpresa."CID_NOME"]/[' +
              'frdEmpresa."EST_SIGLA"] CEP.: [FormatMaskText('#39'##.###-###;0;'#39',<f' +
              'rdEmpresa."CEP">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Line1: TfrxLineView
          Top = 83.149660000000000000
          Width = 718.110700000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo44: TfrxMemoView
          Left = 143.622140000000000000
          Top = 64.252010000000000000
          Width = 574.488560000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            '[frdEmpresa."HOME_PAGE"] / [frdEmpresa."EMAIL"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo45: TfrxMemoView
          Top = 90.708720000000000000
          Width = 721.890230000000000000
          Height = 18.897650000000000000
          ShowHint = False
          CharSpacing = 4.000000000000000000
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            'REQUISI'#195#8225#195#402'O/MANIFESTO DE PRODUTOS')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndMasterData: TfrxMasterData
        Height = 18.897650000000000000
        Top = 302.362400000000000000
        Width = 718.110700000000000000
        DataSet = frdRequisicaoCliente
        DataSetName = 'frdRequisicaoCliente'
        RowCount = 0
        object frdItensCODPROD: TfrxMemoView
          Left = 22.677180000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            ' [frdRequisicaoCliente."CODPRODUTO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdItensSEQ: TfrxMemoView
          Width = 22.677180000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[Line]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdItensDESCRI: TfrxMemoView
          Left = 75.590600000000000000
          Width = 419.527659130000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            
              ' [frdRequisicaoCliente."DESCRI"] (Ref.: [frdRequisicaoCliente."R' +
              'EFERENCIA"])')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 495.118430000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,###,##0'#39',<frdRequisicaoCliente."QUANTIDADE">)]' +
              ' ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 642.520100000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<frdRequisicaoCliente."TOTAL_MEDIO">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 540.472790000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            ' [frdRequisicaoCliente."UNIDADE"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 578.268090000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<frdRequisicaoCliente."VALOR_MEDIO">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndPageFooter: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 737.008350000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 566.929500000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            'P '#195#161' g i n a :  [Page#]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndHeader: TfrxHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Lucida Console'
        Font.Style = []
        Height = 83.149660000000000000
        ParentFont = False
        Top = 196.535560000000000000
        Width = 718.110700000000000000
        object frdVendaNOME: TfrxMemoView
          Top = 11.338590000000000000
          Width = 415.748300000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            ' [frdCliente."NOME"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Width = 415.748300000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' Cliente:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 415.748300000000000000
          Width = 207.874150000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' CPF/CNPJ.:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 415.748300000000000000
          Top = 11.338590000000000000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            
              ' [IIF(<frdCliente."PESSOA_FISICA">=1,FormatMaskText('#39'###.###.###' +
              '-##;0;'#39',<frdCliente."CNPJ">),FormatMaskText('#39'##.###.###/####-##;' +
              '0;'#39',<frdCliente."CNPJ">))]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 623.622450000000000000
          Width = 94.488250000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'Data: ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 623.622450000000000000
          Top = 11.338590000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Lucida Console'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            
              ' [FormatDateTime('#39'dd/mm/yyyy'#39',<frdRequisicaoCliente."DATA_MOVIME' +
              'NTO">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Line2: TfrxLineView
          Top = 79.370130000000000000
          Width = 718.110700000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo23: TfrxMemoView
          Top = 64.252010000000000000
          Width = 22.677180000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '#')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 22.677180000000000000
          Top = 64.252010000000000000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' C'#195#179'digo')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 75.590600000000000000
          Top = 64.252010000000000000
          Width = 419.527659130000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' Descri'#195#167#195#163'o')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Top = 41.574830000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            
              ' [Trim(<frdCliente."TLG_SIGLA"> + '#39' '#39' + <frdCliente."LOG_NOME">)' +
              '], [frdCliente."NUMERO_END"], [frdCliente."BAI_NOME"] - [frdClie' +
              'nte."CID_NOME"]/[frdCliente."EST_SIGLA"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Top = 30.236240000000000000
          Width = 718.110700000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' Endere'#195#167'o:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 540.472790000000000000
          Top = 64.252010000000000000
          Width = 37.795300000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' Und.')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 578.268090000000000000
          Top = 64.252010000000000000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'V. M'#195#169'dio ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 495.118430000000000000
          Top = 64.252010000000000000
          Width = 45.354323390000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'Qtde.')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 642.520100000000000000
          Top = 64.252010000000000000
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'T O T A L ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndReportSummary: TfrxReportSummary
        Height = 332.598640000000000000
        Top = 381.732530000000000000
        Width = 718.110700000000000000
        object SysMemo1: TfrxSysMemoView
          Left = 623.622450000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',SUM(<frdRequisicaoCliente."TOTAL_MEDIO">,bn' +
              'dMasterData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo14: TfrxMemoView
          Left = 480.000310000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          HAlign = haRight
          Memo.UTF8 = (
            'T O T A L    G E R A L :')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line3: TfrxLineView
          Top = 22.677180000000000000
          Width = 718.110700000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo30: TfrxMemoView
          Top = 37.795300000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            ' [frdRequisicaoCliente."INSERCAO_USUARIO"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Top = 26.456710000000000000
          Width = 718.110700000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' Registrada por:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Top = 68.031540000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            ' [frdRequisicaoCliente."AUTORIZACAO_USUARIO"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Top = 56.692950000000000000
          Width = 718.110700000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' Autorizada por:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Top = 102.047310000000000000
          Width = 718.110700000000000000
          Height = 52.913420000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frdRequisicaoCliente."OBSERVACOES"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          Top = 86.929190000000000000
          Width = 718.110700000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Memo.UTF8 = (
            ' Observa'#195#167#195#163'o:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          Left = 37.795300000000000000
          Top = 166.299320000000000000
          Width = 623.622450000000000000
          Height = 71.811070000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial Narrow'
          Font.Style = []
          HAlign = haBlock
          Memo.UTF8 = (
            
              '                 Autorizamos a sa'#195#173'da do(s) produto(s) acima rel' +
              'acionado(s) para o cliente [frdCliente."NOME"], [IIF(<frdCliente' +
              '."PESSOA_FISICA">=1,'#39'CPF'#39','#39'CNPJ'#39')] [IIF(<frdCliente."PESSOA_FISI' +
              'CA">=1,FormatMaskText('#39'###.###.###-##;0;'#39',<frdCliente."CNPJ">),F' +
              'ormatMaskText('#39'##.###.###/####-##;0;'#39',<frdCliente."CNPJ">))], so' +
              'b a responsabilidade e/ou a pedido de [frdRequisicaoCliente."REC' +
              'EBEDOR_NOME"].')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 411.968770000000000000
          Top = 294.803340000000000000
          Width = 249.448980000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frdRequisicaoCliente."RECEBEDOR_NOME"]'
            '[frdRequisicaoCliente."RECEBEDOR_RG"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Left = 37.795300000000000000
          Top = 294.803340000000000000
          Width = 249.448980000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frdEmpresa."RZSOC"]'
            '[FormatMaskText('#39'##.###.###/####-##;0;'#39',<frdEmpresa."CNPJ">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
    end
  end
  object FrrECFPoolerRequisicaoCliente: TfrxReport
    Version = '4.9.72'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40958.629806064810000000
    ReportOptions.LastChange = 40960.806519317130000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    OnGetValue = FrECFPoolerGetValue
    Left = 312
    Top = 400
    Datasets = <
      item
        DataSet = frdCliente
        DataSetName = 'frdCliente'
      end
      item
        DataSet = frdEmpresa
        DataSetName = 'frdEmpresa'
      end
      item
        DataSet = frdRequisicaoCliente
        DataSetName = 'frdRequisicaoCliente'
      end>
    Variables = <
      item
        Name = ' Local'
        Value = Null
      end
      item
        Name = 'CEPEmissor'
        Value = #39'00.000-000'#39
      end
      item
        Name = 'CNPJEmissor'
        Value = #39'00.000.000/0000-00'#39
      end
      item
        Name = 'FONEEmissor'
        Value = #39'(91)0000-0000'#39
      end
      item
        Name = 'CNPJCliente'
        Value = 
          'IIF(<frdCliente."PESSOA_FISICA">=1,FormatMaskText('#39'###.###.###-#' +
          '#;0;'#39',<frdCliente."CNPJ">),FormatMaskText('#39'##.###.###/####-##;0;' +
          #39',<frdCliente."CNPJ">))'
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Lucida Console'
      Font.Style = []
      PaperWidth = 74.000000000000000000
      PaperHeight = 306.000000000000000000
      PaperSize = 161
      LeftMargin = 4.000000000000000000
      RightMargin = 4.000000000000000000
      TopMargin = 4.000000000000000000
      BottomMargin = 4.000000000000000000
      object bndReportTitle: TfrxReportTitle
        Height = 117.165430000000000000
        Top = 18.897650000000000000
        Width = 249.448980000000000000
        Stretched = True
        object frdEmpresaNMFANT: TfrxMemoView
          Width = 249.448980000000000000
          Height = 41.574830000000000000
          ShowHint = False
          DataField = 'NMFANT'
          DataSet = frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[frdEmpresa."NMFANT"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo1: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Top = 41.574830000000000000
          Width = 249.448980000000000000
          Height = 52.913420000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            
              '[frdEmpresa."TLG_SIGLA"] [frdEmpresa."LOG_NOME"], [frdEmpresa."N' +
              'UMERO_END"], [frdEmpresa."BAI_NOME"] [frdEmpresa."CID_NOME"]/[fr' +
              'dEmpresa."EST_SIGLA"] CEP.: [CEPEmissor]'
            'Fone: [FONEEmissor]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Top = 94.488250000000000000
          Width = 249.448980000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            'CNPJ: [CNPJEmissor] IE: [frdEmpresa."IE"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndMasterData: TfrxMasterData
        Height = 30.236240000000000000
        Top = 366.614410000000000000
        Width = 249.448980000000000000
        DataSet = frdRequisicaoCliente
        DataSetName = 'frdRequisicaoCliente'
        RowCount = 0
        object Memo7: TfrxMemoView
          Width = 22.677180000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            '[FormatFloat('#39'#00'#39',<Line>)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 22.677180000000000000
          Width = 37.795300000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            '[frdRequisicaoCliente."CODPRODUTO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 60.472480000000000000
          Width = 188.976500000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            '[frdRequisicaoCliente."DESCRI"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 192.756030000000000000
          Top = 15.118120000000000000
          Width = 56.692950000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<frdRequisicaoCliente."TOTAL_MEDIO">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 136.063080000000000000
          Top = 15.118120000000000000
          Width = 56.692950000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<frdRequisicaoCliente."VALOR_MEDIO">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 79.370130000000000000
          Top = 15.118120000000000000
          Width = 56.692950000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.##'#39',<frdRequisicaoCliente."QUANTIDADE">)]   x ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndHeader: TfrxHeader
        Height = 147.401670000000000000
        Top = 196.535560000000000000
        Width = 249.448980000000000000
        object Memo13: TfrxMemoView
          Top = 75.590600000000000000
          Width = 249.448980000000000000
          Height = 30.236240000000000000
          ShowHint = False
          DataSet = frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            
              '[IIF(<frdRequisicaoCliente."SITUACAO">=1,'#39'REQ. ABERTA'#39',IIF(<frdR' +
              'equisicaoCliente."SITUACAO">=2,'#39'REQUISI'#195#8225#195#402'O PRODUTO'#39',IIF(<frdRe' +
              'quisicaoCliente."SITUACAO">=3,'#39'REQUISI'#195#8225#195#402'O PRODUTO'#39',IIF(<frdReq' +
              'uisicaoCliente."SITUACAO">=4,'#39'REQ. CANCELADA'#39','#39'REQUISI'#195#8225#195#402'O'#39'))))' +
              ']')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            'Data:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 52.913420000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            '[frdRequisicaoCliente."DATA_MOVIMENTO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 143.622140000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            'Controle:')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 185.196970000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[frdRequisicaoCliente."ANO"][FormatFloat('#39'"/"###0000000'#39',<frdReq' +
              'uisicaoCliente."NUMERO">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Top = 18.897650000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            'Atendente:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 52.913420000000000000
          Top = 18.897650000000000000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            '[frdRequisicaoCliente."INSERCAO_USUARIO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Top = 37.795300000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            'Cliente:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 52.913420000000000000
          Top = 37.795300000000000000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            '[frdCliente."NOME"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Top = 105.826840000000000000
          Width = 22.677180000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            '#')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 22.677180000000000000
          Top = 105.826840000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            'C'#195#179'digo')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 60.472480000000000000
          Top = 105.826840000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            'Descri'#195#167#195#163'o')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Top = 124.724490000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'Quant. ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 136.063080000000000000
          Top = 124.724490000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'Valor Un. ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 192.756030000000000000
          Top = 124.724490000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'Total ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Top = 56.692950000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            'CPF/CNPJ:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Left = 52.913420000000000000
          Top = 56.692950000000000000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            '[CNPJCliente]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndReportSummary: TfrxReportSummary
        Height = 79.370130000000000000
        Top = 457.323130000000000000
        Width = 249.448980000000000000
        object Memo17: TfrxMemoView
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            'TOTAL')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 132.283550000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',SUM(<frdRequisicaoCliente."TOTAL_MEDIO">,bn' +
              'dMasterData))]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Top = 18.897650000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            'Autorizador:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 64.252010000000000000
          Top = 18.897650000000000000
          Width = 185.196970000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            '[frdRequisicaoCliente."AUTORIZACAO_USUARIO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Top = 37.795300000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            'Respons'#195#161'vel:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 64.252010000000000000
          Top = 37.795300000000000000
          Width = 185.196970000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            '[frdRequisicaoCliente."RECEBEDOR_NOME"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Top = 56.692950000000000000
          Width = 249.448980000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'Impresso em [Date] '#195#160's [Time]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
    end
  end
  object qryRequisicaoCliente: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    SQL.Strings = (
      'Select'
      '    r.ano'
      '  , r.numero'
      '  , r.situacao'
      '  , case r.situacao'
      '      when 1 then '#39'Aberta'#39
      '      when 2 then '#39'Autorizada'#39
      '      when 3 then '#39'Fechada'#39
      '      when 4 then '#39'Cancelada'#39
      '    end as situacao_desc'
      '  , r.codempresa'
      '  , r.codcliente'
      '  , r.data_movimento'
      
        '  , (Select first 1 us.nomecompleto from TBUSERS us where us.nom' +
        'e = r.insercao_usuario) as insercao_usuario'
      
        '  , (Select first 1 us.nomecompleto from TBUSERS us where us.nom' +
        'e = r.autorizacao_usuario) as autorizacao_usuario'
      '  , r.recebedor_nome'
      '  , r.recebedor_rg'
      '  , r.observacoes'
      '  , i.item'
      '  , i.codproduto'
      '  , p.descri'
      '  , p.referencia'
      '  , i.quantidade'
      
        '  , coalesce(nullif(Trim(u.unp_sigla), '#39#39'), u.unp_descricao) as ' +
        'unidade'
      '  , i.valor_medio'
      '  , (i.quantidade * i.valor_medio) as total_medio'
      'from TBCLIENTE_REQUISICAO r'
      
        '  inner join TBCLIENTE_REQUISICAO_ITEM i on (i.ano = r.ano and i' +
        '.numero = r.numero)'
      '  inner join TBPRODUTO p on (p.cod = i.codproduto)'
      '  left join TBUNIDADEPROD u on (u.unp_cod = i.unidade)'
      ''
      'where r.ano    = :ano'
      '  and r.numero = :num'
      '')
    Left = 312
    Top = 448
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ano'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'num'
        ParamType = ptUnknown
      end>
  end
  object frdRequisicaoCliente: TfrxDBDataset
    UserName = 'frdRequisicaoCliente'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ANO=ANO'
      'NUMERO=NUMERO'
      'SITUACAO=SITUACAO'
      'SITUACAO_DESC=SITUACAO_DESC'
      'CODEMPRESA=CODEMPRESA'
      'CODCLIENTE=CODCLIENTE'
      'DATA_MOVIMENTO=DATA_MOVIMENTO'
      'INSERCAO_USUARIO=INSERCAO_USUARIO'
      'AUTORIZACAO_USUARIO=AUTORIZACAO_USUARIO'
      'RECEBEDOR_NOME=RECEBEDOR_NOME'
      'RECEBEDOR_RG=RECEBEDOR_RG'
      'OBSERVACOES=OBSERVACOES'
      'ITEM=ITEM'
      'CODPRODUTO=CODPRODUTO'
      'DESCRI=DESCRI'
      'REFERENCIA=REFERENCIA'
      'QUANTIDADE=QUANTIDADE'
      'UNIDADE=UNIDADE'
      'VALOR_MEDIO=VALOR_MEDIO'
      'TOTAL_MEDIO=TOTAL_MEDIO')
    DataSet = qryRequisicaoCliente
    BCDToCurrency = False
    Left = 344
    Top = 448
  end
  object cdsLOG: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    ForcedRefresh = True
    CachedUpdates = True
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'Select'
      '    t.usuario'
      '  , t.data_hora'
      '  , t.tipo'
      '  , t.descricao'
      '  , t.especificacao'
      'from TBLOG_TRANSACAO t'
      'where 1=0')
    ModifySQL.Strings = (
      '')
    GeneratorField.Field = 'CODCONTROL'
    UpdateObject = updLOG
    Left = 336
    Top = 24
    object cdsLOGUSUARIO: TIBStringField
      FieldName = 'USUARIO'
      Origin = '"TBLOG_TRANSACAO"."USUARIO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 50
    end
    object cdsLOGDATA_HORA: TDateTimeField
      FieldName = 'DATA_HORA'
      Origin = '"TBLOG_TRANSACAO"."DATA_HORA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsLOGTIPO: TSmallintField
      FieldName = 'TIPO'
      Origin = '"TBLOG_TRANSACAO"."TIPO"'
      ProviderFlags = [pfInUpdate]
    end
    object cdsLOGDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"TBLOG_TRANSACAO"."DESCRICAO"'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsLOGESPECIFICACAO: TMemoField
      FieldName = 'ESPECIFICACAO'
      Origin = '"TBLOG_TRANSACAO"."ESPECIFICACAO"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
  end
  object updLOG: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  USUARIO,'
      '  DATA_HORA,'
      '  TIPO,'
      '  DESCRICAO,'
      '  ESPECIFICACAO'
      'from TBLOG_TRANSACAO '
      'where'
      '  DATA_HORA = :DATA_HORA and'
      '  USUARIO = :USUARIO')
    ModifySQL.Strings = (
      'update TBLOG_TRANSACAO'
      'set'
      '  DATA_HORA = :DATA_HORA,'
      '  DESCRICAO = :DESCRICAO,'
      '  ESPECIFICACAO = :ESPECIFICACAO,'
      '  TIPO = :TIPO,'
      '  USUARIO = :USUARIO'
      'where'
      '  DATA_HORA = :OLD_DATA_HORA and'
      '  USUARIO = :OLD_USUARIO')
    InsertSQL.Strings = (
      'insert into TBLOG_TRANSACAO'
      '  (DATA_HORA, DESCRICAO, ESPECIFICACAO, TIPO, USUARIO)'
      'values'
      '  (:DATA_HORA, :DESCRICAO, :ESPECIFICACAO, :TIPO, :USUARIO)')
    DeleteSQL.Strings = (
      'delete from TBLOG_TRANSACAO'
      'where'
      '  DATA_HORA = :OLD_DATA_HORA and'
      '  USUARIO = :OLD_USUARIO')
    Left = 368
    Top = 24
  end
  object qryNFeEmitidaEntrada: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    SQL.Strings = (
      'Select'
      '    n.ANOCOMPRA'
      '  , n.NUMCOMPRA'
      '  , n.EMPRESA'
      '  , n.DATAEMISSAO'
      '  , n.HORAEMISSAO'
      '  , n.SERIE'
      '  , n.NUMERO'
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
      'where n.ANOCOMPRA = :anocompra'
      '  and n.NUMCOMPRA = :numcompra')
    Left = 144
    Top = 408
    ParamData = <
      item
        DataType = ftInteger
        Name = 'anocompra'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'numcompra'
        ParamType = ptInput
        Value = 0
      end>
    object qryNFeEmitidaEntradaANOCOMPRA: TSmallintField
      FieldName = 'ANOCOMPRA'
      Origin = '"TBNFE_ENVIADA"."ANOCOMPRA"'
    end
    object qryNFeEmitidaEntradaNUMCOMPRA: TIntegerField
      FieldName = 'NUMCOMPRA'
      Origin = '"TBNFE_ENVIADA"."NUMCOMPRA"'
    end
    object qryNFeEmitidaEntradaEMPRESA: TIBStringField
      FieldName = 'EMPRESA'
      Origin = '"TBNFE_ENVIADA"."EMPRESA"'
      Size = 18
    end
    object qryNFeEmitidaEntradaDATAEMISSAO: TDateField
      FieldName = 'DATAEMISSAO'
      Origin = '"TBNFE_ENVIADA"."DATAEMISSAO"'
    end
    object qryNFeEmitidaEntradaHORAEMISSAO: TTimeField
      FieldName = 'HORAEMISSAO'
      Origin = '"TBNFE_ENVIADA"."HORAEMISSAO"'
    end
    object qryNFeEmitidaEntradaSERIE: TIBStringField
      FieldName = 'SERIE'
      Origin = '"TBNFE_ENVIADA"."SERIE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object qryNFeEmitidaEntradaNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = '"TBNFE_ENVIADA"."NUMERO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryNFeEmitidaEntradaMODELO: TSmallintField
      FieldName = 'MODELO'
      Origin = '"TBNFE_ENVIADA"."MODELO"'
    end
    object qryNFeEmitidaEntradaVERSAO: TSmallintField
      FieldName = 'VERSAO'
      Origin = '"TBNFE_ENVIADA"."VERSAO"'
    end
    object qryNFeEmitidaEntradaCHAVE: TIBStringField
      FieldName = 'CHAVE'
      Origin = '"TBNFE_ENVIADA"."CHAVE"'
      Size = 250
    end
    object qryNFeEmitidaEntradaPROTOCOLO: TIBStringField
      FieldName = 'PROTOCOLO'
      Origin = '"TBNFE_ENVIADA"."PROTOCOLO"'
      Size = 250
    end
    object qryNFeEmitidaEntradaRECIBO: TIBStringField
      FieldName = 'RECIBO'
      Origin = '"TBNFE_ENVIADA"."RECIBO"'
      Size = 250
    end
    object qryNFeEmitidaEntradaXML_FILENAME: TIBStringField
      FieldName = 'XML_FILENAME'
      Origin = '"TBNFE_ENVIADA"."XML_FILENAME"'
      Size = 250
    end
    object qryNFeEmitidaEntradaXML_FILE: TMemoField
      FieldName = 'XML_FILE'
      Origin = '"TBNFE_ENVIADA"."XML_FILE"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object qryNFeEmitidaEntradaLOTE_ANO: TSmallintField
      FieldName = 'LOTE_ANO'
      Origin = '"TBNFE_ENVIADA"."LOTE_ANO"'
    end
    object qryNFeEmitidaEntradaLOTE_NUM: TIntegerField
      FieldName = 'LOTE_NUM'
      Origin = '"TBNFE_ENVIADA"."LOTE_NUM"'
      Required = True
    end
  end
  object qryAutorizacaoCompra: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    SQL.Strings = (
      'Select'
      '    a.ano'
      '  , a.codigo'
      '  , a.numero'
      '  , a.tipo'
      '  , case a.tipo'
      '      when 1 then '#39'Compra'#39
      '      when 2 then '#39'Servi'#231'o'#39
      '      when 3 then '#39'Compra/Servi'#231'o'#39
      '    end as tipo_desc'
      '  , a.status'
      '  , case a.status'
      '      when 0 then '#39'Em Edi'#231#227'o'#39
      '      when 1 then '#39'Aberta'#39
      '      when 2 then '#39'Autorizada'#39
      '      when 3 then '#39'Faturada'#39
      '      when 4 then '#39'Cancelada'#39
      '    end as status_desc'
      '  , a.empresa'
      '  , a.fornecedor'
      '  , a.emissao_data'
      
        '  , (Select first 1 us.nomecompleto from TBUSERS us where us.nom' +
        'e = a.emissao_usuario)    as usuario_emissor'
      '  , a.autorizado_data'
      
        '  , (Select first 1 us.nomecompleto from TBUSERS us where us.nom' +
        'e = a.autorizado_usuario) as usuario_autorizador'
      '  , a.transportador'
      '  , t.nomeforn as transportador_nome'
      '  , t.cnpj     as transportador_cnpj'
      '  , a.nome_contato'
      '  , a.recebedor_nome'
      '  , a.recebedor_funcao'
      '  , a.recebedor_cpf'
      '  , a.movito'
      '  , a.cliente  as cliente_codigo'
      '  , ci.nome     as cliente_nome'
      '  , ci.cnpj     as cliente_cnpf'
      '  , a.observacao'
      '  , a.endereco_entrega'
      '  , a.forma_pagto'
      '  , f.descri as forma_pagto_desc'
      '  , a.condicao_pagto'
      '  , c.cond_descricao      as condicao_pagto_desc'
      '  , c.cond_descricao_full as condicao_pagto_desc2'
      '  , a.valor_bruto    as valor_total_bruto'
      '  , a.valor_total_frete'
      '  , a.valor_total_ipi'
      '  , a.valor_desconto as valor_total_desconto'
      '  , a.valor_total    as valor_total_liquido'
      '  , i.seq'
      '  , i.produto'
      '  , p.descri'
      '  , p.descri_apresentacao'
      '  , p.referencia'
      '  , i.quantidade'
      
        '  , coalesce(nullif(Trim(u.unp_sigla), '#39#39'), u.unp_descricao) as ' +
        'unidade'
      '  , i.valor_unitario'
      '  , i.ipi_percentual  as percentual_ipi'
      '  , i.ipi_valor_total as valor_ipi'
      '  , i.valor_total'
      'from TBAUTORIZA_COMPRA a'
      
        '  inner join TBAUTORIZA_COMPRAITEM i on (i.ano = a.ano and i.cod' +
        'igo = a.codigo and i.empresa = a.empresa)'
      '  inner join TBPRODUTO p on (p.cod = i.produto)'
      '  left join TBFORNECEDOR t on (t.codforn = a.transportador)'
      '  left join TBUNIDADEPROD u on (u.unp_cod = i.unidade)'
      '  left join TBFORMPAGTO f on (f.cod = a.forma_pagto)'
      
        '  left join VW_CONDICAOPAGTO c on (c.cond_cod = a.condicao_pagto' +
        ')'
      '  left join TBCLIENTE ci on (ci.codigo = a.cliente)'
      ''
      'where a.ano    = :ano'
      '  and a.codigo = :cod'
      ''
      '')
    Left = 536
    Top = 176
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ano'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'cod'
        ParamType = ptInput
        Value = 0
      end>
  end
  object frdAutorizacaoCompra: TfrxDBDataset
    UserName = 'frdAutorizacaoCompra'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ANO=ANO'
      'CODIGO=CODIGO'
      'NUMERO=NUMERO'
      'TIPO=TIPO'
      'TIPO_DESC=TIPO_DESC'
      'STATUS=STATUS'
      'STATUS_DESC=STATUS_DESC'
      'EMPRESA=EMPRESA'
      'FORNECEDOR=FORNECEDOR'
      'EMISSAO_DATA=EMISSAO_DATA'
      'USUARIO_EMISSOR=USUARIO_EMISSOR'
      'AUTORIZADO_DATA=AUTORIZADO_DATA'
      'USUARIO_AUTORIZADOR=USUARIO_AUTORIZADOR'
      'TRANSPORTADOR=TRANSPORTADOR'
      'TRANSPORTADOR_NOME=TRANSPORTADOR_NOME'
      'TRANSPORTADOR_CNPJ=TRANSPORTADOR_CNPJ'
      'NOME_CONTATO=NOME_CONTATO'
      'RECEBEDOR_NOME=RECEBEDOR_NOME'
      'RECEBEDOR_FUNCAO=RECEBEDOR_FUNCAO'
      'RECEBEDOR_CPF=RECEBEDOR_CPF'
      'MOVITO=MOVITO'
      'CLIENTE_CODIGO=CLIENTE_CODIGO'
      'CLIENTE_NOME=CLIENTE_NOME'
      'CLIENTE_CNPF=CLIENTE_CNPF'
      'OBSERVACAO=OBSERVACAO'
      'ENDERECO_ENTREGA=ENDERECO_ENTREGA'
      'FORMA_PAGTO=FORMA_PAGTO'
      'FORMA_PAGTO_DESC=FORMA_PAGTO_DESC'
      'CONDICAO_PAGTO=CONDICAO_PAGTO'
      'CONDICAO_PAGTO_DESC=CONDICAO_PAGTO_DESC'
      'CONDICAO_PAGTO_DESC2=CONDICAO_PAGTO_DESC2'
      'VALOR_TOTAL_BRUTO=VALOR_TOTAL_BRUTO'
      'VALOR_TOTAL_FRETE=VALOR_TOTAL_FRETE'
      'VALOR_TOTAL_IPI=VALOR_TOTAL_IPI'
      'VALOR_TOTAL_DESCONTO=VALOR_TOTAL_DESCONTO'
      'VALOR_TOTAL_LIQUIDO=VALOR_TOTAL_LIQUIDO'
      'SEQ=SEQ'
      'PRODUTO=PRODUTO'
      'DESCRI=DESCRI'
      'DESCRI_APRESENTACAO=DESCRI_APRESENTACAO'
      'REFERENCIA=REFERENCIA'
      'QUANTIDADE=QUANTIDADE'
      'UNIDADE=UNIDADE'
      'VALOR_UNITARIO=VALOR_UNITARIO'
      'PERCENTUAL_IPI=PERCENTUAL_IPI'
      'VALOR_IPI=VALOR_IPI'
      'VALOR_TOTAL=VALOR_TOTAL')
    DataSet = qryAutorizacaoCompra
    BCDToCurrency = False
    Left = 568
    Top = 176
  end
  object frrAutorizacaoCompra: TfrxReport
    Version = '4.9.72'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40928.407150601900000000
    ReportOptions.LastChange = 41863.913688182870000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    OnGetValue = frrAutorizacaoCompraGetValue
    Left = 600
    Top = 176
    Datasets = <
      item
        DataSet = frdAutorizacaoCompra
        DataSetName = 'frdAutorizacaoCompra'
      end
      item
        DataSet = frdEmpresa
        DataSetName = 'frdEmpresa'
      end
      item
        DataSet = frdFornecedor
        DataSetName = 'frdFornecedor'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Lucida Console'
      Font.Style = []
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object bndReportTitle: TfrxReportTitle
        Height = 116.858380000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object frdVendaCODCONTROL: TfrxMemoView
          Left = 559.370440000000000000
          Top = 18.897650000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frdAutorizacaoCompra."NUMERO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 559.370440000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            'N '#195#186' m e r o   C o n t r o l e :')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 559.370440000000000000
          Top = 37.795300000000000000
          Width = 158.740260000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frdAutorizacaoCompra."STATUS_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Picture1: TfrxPictureView
          Left = 3.779530000000000000
          Width = 139.842610000000000000
          Height = 79.370130000000000000
          ShowHint = False
          DataField = 'LOGO'
          DataSet = frdEmpresa
          DataSetName = 'frdEmpresa'
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object frdEmpresaRZSOC: TfrxMemoView
          Left = 143.622140000000000000
          Width = 411.968770000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frdEmpresa."RZSOC"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frdEmpresaNMFANT: TfrxMemoView
          Left = 143.622140000000000000
          Top = 18.897650000000000000
          Width = 411.968770000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            
              'CNPJ.: [FormatMaskText('#39'##.###.###/####-##;0;'#39',<frdEmpresa."CNPJ' +
              '">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdFone: TfrxMemoView
          Left = 143.622140000000000000
          Top = 34.015770000000000000
          Width = 411.968770000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            'FONE: [FormatMaskText('#39'(##)####.####;0;'#39',<frdEmpresa."FONE">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 143.622140000000000000
          Top = 49.133890000000000000
          Width = 411.968770000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            
              '[frdEmpresa."TLG_SIGLA"] [frdEmpresa."LOG_NOME"], [frdEmpresa."N' +
              'UMERO_END"], [frdEmpresa."BAI_NOME"] - [frdEmpresa."CID_NOME"]/[' +
              'frdEmpresa."EST_SIGLA"] CEP.: [FormatMaskText('#39'##.###-###;0;'#39',<f' +
              'rdEmpresa."CEP">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Line1: TfrxLineView
          Top = 83.149660000000000000
          Width = 718.110700000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo44: TfrxMemoView
          Left = 143.622140000000000000
          Top = 64.252010000000000000
          Width = 574.488560000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            '[frdEmpresa."HOME_PAGE"] / [frdEmpresa."EMAIL"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo45: TfrxMemoView
          Top = 90.708720000000000000
          Width = 721.890230000000000000
          Height = 18.897650000000000000
          ShowHint = False
          CharSpacing = 4.000000000000000000
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            
              '[Trim('#39'AUTORIZA'#195#8225#195#402'O DE '#39' + Uppercase(<frdAutorizacaoCompra."TIP' +
              'O_DESC">))]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndMasterData: TfrxMasterData
        Height = 18.897650000000000000
        Top = 332.598640000000000000
        Width = 718.110700000000000000
        DataSet = frdAutorizacaoCompra
        DataSetName = 'frdAutorizacaoCompra'
        RowCount = 0
        object frdItensCODPROD: TfrxMemoView
          Left = 22.677180000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            ' [frdAutorizacaoCompra."PRODUTO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdItensSEQ: TfrxMemoView
          Width = 22.677180000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[Line]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdItensDESCRI: TfrxMemoView
          Left = 75.590600000000000000
          Width = 419.527659130000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            ' [frdAutorizacaoCompra."DESCRI_APRESENTACAO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 495.118430000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.###'#39',<frdAutorizacaoCompra."QUANTIDADE">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 642.520100000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<frdAutorizacaoCompra."VALOR_TOTAL">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 540.472790000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            ' [frdAutorizacaoCompra."UNIDADE"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 578.268090000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<frdAutorizacaoCompra."VALOR_UNITARIO">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndPageFooter: TfrxPageFooter
        Height = 30.236240000000000000
        Top = 805.039890000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 589.606680000000000000
          Width = 128.504020000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'P'#195#161'gina :  [Page#]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Width = 589.606680000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' [Sistema]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo19: TfrxMemoView
          Top = 15.118120000000000000
          Width = 589.606680000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' Impresso em [Date] '#195#160's [Time] por [Usuario]')
          ParentFont = False
          WordWrap = False
        end
      end
      object bndHeader: TfrxHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Lucida Console'
        Font.Style = []
        Height = 113.385900000000000000
        ParentFont = False
        Top = 196.535560000000000000
        Width = 718.110700000000000000
        object frdVendaNOME: TfrxMemoView
          Top = 41.574830000000000000
          Width = 415.748300000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            ' [frdFornecedor."NOME"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Top = 30.236240000000000000
          Width = 415.748300000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' Fornecedor:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 415.748300000000000000
          Top = 30.236240000000000000
          Width = 207.874150000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' CPF/CNPJ.:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 415.748300000000000000
          Top = 41.574830000000000000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            
              ' [IIF(<frdFornecedor."PESSOA_FISICA">=1,FormatMaskText('#39'###.###.' +
              '###-##;0;'#39',<frdFornecedor."CNPJ">),FormatMaskText('#39'##.###.###/##' +
              '##-##;0;'#39',<frdFornecedor."CNPJ">))]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 623.622450000000000000
          Top = 30.236240000000000000
          Width = 94.488250000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'Data: ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 623.622450000000000000
          Top = 41.574830000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Lucida Console'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            
              ' [FormatDateTime('#39'dd/mm/yyyy'#39',<frdAutorizacaoCompra."EMISSAO_DAT' +
              'A">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Line2: TfrxLineView
          Top = 109.606370000000000000
          Width = 718.110700000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo23: TfrxMemoView
          Top = 94.488250000000000000
          Width = 22.677180000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '#')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 22.677180000000000000
          Top = 94.488250000000000000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' C'#195#179'digo')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 75.590600000000000000
          Top = 94.488250000000000000
          Width = 419.527659130000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' Descri'#195#167#195#163'o')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Top = 71.811070000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            
              ' [Trim(<frdFornecedor."TLG_SIGLA"> + '#39' '#39' + <frdFornecedor."LOG_N' +
              'OME"> + '#39', '#39' + <frdFornecedor."NUMERO_END"> + '#39', '#39' + <frdFornece' +
              'dor."BAI_NOME"> + '#39' - '#39' + <frdFornecedor."CID_NOME"> + '#39'/'#39' + <fr' +
              'dFornecedor."EST_SIGLA">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Top = 60.472480000000000000
          Width = 718.110700000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' Endere'#195#167'o:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 540.472790000000000000
          Top = 94.488250000000000000
          Width = 37.795300000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' Und.')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 578.268090000000000000
          Top = 94.488250000000000000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'V. Un. ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo48: TfrxMemoView
          Top = 11.338590000000000000
          Width = 415.748300000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            ' [frdAutorizacaoCompra."NOME_CONTATO"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo49: TfrxMemoView
          Width = 415.748300000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' Att.:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 642.520100000000000000
          Top = 94.488250000000000000
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'T O T A L ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 495.118430000000000000
          Top = 94.488250000000000000
          Width = 45.354323390000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'Qtde.')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndReportSummary: TfrxReportSummary
        Height = 370.393940000000000000
        Top = 411.968770000000000000
        Width = 718.110700000000000000
        Stretched = True
        object SysMemo1: TfrxSysMemoView
          Left = 623.622450000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',SUM(<frdAutorizacaoCompra."VALOR_TOTAL">,bn' +
              'dMasterData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo14: TfrxMemoView
          Left = 480.000310000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          HAlign = haRight
          Memo.UTF8 = (
            'T O T A L    G E R A L :')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Left = 234.330860000000000000
          Top = 249.448980000000000000
          Width = 249.448980000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frdEmpresa."RZSOC"]'
            '[FormatMaskText('#39'##.###.###/####-##;0;'#39',<frdEmpresa."CNPJ">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Top = 68.031540000000000000
          Width = 302.362400000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            ' [frdAutorizacaoCompra."USUARIO_AUTORIZADOR"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Top = 56.692950000000000000
          Width = 302.362400000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' Autorizador:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line3: TfrxLineView
          Top = 22.677180000000000000
          Width = 718.110700000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo30: TfrxMemoView
          Top = 37.795300000000000000
          Width = 302.362400000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            ' [frdAutorizacaoCompra."FORMA_PAGTO_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Top = 26.456710000000000000
          Width = 302.362400000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' Forma de Pagamento:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 302.362400000000000000
          Top = 37.795300000000000000
          Width = 415.748300000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            ' [frdAutorizacaoCompra."CONDICAO_PAGTO_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 302.362400000000000000
          Top = 26.456710000000000000
          Width = 415.748300000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' Condi'#195#167#195#163'o de Pagamento:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 302.362400000000000000
          Top = 68.031540000000000000
          Width = 102.047248980000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',<frdAutorizacaoCompra."VALOR_TOTAL_BRUTO">)' +
              '] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 302.362400000000000000
          Top = 56.692950000000000000
          Width = 102.047248980000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            ' Total Bruto: ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Left = 502.677490000000000000
          Top = 68.031540000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',<frdAutorizacaoCompra."VALOR_TOTAL_DESCONTO' +
              '">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Left = 502.677490000000000000
          Top = 56.692950000000000000
          Width = 98.267780000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            ' Desconto: ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Left = 600.945270000000000000
          Top = 68.031540000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',<frdAutorizacaoCompra."VALOR_TOTAL_LIQUIDO"' +
              '>)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          Left = 600.945270000000000000
          Top = 56.692950000000000000
          Width = 117.165430000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Color = 13421772
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            ' Total L'#195#173'quido: ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Top = 105.826840000000000000
          Width = 718.110700000000000000
          Height = 45.354360000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frdAutorizacaoCompra."ENDERECO_ENTREGA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          Top = 90.708720000000000000
          Width = 718.110700000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Memo.UTF8 = (
            ' Local de Entrega/Realiza'#195#167#195#163'o:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          Left = 37.795300000000000000
          Top = 162.519790000000000000
          Width = 623.622450000000000000
          Height = 64.252010000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial Narrow'
          Font.Style = []
          HAlign = haBlock
          Memo.UTF8 = (
            
              '                 Autorizamos a [frdFornecedor."NOME"] executar a' +
              ' presente Autoriza'#195#167#195#163'o de [Trim(<frdAutorizacaoCompra."TIPO_DES' +
              'C">)], na sua totalidade, e na forma/condi'#195#167#195#163'o de pagamentos es' +
              'tabelecida.')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Top = 317.480520000000000000
          Width = 718.110700000000000000
          Height = 52.913420000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            
              'Material a ser retirado por: [frdAutorizacaoCompra."RECEBEDOR_NO' +
              'ME"] [IIF(Trim(<frdAutorizacaoCompra."RECEBEDOR_FUNCAO">)='#39#39','#39#39',' +
              #39'('#39'+<frdAutorizacaoCompra."RECEBEDOR_FUNCAO">+'#39')'#39')]'
            '[frdAutorizacaoCompra."OBSERVACAO"]'
            
              '[IIF(<frdAutorizacaoCompra."CLIENTE_CODIGO">=0,'#39#39','#39'* * * Cliente' +
              ' : '#39' + FormatFloat('#39'00000'#39', <frdAutorizacaoCompra."CLIENTE_CODIG' +
              'O">)) ]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Top = 302.362400000000000000
          Width = 718.110700000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Memo.UTF8 = (
            ' Observa'#195#167#195#181'es Gerais:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo46: TfrxMemoView
          Left = 404.409710000000000000
          Top = 68.031540000000000000
          Width = 98.267718980000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<frdAutorizacaoCompra."VALOR_TOTAL_IPI">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo47: TfrxMemoView
          Left = 404.409710000000000000
          Top = 56.692950000000000000
          Width = 98.267718980000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            ' Total IPI: ')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object qryCotacaoCompra: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    SQL.Strings = (
      'Select'
      '    c.ano'
      '  , c.codigo'
      '  , c.numero'
      '  , c.tipo'
      '  , case c.tipo'
      '      when 1 then '#39'Compra'#39
      '      when 2 then '#39'Servi'#231'o'#39
      '      when 3 then '#39'Compra/Servi'#231'o'#39
      '    end as tipo_desc'
      '  , c.status'
      '  , case c.status'
      '      when 0 then '#39'Em Edi'#231#227'o'#39
      '      when 1 then '#39'Aberta'#39
      '      when 2 then '#39'Em Cota'#231#227'o'#39
      '      when 3 then '#39'Autorizada/Encerrada'#39
      '      when 4 then '#39'Cancelada'#39
      '    end as status_desc'
      '  , c.empresa'
      '  , c.emissao_data'
      
        '  , (Select first 1 us.nomecompleto from TBUSERS us where us.nom' +
        'e = c.emissao_usuario)    as usuario_emissor'
      '  , c.autorizada_data'
      
        '  , (Select first 1 us.nomecompleto from TBUSERS us where us.nom' +
        'e = c.autorizada_usuario) as usuario_autorizador'
      '  , c.descricao_resumo'
      '  , c.nome_contato_int'
      '  , c.movito'
      '  , c.observacao'
      '  , c.log_evento'
      '  , c.valor_ref_total'
      '  , c.valor_max_bruto'
      '  , c.valor_max_desconto'
      '  , c.valor_max_total'
      '  , c.valor_min_bruto'
      '  , c.valor_min_desconto'
      '  , c.valor_min_total'
      '  , c.valor_media_bruto'
      '  , c.valor_media_desconto'
      '  , c.valor_media_total'
      ''
      '  , i.seq'
      '  , i.produto'
      '  , p.descri'
      '  , p.descri_apresentacao'
      '  , p.referencia'
      '  , i.quantidade'
      
        '  , coalesce(nullif(Trim(u.unp_sigla), '#39#39'), u.unp_descricao) as ' +
        'unidade'
      '  , i.valor_unitario_ref'
      '  , i.valor_total_ref'
      '  , i.valor_unitario_max'
      '  , i.valor_total_max'
      '  , i.valor_unitario_min'
      '  , i.valor_total_min'
      '  , i.valor_unitario_media'
      '  , i.valor_total_media'
      'from TBCOTACAO_COMPRA c'
      
        '  inner join TBCOTACAO_COMPRAITEM i on (i.ano = c.ano and i.codi' +
        'go = c.codigo and i.empresa = c.empresa)'
      '  inner join TBPRODUTO p on (p.cod = i.produto)'
      '  left join TBUNIDADEPROD u on (u.unp_cod = i.unidade)'
      ''
      'where c.ano    = :ano'
      '  and c.codigo = :cod'
      '  and c.empresa    = :emp')
    Left = 536
    Top = 224
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ano'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'cod'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftUnknown
        Name = 'emp'
        ParamType = ptUnknown
      end>
  end
  object frdCotacaoCompra: TfrxDBDataset
    UserName = 'frdCotacaoCompra'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ANO=ANO'
      'CODIGO=CODIGO'
      'NUMERO=NUMERO'
      'TIPO=TIPO'
      'TIPO_DESC=TIPO_DESC'
      'STATUS=STATUS'
      'STATUS_DESC=STATUS_DESC'
      'EMPRESA=EMPRESA'
      'EMISSAO_DATA=EMISSAO_DATA'
      'USUARIO_EMISSOR=USUARIO_EMISSOR'
      'AUTORIZADA_DATA=AUTORIZADA_DATA'
      'USUARIO_AUTORIZADOR=USUARIO_AUTORIZADOR'
      'DESCRICAO_RESUMO=DESCRICAO_RESUMO'
      'NOME_CONTATO_INT=NOME_CONTATO_INT'
      'MOVITO=MOVITO'
      'OBSERVACAO=OBSERVACAO'
      'LOG_EVENTO=LOG_EVENTO'
      'VALOR_REF_TOTAL=VALOR_REF_TOTAL'
      'VALOR_MAX_BRUTO=VALOR_MAX_BRUTO'
      'VALOR_MAX_DESCONTO=VALOR_MAX_DESCONTO'
      'VALOR_MAX_TOTAL=VALOR_MAX_TOTAL'
      'VALOR_MIN_BRUTO=VALOR_MIN_BRUTO'
      'VALOR_MIN_DESCONTO=VALOR_MIN_DESCONTO'
      'VALOR_MIN_TOTAL=VALOR_MIN_TOTAL'
      'VALOR_MEDIA_BRUTO=VALOR_MEDIA_BRUTO'
      'VALOR_MEDIA_DESCONTO=VALOR_MEDIA_DESCONTO'
      'VALOR_MEDIA_TOTAL=VALOR_MEDIA_TOTAL'
      'SEQ=SEQ'
      'PRODUTO=PRODUTO'
      'DESCRI=DESCRI'
      'DESCRI_APRESENTACAO=DESCRI_APRESENTACAO'
      'REFERENCIA=REFERENCIA'
      'QUANTIDADE=QUANTIDADE'
      'UNIDADE=UNIDADE'
      'VALOR_UNITARIO_REF=VALOR_UNITARIO_REF'
      'VALOR_TOTAL_REF=VALOR_TOTAL_REF'
      'VALOR_UNITARIO_MAX=VALOR_UNITARIO_MAX'
      'VALOR_TOTAL_MAX=VALOR_TOTAL_MAX'
      'VALOR_UNITARIO_MIN=VALOR_UNITARIO_MIN'
      'VALOR_TOTAL_MIN=VALOR_TOTAL_MIN'
      'VALOR_UNITARIO_MEDIA=VALOR_UNITARIO_MEDIA'
      'VALOR_TOTAL_MEDIA=VALOR_TOTAL_MEDIA')
    DataSet = qryCotacaoCompra
    BCDToCurrency = False
    Left = 568
    Top = 224
  end
  object frrCotacaoCompra: TfrxReport
    Version = '4.9.72'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40928.407150601900000000
    ReportOptions.LastChange = 41863.914008553240000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    OnGetValue = frrAutorizacaoCompraGetValue
    Left = 600
    Top = 224
    Datasets = <
      item
        DataSet = frdCotacaoCompra
        DataSetName = 'frdCotacaoCompra'
      end
      item
        DataSet = frdCotacaoCompraFornecedor
        DataSetName = 'frdCotacaoCompraFornecedor'
      end
      item
        DataSet = frdEmpresa
        DataSetName = 'frdEmpresa'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Lucida Console'
      Font.Style = []
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object bndReportTitle: TfrxReportTitle
        Height = 116.858380000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object frdVendaCODCONTROL: TfrxMemoView
          Left = 559.370440000000000000
          Top = 18.897650000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[frdCotacaoCompra."NUMERO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 559.370440000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'N '#195#186' m e r o   C o n t r o l e :')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 559.370440000000000000
          Top = 37.795300000000000000
          Width = 158.740260000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[Trim(<frdCotacaoCompra."STATUS_DESC">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Picture1: TfrxPictureView
          Left = 3.779530000000000000
          Width = 139.842610000000000000
          Height = 79.370130000000000000
          ShowHint = False
          DataField = 'LOGO'
          DataSet = frdEmpresa
          DataSetName = 'frdEmpresa'
          Frame.Width = 0.100000000000000000
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object frdEmpresaRZSOC: TfrxMemoView
          Left = 143.622140000000000000
          Width = 411.968770000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            '[frdEmpresa."RZSOC"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frdEmpresaNMFANT: TfrxMemoView
          Left = 143.622140000000000000
          Top = 18.897650000000000000
          Width = 411.968770000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            
              'CNPJ.: [FormatMaskText('#39'##.###.###/####-##;0;'#39',<frdEmpresa."CNPJ' +
              '">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdFone: TfrxMemoView
          Left = 143.622140000000000000
          Top = 34.015770000000000000
          Width = 411.968770000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            'FONE: [FormatMaskText('#39'(##)####.####;0;'#39',<frdEmpresa."FONE">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 143.622140000000000000
          Top = 49.133890000000000000
          Width = 411.968770000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            
              '[frdEmpresa."TLG_SIGLA"] [frdEmpresa."LOG_NOME"], [frdEmpresa."N' +
              'UMERO_END"], [frdEmpresa."BAI_NOME"] - [frdEmpresa."CID_NOME"]/[' +
              'frdEmpresa."EST_SIGLA"] CEP.: [FormatMaskText('#39'##.###-###;0;'#39',<f' +
              'rdEmpresa."CEP">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Line1: TfrxLineView
          Top = 83.149660000000000000
          Width = 718.110700000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
        end
        object Memo44: TfrxMemoView
          Left = 143.622140000000000000
          Top = 64.252010000000000000
          Width = 574.488560000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            '[frdEmpresa."HOME_PAGE"] / [frdEmpresa."EMAIL"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo45: TfrxMemoView
          Top = 90.708720000000000000
          Width = 721.890230000000000000
          Height = 18.897650000000000000
          ShowHint = False
          CharSpacing = 4.000000000000000000
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            
              '[Trim('#39'COTA'#195#8225#195#402'O DE '#39' + Uppercase(<frdCotacaoCompra."TIPO_DESC">' +
              '))]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndMasterData: TfrxMasterData
        Height = 18.897650000000000000
        Top = 362.834880000000000000
        Width = 718.110700000000000000
        DataSet = frdCotacaoCompra
        DataSetName = 'frdCotacaoCompra'
        RowCount = 0
        object frdItensCODPROD: TfrxMemoView
          Left = 22.677180000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' [frdCotacaoCompra."PRODUTO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdItensSEQ: TfrxMemoView
          Width = 22.677180000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[Line]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdItensDESCRI: TfrxMemoView
          Left = 75.590600000000000000
          Width = 419.527659130000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' [frdCotacaoCompra."DESCRI_APRESENTACAO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 495.118430000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.###'#39',<frdCotacaoCompra."QUANTIDADE">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 642.520100000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 540.472790000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' [frdCotacaoCompra."UNIDADE"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 578.268090000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndPageFooter: TfrxPageFooter
        Height = 30.236240000000000000
        Top = 710.551640000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 589.606680000000000000
          Width = 128.504020000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'P'#195#161'gina :  [Page#]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Width = 589.606680000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' [Sistema]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo19: TfrxMemoView
          Top = 15.118120000000000000
          Width = 589.606680000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' Impresso em [Date] '#195#160's [Time] por [Usuario]')
          ParentFont = False
          WordWrap = False
        end
      end
      object bndHeader: TfrxHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Lucida Console'
        Font.Style = []
        Height = 143.622140000000000000
        ParentFont = False
        Top = 196.535560000000000000
        Width = 718.110700000000000000
        object frdVendaNOME: TfrxMemoView
          Top = 79.370130000000000000
          Width = 415.748300000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' [frdCotacaoCompraFornecedor."NOMEFORN"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Top = 68.031540000000000000
          Width = 415.748300000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' Fornecedor:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 415.748300000000000000
          Top = 68.031540000000000000
          Width = 207.874150000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' CPF/CNPJ.:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 415.748300000000000000
          Top = 79.370130000000000000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            
              ' [IIF(<frdCotacaoCompraFornecedor."CNPJ">='#39#39','#39#39',IIF(<frdCotacaoC' +
              'ompraFornecedor."PESSOA_FISICA">=1,FormatMaskText('#39'###.###.###-#' +
              '#;0;'#39',<frdCotacaoCompraFornecedor."CNPJ">),FormatMaskText('#39'##.##' +
              '#.###/####-##;0;'#39',<frdCotacaoCompraFornecedor."CNPJ">)))]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 623.622450000000000000
          Top = 68.031540000000000000
          Width = 94.488250000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'Data: ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 623.622450000000000000
          Top = 79.370130000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              ' [FormatDateTime('#39'dd/mm/yyyy'#39',<frdCotacaoCompra."EMISSAO_DATA">)' +
              '] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 642.520100000000000000
          Top = 128.504020000000000000
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'T O T A L ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 495.118430000000000000
          Top = 128.504020000000000000
          Width = 45.354323390000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'Qtde.')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Line2: TfrxLineView
          Top = 143.622140000000000000
          Width = 718.110700000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
        end
        object Memo23: TfrxMemoView
          Top = 128.504020000000000000
          Width = 22.677180000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '#')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 22.677180000000000000
          Top = 128.504020000000000000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' C'#195#179'digo')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 75.590600000000000000
          Top = 128.504020000000000000
          Width = 419.527659130000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' Descri'#195#167#195#163'o')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Top = 109.606370000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Top = 98.267780000000000000
          Width = 718.110700000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' Endere'#195#167'o:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 540.472790000000000000
          Top = 128.504020000000000000
          Width = 37.795300000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' Und.')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 578.268090000000000000
          Top = 128.504020000000000000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'V. Un. ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo48: TfrxMemoView
          Top = 49.133890000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' [frdCotacaoCompraFornecedor."NOME_CONTATO"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo49: TfrxMemoView
          Top = 37.795300000000000000
          Width = 718.110700000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' Att.:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Top = 15.118120000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' [frdCotacaoCompra."DESCRICAO_RESUMO"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          Top = 3.779530000000000000
          Width = 718.110700000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            ' Descri'#195#167#195#163'o resumo')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object bndReportSummary: TfrxReportSummary
        Height = 245.669450000000000000
        Top = 442.205010000000000000
        Width = 718.110700000000000000
        Stretched = True
        object SysMemo1: TfrxSysMemoView
          Left = 623.622450000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo14: TfrxMemoView
          Left = 480.000310000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'T O T A L    G E R A L :')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Left = 226.771800000000000000
          Top = 139.842610000000000000
          Width = 264.567100000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            
              '[IIF(<frdCotacaoCompraFornecedor."NOMEFORN">='#39#39','#39'Fornecedor'#39',<fr' +
              'dCotacaoCompraFornecedor."NOMEFORN">)]'
            
              '[IIF(<frdCotacaoCompraFornecedor."CNPJ">='#39#39','#39'CPF/CNPJ:'#39',IIF(<frd' +
              'CotacaoCompraFornecedor."PESSOA_FISICA">=1,FormatMaskText('#39'###.#' +
              '##.###-##;0;'#39',<frdCotacaoCompraFornecedor."CNPJ">),FormatMaskTex' +
              't('#39'##.###.###/####-##;0;'#39',<frdCotacaoCompraFornecedor."CNPJ">)))' +
              ']')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Top = 68.031540000000000000
          Width = 302.362400000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' [frdCotacaoCompra."USUARIO_AUTORIZADOR"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Top = 56.692950000000000000
          Width = 302.362400000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' Autorizador:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line3: TfrxLineView
          Top = 22.677180000000000000
          Width = 718.110700000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
        end
        object Memo30: TfrxMemoView
          Top = 37.795300000000000000
          Width = 302.362400000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' [frdCotacaoCompraFornecedor."FORMA_PAGTO_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Top = 26.456710000000000000
          Width = 302.362400000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' Forma de Pagamento:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 302.362400000000000000
          Top = 37.795300000000000000
          Width = 415.748300000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' [frdCotacaoCompraFornecedor."CONDICAP_PAGTO_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 302.362400000000000000
          Top = 26.456710000000000000
          Width = 415.748300000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' Condi'#195#167#195#163'o de Pagamento:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 400.630180000000000000
          Top = 68.031540000000000000
          Width = 102.047248980000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 400.630180000000000000
          Top = 56.692950000000000000
          Width = 102.047248980000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            ' Total Bruto: ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Left = 502.677490000000000000
          Top = 68.031540000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Left = 502.677490000000000000
          Top = 56.692950000000000000
          Width = 98.267780000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            ' Desconto: ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Left = 600.945270000000000000
          Top = 68.031540000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          Left = 600.945270000000000000
          Top = 56.692950000000000000
          Width = 117.165430000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Color = 13421772
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            ' Total L'#195#173'quido: ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Top = 192.756030000000000000
          Width = 718.110700000000000000
          Height = 52.913420000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            
              '[IIF(<frdCotacaoCompraFornecedor."OBSERVACAO">='#39#39',<frdCotacaoCom' +
              'pra."OBSERVACAO">,<frdCotacaoCompraFornecedor."OBSERVACAO">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Top = 177.637910000000000000
          Width = 718.110700000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' Observa'#195#167#195#181'es Gerais:')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object qryCotacaoCompraFornecedor: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    SQL.Strings = (
      'Select'
      '    c.ano'
      '  , c.codigo'
      '  , c.empresa'
      '  , c.fornecedor'
      '  , c.nome_contato'
      '  , c.email_envio'
      '  , c.forma_pagto'
      '  , c.condicao_pagto'
      '  , c.prazo_entrega_data'
      '  , c.prazo_entreda_dia'
      '  , c.observacao'
      '  , c.ativo'
      '  , c.usuario'
      '  , c.valor_total_bruto'
      '  , c.valor_total_desconto'
      '  , c.valor_total_liquido'
      '  , c.vencedor'
      '  , f.nomeforn'
      '  , f.cnpj'
      '  , f.pessoa_fisica'
      '  , f.email'
      '  , fp.descri as forma_pagto_desc'
      '  , cp.cond_descricao as condicap_pagto_desc'
      
        '  , (Select count(x.item) from TBCOTACAO_COMPRAFORN_ITEM x where' +
        ' x.ano = c.ano and x.codigo = c.codigo and x.empresa = c.empresa' +
        ' and x.fornecedor = c.fornecedor) as Itens'
      'from TBCOTACAO_COMPRAFORN c'
      '  left join TBFORNECEDOR f on (f.codforn = c.fornecedor)'
      '  left join TBFORMPAGTO fp on (fp.cod = c.forma_pagto)'
      
        '  left join VW_CONDICAOPAGTO cp on (cp.cond_cod = c.condicao_pag' +
        'to)'
      ''
      'where c.ano        = :ano'
      '  and c.codigo     = :cod'
      '  and c.empresa    = :emp'
      '  and ((c.fornecedor = :frn) or (:todos = 1))'
      ''
      'order by'
      '    c.ano'
      '  , c.codigo'
      '  , c.empresa'
      '  , c.fornecedor')
    Left = 536
    Top = 272
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ano'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'cod'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftUnknown
        Name = 'emp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'frn'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'todos'
        ParamType = ptUnknown
      end>
  end
  object frdCotacaoCompraFornecedor: TfrxDBDataset
    UserName = 'frdCotacaoCompraFornecedor'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ANO=ANO'
      'CODIGO=CODIGO'
      'EMPRESA=EMPRESA'
      'FORNECEDOR=FORNECEDOR'
      'NOME_CONTATO=NOME_CONTATO'
      'EMAIL_ENVIO=EMAIL_ENVIO'
      'FORMA_PAGTO=FORMA_PAGTO'
      'CONDICAO_PAGTO=CONDICAO_PAGTO'
      'PRAZO_ENTREGA_DATA=PRAZO_ENTREGA_DATA'
      'PRAZO_ENTREDA_DIA=PRAZO_ENTREDA_DIA'
      'OBSERVACAO=OBSERVACAO'
      'ATIVO=ATIVO'
      'USUARIO=USUARIO'
      'VALOR_TOTAL_BRUTO=VALOR_TOTAL_BRUTO'
      'VALOR_TOTAL_DESCONTO=VALOR_TOTAL_DESCONTO'
      'VALOR_TOTAL_LIQUIDO=VALOR_TOTAL_LIQUIDO'
      'VENCEDOR=VENCEDOR'
      'NOMEFORN=NOMEFORN'
      'CNPJ=CNPJ'
      'PESSOA_FISICA=PESSOA_FISICA'
      'EMAIL=EMAIL'
      'FORMA_PAGTO_DESC=FORMA_PAGTO_DESC'
      'CONDICAP_PAGTO_DESC=CONDICAP_PAGTO_DESC'
      'ITENS=ITENS')
    DataSet = qryCotacaoCompraFornecedor
    BCDToCurrency = False
    Left = 568
    Top = 272
  end
  object ACBrValidador: TACBrValidador
    IgnorarChar = './-'
    Left = 40
    Top = 384
  end
  object qryCotacaoCompraFornecedorItem: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    SQL.Strings = (
      'Select'
      '    right('#39'00000'#39' || fi.fornecedor, 5) as fornecedor'
      '  , fi.item'
      '  , ci.produto'
      '  , pr.descri_apresentacao'
      '  , ci.quantidade'
      '  , ci.unidade'
      '  , un.unp_descricao'
      '  , un.unp_sigla'
      ''
      '  , ci.valor_unitario_ref'
      '  , ci.valor_total_ref'
      '  , ci.valor_unitario_max'
      '  , ci.valor_total_max'
      '  , ci.valor_unitario_min'
      '  , ci.valor_total_min'
      '  , ci.valor_unitario_media'
      '  , ci.valor_total_media'
      ''
      '  , fi.valor_unitario'
      '  , fi.valor_total'
      'from TBCOTACAO_COMPRAFORN_ITEM fi'
      
        '  left join TBCOTACAO_COMPRAITEM ci on (ci.ano = fi.ano and ci.c' +
        'odigo = fi.codigo and ci.empresa = fi.empresa and ci.seq = fi.it' +
        'em)'
      '  left join TBPRODUTO pr on (pr.cod = ci.produto)'
      '  left join TBUNIDADEPROD un on (un.unp_cod = ci.unidade)'
      ''
      'where fi.ano        = :ano'
      '  and fi.codigo     = :cod'
      '  and fi.empresa    = :emp'
      '  and ((fi.fornecedor = :frn) or (:todos = 1))'
      ''
      'order by'
      '    fi.fornecedor'
      '  , pr.descri_apresentacao')
    Left = 536
    Top = 320
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ano'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'cod'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftUnknown
        Name = 'emp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'frn'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'todos'
        ParamType = ptUnknown
      end>
  end
  object frdCotacaoCompraFornecedorItem: TfrxDBDataset
    UserName = 'frdCotacaoCompraFornecedorItem'
    CloseDataSource = False
    FieldAliases.Strings = (
      'FORNECEDOR=FORNECEDOR'
      'ITEM=ITEM'
      'PRODUTO=PRODUTO'
      'DESCRI_APRESENTACAO=DESCRI_APRESENTACAO'
      'QUANTIDADE=QUANTIDADE'
      'UNIDADE=UNIDADE'
      'UNP_DESCRICAO=UNP_DESCRICAO'
      'UNP_SIGLA=UNP_SIGLA'
      'VALOR_UNITARIO_REF=VALOR_UNITARIO_REF'
      'VALOR_TOTAL_REF=VALOR_TOTAL_REF'
      'VALOR_UNITARIO_MAX=VALOR_UNITARIO_MAX'
      'VALOR_TOTAL_MAX=VALOR_TOTAL_MAX'
      'VALOR_UNITARIO_MIN=VALOR_UNITARIO_MIN'
      'VALOR_TOTAL_MIN=VALOR_TOTAL_MIN'
      'VALOR_UNITARIO_MEDIA=VALOR_UNITARIO_MEDIA'
      'VALOR_TOTAL_MEDIA=VALOR_TOTAL_MEDIA'
      'VALOR_UNITARIO=VALOR_UNITARIO'
      'VALOR_TOTAL=VALOR_TOTAL')
    DataSet = qryCotacaoCompraFornecedorItem
    BCDToCurrency = False
    Left = 568
    Top = 320
  end
  object frrCotacaoCompraMapaPreco: TfrxReport
    Version = '4.9.72'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PreviewOptions.ZoomMode = zmPageWidth
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40928.407150601900000000
    ReportOptions.LastChange = 41828.581609050930000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    OnGetValue = frrAutorizacaoCompraGetValue
    Left = 632
    Top = 224
    Datasets = <
      item
        DataSet = frdCotacaoCompra
        DataSetName = 'frdCotacaoCompra'
      end
      item
        DataSet = frdCotacaoCompraFornecedor
        DataSetName = 'frdCotacaoCompraFornecedor'
      end
      item
        DataSet = frdCotacaoCompraFornecedorItem
        DataSetName = 'frdCotacaoCompraFornecedorItem'
      end
      item
        DataSet = frdEmpresa
        DataSetName = 'frdEmpresa'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Lucida Console'
      Font.Style = []
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object bndReportTitle: TfrxReportTitle
        Height = 116.858380000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object frdVendaCODCONTROL: TfrxMemoView
          Left = 888.189550000000000000
          Top = 18.897650000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[frdCotacaoCompra."NUMERO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 888.189550000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'N '#195#186' m e r o   C o n t r o l e :')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 888.189550000000000000
          Top = 37.795300000000000000
          Width = 158.740260000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[Trim(<frdCotacaoCompra."STATUS_DESC">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Picture1: TfrxPictureView
          Left = 3.779530000000000000
          Width = 139.842610000000000000
          Height = 79.370130000000000000
          ShowHint = False
          DataField = 'LOGO'
          DataSet = frdEmpresa
          DataSetName = 'frdEmpresa'
          Frame.Width = 0.100000000000000000
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object frdEmpresaRZSOC: TfrxMemoView
          Left = 143.622140000000000000
          Width = 411.968770000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            '[frdEmpresa."RZSOC"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frdEmpresaNMFANT: TfrxMemoView
          Left = 143.622140000000000000
          Top = 18.897650000000000000
          Width = 411.968770000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            
              'CNPJ.: [FormatMaskText('#39'##.###.###/####-##;0;'#39',<frdEmpresa."CNPJ' +
              '">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdFone: TfrxMemoView
          Left = 143.622140000000000000
          Top = 34.015770000000000000
          Width = 411.968770000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            'FONE: [FormatMaskText('#39'(##)####.####;0;'#39',<frdEmpresa."FONE">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 143.622140000000000000
          Top = 49.133890000000000000
          Width = 411.968770000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            
              '[frdEmpresa."TLG_SIGLA"] [frdEmpresa."LOG_NOME"], [frdEmpresa."N' +
              'UMERO_END"], [frdEmpresa."BAI_NOME"] - [frdEmpresa."CID_NOME"]/[' +
              'frdEmpresa."EST_SIGLA"] CEP.: [FormatMaskText('#39'##.###-###;0;'#39',<f' +
              'rdEmpresa."CEP">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Line1: TfrxLineView
          Top = 83.149660000000000000
          Width = 1046.929810000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
        end
        object Memo44: TfrxMemoView
          Left = 143.622140000000000000
          Top = 64.252010000000000000
          Width = 574.488560000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            '[frdEmpresa."HOME_PAGE"] / [frdEmpresa."EMAIL"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo45: TfrxMemoView
          Top = 90.708720000000000000
          Width = 1046.929810000000000000
          Height = 18.897650000000000000
          ShowHint = False
          CharSpacing = 4.000000000000000000
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            
              '[Trim('#39'COTA'#195#8225#195#402'O DE '#39' + Uppercase(<frdCotacaoCompra."TIPO_DESC">' +
              '))]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndMasterData: TfrxMasterData
        Height = 18.897650000000000000
        Top = 268.346630000000000000
        Width = 1046.929810000000000000
        DataSet = frdCotacaoCompraFornecedor
        DataSetName = 'frdCotacaoCompraFornecedor'
        RowCount = 0
        object frdItensCODPROD: TfrxMemoView
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = 10485760
          Highlight.Font.Height = -11
          Highlight.Font.Name = 'Calibri'
          Highlight.Font.Style = [fsBold]
          Highlight.Condition = '<frdCotacaoCompraFornecedor."VENCEDOR">=1'
          Memo.UTF8 = (
            
              ' [FormatFloat('#39'00000'#39', <frdCotacaoCompraFornecedor."FORNECEDOR">' +
              ')]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdItensDESCRI: TfrxMemoView
          Left = 52.913420000000000000
          Width = 321.259879130000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = 10485760
          Highlight.Font.Height = -11
          Highlight.Font.Name = 'Calibri'
          Highlight.Font.Style = [fsBold]
          Highlight.Condition = '<frdCotacaoCompraFornecedor."VENCEDOR">=1'
          Memo.UTF8 = (
            ' [frdCotacaoCompraFornecedor."NOMEFORN"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 963.780150000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = 10485760
          Highlight.Font.Height = -11
          Highlight.Font.Name = 'Calibri'
          Highlight.Font.Style = [fsBold]
          Highlight.Condition = '<frdCotacaoCompraFornecedor."VENCEDOR">=1'
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',<frdCotacaoCompraFornecedor."VALOR_TOTAL_LI' +
              'QUIDO">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          Left = 374.173470000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = 10485760
          Highlight.Font.Height = -11
          Highlight.Font.Name = 'Calibri'
          Highlight.Font.Style = [fsBold]
          Highlight.Condition = '<frdCotacaoCompraFornecedor."VENCEDOR">=1'
          Memo.UTF8 = (
            
              ' [IIF(<frdCotacaoCompraFornecedor."CNPJ">='#39#39','#39#39',IIF(<frdCotacaoC' +
              'ompraFornecedor."PESSOA_FISICA">=1,FormatMaskText('#39'###.###.###-#' +
              '#;0;'#39',<frdCotacaoCompraFornecedor."CNPJ">),FormatMaskText('#39'##.##' +
              '#.###/####-##;0;'#39',<frdCotacaoCompraFornecedor."CNPJ">)))]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 808.819420000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = 10485760
          Highlight.Font.Height = -11
          Highlight.Font.Name = 'Calibri'
          Highlight.Font.Style = [fsBold]
          Highlight.Condition = '<frdCotacaoCompraFornecedor."VENCEDOR">=1'
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',<frdCotacaoCompraFornecedor."VALOR_TOTAL_BR' +
              'UTO">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 888.189550000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = 10485760
          Highlight.Font.Height = -11
          Highlight.Font.Name = 'Calibri'
          Highlight.Font.Style = [fsBold]
          Highlight.Condition = '<frdCotacaoCompraFornecedor."VENCEDOR">=1'
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',<frdCotacaoCompraFornecedor."VALOR_TOTAL_DE' +
              'SCONTO">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 514.016080000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = 10485760
          Highlight.Font.Height = -11
          Highlight.Font.Name = 'Calibri'
          Highlight.Font.Style = [fsBold]
          Highlight.Condition = '<frdCotacaoCompraFornecedor."VENCEDOR">=1'
          Memo.UTF8 = (
            ' [frdCotacaoCompraFornecedor."FORMA_PAGTO_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 653.858690000000000000
          Width = 154.960730000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = 10485760
          Highlight.Font.Height = -11
          Highlight.Font.Name = 'Calibri'
          Highlight.Font.Style = [fsBold]
          Highlight.Condition = '<frdCotacaoCompraFornecedor."VENCEDOR">=1'
          Memo.UTF8 = (
            ' [frdCotacaoCompraFornecedor."CONDICAP_PAGTO_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndPageFooter: TfrxPageFooter
        Height = 30.236240000000000000
        Top = 532.913730000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          Left = 918.425790000000000000
          Width = 128.504020000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'P'#195#161'gina :  [Page#]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Width = 918.425790000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' [Sistema]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo19: TfrxMemoView
          Top = 15.118120000000000000
          Width = 918.425790000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' Impresso em [Date] '#195#160's [Time] por [Usuario]')
          ParentFont = False
          WordWrap = False
        end
      end
      object bndHeader: TfrxHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Lucida Console'
        Font.Style = []
        Height = 49.133890000000000000
        ParentFont = False
        Top = 196.535560000000000000
        Width = 1046.929810000000000000
        object Memo17: TfrxMemoView
          Left = 963.780150000000000000
          Top = 34.015770000000000000
          Width = 83.149660000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'T. L'#195#173'quido ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Line2: TfrxLineView
          Top = 49.133890000000000000
          Width = 1046.929810000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
        end
        object Memo24: TfrxMemoView
          Top = 34.015770000000000000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' C'#195#179'digo')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 52.913420000000000000
          Top = 34.015770000000000000
          Width = 321.259879130000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' Nome / Raz'#195#163'o Social')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Top = 11.338590000000000000
          Width = 1046.929810000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' [frdCotacaoCompra."DESCRICAO_RESUMO"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          Width = 1046.929810000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            ' Descri'#195#167#195#163'o resumo')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 374.173470000000000000
          Top = 34.015770000000000000
          Width = 139.842610000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' CPF/CNPJ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 888.189550000000000000
          Top = 34.015770000000000000
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'Desconto ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 808.819420000000000000
          Top = 34.015770000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'T. Bruto ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Left = 514.016080000000000000
          Top = 34.015770000000000000
          Width = 139.842610000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' Forma de Pagamento')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 653.858690000000000000
          Top = 34.015770000000000000
          Width = 154.960730000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' Condi'#195#167#195#163'o de Pagamento')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndMasterDataMapa: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        Height = 129.000000000000000000
        ParentFont = False
        Top = 343.937230000000000000
        Width = 1046.929810000000000000
        DataSet = frdEmpresa
        DataSetName = 'frdEmpresa'
        RowCount = 0
        object dbCrossMapa: TfrxDBCrossView
          Width = 764.000000000000000000
          Height = 125.000000000000000000
          ShowHint = False
          CellLevels = 2
          DownThenAcross = False
          PlainCells = True
          RowLevels = 6
          ShowColumnTotal = False
          ShowRowTotal = False
          CellFields.Strings = (
            'VALOR_UNITARIO'
            'VALOR_TOTAL')
          ColumnFields.Strings = (
            'FORNECEDOR')
          DataSet = frdCotacaoCompraFornecedorItem
          DataSetName = 'frdCotacaoCompraFornecedorItem'
          RowFields.Strings = (
            'ITEM'
            'DESCRI_APRESENTACAO'
            'QUANTIDADE'
            'UNP_SIGLA'
            'VALOR_UNITARIO_MIN'
            'VALOR_UNITARIO_MAX')
          Memos = {
            3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D227574
            662D38223F3E3C63726F73733E3C63656C6C6D656D6F733E3C546672784D656D
            6F56696577204C6566743D223534342220546F703D223433302C393337323322
            2057696474683D22353822204865696768743D22313822205265737472696374
            696F6E733D223234222053686F7748696E743D2246616C73652220416C6C6F77
            45787072657373696F6E733D2246616C73652220446973706C6179466F726D61
            742E466F726D61745374723D2225322E326E2220446973706C6179466F726D61
            742E4B696E643D22666B4E756D657269632220466F6E742E436861727365743D
            22312220466F6E742E436F6C6F723D22302220466F6E742E4865696768743D22
            2D31312220466F6E742E4E616D653D2243616C696272692220466F6E742E5374
            796C653D223022204672616D652E5479703D22313522204672616D652E576964
            74683D22302C312220476170583D22332220476170593D2233222048416C6967
            6E3D22686152696768742220506172656E74466F6E743D2246616C7365222056
            416C69676E3D22766143656E7465722220546578743D22302C3030222F3E3C54
            6672784D656D6F56696577204C6566743D223630322220546F703D223433302C
            3933373233222057696474683D2231343222204865696768743D223138222052
            65737472696374696F6E733D223234222053686F7748696E743D2246616C7365
            2220416C6C6F7745787072657373696F6E733D2246616C73652220446973706C
            6179466F726D61742E466F726D61745374723D2225322E326E2220446973706C
            6179466F726D61742E4B696E643D22666B4E756D657269632220466F6E742E43
            6861727365743D22312220466F6E742E436F6C6F723D22302220466F6E742E48
            65696768743D222D31312220466F6E742E4E616D653D2243616C696272692220
            466F6E742E5374796C653D223022204672616D652E5479703D22313522204672
            616D652E57696474683D22302C312220476170583D22332220476170593D2233
            222048416C69676E3D22686152696768742220506172656E74466F6E743D2246
            616C7365222056416C69676E3D22766143656E7465722220546578743D22302C
            3030222F3E3C546672784D656D6F56696577204C6566743D223632302220546F
            703D223739222057696474683D22383522204865696768743D22323222205265
            737472696374696F6E733D223234222053686F7748696E743D2246616C736522
            20416C6C6F7745787072657373696F6E733D2246616C736522204672616D652E
            5479703D2231352220476170583D22332220476170593D2233222048416C6967
            6E3D2268615269676874222056416C69676E3D22766143656E74657222205465
            78743D22222F3E3C546672784D656D6F56696577204C6566743D223730352220
            546F703D223739222057696474683D22373022204865696768743D2232322220
            5265737472696374696F6E733D223234222053686F7748696E743D2246616C73
            652220416C6C6F7745787072657373696F6E733D2246616C736522204672616D
            652E5479703D2231352220476170583D22332220476170593D2233222048416C
            69676E3D2268615269676874222056416C69676E3D22766143656E7465722220
            546578743D22222F3E3C546672784D656D6F56696577204C6566743D22333438
            2220546F703D223838222057696474683D2231303822204865696768743D2232
            3222205265737472696374696F6E733D223234222053686F7748696E743D2246
            616C73652220416C6C6F7745787072657373696F6E733D2246616C7365222046
            72616D652E5479703D2231352220476170583D22332220476170593D22332220
            48416C69676E3D2268615269676874222056416C69676E3D22766143656E7465
            722220546578743D22222F3E3C546672784D656D6F56696577204C6566743D22
            3334382220546F703D22313130222057696474683D2231303822204865696768
            743D22323222205265737472696374696F6E733D223234222053686F7748696E
            743D2246616C73652220416C6C6F7745787072657373696F6E733D2246616C73
            6522204672616D652E5479703D2231352220476170583D22332220476170593D
            2233222048416C69676E3D2268615269676874222056416C69676E3D22766143
            656E7465722220546578743D22222F3E3C546672784D656D6F56696577204C65
            66743D223434392220546F703D223838222057696474683D2231303822204865
            696768743D22323222205265737472696374696F6E733D223234222053686F77
            48696E743D2246616C73652220416C6C6F7745787072657373696F6E733D2246
            616C736522204672616D652E5479703D2231352220476170583D223322204761
            70593D2233222048416C69676E3D2268615269676874222056416C69676E3D22
            766143656E7465722220546578743D22222F3E3C546672784D656D6F56696577
            204C6566743D223434392220546F703D22313130222057696474683D22313038
            22204865696768743D22323222205265737472696374696F6E733D2232342220
            53686F7748696E743D2246616C73652220416C6C6F7745787072657373696F6E
            733D2246616C736522204672616D652E5479703D2231352220476170583D2233
            2220476170593D2233222048416C69676E3D2268615269676874222056416C69
            676E3D22766143656E7465722220546578743D22222F3E3C546672784D656D6F
            56696577204C6566743D223239332220546F703D223736222057696474683D22
            363722204865696768743D22313922205265737472696374696F6E733D223234
            222053686F7748696E743D2246616C73652220416C6C6F774578707265737369
            6F6E733D2246616C73652220466F6E742E436861727365743D22312220466F6E
            742E436F6C6F723D22302220466F6E742E4865696768743D222D31312220466F
            6E742E4E616D653D2243616C696272692220466F6E742E5374796C653D223022
            204672616D652E5479703D2231352220476170583D22332220476170593D2233
            222048416C69676E3D22686152696768742220506172656E74466F6E743D2246
            616C7365222056416C69676E3D22766143656E7465722220546578743D22222F
            3E3C546672784D656D6F56696577204C6566743D223336302220546F703D2237
            36222057696474683D22373422204865696768743D2231392220526573747269
            6374696F6E733D223234222053686F7748696E743D2246616C73652220416C6C
            6F7745787072657373696F6E733D2246616C73652220466F6E742E4368617273
            65743D22312220466F6E742E436F6C6F723D22302220466F6E742E4865696768
            743D222D31312220466F6E742E4E616D653D2243616C696272692220466F6E74
            2E5374796C653D223022204672616D652E5479703D2231352220476170583D22
            332220476170593D2233222048416C69676E3D22686152696768742220506172
            656E74466F6E743D2246616C7365222056416C69676E3D22766143656E746572
            2220546578743D22222F3E3C546672784D656D6F56696577204C6566743D2234
            33342220546F703D223537222057696474683D22383522204865696768743D22
            313922205265737472696374696F6E733D223234222053686F7748696E743D22
            46616C73652220416C6C6F7745787072657373696F6E733D2246616C73652220
            466F6E742E436861727365743D22312220466F6E742E436F6C6F723D22302220
            466F6E742E4865696768743D222D31312220466F6E742E4E616D653D2243616C
            696272692220466F6E742E5374796C653D223022204672616D652E5479703D22
            31352220476170583D22332220476170593D2233222048416C69676E3D226861
            52696768742220506172656E74466F6E743D2246616C7365222056416C69676E
            3D22766143656E7465722220546578743D22222F3E3C546672784D656D6F5669
            6577204C6566743D223531392220546F703D223537222057696474683D223730
            22204865696768743D22313922205265737472696374696F6E733D2232342220
            53686F7748696E743D2246616C73652220416C6C6F7745787072657373696F6E
            733D2246616C73652220466F6E742E436861727365743D22312220466F6E742E
            436F6C6F723D22302220466F6E742E4865696768743D222D31312220466F6E74
            2E4E616D653D2243616C696272692220466F6E742E5374796C653D2230222046
            72616D652E5479703D2231352220476170583D22332220476170593D22332220
            48416C69676E3D22686152696768742220506172656E74466F6E743D2246616C
            7365222056416C69676E3D22766143656E7465722220546578743D22222F3E3C
            546672784D656D6F56696577204C6566743D223634352220546F703D22383822
            2057696474683D22383122204865696768743D22323222205265737472696374
            696F6E733D223234222053686F7748696E743D2246616C73652220416C6C6F77
            45787072657373696F6E733D2246616C736522204672616D652E5479703D2231
            352220476170583D22332220476170593D2233222048416C69676E3D22686152
            69676874222056416C69676E3D22766143656E7465722220546578743D22222F
            3E3C546672784D656D6F56696577204C6566743D223634352220546F703D2231
            3130222057696474683D22383122204865696768743D22323222205265737472
            696374696F6E733D223234222053686F7748696E743D2246616C73652220416C
            6C6F7745787072657373696F6E733D2246616C736522204672616D652E547970
            3D2231352220476170583D22332220476170593D2233222048416C69676E3D22
            68615269676874222056416C69676E3D22766143656E7465722220546578743D
            22222F3E3C546672784D656D6F56696577204C6566743D223535372220546F70
            3D223838222057696474683D22383122204865696768743D2232322220526573
            7472696374696F6E733D223234222053686F7748696E743D2246616C73652220
            416C6C6F7745787072657373696F6E733D2246616C736522204672616D652E54
            79703D2231352220476170583D22332220476170593D2233222048416C69676E
            3D2268615269676874222056416C69676E3D22766143656E7465722220546578
            743D22222F3E3C546672784D656D6F56696577204C6566743D22353537222054
            6F703D22313130222057696474683D22383122204865696768743D2232322220
            5265737472696374696F6E733D223234222053686F7748696E743D2246616C73
            652220416C6C6F7745787072657373696F6E733D2246616C736522204672616D
            652E5479703D2231352220476170583D22332220476170593D2233222048416C
            69676E3D2268615269676874222056416C69676E3D22766143656E7465722220
            546578743D22222F3E3C546672784D656D6F56696577204C6566743D22302220
            546F703D2230222057696474683D223022204865696768743D22302220526573
            7472696374696F6E733D2238222053686F7748696E743D2246616C7365222041
            6C6C6F7745787072657373696F6E733D2246616C736522204672616D652E5479
            703D2231352220476170583D22332220476170593D2233222048416C69676E3D
            2268615269676874222056416C69676E3D22766143656E746572222054657874
            3D22222F3E3C546672784D656D6F56696577204C6566743D22302220546F703D
            2230222057696474683D223022204865696768743D2230222052657374726963
            74696F6E733D2238222053686F7748696E743D2246616C73652220416C6C6F77
            45787072657373696F6E733D2246616C736522204672616D652E5479703D2231
            352220476170583D22332220476170593D2233222048416C69676E3D22686152
            69676874222056416C69676E3D22766143656E7465722220546578743D22222F
            3E3C546672784D656D6F56696577204C6566743D223433342220546F703D2237
            36222057696474683D22383522204865696768743D2231392220526573747269
            6374696F6E733D223234222053686F7748696E743D2246616C73652220416C6C
            6F7745787072657373696F6E733D2246616C73652220466F6E742E4368617273
            65743D22312220466F6E742E436F6C6F723D22302220466F6E742E4865696768
            743D222D31312220466F6E742E4E616D653D2243616C696272692220466F6E74
            2E5374796C653D223022204672616D652E5479703D2231352220476170583D22
            332220476170593D2233222048416C69676E3D22686152696768742220506172
            656E74466F6E743D2246616C7365222056416C69676E3D22766143656E746572
            2220546578743D22222F3E3C546672784D656D6F56696577204C6566743D2235
            31392220546F703D223736222057696474683D22373022204865696768743D22
            313922205265737472696374696F6E733D223234222053686F7748696E743D22
            46616C73652220416C6C6F7745787072657373696F6E733D2246616C73652220
            466F6E742E436861727365743D22312220466F6E742E436F6C6F723D22302220
            466F6E742E4865696768743D222D31312220466F6E742E4E616D653D2243616C
            696272692220466F6E742E5374796C653D223022204672616D652E5479703D22
            31352220476170583D22332220476170593D2233222048416C69676E3D226861
            52696768742220506172656E74466F6E743D2246616C7365222056416C69676E
            3D22766143656E7465722220546578743D22222F3E3C546672784D656D6F5669
            6577204C6566743D22302220546F703D2230222057696474683D223022204865
            696768743D223022205265737472696374696F6E733D2238222053686F774869
            6E743D2246616C73652220416C6C6F7745787072657373696F6E733D2246616C
            736522204672616D652E5479703D2231352220476170583D2233222047617059
            3D2233222048416C69676E3D2268615269676874222056416C69676E3D227661
            43656E7465722220546578743D22222F3E3C546672784D656D6F56696577204C
            6566743D22302220546F703D2230222057696474683D22302220486569676874
            3D223022205265737472696374696F6E733D2238222053686F7748696E743D22
            46616C73652220416C6C6F7745787072657373696F6E733D2246616C73652220
            4672616D652E5479703D2231352220476170583D22332220476170593D223322
            2048416C69676E3D2268615269676874222056416C69676E3D22766143656E74
            65722220546578743D22222F3E3C546672784D656D6F56696577204C6566743D
            22302220546F703D2230222057696474683D223022204865696768743D223022
            205265737472696374696F6E733D2238222053686F7748696E743D2246616C73
            652220416C6C6F7745787072657373696F6E733D2246616C736522204672616D
            652E5479703D2231352220476170583D22332220476170593D2233222048416C
            69676E3D2268615269676874222056416C69676E3D22766143656E7465722220
            546578743D22222F3E3C546672784D656D6F56696577204C6566743D22302220
            546F703D2230222057696474683D223022204865696768743D22302220526573
            7472696374696F6E733D2238222053686F7748696E743D2246616C7365222041
            6C6C6F7745787072657373696F6E733D2246616C736522204672616D652E5479
            703D2231352220476170583D22332220476170593D2233222048416C69676E3D
            2268615269676874222056416C69676E3D22766143656E746572222054657874
            3D22222F3E3C546672784D656D6F56696577204C6566743D22302220546F703D
            2230222057696474683D223022204865696768743D2230222052657374726963
            74696F6E733D2238222053686F7748696E743D2246616C73652220416C6C6F77
            45787072657373696F6E733D2246616C736522204672616D652E5479703D2231
            352220476170583D22332220476170593D2233222048416C69676E3D22686152
            69676874222056416C69676E3D22766143656E7465722220546578743D22222F
            3E3C546672784D656D6F56696577204C6566743D22302220546F703D22302220
            57696474683D223022204865696768743D223022205265737472696374696F6E
            733D2238222053686F7748696E743D2246616C73652220416C6C6F7745787072
            657373696F6E733D2246616C736522204672616D652E5479703D223135222047
            6170583D22332220476170593D2233222048416C69676E3D2268615269676874
            222056416C69676E3D22766143656E7465722220546578743D22222F3E3C5466
            72784D656D6F56696577204C6566743D22302220546F703D2230222057696474
            683D223022204865696768743D223022205265737472696374696F6E733D2238
            222053686F7748696E743D2246616C73652220416C6C6F774578707265737369
            6F6E733D2246616C736522204672616D652E5479703D2231352220476170583D
            22332220476170593D2233222048416C69676E3D226861526967687422205641
            6C69676E3D22766143656E7465722220546578743D22222F3E3C546672784D65
            6D6F56696577204C6566743D22302220546F703D2230222057696474683D2230
            22204865696768743D223022205265737472696374696F6E733D223822205368
            6F7748696E743D2246616C73652220416C6C6F7745787072657373696F6E733D
            2246616C736522204672616D652E5479703D2231352220476170583D22332220
            476170593D2233222048416C69676E3D2268615269676874222056416C69676E
            3D22766143656E7465722220546578743D22222F3E3C2F63656C6C6D656D6F73
            3E3C63656C6C6865616465726D656D6F733E3C546672784D656D6F5669657720
            4C6566743D223534342220546F703D223431322C393337323322205769647468
            3D22353822204865696768743D22313822205265737472696374696F6E733D22
            38222053686F7748696E743D2246616C73652220416C6C6F7745787072657373
            696F6E733D2246616C73652220436F6C6F723D222D3136373737323031222046
            6F6E742E436861727365743D22312220466F6E742E436F6C6F723D2230222046
            6F6E742E4865696768743D222D31312220466F6E742E4E616D653D2243616C69
            6272692220466F6E742E5374796C653D223122204672616D652E5479703D2231
            3522204672616D652E57696474683D22302C312220476170583D223322204761
            70593D2233222048416C69676E3D22686152696768742220506172656E74466F
            6E743D2246616C7365222056416C69676E3D22766143656E7465722220546578
            743D2220562E20556E2E202852242920222F3E3C546672784D656D6F56696577
            204C6566743D223630322220546F703D223431322C3933373233222057696474
            683D2231343222204865696768743D22313822205265737472696374696F6E73
            3D2238222053686F7748696E743D2246616C73652220416C6C6F774578707265
            7373696F6E733D2246616C73652220436F6C6F723D222D313637373732303122
            20466F6E742E436861727365743D22312220466F6E742E436F6C6F723D223022
            20466F6E742E4865696768743D222D31312220466F6E742E4E616D653D224361
            6C696272692220466F6E742E5374796C653D223122204672616D652E5479703D
            22313522204672616D652E57696474683D22302C312220476170583D22332220
            476170593D2233222048416C69676E3D22686152696768742220506172656E74
            466F6E743D2246616C7365222056416C69676E3D22766143656E746572222054
            6578743D2220562E20546F74616C202852242920222F3E3C546672784D656D6F
            56696577204C6566743D223433342220546F703D223338222057696474683D22
            383522204865696768743D22313922205265737472696374696F6E733D223822
            2053686F7748696E743D2246616C73652220416C6C6F7745787072657373696F
            6E733D2246616C73652220436F6C6F723D222D31363737373230312220466F6E
            742E436861727365743D22312220466F6E742E436F6C6F723D22302220466F6E
            742E4865696768743D222D31312220466F6E742E4E616D653D2243616C696272
            692220466F6E742E5374796C653D223022204672616D652E5479703D22313522
            20476170583D22332220476170593D22332220506172656E74466F6E743D2246
            616C7365222056416C69676E3D22766143656E7465722220546578743D225641
            4C4F525F554E49544152494F222F3E3C546672784D656D6F56696577204C6566
            743D223531392220546F703D223338222057696474683D223730222048656967
            68743D22313922205265737472696374696F6E733D2238222053686F7748696E
            743D2246616C73652220416C6C6F7745787072657373696F6E733D2246616C73
            652220436F6C6F723D222D31363737373230312220466F6E742E436861727365
            743D22312220466F6E742E436F6C6F723D22302220466F6E742E486569676874
            3D222D31312220466F6E742E4E616D653D2243616C696272692220466F6E742E
            5374796C653D223022204672616D652E5479703D2231352220476170583D2233
            2220476170593D22332220506172656E74466F6E743D2246616C736522205641
            6C69676E3D22766143656E7465722220546578743D2256414C4F525F544F5441
            4C222F3E3C546672784D656D6F56696577204C6566743D223232362220546F70
            3D223838222057696474683D2231323222204865696768743D22323222205265
            737472696374696F6E733D2238222053686F7748696E743D2246616C73652220
            416C6C6F7745787072657373696F6E733D2246616C736522204672616D652E54
            79703D2231352220476170583D22332220476170593D2233222056416C69676E
            3D22766143656E7465722220546578743D2256414C4F525F554E49544152494F
            222F3E3C546672784D656D6F56696577204C6566743D223232362220546F703D
            22313130222057696474683D2231323222204865696768743D22323222205265
            737472696374696F6E733D2238222053686F7748696E743D2246616C73652220
            416C6C6F7745787072657373696F6E733D2246616C736522204672616D652E54
            79703D2231352220476170583D22332220476170593D2233222056416C69676E
            3D22766143656E7465722220546578743D2256414C4F525F544F54414C222F3E
            3C546672784D656D6F56696577204C6566743D223332372220546F703D223838
            222057696474683D2231323222204865696768743D2232322220526573747269
            6374696F6E733D2238222053686F7748696E743D2246616C73652220416C6C6F
            7745787072657373696F6E733D2246616C736522204672616D652E5479703D22
            31352220476170583D22332220476170593D2233222056416C69676E3D227661
            43656E7465722220546578743D2256414C4F525F554E49544152494F222F3E3C
            546672784D656D6F56696577204C6566743D223332372220546F703D22313130
            222057696474683D2231323222204865696768743D2232322220526573747269
            6374696F6E733D2238222053686F7748696E743D2246616C73652220416C6C6F
            7745787072657373696F6E733D2246616C736522204672616D652E5479703D22
            31352220476170583D22332220476170593D2233222056416C69676E3D227661
            43656E7465722220546578743D2256414C4F525F544F54414C222F3E3C546672
            784D656D6F56696577204C6566743D223239322220546F703D22373622205769
            6474683D22383522204865696768743D22313922205265737472696374696F6E
            733D2238222053686F7748696E743D2246616C73652220416C6C6F7745787072
            657373696F6E733D2246616C73652220466F6E742E436861727365743D223122
            20466F6E742E436F6C6F723D22302220466F6E742E4865696768743D222D3131
            2220466F6E742E4E616D653D2243616C696272692220466F6E742E5374796C65
            3D223022204672616D652E5479703D2231352220476170583D22332220476170
            593D22332220506172656E74466F6E743D2246616C7365222056416C69676E3D
            22766143656E7465722220546578743D2256414C4F525F554E49544152494F22
            2F3E3C546672784D656D6F56696577204C6566743D223239322220546F703D22
            3935222057696474683D22383522204865696768743D22313922205265737472
            696374696F6E733D2238222053686F7748696E743D2246616C73652220416C6C
            6F7745787072657373696F6E733D2246616C73652220466F6E742E4368617273
            65743D22312220466F6E742E436F6C6F723D22302220466F6E742E4865696768
            743D222D31312220466F6E742E4E616D653D2243616C696272692220466F6E74
            2E5374796C653D223022204672616D652E5479703D2231352220476170583D22
            332220476170593D22332220506172656E74466F6E743D2246616C7365222056
            416C69676E3D22766143656E7465722220546578743D2256414C4F525F544F54
            414C222F3E3C546672784D656D6F56696577204C6566743D22302220546F703D
            2230222057696474683D223022204865696768743D2230222052657374726963
            74696F6E733D2238222053686F7748696E743D2246616C73652220416C6C6F77
            45787072657373696F6E733D2246616C736522204672616D652E5479703D2231
            352220476170583D22332220476170593D2233222056416C69676E3D22766143
            656E7465722220546578743D2256414C4F525F554E49544152494F222F3E3C54
            6672784D656D6F56696577204C6566743D22302220546F703D22302220576964
            74683D223022204865696768743D223022205265737472696374696F6E733D22
            38222053686F7748696E743D2246616C73652220416C6C6F7745787072657373
            696F6E733D2246616C736522204672616D652E5479703D223135222047617058
            3D22332220476170593D2233222056416C69676E3D22766143656E7465722220
            546578743D2256414C4F525F544F54414C222F3E3C546672784D656D6F566965
            77204C6566743D22302220546F703D2230222057696474683D22302220486569
            6768743D223022205265737472696374696F6E733D2238222053686F7748696E
            743D2246616C73652220416C6C6F7745787072657373696F6E733D2246616C73
            6522204672616D652E5479703D2231352220476170583D22332220476170593D
            2233222056416C69676E3D22766143656E7465722220546578743D2256414C4F
            525F554E49544152494F222F3E3C546672784D656D6F56696577204C6566743D
            22302220546F703D2230222057696474683D223022204865696768743D223022
            205265737472696374696F6E733D2238222053686F7748696E743D2246616C73
            652220416C6C6F7745787072657373696F6E733D2246616C736522204672616D
            652E5479703D2231352220476170583D22332220476170593D2233222056416C
            69676E3D22766143656E7465722220546578743D2256414C4F525F544F54414C
            222F3E3C2F63656C6C6865616465726D656D6F733E3C636F6C756D6E6D656D6F
            733E3C546672784D656D6F56696577204C6566743D223534342220546F703D22
            3339342C3933373233222057696474683D2232303022204865696768743D2231
            3822205265737472696374696F6E733D223234222053686F7748696E743D2246
            616C73652220416C6C6F7745787072657373696F6E733D2246616C7365222043
            6F6C6F723D222D31363737373230312220466F6E742E436861727365743D2231
            2220466F6E742E436F6C6F723D22302220466F6E742E4865696768743D222D31
            312220466F6E742E4E616D653D2243616C696272692220466F6E742E5374796C
            653D223122204672616D652E5479703D22313522204672616D652E5769647468
            3D22302C312220476170583D22332220476170593D2233222048416C69676E3D
            22686143656E7465722220506172656E74466F6E743D2246616C736522205641
            6C69676E3D22766143656E7465722220546578743D22222F3E3C2F636F6C756D
            6E6D656D6F733E3C636F6C756D6E746F74616C6D656D6F733E3C546672784D65
            6D6F56696577204C6566743D223433342220546F703D22313922205769647468
            3D2231353522204865696768743D22313922205265737472696374696F6E733D
            2238222056697369626C653D2246616C7365222053686F7748696E743D224661
            6C73652220416C6C6F7745787072657373696F6E733D2246616C73652220436F
            6C6F723D222D31363737373230312220466F6E742E436861727365743D223122
            20466F6E742E436F6C6F723D22302220466F6E742E4865696768743D222D3131
            2220466F6E742E4E616D653D2243616C696272692220466F6E742E5374796C65
            3D223122204672616D652E5479703D2231352220476170583D22332220476170
            593D2233222048416C69676E3D22686143656E7465722220506172656E74466F
            6E743D2246616C7365222056416C69676E3D22766143656E7465722220546578
            743D22436F6E736F6C696461646F222F3E3C2F636F6C756D6E746F74616C6D65
            6D6F733E3C636F726E65726D656D6F733E3C546672784D656D6F56696577204C
            6566743D2232302220546F703D223336332C3933373233222057696474683D22
            35323422204865696768743D22333122205265737472696374696F6E733D2238
            222053686F7748696E743D2246616C73652220416C6C6F774578707265737369
            6F6E733D2246616C736522204368617253706163696E673D22322220436F6C6F
            723D2231343231313238382220466F6E742E436861727365743D22312220466F
            6E742E436F6C6F723D22302220466F6E742E4865696768743D222D3131222046
            6F6E742E4E616D653D2243616C696272692220466F6E742E5374796C653D2231
            22204672616D652E5479703D22313522204672616D652E57696474683D22302C
            312220476170583D22332220476170593D2233222048416C69676E3D22686143
            656E7465722220506172656E74466F6E743D2246616C7365222056416C69676E
            3D22766143656E7465722220546578743D2250726F6475746F202F2053657276
            69C3A76F222F3E3C546672784D656D6F56696577204C6566743D223534342220
            546F703D223336332C3933373233222057696474683D22323030222048656967
            68743D22333122205265737472696374696F6E733D2238222053686F7748696E
            743D2246616C73652220416C6C6F7745787072657373696F6E733D2246616C73
            6522204368617253706163696E673D22322220436F6C6F723D22313432313132
            38382220466F6E742E436861727365743D22312220466F6E742E436F6C6F723D
            22302220466F6E742E4865696768743D222D31312220466F6E742E4E616D653D
            2243616C696272692220466F6E742E5374796C653D223122204672616D652E54
            79703D22313522204672616D652E57696474683D22302C312220476170583D22
            332220476170593D2233222048416C69676E3D22686143656E74657222205061
            72656E74466F6E743D2246616C7365222056416C69676E3D22766143656E7465
            722220546578743D224D61706120646520507265C3A76F7320656E7472652046
            6F726E656365646F726573222F3E3C546672784D656D6F56696577204C656674
            3D223239322220546F703D223139222057696474683D22383522204865696768
            743D22313922205265737472696374696F6E733D2238222056697369626C653D
            2246616C7365222053686F7748696E743D2246616C73652220416C6C6F774578
            7072657373696F6E733D2246616C73652220466F6E742E436861727365743D22
            312220466F6E742E436F6C6F723D22302220466F6E742E4865696768743D222D
            31312220466F6E742E4E616D653D2243616C696272692220466F6E742E537479
            6C653D223022204672616D652E5479703D2231352220476170583D2233222047
            6170593D2233222048416C69676E3D22686143656E7465722220506172656E74
            466F6E743D2246616C7365222056416C69676E3D22766143656E746572222054
            6578743D22222F3E3C546672784D656D6F56696577204C6566743D2232302220
            546F703D223339342C3933373233222057696474683D22333522204865696768
            743D22333622205265737472696374696F6E733D2238222053686F7748696E74
            3D2246616C73652220416C6C6F7745787072657373696F6E733D2246616C7365
            2220436F6C6F723D222D31363737373230312220466F6E742E43686172736574
            3D22312220466F6E742E436F6C6F723D22302220466F6E742E4865696768743D
            222D31312220466F6E742E4E616D653D2243616C696272692220466F6E742E53
            74796C653D223122204672616D652E5479703D22313522204672616D652E5769
            6474683D22302C312220476170583D22332220476170593D2233222048416C69
            676E3D22686143656E7465722220506172656E74466F6E743D2246616C736522
            2056416C69676E3D22766143656E7465722220546578743D22204974656D2022
            2F3E3C546672784D656D6F56696577204C6566743D2235352220546F703D2233
            39342C3933373233222057696474683D2231323322204865696768743D223336
            22205265737472696374696F6E733D2238222053686F7748696E743D2246616C
            73652220416C6C6F7745787072657373696F6E733D2246616C73652220436F6C
            6F723D222D31363737373230312220466F6E742E436861727365743D22312220
            466F6E742E436F6C6F723D22302220466F6E742E4865696768743D222D313122
            20466F6E742E4E616D653D2243616C696272692220466F6E742E5374796C653D
            223122204672616D652E5479703D22313522204672616D652E57696474683D22
            302C312220476170583D22332220476170593D22332220506172656E74466F6E
            743D2246616C7365222056416C69676E3D22766143656E746572222054657874
            3D2220446573637269C3A7C3A36F202B204170726573656E7461C3A7C3A36F22
            2F3E3C546672784D656D6F56696577204C6566743D223137382220546F703D22
            3339342C3933373233222057696474683D22373222204865696768743D223336
            22205265737472696374696F6E733D2238222053686F7748696E743D2246616C
            73652220416C6C6F7745787072657373696F6E733D2246616C73652220436F6C
            6F723D222D31363737373230312220466F6E742E436861727365743D22312220
            466F6E742E436F6C6F723D22302220466F6E742E4865696768743D222D313122
            20466F6E742E4E616D653D2243616C696272692220466F6E742E5374796C653D
            223122204672616D652E5479703D22313522204672616D652E57696474683D22
            302C312220476170583D22332220476170593D2233222048416C69676E3D2268
            6143656E7465722220506172656E74466F6E743D2246616C7365222056416C69
            676E3D22766143656E7465722220546578743D2220517464652E20222F3E3C54
            6672784D656D6F56696577204C6566743D223235302220546F703D223339342C
            3933373233222057696474683D22363222204865696768743D22333622205265
            737472696374696F6E733D2238222053686F7748696E743D2246616C73652220
            416C6C6F7745787072657373696F6E733D2246616C73652220436F6C6F723D22
            2D31363737373230312220466F6E742E436861727365743D22312220466F6E74
            2E436F6C6F723D22302220466F6E742E4865696768743D222D31312220466F6E
            742E4E616D653D2243616C696272692220466F6E742E5374796C653D22312220
            4672616D652E5479703D22313522204672616D652E57696474683D22302C3122
            20476170583D22332220476170593D2233222048416C69676E3D22686143656E
            7465722220506172656E74466F6E743D2246616C7365222056416C69676E3D22
            766143656E7465722220546578743D2220556E642E20222F3E3C546672784D65
            6D6F56696577204C6566743D223331322220546F703D223339342C3933373233
            222057696474683D2231313522204865696768743D2233362220526573747269
            6374696F6E733D2238222053686F7748696E743D2246616C73652220416C6C6F
            7745787072657373696F6E733D2246616C73652220436F6C6F723D222D313637
            37373230312220466F6E742E436861727365743D22312220466F6E742E436F6C
            6F723D2231363731313638302220466F6E742E4865696768743D222D31312220
            466F6E742E4E616D653D2243616C696272692220466F6E742E5374796C653D22
            3122204672616D652E5479703D22313522204672616D652E57696474683D2230
            2C312220476170583D22332220476170593D2233222048416C69676E3D226861
            52696768742220506172656E74466F6E743D2246616C7365222056416C69676E
            3D22766143656E7465722220546578743D224DC3AD6E2E2028522429222F3E3C
            546672784D656D6F56696577204C6566743D223432372220546F703D22333934
            2C3933373233222057696474683D2231313722204865696768743D2233362220
            5265737472696374696F6E733D2238222053686F7748696E743D2246616C7365
            2220416C6C6F7745787072657373696F6E733D2246616C73652220436F6C6F72
            3D222D31363737373230312220466F6E742E436861727365743D22312220466F
            6E742E436F6C6F723D223235352220466F6E742E4865696768743D222D313122
            20466F6E742E4E616D653D2243616C696272692220466F6E742E5374796C653D
            223122204672616D652E5479703D22313522204672616D652E57696474683D22
            302C312220476170583D22332220476170593D2233222048416C69676E3D2268
            6152696768742220506172656E74466F6E743D2246616C7365222056416C6967
            6E3D22766143656E7465722220546578743D224DC3A1782E2028522429222F3E
            3C2F636F726E65726D656D6F733E3C726F776D656D6F733E3C546672784D656D
            6F56696577204C6566743D2232302220546F703D223433302C39333732332220
            57696474683D22333522204865696768743D2231382220526573747269637469
            6F6E733D223234222053686F7748696E743D2246616C73652220416C6C6F7745
            787072657373696F6E733D2246616C73652220466F6E742E436861727365743D
            22312220466F6E742E436F6C6F723D22302220466F6E742E4865696768743D22
            2D31312220466F6E742E4E616D653D2243616C696272692220466F6E742E5374
            796C653D223022204672616D652E5479703D22313522204672616D652E576964
            74683D22302C312220476170583D22332220476170593D2233222048416C6967
            6E3D22686143656E7465722220506172656E74466F6E743D2246616C73652220
            56416C69676E3D22766143656E7465722220546578743D22222F3E3C54667278
            4D656D6F56696577204C6566743D2235352220546F703D223433302C39333732
            33222057696474683D2231323322204865696768743D22313822205265737472
            696374696F6E733D223234222053686F7748696E743D2246616C73652220416C
            6C6F7745787072657373696F6E733D2246616C73652220466F6E742E43686172
            7365743D22312220466F6E742E436F6C6F723D22302220466F6E742E48656967
            68743D222D31312220466F6E742E4E616D653D2243616C696272692220466F6E
            742E5374796C653D223022204672616D652E5479703D22313522204672616D65
            2E57696474683D22302C312220476170583D22332220476170593D2233222050
            6172656E74466F6E743D2246616C7365222056416C69676E3D22766143656E74
            65722220546578743D22222F3E3C546672784D656D6F56696577204C6566743D
            223137382220546F703D223433302C3933373233222057696474683D22373222
            204865696768743D22313822205265737472696374696F6E733D223234222053
            686F7748696E743D2246616C73652220416C6C6F7745787072657373696F6E73
            3D2246616C73652220466F6E742E436861727365743D22312220466F6E742E43
            6F6C6F723D22302220466F6E742E4865696768743D222D31312220466F6E742E
            4E616D653D2243616C696272692220466F6E742E5374796C653D223022204672
            616D652E5479703D22313522204672616D652E57696474683D22302C31222047
            6170583D22332220476170593D2233222048416C69676E3D22686143656E7465
            722220506172656E74466F6E743D2246616C7365222056416C69676E3D227661
            43656E7465722220546578743D22222F3E3C546672784D656D6F56696577204C
            6566743D223235302220546F703D223433302C3933373233222057696474683D
            22363222204865696768743D22313822205265737472696374696F6E733D2232
            34222053686F7748696E743D2246616C73652220416C6C6F7745787072657373
            696F6E733D2246616C73652220466F6E742E436861727365743D22312220466F
            6E742E436F6C6F723D22302220466F6E742E4865696768743D222D3131222046
            6F6E742E4E616D653D2243616C696272692220466F6E742E5374796C653D2230
            22204672616D652E5479703D22313522204672616D652E57696474683D22302C
            312220476170583D22332220476170593D2233222048416C69676E3D22686143
            656E7465722220506172656E74466F6E743D2246616C7365222056416C69676E
            3D22766143656E7465722220546578743D22222F3E3C546672784D656D6F5669
            6577204C6566743D223331322220546F703D223433302C393337323322205769
            6474683D2231313522204865696768743D22313822205265737472696374696F
            6E733D223234222053686F7748696E743D2246616C73652220416C6C6F774578
            7072657373696F6E733D2246616C73652220446973706C6179466F726D61742E
            466F726D61745374723D2225322E326E2220446973706C6179466F726D61742E
            4B696E643D22666B4E756D657269632220466F6E742E436861727365743D2231
            2220466F6E742E436F6C6F723D2231363731313638302220466F6E742E486569
            6768743D222D31312220466F6E742E4E616D653D2243616C696272692220466F
            6E742E5374796C653D223022204672616D652E5479703D22313522204672616D
            652E57696474683D22302C312220476170583D22332220476170593D22332220
            48416C69676E3D22686152696768742220506172656E74466F6E743D2246616C
            7365222056416C69676E3D22766143656E7465722220546578743D22222F3E3C
            546672784D656D6F56696577204C6566743D223432372220546F703D22343330
            2C3933373233222057696474683D2231313722204865696768743D2231382220
            5265737472696374696F6E733D223234222053686F7748696E743D2246616C73
            652220416C6C6F7745787072657373696F6E733D2246616C7365222044697370
            6C6179466F726D61742E466F726D61745374723D2225322E326E222044697370
            6C6179466F726D61742E4B696E643D22666B4E756D657269632220466F6E742E
            436861727365743D22312220466F6E742E436F6C6F723D223235352220466F6E
            742E4865696768743D222D31312220466F6E742E4E616D653D2243616C696272
            692220466F6E742E5374796C653D223022204672616D652E5479703D22313522
            204672616D652E57696474683D22302C312220476170583D2233222047617059
            3D2233222048416C69676E3D22686152696768742220506172656E74466F6E74
            3D2246616C7365222056416C69676E3D22766143656E7465722220546578743D
            22222F3E3C2F726F776D656D6F733E3C726F77746F74616C6D656D6F733E3C54
            6672784D656D6F56696577204C6566743D22302220546F703D22373622205769
            6474683D2232393322204865696768743D22313922205265737472696374696F
            6E733D2238222056697369626C653D2246616C7365222053686F7748696E743D
            2246616C73652220416C6C6F7745787072657373696F6E733D2246616C736522
            20466F6E742E436861727365743D22312220466F6E742E436F6C6F723D223022
            20466F6E742E4865696768743D222D31312220466F6E742E4E616D653D224361
            6C696272692220466F6E742E5374796C653D223122204672616D652E5479703D
            2231352220476170583D22332220476170593D2233222048416C69676E3D2268
            6143656E7465722220506172656E74466F6E743D2246616C7365222056416C69
            676E3D22766143656E7465722220546578743D224772616E6420546F74616C22
            2F3E3C546672784D656D6F56696577204C6566743D2234362220546F703D2238
            38222057696474683D2231383022204865696768743D22343422205265737472
            696374696F6E733D2238222056697369626C653D2246616C7365222053686F77
            48696E743D2246616C73652220416C6C6F7745787072657373696F6E733D2246
            616C73652220466F6E742E436861727365743D22312220466F6E742E436F6C6F
            723D22302220466F6E742E4865696768743D222D31332220466F6E742E4E616D
            653D22417269616C2220466F6E742E5374796C653D223122204672616D652E54
            79703D2231352220476170583D22332220476170593D2233222048416C69676E
            3D22686143656E7465722220506172656E74466F6E743D2246616C7365222056
            416C69676E3D22766143656E7465722220546578743D22546F74616C222F3E3C
            546672784D656D6F56696577204C6566743D223232362220546F703D22383822
            2057696474683D2231303122204865696768743D223434222052657374726963
            74696F6E733D2238222056697369626C653D2246616C7365222053686F774869
            6E743D2246616C73652220416C6C6F7745787072657373696F6E733D2246616C
            73652220466F6E742E436861727365743D22312220466F6E742E436F6C6F723D
            22302220466F6E742E4865696768743D222D31332220466F6E742E4E616D653D
            22417269616C2220466F6E742E5374796C653D223122204672616D652E547970
            3D2231352220476170583D22332220476170593D2233222048416C69676E3D22
            686143656E7465722220506172656E74466F6E743D2246616C7365222056416C
            69676E3D22766143656E7465722220546578743D22546F74616C222F3E3C5466
            72784D656D6F56696577204C6566743D223332372220546F703D223838222057
            696474683D22383822204865696768743D22343422205265737472696374696F
            6E733D2238222056697369626C653D2246616C7365222053686F7748696E743D
            2246616C73652220416C6C6F7745787072657373696F6E733D2246616C736522
            20466F6E742E436861727365743D22312220466F6E742E436F6C6F723D223022
            20466F6E742E4865696768743D222D31332220466F6E742E4E616D653D224172
            69616C2220466F6E742E5374796C653D223122204672616D652E5479703D2231
            352220476170583D22332220476170593D2233222048416C69676E3D22686143
            656E7465722220506172656E74466F6E743D2246616C7365222056416C69676E
            3D22766143656E7465722220546578743D22546F74616C222F3E3C546672784D
            656D6F56696577204C6566743D223239322220546F703D223739222057696474
            683D2231363222204865696768743D22323222205265737472696374696F6E73
            3D2238222056697369626C653D2246616C7365222053686F7748696E743D2246
            616C73652220416C6C6F7745787072657373696F6E733D2246616C7365222046
            6F6E742E436861727365743D22312220466F6E742E436F6C6F723D2230222046
            6F6E742E4865696768743D222D31332220466F6E742E4E616D653D2241726961
            6C2220466F6E742E5374796C653D223122204672616D652E5479703D22313522
            20476170583D22332220476170593D2233222048416C69676E3D22686143656E
            7465722220506172656E74466F6E743D2246616C7365222056416C69676E3D22
            766143656E7465722220546578743D22546F74616C222F3E3C546672784D656D
            6F56696577204C6566743D223435342220546F703D223739222057696474683D
            2231363622204865696768743D22323222205265737472696374696F6E733D22
            38222056697369626C653D2246616C7365222053686F7748696E743D2246616C
            73652220416C6C6F7745787072657373696F6E733D2246616C73652220466F6E
            742E436861727365743D22312220466F6E742E436F6C6F723D22302220466F6E
            742E4865696768743D222D31332220466F6E742E4E616D653D22417269616C22
            20466F6E742E5374796C653D223122204672616D652E5479703D223135222047
            6170583D22332220476170593D2233222048416C69676E3D22686143656E7465
            722220506172656E74466F6E743D2246616C7365222056416C69676E3D227661
            43656E7465722220546578743D22546F74616C222F3E3C2F726F77746F74616C
            6D656D6F733E3C63656C6C66756E6374696F6E733E3C6974656D20302F3E3C69
            74656D20302F3E3C2F63656C6C66756E6374696F6E733E3C636F6C756D6E736F
            72743E3C6974656D20302F3E3C2F636F6C756D6E736F72743E3C726F77736F72
            743E3C6974656D20302F3E3C6974656D20302F3E3C6974656D20302F3E3C6974
            656D20302F3E3C6974656D20302F3E3C6974656D20302F3E3C2F726F77736F72
            743E3C2F63726F73733E}
        end
      end
      object bndFooter: TfrxFooter
        Height = 11.338590000000000000
        Top = 309.921460000000000000
        Width = 1046.929810000000000000
      end
    end
  end
  object frrNotaEntrega: TfrxReport
    Version = '4.9.72'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40928.407150601900000000
    ReportOptions.LastChange = 41856.560776539350000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 24
    Top = 168
    Datasets = <
      item
        DataSet = frdCliente
        DataSetName = 'frdCliente'
      end
      item
        DataSet = frdEmpresa
        DataSetName = 'frdEmpresa'
      end
      item
        DataSet = frdFormaPagtos
        DataSetName = 'frdFormaPagtos'
      end
      item
        DataSet = frdItens
        DataSetName = 'frdItens'
      end
      item
        DataSet = frdTitulo
        DataSetName = 'frdTitulo'
      end
      item
        DataSet = frdVenda
        DataSetName = 'frdVenda'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Lucida Console'
      Font.Style = []
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object bndReportTitle: TfrxReportTitle
        Height = 90.401670000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object frdVendaCODCONTROL: TfrxMemoView
          Left = 559.370440000000000000
          Top = 18.897650000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.UTF8 = (
            
              '[IIF(<frdVenda."NFE">=0,FormatFloat('#39'0000'#39',<frdVenda."ANO">)+'#39'/'#39 +
              '+FormatFloat('#39'###0000000'#39',<frdVenda."CODCONTROL">),FormatFloat('#39 +
              '###0000000'#39',<frdVenda."NFE">)+'#39'-'#39'+<frdVenda."SERIE">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 559.370440000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          ShowHint = False
          CharSpacing = 4.000000000000000000
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            '[IIF(<frdVenda."NFE">=0,'#39'N'#195#186'mero Controle'#39', '#39'N'#195#186'mero NF-e'#39')]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 559.370440000000000000
          Top = 37.795300000000000000
          Width = 158.740260000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = clBtnFace
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            
              '[IIF(<frdVenda."STATUS">=1,'#39'Or'#195#167'amento'#39',IIF(<frdVenda."STATUS">=' +
              '2,'#39'Or'#195#167'amento'#39',IIF(<frdVenda."STATUS">=3,'#39'Finalizada'#39',IIF(<frdVe' +
              'nda."STATUS">=4,'#39'Gerada NF-e'#39','#39'Cancelada'#39'))))]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Picture1: TfrxPictureView
          Left = 3.779530000000000000
          Width = 139.842610000000000000
          Height = 79.370130000000000000
          ShowHint = False
          DataField = 'LOGO'
          DataSet = frdEmpresa
          DataSetName = 'frdEmpresa'
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object frdEmpresaRZSOC: TfrxMemoView
          Left = 143.622140000000000000
          Width = 411.968770000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frdEmpresa."RZSOC"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frdEmpresaNMFANT: TfrxMemoView
          Left = 143.622140000000000000
          Top = 18.897650000000000000
          Width = 411.968770000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            
              'CNPJ.: [FormatMaskText('#39'##.###.###/####-##;0;'#39',<frdEmpresa."CNPJ' +
              '">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdFone: TfrxMemoView
          Left = 143.622140000000000000
          Top = 34.015770000000000000
          Width = 411.968770000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            'FONE: [FormatMaskText('#39'(##)####.####;0;'#39',<frdEmpresa."FONE">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 143.622140000000000000
          Top = 49.133890000000000000
          Width = 411.968770000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            
              '[frdEmpresa."TLG_SIGLA"] [frdEmpresa."LOG_NOME"], [frdEmpresa."N' +
              'UMERO_END"], [frdEmpresa."BAI_NOME"] - [frdEmpresa."CID_NOME"]/[' +
              'frdEmpresa."EST_SIGLA"] CEP.: [FormatMaskText('#39'##.###-###;0;'#39',<f' +
              'rdEmpresa."CEP">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Line1: TfrxLineView
          Top = 83.149660000000000000
          Width = 718.110700000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo44: TfrxMemoView
          Left = 143.622140000000000000
          Top = 64.252010000000000000
          Width = 574.488560000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            '[frdEmpresa."HOME_PAGE"] / [frdEmpresa."EMAIL"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndMasterData: TfrxMasterData
        Height = 18.897650000000000000
        Top = 302.362400000000000000
        Width = 718.110700000000000000
        DataSet = frdItens
        DataSetName = 'frdItens'
        RowCount = 0
        object frdItensCODPROD: TfrxMemoView
          Left = 22.677180000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = []
          Memo.UTF8 = (
            ' [frdItens."CODPROD"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdItensSEQ: TfrxMemoView
          Width = 22.677180000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[Line]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdItensDESCRI: TfrxMemoView
          Left = 75.590600000000000000
          Width = 291.023639130000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = []
          Memo.UTF8 = (
            ' [frdItens."DESCRI"] (Ref.: [frdItens."REFERENCIA"])')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 366.614410000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39'###,###,##0'#39',<frdItens."QTDE">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 642.520100000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<frdItens."TOTAL_LIQUIDO">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 411.968770000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = []
          Memo.UTF8 = (
            ' [frdItens."UNP_SIGLA"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 449.764070000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<frdItens."PUNIT">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 514.016080000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<frdItens."DESCONTO_VALOR">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 578.268090000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<frdItens."PFINAL">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndPageFooter: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 737.008350000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 566.929500000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            'P '#195#161' g i n a :  [Page#]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndHeader: TfrxHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Lucida Console'
        Font.Style = []
        Height = 109.606370000000000000
        ParentFont = False
        Top = 170.078850000000000000
        Width = 718.110700000000000000
        object frdVendaNOME: TfrxMemoView
          Top = 37.795300000000000000
          Width = 415.748300000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8 = (
            ' [frdCliente."NOME"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Top = 26.456710000000000000
          Width = 415.748300000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' Cliente:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 415.748300000000000000
          Top = 26.456710000000000000
          Width = 207.874150000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' CPF/CNPJ.:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 415.748300000000000000
          Top = 37.795300000000000000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8 = (
            
              ' [IIF(<frdCliente."PESSOA_FISICA">=1,FormatMaskText('#39'###.###.###' +
              '-##;0;'#39',<frdCliente."CNPJ">),FormatMaskText('#39'##.###.###/####-##;' +
              '0;'#39',<frdCliente."CNPJ">))]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 623.622450000000000000
          Top = 26.456710000000000000
          Width = 94.488250000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'Data: ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 623.622450000000000000
          Top = 37.795300000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            ' [FormatDateTime('#39'dd/mm/yyyy'#39',<frdVenda."DTVENDA">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Line2: TfrxLineView
          Top = 105.826840000000000000
          Width = 718.110700000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo23: TfrxMemoView
          Top = 90.708720000000000000
          Width = 22.677180000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '#')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 22.677180000000000000
          Top = 90.708720000000000000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' C'#195#179'digo')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 75.590600000000000000
          Top = 90.708720000000000000
          Width = 291.023639130000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' Descri'#195#167#195#163'o')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Top = 68.031540000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8 = (
            
              ' [Trim(<frdCliente."TLG_SIGLA"> + '#39' '#39' + <frdCliente."LOG_NOME">)' +
              '], [frdCliente."NUMERO_END"], [frdCliente."BAI_NOME"] - [frdClie' +
              'nte."CID_NOME"]/[frdCliente."EST_SIGLA"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Top = 56.692950000000000000
          Width = 718.110700000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' Endere'#195#167'o:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 411.968770000000000000
          Top = 90.708720000000000000
          Width = 37.795300000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' Und.')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 449.764070000000000000
          Top = 90.708720000000000000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'V. Bruto ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 514.016080000000000000
          Top = 90.708720000000000000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'V. Desc. ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 578.268090000000000000
          Top = 90.708720000000000000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'V. L'#195#173'quido ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo45: TfrxMemoView
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          CharSpacing = 4.000000000000000000
          DataSet = frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            'TERMO DE RECEBIMENTO DE MERCADORIAS/PRODUTOS')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 366.614410000000000000
          Top = 90.708720000000000000
          Width = 45.354323390000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'Qtde.')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 642.520100000000000000
          Top = 90.708720000000000000
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'T O T A L ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndReportSummary: TfrxReportSummary
        Height = 332.598640000000000000
        Top = 381.732530000000000000
        Width = 718.110700000000000000
        object SysMemo1: TfrxSysMemoView
          Left = 623.622450000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',SUM(<frdItens."TOTAL_LIQUIDO">,bndMasterDat' +
              'a,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo14: TfrxMemoView
          Left = 480.000310000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          HAlign = haRight
          Memo.UTF8 = (
            'T O T A L    G E R A L :')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Top = 98.267780000000000000
          Width = 366.614410000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = []
          Memo.UTF8 = (
            ' [frdVenda."VENDEDOR_NOME"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Top = 86.929190000000000000
          Width = 366.614410000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' Vendedor:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line3: TfrxLineView
          Top = 22.677180000000000000
          Width = 718.110700000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo30: TfrxMemoView
          Top = 37.795300000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = []
          Memo.UTF8 = (
            ' [frdVenda."LISTA_FORMA_PAGO"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Top = 26.456710000000000000
          Width = 718.110700000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' Forma de Pagamento:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Top = 68.031540000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = []
          Memo.UTF8 = (
            ' [frdVenda."LISTA_COND_PAGO"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Top = 56.692950000000000000
          Width = 718.110700000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' Condi'#195#167#195#163'o de Pagamento:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 366.614410000000000000
          Top = 98.267780000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<frdVenda."TOTALVENDABRUTA">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 366.614410000000000000
          Top = 86.929190000000000000
          Width = 128.504020000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            ' Total Venda: ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Left = 495.118430000000000000
          Top = 98.267780000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<frdVenda."DESCONTO">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Left = 495.118430000000000000
          Top = 86.929190000000000000
          Width = 94.488250000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            ' Desconto: ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Left = 589.606680000000000000
          Top = 98.267780000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<frdVenda."TOTALVENDA">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          Left = 589.606680000000000000
          Top = 86.929190000000000000
          Width = 128.504020000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            ' Total L'#195#173'quido: ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Top = 132.283550000000000000
          Width = 718.110700000000000000
          Height = 45.354360000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frdVenda."OBS"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          Top = 117.165430000000000000
          Width = 718.110700000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Memo.UTF8 = (
            ' Observa'#195#167#195#163'o:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Left = 234.330860000000000000
          Top = 301.362400000000000000
          Width = 249.448980000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            'Assinatura do Recebedor'
            'CPF/RG')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          Left = 37.795300000000000000
          Top = 192.756030000000000000
          Width = 623.622450000000000000
          Height = 45.354360000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial Narrow'
          Font.Style = []
          HAlign = haBlock
          Memo.UTF8 = (
            
              '                 Declaro, sob penas da lei, que recebi os produt' +
              'os e/ou mercadorias, constante da nota fiscal acima.')
          ParentFont = False
        end
      end
    end
  end
  object qryVendaCartaCredito: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    SQL.Strings = (
      'Select'
      '    e.cod_cliente'
      '  , e.cod_produto'
      '  , e.quantidade'
      '  , e.valor_medio'
      '  , e.quantidade * e.valor_medio as total_medio'
      '  , e.usuario'
      '  , e.ano_venda_ult'
      '  , e.cod_venda_ult'
      ''
      '  , p.Descri'
      '  , p.Apresentacao'
      '  , p.Descri_apresentacao'
      '  , p.Modelo'
      '  , p.Referencia'
      '  , p.Secao'
      '  , p.Preco'
      '  , p.Unidade'
      '  , g.Descri as Descricao_Grupo'
      '  , f.Nome   as Nome_Fabricante'
      '  , coalesce(s.Scp_descricao, p.Secao) as Descricao_Secao'
      '  , coalesce(u.Unp_descricao, p.Unidade) as Descricao_Unidade'
      '  , u.Unp_sigla'
      'from TBCLIENTE_ESTOQUE e'
      '  inner join TBPRODUTO p on (p.cod = e.cod_produto)'
      '  left join TBGRUPOPROD g on (g.Cod = p.Codgrupo)'
      '  left join TBSECAOPROD s on (s.Scp_cod = p.Codsecao)'
      '  left join TBUNIDADEPROD u on (u.Unp_cod = p.Codunidade)'
      '  left join TBFABRICANTE f on (f.Cod = p.Codfabricante)'
      ''
      'where e.ano_venda_ult = :anovenda'
      '  and e.cod_venda_ult = :numvenda'
      '  and e.quantidade > 0'
      ''
      'order by'
      '    p.Descri'
      '  , p.Apresentacao'
      '  , p.Descri_apresentacao')
    Left = 312
    Top = 496
    ParamData = <
      item
        DataType = ftInteger
        Name = 'anovenda'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'numvenda'
        ParamType = ptInput
        Value = 0
      end>
  end
  object frdVendaCartaCredito: TfrxDBDataset
    UserName = 'frdVendaCartaCredito'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_CLIENTE=COD_CLIENTE'
      'COD_PRODUTO=COD_PRODUTO'
      'QUANTIDADE=QUANTIDADE'
      'VALOR_MEDIO=VALOR_MEDIO'
      'TOTAL_MEDIO=TOTAL_MEDIO'
      'USUARIO=USUARIO'
      'ANO_VENDA_ULT=ANO_VENDA_ULT'
      'COD_VENDA_ULT=COD_VENDA_ULT'
      'DESCRI=DESCRI'
      'APRESENTACAO=APRESENTACAO'
      'DESCRI_APRESENTACAO=DESCRI_APRESENTACAO'
      'MODELO=MODELO'
      'REFERENCIA=REFERENCIA'
      'SECAO=SECAO'
      'PRECO=PRECO'
      'UNIDADE=UNIDADE'
      'DESCRICAO_GRUPO=DESCRICAO_GRUPO'
      'NOME_FABRICANTE=NOME_FABRICANTE'
      'DESCRICAO_SECAO=DESCRICAO_SECAO'
      'DESCRICAO_UNIDADE=DESCRICAO_UNIDADE'
      'UNP_SIGLA=UNP_SIGLA')
    DataSet = qryVendaCartaCredito
    BCDToCurrency = False
    Left = 344
    Top = 496
  end
  object frrVendaCartaCredito: TfrxReport
    Version = '4.9.72'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PreviewOptions.ZoomMode = zmPageWidth
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40928.407150601900000000
    ReportOptions.LastChange = 41856.558647511570000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 376
    Top = 496
    Datasets = <
      item
        DataSet = frdCliente
        DataSetName = 'frdCliente'
      end
      item
        DataSet = frdEmpresa
        DataSetName = 'frdEmpresa'
      end
      item
        DataSet = frdVenda
        DataSetName = 'frdVenda'
      end
      item
        DataSet = frdVendaCartaCredito
        DataSetName = 'frdVendaCartaCredito'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Requisicao: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Lucida Console'
      Font.Style = []
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object bndReportTitle: TfrxReportTitle
        Height = 116.858380000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Picture1: TfrxPictureView
          Left = 3.779530000000000000
          Width = 139.842610000000000000
          Height = 79.370130000000000000
          ShowHint = False
          DataField = 'LOGO'
          DataSet = frdEmpresa
          DataSetName = 'frdEmpresa'
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object frdEmpresaRZSOC: TfrxMemoView
          Left = 143.622140000000000000
          Width = 411.968770000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frdEmpresa."RZSOC"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frdEmpresaNMFANT: TfrxMemoView
          Left = 143.622140000000000000
          Top = 18.897650000000000000
          Width = 411.968770000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            
              'CNPJ.: [FormatMaskText('#39'##.###.###/####-##;0;'#39',<frdEmpresa."CNPJ' +
              '">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdFone: TfrxMemoView
          Left = 143.622140000000000000
          Top = 34.015770000000000000
          Width = 411.968770000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            'FONE: [FormatMaskText('#39'(##)####.####;0;'#39',<frdEmpresa."FONE">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 143.622140000000000000
          Top = 49.133890000000000000
          Width = 411.968770000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            
              '[frdEmpresa."TLG_SIGLA"] [frdEmpresa."LOG_NOME"], [frdEmpresa."N' +
              'UMERO_END"], [frdEmpresa."BAI_NOME"] - [frdEmpresa."CID_NOME"]/[' +
              'frdEmpresa."EST_SIGLA"] CEP.: [FormatMaskText('#39'##.###-###;0;'#39',<f' +
              'rdEmpresa."CEP">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Line1: TfrxLineView
          Top = 83.149660000000000000
          Width = 718.110700000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo44: TfrxMemoView
          Left = 143.622140000000000000
          Top = 64.252010000000000000
          Width = 574.488560000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            '[frdEmpresa."HOME_PAGE"] / [frdEmpresa."EMAIL"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo45: TfrxMemoView
          Top = 90.708720000000000000
          Width = 721.890230000000000000
          Height = 18.897650000000000000
          ShowHint = False
          CharSpacing = 4.000000000000000000
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            'CARTA DE CR'#195#8240'DITO')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdVendaCODCONTROL: TfrxMemoView
          Left = 559.370440000000000000
          Top = 18.897650000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.UTF8 = (
            
              '[IIF(<frdVenda."NFE">=0,FormatFloat('#39'0000'#39',<frdVenda."ANO">)+'#39'/'#39 +
              '+FormatFloat('#39'###0000000'#39',<frdVenda."CODCONTROL">),FormatFloat('#39 +
              '###0000000'#39',<frdVenda."NFE">)+'#39'-'#39'+<frdVenda."SERIE">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 559.370440000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          ShowHint = False
          CharSpacing = 4.000000000000000000
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            '[IIF(<frdVenda."NFE">=0,'#39'N'#195#186'mero Controle'#39', '#39'N'#195#186'mero NF-e'#39')]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 559.370440000000000000
          Top = 37.795300000000000000
          Width = 158.740260000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = clBtnFace
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            
              '[IIF(<frdVenda."STATUS">=1,'#39'Or'#195#167'amento'#39',IIF(<frdVenda."STATUS">=' +
              '2,'#39'Or'#195#167'amento'#39',IIF(<frdVenda."STATUS">=3,'#39'Finalizada'#39',IIF(<frdVe' +
              'nda."STATUS">=4,'#39'Gerada NF-e'#39','#39'Cancelada'#39'))))]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndMasterData: TfrxMasterData
        Height = 18.897650000000000000
        Top = 302.362400000000000000
        Width = 718.110700000000000000
        DataSet = frdVendaCartaCredito
        DataSetName = 'frdVendaCartaCredito'
        RowCount = 0
        object frdItensCODPROD: TfrxMemoView
          Left = 22.677180000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            ' [frdVendaCartaCredito."COD_PRODUTO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdItensSEQ: TfrxMemoView
          Width = 22.677180000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[Line]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdItensDESCRI: TfrxMemoView
          Left = 75.590600000000000000
          Width = 419.527659130000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            
              ' [frdVendaCartaCredito."DESCRI_APRESENTACAO"] (Ref.: [frdVendaCa' +
              'rtaCredito."REFERENCIA"])')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 495.118430000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.###'#39',<frdVendaCartaCredito."QUANTIDADE">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 642.520100000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<frdVendaCartaCredito."TOTAL_MEDIO">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 540.472790000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            ' [frdVendaCartaCredito."UNIDADE"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 578.268090000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<frdVendaCartaCredito."VALOR_MEDIO">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndPageFooter: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 737.008350000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 566.929500000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            'P '#195#161' g i n a :  [Page#]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndHeader: TfrxHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Lucida Console'
        Font.Style = []
        Height = 83.149660000000000000
        ParentFont = False
        Top = 196.535560000000000000
        Width = 718.110700000000000000
        object frdVendaNOME: TfrxMemoView
          Top = 11.338590000000000000
          Width = 415.748300000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            ' [frdCliente."NOME"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Width = 415.748300000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' Cliente:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 415.748300000000000000
          Width = 207.874150000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' CPF/CNPJ.:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 415.748300000000000000
          Top = 11.338590000000000000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            
              ' [IIF(<frdCliente."PESSOA_FISICA">=1,FormatMaskText('#39'###.###.###' +
              '-##;0;'#39',<frdCliente."CNPJ">),FormatMaskText('#39'##.###.###/####-##;' +
              '0;'#39',<frdCliente."CNPJ">))]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 623.622450000000000000
          Width = 94.488250000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'Data Venda: ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 623.622450000000000000
          Top = 11.338590000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Lucida Console'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            ' [FormatDateTime('#39'dd/mm/yyyy'#39',<frdVenda."DTVENDA">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Line2: TfrxLineView
          Top = 79.370130000000000000
          Width = 718.110700000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo23: TfrxMemoView
          Top = 64.252010000000000000
          Width = 22.677180000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '#')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 22.677180000000000000
          Top = 64.252010000000000000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' C'#195#179'digo')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 75.590600000000000000
          Top = 64.252010000000000000
          Width = 419.527659130000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' Descri'#195#167#195#163'o')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Top = 41.574830000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            
              ' [Trim(<frdCliente."TLG_SIGLA"> + '#39' '#39' + <frdCliente."LOG_NOME">)' +
              '], [frdCliente."NUMERO_END"], [frdCliente."BAI_NOME"] - [frdClie' +
              'nte."CID_NOME"]/[frdCliente."EST_SIGLA"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Top = 30.236240000000000000
          Width = 718.110700000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' Endere'#195#167'o:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 540.472790000000000000
          Top = 64.252010000000000000
          Width = 37.795300000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' Und.')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 578.268090000000000000
          Top = 64.252010000000000000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'V. M'#195#169'dio ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 495.118430000000000000
          Top = 64.252010000000000000
          Width = 45.354323390000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'Qtde.')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 642.520100000000000000
          Top = 64.252010000000000000
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'T O T A L ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndReportSummary: TfrxReportSummary
        Height = 332.598640000000000000
        Top = 381.732530000000000000
        Width = 718.110700000000000000
        object SysMemo1: TfrxSysMemoView
          Left = 623.622450000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',SUM(<frdVendaCartaCredito."TOTAL_MEDIO">,bn' +
              'dMasterData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo14: TfrxMemoView
          Left = 480.000310000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          HAlign = haRight
          Memo.UTF8 = (
            'T O T A L    G E R A L :')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line3: TfrxLineView
          Top = 22.677180000000000000
          Width = 718.110700000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo30: TfrxMemoView
          Top = 37.795300000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            ' [frdVenda."VENDEDOR_NOME"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Top = 26.456710000000000000
          Width = 718.110700000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' Venda realizada por:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Top = 68.031540000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            ' [frdVenda."USUARIO"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Top = 56.692950000000000000
          Width = 718.110700000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' Autorizada/Finalizada por:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Top = 102.047310000000000000
          Width = 718.110700000000000000
          Height = 52.913420000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frdVenda."OBS"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          Top = 86.929190000000000000
          Width = 718.110700000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Memo.UTF8 = (
            ' Observa'#195#167#195#163'o da venda:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          Left = 37.795300000000000000
          Top = 166.299320000000000000
          Width = 623.622450000000000000
          Height = 71.811070000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial Narrow'
          Font.Style = []
          HAlign = haBlock
          Memo.UTF8 = (
            
              '                 Asseguramos que o(s) produto(s) acima relaciona' +
              'do(s) para o cliente [frdCliente."NOME"], [IIF(<frdCliente."PESS' +
              'OA_FISICA">=1,'#39'CPF'#39','#39'CNPJ'#39')] [IIF(<frdCliente."PESSOA_FISICA">=1' +
              ',FormatMaskText('#39'###.###.###-##;0;'#39',<frdCliente."CNPJ">),FormatM' +
              'askText('#39'##.###.###/####-##;0;'#39',<frdCliente."CNPJ">))], consta(m' +
              ') como cr'#195#169'dito para que possa(m) ser retirado(s) por ele atrav'#195 +
              #169's de requisi'#195#167#195#181'es de materiais/produtos.')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 411.968770000000000000
          Top = 294.803340000000000000
          Width = 249.448980000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frdCliente."NOME"]'
            
              '[IIF(<frdCliente."PESSOA_FISICA">=1,FormatMaskText('#39'###.###.###-' +
              '##;0;'#39',<frdCliente."CNPJ">),FormatMaskText('#39'##.###.###/####-##;0' +
              ';'#39',<frdCliente."CNPJ">))]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Left = 37.795300000000000000
          Top = 294.803340000000000000
          Width = 249.448980000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frdEmpresa."RZSOC"]'
            '[FormatMaskText('#39'##.###.###/####-##;0;'#39',<frdEmpresa."CNPJ">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
    end
  end
  object qryRequisicaoCompra: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    SQL.Strings = (
      'Select'
      '    r.ano'
      '  , r.codigo'
      '  , r.numero'
      '  , r.tipo'
      '  , case r.tipo'
      '      when 1 then '#39'Compra'#39
      '      when 2 then '#39'Servi'#231'o'#39
      '      when 3 then '#39'Compra/Servi'#231'o'#39
      '    end as tipo_desc'
      '  , r.status'
      '  , case r.status'
      '      when 0 then '#39'Em Edi'#231#227'o'#39
      '      when 1 then '#39'Aberta'#39
      '      when 2 then '#39'Requisitada'#39
      '      when 3 then '#39'Faturada'#39
      '      when 4 then '#39'Cancelada'#39
      '    end as status_desc'
      '  , r.empresa'
      '  , r.fornecedor'
      '  , r.emissao_data'
      
        '  , (Select first 1 us.nomecompleto from TBUSERS us where us.nom' +
        'e = r.emissao_usuario)    as usuario_emissor'
      '  , r.requisitado_data'
      
        '  , (Select first 1 us.nomecompleto from TBUSERS us where us.nom' +
        'e = r.requisitado_usuario) as usuario_autorizador'
      '  , r.transportador'
      '  , t.nomeforn as transportador_nome'
      '  , t.cnpj     as transportador_cnpj'
      '  , r.nome_contato'
      '  , r.recebedor_nome'
      '  , r.recebedor_funcao'
      '  , r.recebedor_cpf'
      '  , r.movito'
      '  , r.cliente  as cliente_codigo'
      '  , ci.nome     as cliente_nome'
      '  , ci.cnpj     as cliente_cnpf'
      '  , r.observacao'
      '  , r.endereco_entrega'
      '  , r.forma_pagto'
      '  , f.descri as forma_pagto_desc'
      '  , r.condicao_pagto'
      '  , c.cond_descricao      as condicao_pagto_desc'
      '  , c.cond_descricao_full as condicao_pagto_desc2'
      '  , r.valor_bruto    as valor_total_bruto'
      '  , r.valor_total_frete'
      '  , r.valor_total_ipi'
      '  , r.valor_desconto as valor_total_desconto'
      '  , r.valor_total    as valor_total_liquido'
      '  , i.seq'
      '  , i.produto'
      '  , p.descri'
      '  , p.descri_apresentacao'
      '  , p.referencia'
      '  , i.quantidade'
      
        '  , coalesce(nullif(Trim(u.unp_sigla), '#39#39'), u.unp_descricao) as ' +
        'unidade'
      '  , i.valor_unitario'
      '  , i.ipi_percentual  as percentual_ipi'
      '  , i.ipi_valor_total as valor_ipi'
      '  , i.valor_total'
      'from TBREQUISITA_COMPRA r'
      
        '  inner join TBREQUISITA_COMPRAITEM i on (i.ano = r.ano and i.co' +
        'digo = r.codigo and i.empresa = r.empresa)'
      '  inner join TBPRODUTO p on (p.cod = i.produto)'
      '  left join TBFORNECEDOR t on (t.codforn = r.transportador)'
      '  left join TBUNIDADEPROD u on (u.unp_cod = i.unidade)'
      '  left join TBFORMPAGTO f on (f.cod = r.forma_pagto)'
      
        '  left join VW_CONDICAOPAGTO c on (c.cond_cod = r.condicao_pagto' +
        ')'
      '  left join TBCLIENTE ci on (ci.codigo = r.cliente)'
      ''
      'where r.ano    = :ano'
      '  and r.codigo = :cod'
      ''
      '')
    Left = 536
    Top = 368
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ano'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'cod'
        ParamType = ptInput
        Value = 0
      end>
  end
  object frdRequisicaoCompra: TfrxDBDataset
    UserName = 'frdRequisicaoCompra'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ANO=ANO'
      'CODIGO=CODIGO'
      'NUMERO=NUMERO'
      'TIPO=TIPO'
      'TIPO_DESC=TIPO_DESC'
      'STATUS=STATUS'
      'STATUS_DESC=STATUS_DESC'
      'EMPRESA=EMPRESA'
      'FORNECEDOR=FORNECEDOR'
      'EMISSAO_DATA=EMISSAO_DATA'
      'USUARIO_EMISSOR=USUARIO_EMISSOR'
      'REQUISITADO_DATA=REQUISITADO_DATA'
      'USUARIO_AUTORIZADOR=USUARIO_AUTORIZADOR'
      'TRANSPORTADOR=TRANSPORTADOR'
      'TRANSPORTADOR_NOME=TRANSPORTADOR_NOME'
      'TRANSPORTADOR_CNPJ=TRANSPORTADOR_CNPJ'
      'NOME_CONTATO=NOME_CONTATO'
      'RECEBEDOR_NOME=RECEBEDOR_NOME'
      'RECEBEDOR_FUNCAO=RECEBEDOR_FUNCAO'
      'RECEBEDOR_CPF=RECEBEDOR_CPF'
      'MOVITO=MOVITO'
      'CLIENTE_CODIGO=CLIENTE_CODIGO'
      'CLIENTE_NOME=CLIENTE_NOME'
      'CLIENTE_CNPF=CLIENTE_CNPF'
      'OBSERVACAO=OBSERVACAO'
      'ENDERECO_ENTREGA=ENDERECO_ENTREGA'
      'FORMA_PAGTO=FORMA_PAGTO'
      'FORMA_PAGTO_DESC=FORMA_PAGTO_DESC'
      'CONDICAO_PAGTO=CONDICAO_PAGTO'
      'CONDICAO_PAGTO_DESC=CONDICAO_PAGTO_DESC'
      'CONDICAO_PAGTO_DESC2=CONDICAO_PAGTO_DESC2'
      'VALOR_TOTAL_BRUTO=VALOR_TOTAL_BRUTO'
      'VALOR_TOTAL_FRETE=VALOR_TOTAL_FRETE'
      'VALOR_TOTAL_IPI=VALOR_TOTAL_IPI'
      'VALOR_TOTAL_DESCONTO=VALOR_TOTAL_DESCONTO'
      'VALOR_TOTAL_LIQUIDO=VALOR_TOTAL_LIQUIDO'
      'SEQ=SEQ'
      'PRODUTO=PRODUTO'
      'DESCRI=DESCRI'
      'DESCRI_APRESENTACAO=DESCRI_APRESENTACAO'
      'REFERENCIA=REFERENCIA'
      'QUANTIDADE=QUANTIDADE'
      'UNIDADE=UNIDADE'
      'VALOR_UNITARIO=VALOR_UNITARIO'
      'PERCENTUAL_IPI=PERCENTUAL_IPI'
      'VALOR_IPI=VALOR_IPI'
      'VALOR_TOTAL=VALOR_TOTAL')
    DataSet = qryRequisicaoCompra
    BCDToCurrency = False
    Left = 568
    Top = 368
  end
  object frrRequisicaoCompra: TfrxReport
    Version = '4.9.72'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40928.407150601900000000
    ReportOptions.LastChange = 41863.913688182870000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    OnGetValue = frrAutorizacaoCompraGetValue
    Left = 600
    Top = 368
    Datasets = <
      item
        DataSet = frdRequisicaoCompra
        DataSetName = 'frdRequisicaoCompra'
      end
      item
        DataSet = frdEmpresa
        DataSetName = 'frdEmpresa'
      end
      item
        DataSet = frdFornecedor
        DataSetName = 'frdFornecedor'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Lucida Console'
      Font.Style = []
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object bndReportTitle: TfrxReportTitle
        Height = 116.858380000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object frdVendaCODCONTROL: TfrxMemoView
          Left = 559.370440000000000000
          Top = 18.897650000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[frdRequisicaoCompra."NUMERO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 559.370440000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'N '#195#186' m e r o   C o n t r o l e :')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 559.370440000000000000
          Top = 37.795300000000000000
          Width = 158.740260000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[frdRequisicaoCompra."STATUS_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Picture1: TfrxPictureView
          Left = 3.779530000000000000
          Width = 139.842610000000000000
          Height = 79.370130000000000000
          ShowHint = False
          DataField = 'LOGO'
          DataSet = frdEmpresa
          DataSetName = 'frdEmpresa'
          Frame.Width = 0.100000000000000000
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object frdEmpresaRZSOC: TfrxMemoView
          Left = 143.622140000000000000
          Width = 411.968770000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            '[frdEmpresa."RZSOC"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frdEmpresaNMFANT: TfrxMemoView
          Left = 143.622140000000000000
          Top = 18.897650000000000000
          Width = 411.968770000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            
              'CNPJ.: [FormatMaskText('#39'##.###.###/####-##;0;'#39',<frdEmpresa."CNPJ' +
              '">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdFone: TfrxMemoView
          Left = 143.622140000000000000
          Top = 34.015770000000000000
          Width = 411.968770000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            'FONE: [FormatMaskText('#39'(##)####.####;0;'#39',<frdEmpresa."FONE">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 143.622140000000000000
          Top = 49.133890000000000000
          Width = 411.968770000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            
              '[frdEmpresa."TLG_SIGLA"] [frdEmpresa."LOG_NOME"], [frdEmpresa."N' +
              'UMERO_END"], [frdEmpresa."BAI_NOME"] - [frdEmpresa."CID_NOME"]/[' +
              'frdEmpresa."EST_SIGLA"] CEP.: [FormatMaskText('#39'##.###-###;0;'#39',<f' +
              'rdEmpresa."CEP">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Line1: TfrxLineView
          Top = 83.149660000000000000
          Width = 718.110700000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
        end
        object Memo44: TfrxMemoView
          Left = 143.622140000000000000
          Top = 64.252010000000000000
          Width = 574.488560000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            '[frdEmpresa."HOME_PAGE"] / [frdEmpresa."EMAIL"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo45: TfrxMemoView
          Top = 90.708720000000000000
          Width = 721.890230000000000000
          Height = 18.897650000000000000
          ShowHint = False
          CharSpacing = 4.000000000000000000
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            
              '[Trim('#39'REQUISI'#195#8225#195#402'O DE '#39' + Uppercase(<frdRequisicaoCompra."TIPO_' +
              'DESC">))]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndMasterData: TfrxMasterData
        Height = 18.897650000000000000
        Top = 332.598640000000000000
        Width = 718.110700000000000000
        DataSet = frdRequisicaoCompra
        DataSetName = 'frdRequisicaoCompra'
        RowCount = 0
        object frdItensCODPROD: TfrxMemoView
          Left = 22.677180000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' [frdRequisicaoCompra."PRODUTO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdItensSEQ: TfrxMemoView
          Width = 22.677180000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[Line]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdItensDESCRI: TfrxMemoView
          Left = 75.590600000000000000
          Width = 419.527659130000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' [frdRequisicaoCompra."DESCRI_APRESENTACAO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 495.118430000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.###'#39',<frdRequisicaoCompra."QUANTIDADE">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 642.520100000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<frdRequisicaoCompra."VALOR_TOTAL">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 540.472790000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' [frdRequisicaoCompra."UNIDADE"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 578.268090000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<frdRequisicaoCompra."VALOR_UNITARIO">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndPageFooter: TfrxPageFooter
        Height = 30.236240000000000000
        Top = 805.039890000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 589.606680000000000000
          Width = 128.504020000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'P'#195#161'gina :  [Page#]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Width = 589.606680000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' [Sistema]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo19: TfrxMemoView
          Top = 15.118120000000000000
          Width = 589.606680000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' Impresso em [Date] '#195#160's [Time] por [Usuario]')
          ParentFont = False
          WordWrap = False
        end
      end
      object bndHeader: TfrxHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Lucida Console'
        Font.Style = []
        Height = 113.385900000000000000
        ParentFont = False
        Top = 196.535560000000000000
        Width = 718.110700000000000000
        object frdVendaNOME: TfrxMemoView
          Top = 41.574830000000000000
          Width = 415.748300000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' [frdFornecedor."NOME"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Top = 30.236240000000000000
          Width = 415.748300000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' Fornecedor:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 415.748300000000000000
          Top = 30.236240000000000000
          Width = 207.874150000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' CPF/CNPJ.:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 415.748300000000000000
          Top = 41.574830000000000000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            
              ' [IIF(<frdFornecedor."PESSOA_FISICA">=1,FormatMaskText('#39'###.###.' +
              '###-##;0;'#39',<frdFornecedor."CNPJ">),FormatMaskText('#39'##.###.###/##' +
              '##-##;0;'#39',<frdFornecedor."CNPJ">))]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 623.622450000000000000
          Top = 30.236240000000000000
          Width = 94.488250000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'Data: ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 623.622450000000000000
          Top = 41.574830000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              ' [FormatDateTime('#39'dd/mm/yyyy'#39',<frdRequisicaoCompra."EMISSAO_DATA' +
              '">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Line2: TfrxLineView
          Top = 109.606370000000000000
          Width = 718.110700000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
        end
        object Memo23: TfrxMemoView
          Top = 94.488250000000000000
          Width = 22.677180000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '#')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 22.677180000000000000
          Top = 94.488250000000000000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' C'#195#179'digo')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 75.590600000000000000
          Top = 94.488250000000000000
          Width = 419.527659130000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' Descri'#195#167#195#163'o')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Top = 71.811070000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            
              ' [Trim(<frdFornecedor."TLG_SIGLA"> + '#39' '#39' + <frdFornecedor."LOG_N' +
              'OME"> + '#39', '#39' + <frdFornecedor."NUMERO_END"> + '#39', '#39' + <frdFornece' +
              'dor."BAI_NOME"> + '#39' - '#39' + <frdFornecedor."CID_NOME"> + '#39'/'#39' + <fr' +
              'dFornecedor."EST_SIGLA">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Top = 60.472480000000000000
          Width = 718.110700000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' Endere'#195#167'o:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 540.472790000000000000
          Top = 94.488250000000000000
          Width = 37.795300000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' Und.')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 578.268090000000000000
          Top = 94.488250000000000000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'V. Un. ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo48: TfrxMemoView
          Top = 11.338590000000000000
          Width = 415.748300000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' [frdRequisicaoCompra."NOME_CONTATO"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo49: TfrxMemoView
          Width = 415.748300000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' Att.:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 642.520100000000000000
          Top = 94.488250000000000000
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'T O T A L ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 495.118430000000000000
          Top = 94.488250000000000000
          Width = 45.354323390000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'Qtde.')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndReportSummary: TfrxReportSummary
        Height = 370.393940000000000000
        Top = 411.968770000000000000
        Width = 718.110700000000000000
        Stretched = True
        object SysMemo1: TfrxSysMemoView
          Left = 623.622450000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',SUM(<frdRequisicaoCompra."VALOR_TOTAL">,bnd' +
              'MasterData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo14: TfrxMemoView
          Left = 480.000310000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'T O T A L    G E R A L :')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Left = 234.330860000000000000
          Top = 249.448980000000000000
          Width = 249.448980000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[frdEmpresa."RZSOC"]'
            '[FormatMaskText('#39'##.###.###/####-##;0;'#39',<frdEmpresa."CNPJ">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Top = 68.031540000000000000
          Width = 302.362400000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' [frdRequisicaoCompra."USUARIO_AUTORIZADOR"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Top = 56.692950000000000000
          Width = 302.362400000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' Autorizador:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line3: TfrxLineView
          Top = 22.677180000000000000
          Width = 718.110700000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
        end
        object Memo30: TfrxMemoView
          Top = 37.795300000000000000
          Width = 302.362400000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' [frdRequisicaoCompra."FORMA_PAGTO_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Top = 26.456710000000000000
          Width = 302.362400000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' Forma de Pagamento:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 302.362400000000000000
          Top = 37.795300000000000000
          Width = 415.748300000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' [frdRequisicaoCompra."CONDICAO_PAGTO_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 302.362400000000000000
          Top = 26.456710000000000000
          Width = 415.748300000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' Condi'#195#167#195#163'o de Pagamento:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 302.362400000000000000
          Top = 68.031540000000000000
          Width = 102.047248980000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',<frdRequisicaoCompra."VALOR_TOTAL_BRUTO">)]' +
              ' ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 302.362400000000000000
          Top = 56.692950000000000000
          Width = 102.047248980000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            ' Total Bruto: ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Left = 502.677490000000000000
          Top = 68.031540000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',<frdRequisicaoCompra."VALOR_TOTAL_DESCONTO"' +
              '>)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Left = 502.677490000000000000
          Top = 56.692950000000000000
          Width = 98.267780000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            ' Desconto: ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Left = 600.945270000000000000
          Top = 68.031540000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',<frdRequisicaoCompra."VALOR_TOTAL_LIQUIDO">' +
              ')] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          Left = 600.945270000000000000
          Top = 56.692950000000000000
          Width = 117.165430000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Color = 13421772
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            ' Total L'#195#173'quido: ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Top = 105.826840000000000000
          Width = 718.110700000000000000
          Height = 45.354360000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[frdRequisicaoCompra."ENDERECO_ENTREGA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          Top = 90.708720000000000000
          Width = 718.110700000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' Local de Entrega/Realiza'#195#167#195#163'o:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          Left = 37.795300000000000000
          Top = 162.519790000000000000
          Width = 623.622450000000000000
          Height = 64.252010000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          HAlign = haBlock
          Memo.UTF8 = (
            
              '                 Autorizamos a [frdFornecedor."NOME"] executar a' +
              ' presente Requisi'#195#167#195#163'o de [Trim(<frdRequisicaoCompra."TIPO_DESC"' +
              '>)], na sua totalidade, e na forma/condi'#195#167#195#163'o de pagamentos esta' +
              'belecida.')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Top = 317.480520000000000000
          Width = 718.110700000000000000
          Height = 52.913420000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            
              'Material a ser retirado por: [frdRequisicaoCompra."RECEBEDOR_NOM' +
              'E"] [IIF(Trim(<frdRequisicaoCompra."RECEBEDOR_FUNCAO">)='#39#39','#39#39','#39'(' +
              #39'+<frdRequisicaoCompra."RECEBEDOR_FUNCAO">+'#39')'#39')]'
            '[frdRequisicaoCompra."OBSERVACAO"]'
            
              '[IIF(<frdRequisicaoCompra."CLIENTE_CODIGO">=0,'#39#39','#39'* * * Cliente ' +
              ': '#39' + FormatFloat('#39'00000'#39', <frdRequisicaoCompra."CLIENTE_CODIGO"' +
              '>)) ]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Top = 302.362400000000000000
          Width = 718.110700000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' Observa'#195#167#195#181'es Gerais:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo46: TfrxMemoView
          Left = 404.409710000000000000
          Top = 68.031540000000000000
          Width = 98.267718980000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<frdRequisicaoCompra."VALOR_TOTAL_IPI">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo47: TfrxMemoView
          Left = 404.409710000000000000
          Top = 56.692950000000000000
          Width = 98.267718980000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            ' Total IPI: ')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object frDANFE: TACBrNFeDANFEFR
    Sistema = 'Masterdados - Contatos: (91) 8717-1057/8129-1567'
    PathPDF = '..\Bin\'
    MostrarPreview = True
    MostrarStatus = True
    TipoDANFE = tiRetrato
    NumCopias = 1
    ImprimirDescPorc = False
    ImprimirTotalLiquido = False
    MargemInferior = 0.800000000000000000
    MargemSuperior = 0.800000000000000000
    MargemEsquerda = 0.600000000000000000
    MargemDireita = 0.510000000000000000
    CasasDecimais._qCom = 2
    CasasDecimais._vUnCom = 2
    ExibirResumoCanhoto = False
    FormularioContinuo = False
    TamanhoFonte_DemaisCampos = 10
    ProdutosPorPagina = 0
    ImprimirDetalhamentoEspecifico = True
    NFeCancelada = False
    LocalImpCanhoto = 0
    ImprimeItens = True
    EspessuraBorda = 1
    ExibirTotalTributosItem = False
    ExibeCampoFatura = True
    TributosPercentual = ptValorProdutos
    ImprimirUnQtVlComercial = False
    Detalhado = False
    DescricaoViaEstabelec = 'Via do Consumidor'
    Left = 56
    Top = 72
  end
  object frrCartaCorrecaoE: TfrxReport
    Version = '4.9.72'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41247.809339340300000000
    ReportOptions.LastChange = 41249.650792696800000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'VAR'
      '  TITULO_CONTEXTO: String;'
      
        '  TEXTO_EVENTO: String;                                         ' +
        '      '
      ''
      
        'procedure memJustificativaCorrecaoOnBeforePrint(Sender: TfrxComp' +
        'onent);'
      'begin'
      '  '
      '  if <Eventos."xJust"> <> '#39#39' then'
      '  begin              '
      '    TITULO_CONTEXTO := '#39'JUSTIFICATIVA'#39';  '
      '    TEXTO_EVENTO := <Eventos."xJust">;  '
      '  end            '
      '  else'
      '  begin              '
      '    TITULO_CONTEXTO := '#39'CORRE'#199#195'O'#39';'
      '    TEXTO_EVENTO := <Eventos."xCorrecao">;    '
      '  end;'
      ''
      'end;'
      ''
      'procedure BandCondicoesUsoOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '                       '
      'end;'
      ''
      'procedure Page1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  BandEmitenteDestinatario.Visible := <PossuiNFe> = '#39'S'#39';'
      
        '  BandCondicoesUso.Visible         := <Eventos."xCondUso"> <> '#39#39 +
        ';      '
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 24
    Top = 216
    Datasets = <
      item
        DataSet = dmACBrNFeFR.frxDestinatario
        DataSetName = 'Destinatario'
      end
      item
        DataSet = dmACBrNFeFR.frxEmitente
        DataSetName = 'Emitente'
      end
      item
        DataSet = dmACBrNFeFR.frxEventos
        DataSetName = 'Eventos'
      end>
    Variables = <
      item
        Name = ' Variaveis'
        Value = Null
      end
      item
        Name = 'PossuiNFe'
        Value = Null
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      EndlessHeight = True
      OnBeforePrint = 'Page1OnBeforePrint'
      object PageHeader1: TfrxPageHeader
        Height = 234.330860000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        Child = frrCartaCorrecaoE.BandEmitenteDestinatario
        object Memo1: TfrxMemoView
          Align = baWidth
          Width = 718.110700000000000000
          Height = 30.236220470000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 0.500000000000000000
          GapY = 5.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[Eventos."DescricaoTipoEvento"]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Align = baWidth
          Top = 30.236240000000000000
          Width = 718.110700000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            
              'N'#195#163'o possui valor fiscal. Simples representa'#195#167#195#163'o do evento indi' +
              'cado abaixo.'
            'CONSULTE A AUTENTICIDADE NO SITE DA SEFAZ AUTORIZADORA')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Top = 94.488250000000000000
          Width = 56.692950000000000000
          Height = 22.677165350000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            'MODELO')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Top = 117.165430000000000000
          Width = 340.157700000000000000
          Height = 22.677165350000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            'CHAVE DE ACESSO')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 56.692950000000000000
          Top = 94.488250000000000000
          Width = 56.692950000000000000
          Height = 22.677165350000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            'S'#195#8240'RIE')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 113.385900000000000000
          Top = 94.488250000000000000
          Width = 113.385900000000000000
          Height = 22.677165350000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            'N'#195#353'MERO')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 226.771800000000000000
          Top = 94.488250000000000000
          Width = 113.385900000000000000
          Height = 22.677165350000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            'M'#195#352'S/ANO DA EMISS'#195#402'O')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 340.157700000000000000
          Top = 94.488250000000000000
          Width = 377.953000000000000000
          Height = 45.354345350000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Top = 166.299320000000000000
          Width = 60.472480000000000000
          Height = 22.677165350000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            #195#8220'RG'#195#402'O')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 60.472480000000000000
          Top = 166.299320000000000000
          Width = 483.779840000000000000
          Height = 22.677165350000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            'AMBIENTE')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 544.252320000000000000
          Top = 166.299320000000000000
          Width = 173.858380000000000000
          Height = 22.677165350000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            'DATA E HOR'#195#129'RIO DO EVENTO')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Top = 188.976500000000000000
          Width = 109.606370000000000000
          Height = 22.677165350000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            'EVENTO')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 109.606125910000000000
          Top = 188.976402360000000000
          Width = 381.732530000000000000
          Height = 22.677165350000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            'DESCRI'#195#8225#195#402'O DO EVENTO')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 491.338900000000000000
          Top = 188.976500000000000000
          Width = 113.385900000000000000
          Height = 22.677165350000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            'SEQU'#195#352'NCIA DO EVENTO')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 604.724800000000000000
          Top = 188.976500000000000000
          Width = 113.385900000000000000
          Height = 22.677165350000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            'VERS'#195#402'O DO EVENTO')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 544.252320000000000000
          Top = 211.653680000000000000
          Width = 173.858380000000000000
          Height = 22.677165350000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            'DATA E HOR'#195#129'RIO DO REGISTRO')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 415.748300000000000000
          Top = 211.653680000000000000
          Width = 128.504020000000000000
          Height = 22.677165350000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            'PROTOCOLO')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Top = 211.653680000000000000
          Width = 415.748300000000000000
          Height = 22.677165350000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            'STATUS')
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          Align = baWidth
          Top = 75.590600000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            'NOTA FISCAL ELETR'#195#8221'NICA - NF-e')
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          Align = baWidth
          Top = 147.401670000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            'CARTA DE CORRE'#195#8225#195#402'O ELETR'#195#8221'NICA')
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          Top = 102.047310000000000000
          Width = 56.692950000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[Eventos."Modelo"]')
          ParentFont = False
        end
        object Memo47: TfrxMemoView
          Left = 56.692950000000000000
          Top = 102.047310000000000000
          Width = 56.692950000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[Eventos."Serie"]')
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          Left = 113.385900000000000000
          Top = 102.047310000000000000
          Width = 113.385900000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[Eventos."Numero"]')
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          Left = 226.771800000000000000
          Top = 102.047310000000000000
          Width = 113.385900000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[Eventos."MesAno"]')
          ParentFont = False
        end
        object Memo50: TfrxMemoView
          Top = 124.724490000000000000
          Width = 340.157700000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[Eventos."ChaveAcesso"]')
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          Top = 173.858380000000000000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[Eventos."cOrgao"]')
          ParentFont = False
        end
        object Memo52: TfrxMemoView
          Left = 60.472480000000000000
          Top = 173.858380000000000000
          Width = 483.779840000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            '[Eventos."tpAmb"]')
          ParentFont = False
        end
        object Memo53: TfrxMemoView
          Left = 544.252320000000000000
          Top = 173.858380000000000000
          Width = 173.858380000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = 'dd/mm/yyyy hh:mm:ss'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[Eventos."dhEvento"]')
          ParentFont = False
        end
        object Memo54: TfrxMemoView
          Top = 196.535560000000000000
          Width = 109.606370000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[Eventos."TipoEvento"]')
          ParentFont = False
        end
        object Memo55: TfrxMemoView
          Left = 109.606370000000000000
          Top = 196.535560000000000000
          Width = 381.732530000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            '[Eventos."DescEvento"]')
          ParentFont = False
        end
        object Memo56: TfrxMemoView
          Left = 491.338900000000000000
          Top = 196.535560000000000000
          Width = 113.385900000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[Eventos."nSeqEvento"]')
          ParentFont = False
        end
        object Memo57: TfrxMemoView
          Left = 604.724800000000000000
          Top = 196.535560000000000000
          Width = 113.385900000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[Eventos."versaoEvento"]')
          ParentFont = False
        end
        object Memo58: TfrxMemoView
          Top = 219.212740000000000000
          Width = 415.748300000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            '[Eventos."cStat"] - [Eventos."xMotivo"]')
          ParentFont = False
        end
        object Memo59: TfrxMemoView
          Left = 415.748300000000000000
          Top = 219.212740000000000000
          Width = 128.504020000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[Eventos."nProt"]')
          ParentFont = False
        end
        object Memo60: TfrxMemoView
          Left = 544.252320000000000000
          Top = 219.212740000000000000
          Width = 173.858380000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = 'dd/mm/yyyy hh:mm:ss'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[Eventos."dhRegEvento"]')
          ParentFont = False
        end
        object BarCode2: TfrxBarCodeView
          Left = 377.953000000000000000
          Top = 99.267780000000000000
          Width = 79.000000000000000000
          Height = 37.795270710000000000
          ShowHint = False
          BarType = bcCode128C
          Expression = '<Eventos."Barras">'
          Rotation = 0
          ShowText = False
          Text = '12345678'
          WideBarRatio = 2.000000000000000000
          Zoom = 1.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
        end
      end
      object MasterData1: TfrxMasterData
        Height = 222.992270000000000000
        Top = 684.094930000000000000
        Width = 718.110700000000000000
        DataSet = dmACBrNFeFR.frxEventos
        DataSetName = 'Eventos'
        RowCount = 0
        Stretched = True
        object memJustificativaCorrecao: TfrxMemoView
          Align = baWidth
          Top = 7.559060000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'memJustificativaCorrecaoOnBeforePrint'
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            '[TITULO_CONTEXTO]')
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          Align = baWidth
          Top = 26.456710000000000000
          Width = 718.110700000000000000
          Height = 196.535545350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            '[TEXTO_EVENTO]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 18.897650000000000000
        Top = 967.559680000000000000
        Width = 718.110700000000000000
        object Memo3: TfrxMemoView
          Align = baWidth
          Top = 3.779530000000000000
          Width = 718.110700000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            
              'DATA E HORA DA IMPRESS'#195#402'O: [Date #ddd/mm/yyyy]  [Time #dhh:mm:ss' +
              ']')
          ParentFont = False
        end
      end
      object BandCondicoesUso: TfrxChild
        Height = 136.063080000000000000
        Top = 487.559370000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'BandCondicoesUsoOnBeforePrint'
        object Memo43: TfrxMemoView
          Align = baWidth
          Top = 7.559060000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            'CONDI'#195#8225#195#8226'ES DE USO')
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          Align = baWidth
          Top = 26.456710000000000000
          Width = 718.110700000000000000
          Height = 109.606355350000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            '[Eventos."xCondUso"]')
          ParentFont = False
        end
      end
      object BandEmitenteDestinatario: TfrxChild
        Height = 188.976500000000000000
        Top = 275.905690000000000000
        Width = 718.110700000000000000
        Child = frrCartaCorrecaoE.BandCondicoesUso
        object Memo21: TfrxMemoView
          Top = 26.456710000000000000
          Width = 544.252320000000000000
          Height = 22.677165350000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            'NOME / RAZ'#195#402'O SOCIAL')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 544.252320000000000000
          Top = 26.456710000000000000
          Width = 173.858380000000000000
          Height = 22.677165350000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            'CNPJ / CPF')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Top = 49.133890000000000000
          Width = 415.748300000000000000
          Height = 22.677165350000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            'ENDERE'#195#8225'O')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 415.748300000000000000
          Top = 49.133890000000000000
          Width = 215.433210000000000000
          Height = 22.677165350000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            'BAIRRO')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 631.181510000000000000
          Top = 49.133890000000000000
          Width = 86.929190000000000000
          Height = 22.677165350000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            'CEP')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Top = 71.811070000000000000
          Width = 294.803340000000000000
          Height = 22.677165350000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            'MUNIC'#195#141'PIO')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Left = 347.716760000000000000
          Top = 71.811070000000000000
          Width = 196.535560000000000000
          Height = 22.677165350000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            'FONE / FAX')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 294.803340000000000000
          Top = 71.811070000000000000
          Width = 52.913420000000000000
          Height = 22.677165350000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            'ESTADO')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Left = 544.252320000000000000
          Top = 71.811070000000000000
          Width = 173.858380000000000000
          Height = 22.677165350000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            'INSCRI'#195#8225#195#402'O ESTADUAL')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Top = 120.944960000000000000
          Width = 544.252320000000000000
          Height = 22.677165350000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            'NOME / RAZ'#195#402'O SOCIAL')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Left = 544.252320000000000000
          Top = 120.944960000000000000
          Width = 173.858380000000000000
          Height = 22.677165350000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            'CNPJ / CPF')
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          Top = 143.622140000000000000
          Width = 415.748300000000000000
          Height = 22.677165350000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            'ENDERE'#195#8225'O')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Left = 415.748300000000000000
          Top = 143.622140000000000000
          Width = 215.433210000000000000
          Height = 22.677165350000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            'BAIRRO')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          Left = 631.181510000000000000
          Top = 143.622140000000000000
          Width = 86.929190000000000000
          Height = 22.677165350000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            'CEP')
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          Top = 166.299320000000000000
          Width = 294.803340000000000000
          Height = 22.677165350000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            'MUNIC'#195#141'PIO')
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          Left = 347.716760000000000000
          Top = 166.299320000000000000
          Width = 196.535560000000000000
          Height = 22.677165350000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            'FONE / FAX')
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          Left = 294.803340000000000000
          Top = 166.299320000000000000
          Width = 52.913420000000000000
          Height = 22.677165350000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            'ESTADO')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          Left = 544.252320000000000000
          Top = 166.299320000000000000
          Width = 173.858380000000000000
          Height = 22.677165350000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            'INSCRI'#195#8225#195#402'O ESTADUAL')
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          Align = baWidth
          Top = 7.559060000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            'EMITENTE')
          ParentFont = False
        end
        object Memo42: TfrxMemoView
          Align = baWidth
          Top = 102.047310000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            'DESTINAT'#195#129'RIO / REMETENTE')
          ParentFont = False
        end
        object Memo61: TfrxMemoView
          Top = 34.015770000000000000
          Width = 544.252320000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            '[Emitente."XNome"]')
          ParentFont = False
        end
        object Memo62: TfrxMemoView
          Left = 544.252320000000000000
          Top = 34.015770000000000000
          Width = 173.858380000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            '[Emitente."CNPJ"]')
          ParentFont = False
        end
        object Memo63: TfrxMemoView
          Top = 56.692950000000000000
          Width = 415.748300000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            '[Emitente."XLgr"] [Emitente."Nro"] [Emitente."XCpl"]')
          ParentFont = False
        end
        object Memo64: TfrxMemoView
          Left = 415.748300000000000000
          Top = 56.692950000000000000
          Width = 215.433210000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            '[Emitente."XBairro"]')
          ParentFont = False
        end
        object Memo65: TfrxMemoView
          Left = 631.181510000000000000
          Top = 56.692950000000000000
          Width = 86.929190000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            '[Emitente."CEP"]')
          ParentFont = False
        end
        object Memo66: TfrxMemoView
          Top = 79.370130000000000000
          Width = 294.803340000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            '[Emitente."XMun"]')
          ParentFont = False
        end
        object Memo67: TfrxMemoView
          Left = 294.803340000000000000
          Top = 79.370130000000000000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[Emitente."UF"]')
          ParentFont = False
        end
        object Memo68: TfrxMemoView
          Left = 347.716760000000000000
          Top = 79.370130000000000000
          Width = 196.535560000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            '[Emitente."Fone"]')
          ParentFont = False
        end
        object Memo69: TfrxMemoView
          Left = 544.252320000000000000
          Top = 79.370130000000000000
          Width = 173.858380000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            '[Emitente."IE"]')
          ParentFont = False
        end
        object Memo70: TfrxMemoView
          Top = 128.504020000000000000
          Width = 544.252320000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            '[Destinatario."XNome"]')
          ParentFont = False
        end
        object Memo71: TfrxMemoView
          Left = 544.252320000000000000
          Top = 128.504020000000000000
          Width = 173.858380000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            '[Destinatario."CNPJCPF"]')
          ParentFont = False
        end
        object Memo72: TfrxMemoView
          Top = 151.181200000000000000
          Width = 415.748300000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            
              '[Destinatario."XLgr"] [Destinatario."Nro"] [Destinatario."XCpl"]' +
              ' ')
          ParentFont = False
        end
        object Memo73: TfrxMemoView
          Left = 415.748300000000000000
          Top = 151.181200000000000000
          Width = 215.433210000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            '[Destinatario."XBairro"]')
          ParentFont = False
        end
        object Memo74: TfrxMemoView
          Left = 631.181510000000000000
          Top = 151.181200000000000000
          Width = 86.929190000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            '[Destinatario."CEP"]')
          ParentFont = False
        end
        object Memo75: TfrxMemoView
          Top = 173.858380000000000000
          Width = 294.803340000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            '[Destinatario."XMun"]')
          ParentFont = False
        end
        object Memo76: TfrxMemoView
          Left = 294.803340000000000000
          Top = 173.858380000000000000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[Destinatario."UF"]')
          ParentFont = False
        end
        object Memo77: TfrxMemoView
          Left = 347.716760000000000000
          Top = 173.858380000000000000
          Width = 196.535560000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            '[Destinatario."Fone"]')
          ParentFont = False
        end
        object Memo78: TfrxMemoView
          Left = 544.252320000000000000
          Top = 173.858380000000000000
          Width = 173.858380000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            '[Destinatario."IE"]')
          ParentFont = False
        end
      end
    end
  end
  object qryNFe: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    SQL.Strings = (
      'Select'
      '    n.ANOVENDA'
      '  , n.NUMVENDA'
      '  , n.EMPRESA'
      '  , n.DATAEMISSAO'
      '  , n.HORAEMISSAO'
      '  , n.SERIE'
      '  , n.NUMERO'
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
      'where n.empresa = :empresa'
      '  and n.modelo  = :modelo'
      '  and n.serie   = :serie'
      '  and n.numero  = :numero'
      '')
    Left = 144
    Top = 504
    ParamData = <
      item
        DataType = ftString
        Name = 'empresa'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftInteger
        Name = 'modelo'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftString
        Name = 'serie'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftInteger
        Name = 'numero'
        ParamType = ptInput
        Value = 0
      end>
    object qryNFeANOVENDA: TSmallintField
      FieldName = 'ANOVENDA'
      Origin = '"TBNFE_ENVIADA"."ANOVENDA"'
    end
    object qryNFeNUMVENDA: TIntegerField
      FieldName = 'NUMVENDA'
      Origin = '"TBNFE_ENVIADA"."NUMVENDA"'
    end
    object qryNFeEMPRESA: TIBStringField
      FieldName = 'EMPRESA'
      Origin = '"TBNFE_ENVIADA"."EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 18
    end
    object qryNFeDATAEMISSAO: TDateField
      FieldName = 'DATAEMISSAO'
      Origin = '"TBNFE_ENVIADA"."DATAEMISSAO"'
    end
    object qryNFeHORAEMISSAO: TTimeField
      FieldName = 'HORAEMISSAO'
      Origin = '"TBNFE_ENVIADA"."HORAEMISSAO"'
    end
    object qryNFeSERIE: TIBStringField
      FieldName = 'SERIE'
      Origin = '"TBNFE_ENVIADA"."SERIE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object qryNFeNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = '"TBNFE_ENVIADA"."NUMERO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryNFeMODELO: TSmallintField
      FieldName = 'MODELO'
      Origin = '"TBNFE_ENVIADA"."MODELO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryNFeVERSAO: TSmallintField
      FieldName = 'VERSAO'
      Origin = '"TBNFE_ENVIADA"."VERSAO"'
    end
    object qryNFeCHAVE: TIBStringField
      FieldName = 'CHAVE'
      Origin = '"TBNFE_ENVIADA"."CHAVE"'
      Size = 250
    end
    object qryNFePROTOCOLO: TIBStringField
      FieldName = 'PROTOCOLO'
      Origin = '"TBNFE_ENVIADA"."PROTOCOLO"'
      Size = 250
    end
    object qryNFeRECIBO: TIBStringField
      FieldName = 'RECIBO'
      Origin = '"TBNFE_ENVIADA"."RECIBO"'
      Size = 250
    end
    object qryNFeXML_FILENAME: TIBStringField
      FieldName = 'XML_FILENAME'
      Origin = '"TBNFE_ENVIADA"."XML_FILENAME"'
      Size = 250
    end
    object qryNFeXML_FILE: TMemoField
      FieldName = 'XML_FILE'
      Origin = '"TBNFE_ENVIADA"."XML_FILE"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object qryNFeLOTE_ANO: TSmallintField
      FieldName = 'LOTE_ANO'
      Origin = '"TBNFE_ENVIADA"."LOTE_ANO"'
    end
    object qryNFeLOTE_NUM: TIntegerField
      FieldName = 'LOTE_NUM'
      Origin = '"TBNFE_ENVIADA"."LOTE_NUM"'
      Required = True
    end
  end
  object qryCartaCorrecaoNFe: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    ForcedRefresh = True
    CachedUpdates = True
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'Select'
      '    cce.CCE_NUMERO'
      '  , cce.CCE_EMPRESA'
      '  , cce.CCE_DATA'
      '  , cce.CCE_HORA'
      '  , cce.CCE_ENVIADA'
      '  , cce.CCE_TEXTO'
      '  , cce.NFE_SERIE'
      '  , cce.NFE_NUMERO'
      '  , cce.NFE_MODELO'
      '  , cce.NUMERO'
      '  , cce.PROTOCOLO'
      '  , cce.XML'
      'from TBNFE_CARTA_CORRECAO cce'
      'where cce.cce_empresa = :empresa'
      '  and cce.cce_numero  = :codigo')
    ModifySQL.Strings = (
      '')
    GeneratorField.Field = 'CODCONTROL'
    UpdateObject = updCartaCorrecaoNFe
    Left = 144
    Top = 552
    object qryCartaCorrecaoNFeCCE_NUMERO: TIntegerField
      FieldName = 'CCE_NUMERO'
      Origin = '"TBNFE_CARTA_CORRECAO"."CCE_NUMERO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCartaCorrecaoNFeCCE_EMPRESA: TIBStringField
      FieldName = 'CCE_EMPRESA'
      Origin = '"TBNFE_CARTA_CORRECAO"."CCE_EMPRESA"'
      Required = True
      Size = 18
    end
    object qryCartaCorrecaoNFeCCE_DATA: TDateField
      FieldName = 'CCE_DATA'
      Origin = '"TBNFE_CARTA_CORRECAO"."CCE_DATA"'
    end
    object qryCartaCorrecaoNFeCCE_HORA: TTimeField
      FieldName = 'CCE_HORA'
      Origin = '"TBNFE_CARTA_CORRECAO"."CCE_HORA"'
    end
    object qryCartaCorrecaoNFeCCE_ENVIADA: TSmallintField
      FieldName = 'CCE_ENVIADA'
      Origin = '"TBNFE_CARTA_CORRECAO"."CCE_ENVIADA"'
    end
    object qryCartaCorrecaoNFeCCE_TEXTO: TMemoField
      FieldName = 'CCE_TEXTO'
      Origin = '"TBNFE_CARTA_CORRECAO"."CCE_TEXTO"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object qryCartaCorrecaoNFeNFE_SERIE: TIBStringField
      FieldName = 'NFE_SERIE'
      Origin = '"TBNFE_CARTA_CORRECAO"."NFE_SERIE"'
      Required = True
      Size = 3
    end
    object qryCartaCorrecaoNFeNFE_NUMERO: TIntegerField
      FieldName = 'NFE_NUMERO'
      Origin = '"TBNFE_CARTA_CORRECAO"."NFE_NUMERO"'
      Required = True
    end
    object qryCartaCorrecaoNFeNFE_MODELO: TSmallintField
      FieldName = 'NFE_MODELO'
      Origin = '"TBNFE_CARTA_CORRECAO"."NFE_MODELO"'
    end
    object qryCartaCorrecaoNFeNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = '"TBNFE_CARTA_CORRECAO"."NUMERO"'
    end
    object qryCartaCorrecaoNFePROTOCOLO: TIBStringField
      FieldName = 'PROTOCOLO'
      Origin = '"TBNFE_CARTA_CORRECAO"."PROTOCOLO"'
      Size = 250
    end
    object qryCartaCorrecaoNFeXML: TMemoField
      FieldName = 'XML'
      Origin = '"TBNFE_CARTA_CORRECAO"."XML"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
  end
  object updCartaCorrecaoNFe: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  CCE_NUMERO,'
      '  CCE_EMPRESA,'
      '  CCE_DATA,'
      '  CCE_HORA,'
      '  CCE_ENVIADA,'
      '  CCE_TEXTO,'
      '  NFE_SERIE,'
      '  NFE_NUMERO,'
      '  NFE_MODELO,'
      '  NUMERO,'
      '  PROTOCOLO,'
      '  XML'
      'from TBNFE_CARTA_CORRECAO '
      'where'
      '  CCE_NUMERO = :CCE_NUMERO')
    ModifySQL.Strings = (
      'update TBNFE_CARTA_CORRECAO'
      'set'
      '  CCE_DATA = :CCE_DATA,'
      '  CCE_EMPRESA = :CCE_EMPRESA,'
      '  CCE_ENVIADA = :CCE_ENVIADA,'
      '  CCE_HORA = :CCE_HORA,'
      '  CCE_NUMERO = :CCE_NUMERO,'
      '  CCE_TEXTO = :CCE_TEXTO,'
      '  NFE_MODELO = :NFE_MODELO,'
      '  NFE_NUMERO = :NFE_NUMERO,'
      '  NFE_SERIE = :NFE_SERIE,'
      '  NUMERO = :NUMERO,'
      '  PROTOCOLO = :PROTOCOLO,'
      '  XML = :XML'
      'where'
      '  CCE_NUMERO = :OLD_CCE_NUMERO')
    Left = 176
    Top = 552
  end
end
