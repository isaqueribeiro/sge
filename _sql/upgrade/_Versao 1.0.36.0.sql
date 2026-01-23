

ALTER TABLE TBPRODUTO
    ADD ZONA_FRANCA_MANAUS DMN_LOGICO_NULL;

COMMENT ON COLUMN TBPRODUTO.ZONA_FRANCA_MANAUS IS
'Produto da Zona Franca de Manaus:
0, NULL - Nao
1 - Sim';

alter table TBPRODUTO
alter CODIGO position 1;

alter table TBPRODUTO
alter COD position 2;

alter table TBPRODUTO
alter DESCRI position 3;

alter table TBPRODUTO
alter APRESENTACAO position 4;

alter table TBPRODUTO
alter DESCRI_APRESENTACAO position 5;

alter table TBPRODUTO
alter METAFONEMA position 6;

alter table TBPRODUTO
alter MODELO position 7;

alter table TBPRODUTO
alter ANVISA position 8;

alter table TBPRODUTO
alter REFERENCIA position 9;

alter table TBPRODUTO
alter NOME_AMIGO position 10;

alter table TBPRODUTO
alter ESPECIFICACAO position 11;

alter table TBPRODUTO
alter SECAO position 12;

alter table TBPRODUTO
alter QTDE position 13;

alter table TBPRODUTO
alter FRACIONADOR position 14;

alter table TBPRODUTO
alter PESO_BRUTO position 15;

alter table TBPRODUTO
alter PESO_LIQUIDO position 16;

alter table TBPRODUTO
alter LARGURA position 17;

alter table TBPRODUTO
alter ALTURA position 18;

alter table TBPRODUTO
alter ESPESSURA position 19;

alter table TBPRODUTO
alter CUBAGEM position 20;

alter table TBPRODUTO
alter VENDA_FRACIONADA position 21;

alter table TBPRODUTO
alter UNIDADE position 22;

alter table TBPRODUTO
alter ESTOQMIN position 23;

alter table TBPRODUTO
alter CODTIPO position 24;

alter table TBPRODUTO
alter CODGRUPO position 25;

alter table TBPRODUTO
alter CODFABRICANTE position 26;

alter table TBPRODUTO
alter PERCENTUAL_MARCKUP position 27;

alter table TBPRODUTO
alter PERCENTUAL_MARGEM position 28;

alter table TBPRODUTO
alter PRECO_SUGERIDO position 29;

alter table TBPRODUTO
alter CODEMP position 30;

alter table TBPRODUTO
alter CODSECAO position 31;

alter table TBPRODUTO
alter CODORIGEM position 32;

alter table TBPRODUTO
alter CODTRIBUTACAO position 33;

alter table TBPRODUTO
alter CST position 34;

alter table TBPRODUTO
alter CSOSN position 35;

alter table TBPRODUTO
alter CST_PIS position 36;

alter table TBPRODUTO
alter CST_COFINS position 37;

alter table TBPRODUTO
alter TABELA_IBPT position 38;

alter table TBPRODUTO
alter NCM_SH position 39;

alter table TBPRODUTO
alter CODIGO_NVE position 40;

alter table TBPRODUTO
alter CODIGO_CEST position 41;

alter table TBPRODUTO
alter CODCFOP position 42;

alter table TBPRODUTO
alter CODBARRA_EAN position 43;

alter table TBPRODUTO
alter CODUNIDADE position 44;

alter table TBPRODUTO
alter CODUNIDADE_FRACIONADA position 45;

alter table TBPRODUTO
alter ALIQUOTA_TIPO position 46;

alter table TBPRODUTO
alter ALIQUOTA position 47;

alter table TBPRODUTO
alter ALIQUOTA_CSOSN position 48;

alter table TBPRODUTO
alter ALIQUOTA_PIS position 49;

alter table TBPRODUTO
alter ALIQUOTA_COFINS position 50;

alter table TBPRODUTO
alter VALOR_IPI position 51;

alter table TBPRODUTO
alter PERCENTUAL_REDUCAO_BC position 52;

alter table TBPRODUTO
alter RESERVA position 53;

alter table TBPRODUTO
alter PRODUTO_NOVO position 54;

alter table TBPRODUTO
alter COR_VEICULO position 55;

alter table TBPRODUTO
alter COMBUSTIVEL_VEICULO position 56;

alter table TBPRODUTO
alter TIPO_VEICULO position 57;

alter table TBPRODUTO
alter ANO_MODELO_VEICULO position 58;

alter table TBPRODUTO
alter ANO_FABRICACAO_VEICULO position 59;

alter table TBPRODUTO
alter RENAVAM_VEICULO position 60;

alter table TBPRODUTO
alter CHASSI_VEICULO position 61;

alter table TBPRODUTO
alter KILOMETRAGEM_VEICULO position 62;

alter table TBPRODUTO
alter SITUACAO_ATUAL_VEICULO position 63;

alter table TBPRODUTO
alter SITUACAO_HISTORICO_VEICULO position 64;

alter table TBPRODUTO
alter USUARIO position 65;

alter table TBPRODUTO
alter CADASTRO_ATIVO position 66;

alter table TBPRODUTO
alter MOVIMENTA_ESTOQUE position 67;

alter table TBPRODUTO
alter COMPOR_FATURAMENTO position 68;

alter table TBPRODUTO
alter PRODUTO_IMOBILIZADO position 69;

alter table TBPRODUTO
alter ESTOQUE_APROP_LOTE position 70;

alter table TBPRODUTO
alter ZONA_FRANCA_MANAUS position 71;

alter table TBPRODUTO
alter PRECO position 72;

alter table TBPRODUTO
alter PRECO_PROMOCAO position 73;

alter table TBPRODUTO
alter CUSTOMEDIO position 74;

alter table TBPRODUTO
alter CUST_DESP_OFIC position 75;

alter table TBPRODUTO
alter CUST_DESP_GERAIS position 76;

alter table TBPRODUTO
alter CUST_DESP_ADM position 77;

alter table TBPRODUTO
alter CUST_COMISSAO position 78;

alter table TBPRODUTO
alter CUST_IMPOSTO position 79;

alter table TBPRODUTO
alter FI_RET_FINANC position 80;

alter table TBPRODUTO
alter FI_RET_PLANO position 81;

alter table TBPRODUTO
alter ULTIMA_COMPRA_DATA position 82;

alter table TBPRODUTO
alter ULTIMA_COMPRA_VALOR position 83;

alter table TBPRODUTO
alter ULTIMA_COMPRA_FORNEC position 84;

alter table TBPRODUTO
alter GERAR_SUBPRODUTO position 85;

alter table TBPRODUTO
alter PRODUTO_PAI position 86;

alter table TBPRODUTO
alter ARQUIVO_MORTO position 87;

Update TBPRODUTO Set ZONA_FRANCA_MANAUS = 0 where (ZONA_FRANCA_MANAUS is null) and (ARQUIVO_MORTO = 0);

ALTER TABLE TBTRIBUTACAO_TIPO
    ADD NRT DMN_LOGICO;

COMMENT ON COLUMN TBTRIBUTACAO_TIPO.NRT IS
'Nova Reforma Tributaria:
0 - Nao
1 - Sim';

UPDATE TBTRIBUTACAO_TIPO
SET NRT = 0;

COMMENT ON COLUMN TBTRIBUTACAO_TIPO.CRT IS
'Codigo do Regime Tributario.
0 - Normal
1 - Simples Nacional
2 - Nova Tributacao (A partir de 2026)';

Insert Into TBTRIBUTACAO_TIPO (TPT_COD, TPT_DESCRICAO, CRT, NRT) values ('000', 'Tributação integral', 2, 1);
Insert Into TBTRIBUTACAO_TIPO (TPT_COD, TPT_DESCRICAO, CRT, NRT) values ('010', 'Tributação com alíquotas uniformes', 2, 1);
Insert Into TBTRIBUTACAO_TIPO (TPT_COD, TPT_DESCRICAO, CRT, NRT) values ('011', 'Tributação com alíquotas uniformes reduzidas', 2, 1);
Insert Into TBTRIBUTACAO_TIPO (TPT_COD, TPT_DESCRICAO, CRT, NRT) values ('200', 'Alíquota reduzida', 2, 1);
Insert Into TBTRIBUTACAO_TIPO (TPT_COD, TPT_DESCRICAO, CRT, NRT) values ('220', 'Alíquota fixa', 2, 1);
Insert Into TBTRIBUTACAO_TIPO (TPT_COD, TPT_DESCRICAO, CRT, NRT) values ('222', 'Redução de base de cálculo', 2, 1);
Insert Into TBTRIBUTACAO_TIPO (TPT_COD, TPT_DESCRICAO, CRT, NRT) values ('221', 'Alíquota fixa proporcional', 2, 1);
Update TBTRIBUTACAO_TIPO Set TPT_DESCRICAO = 'Não tributada / Isenção', NRT = 1 where (TPT_COD = '400');
Insert Into TBTRIBUTACAO_TIPO (TPT_COD, TPT_DESCRICAO, CRT, NRT) values ('410', 'Imunidade e não incidência', 2, 1);
Insert Into TBTRIBUTACAO_TIPO (TPT_COD, TPT_DESCRICAO, CRT, NRT) values ('510', 'Diferimento', 2, 1);
Insert Into TBTRIBUTACAO_TIPO (TPT_COD, TPT_DESCRICAO, CRT, NRT) values ('515', 'Diferimento com redução de alíquota', 2, 1);
Insert Into TBTRIBUTACAO_TIPO (TPT_COD, TPT_DESCRICAO, CRT, NRT) values ('550', 'Suspensão', 2, 1);
Insert Into TBTRIBUTACAO_TIPO (TPT_COD, TPT_DESCRICAO, CRT, NRT) values ('620', 'Tributação monofásica', 2, 1);
Insert Into TBTRIBUTACAO_TIPO (TPT_COD, TPT_DESCRICAO, CRT, NRT) values ('800', 'Transferência de crédito', 2, 1);
Insert Into TBTRIBUTACAO_TIPO (TPT_COD, TPT_DESCRICAO, CRT, NRT) values ('810', 'Ajuste de IBS na ZFM', 2, 1);
Insert Into TBTRIBUTACAO_TIPO (TPT_COD, TPT_DESCRICAO, CRT, NRT) values ('811', 'Ajustes', 2, 1);
Insert Into TBTRIBUTACAO_TIPO (TPT_COD, TPT_DESCRICAO, CRT, NRT) values ('820', 'Tributação em declaração de regime específico', 2, 1);
Insert Into TBTRIBUTACAO_TIPO (TPT_COD, TPT_DESCRICAO, CRT, NRT) values ('830', 'Exclusão de base de cálculo', 2, 1);

COMMIT WORK;

ALTER TABLE TBPRODUTO
    ADD CST2026 DMN_VCHAR_03,
    ADD CCT2026 DMN_VCHAR_10;

COMMENT ON COLUMN TBPRODUTO.CST2026 IS
'Nova Reforma Tributaria 2026 - CST (Codigo de Situacao Tributaria)';

COMMENT ON COLUMN TBPRODUTO.CCT2026 IS
'Nova Reforma Tributaria 2026 - CCT (Codigo de Classificacao Tributaria)';

alter table TBPRODUTO
alter CODIGO position 1;

alter table TBPRODUTO
alter COD position 2;

alter table TBPRODUTO
alter DESCRI position 3;

alter table TBPRODUTO
alter APRESENTACAO position 4;

alter table TBPRODUTO
alter DESCRI_APRESENTACAO position 5;

alter table TBPRODUTO
alter METAFONEMA position 6;

alter table TBPRODUTO
alter MODELO position 7;

alter table TBPRODUTO
alter ANVISA position 8;

alter table TBPRODUTO
alter REFERENCIA position 9;

alter table TBPRODUTO
alter NOME_AMIGO position 10;

alter table TBPRODUTO
alter ESPECIFICACAO position 11;

alter table TBPRODUTO
alter SECAO position 12;

alter table TBPRODUTO
alter QTDE position 13;

alter table TBPRODUTO
alter FRACIONADOR position 14;

alter table TBPRODUTO
alter PESO_BRUTO position 15;

alter table TBPRODUTO
alter PESO_LIQUIDO position 16;

alter table TBPRODUTO
alter LARGURA position 17;

alter table TBPRODUTO
alter ALTURA position 18;

alter table TBPRODUTO
alter ESPESSURA position 19;

alter table TBPRODUTO
alter CUBAGEM position 20;

alter table TBPRODUTO
alter VENDA_FRACIONADA position 21;

alter table TBPRODUTO
alter UNIDADE position 22;

alter table TBPRODUTO
alter ESTOQMIN position 23;

alter table TBPRODUTO
alter CODTIPO position 24;

alter table TBPRODUTO
alter CODGRUPO position 25;

alter table TBPRODUTO
alter CODFABRICANTE position 26;

alter table TBPRODUTO
alter PERCENTUAL_MARCKUP position 27;

alter table TBPRODUTO
alter PERCENTUAL_MARGEM position 28;

alter table TBPRODUTO
alter PRECO_SUGERIDO position 29;

alter table TBPRODUTO
alter CODEMP position 30;

alter table TBPRODUTO
alter CODSECAO position 31;

alter table TBPRODUTO
alter CODORIGEM position 32;

alter table TBPRODUTO
alter CODTRIBUTACAO position 33;

alter table TBPRODUTO
alter CST position 34;

alter table TBPRODUTO
alter CSOSN position 35;

alter table TBPRODUTO
alter CST2026 position 36;

alter table TBPRODUTO
alter CCT2026 position 37;

alter table TBPRODUTO
alter CST_PIS position 38;

alter table TBPRODUTO
alter CST_COFINS position 39;

alter table TBPRODUTO
alter TABELA_IBPT position 40;

alter table TBPRODUTO
alter NCM_SH position 41;

alter table TBPRODUTO
alter CODIGO_NVE position 42;

alter table TBPRODUTO
alter CODIGO_CEST position 43;

alter table TBPRODUTO
alter CODCFOP position 44;

alter table TBPRODUTO
alter CODBARRA_EAN position 45;

alter table TBPRODUTO
alter CODUNIDADE position 46;

alter table TBPRODUTO
alter CODUNIDADE_FRACIONADA position 47;

alter table TBPRODUTO
alter ALIQUOTA_TIPO position 48;

alter table TBPRODUTO
alter ALIQUOTA position 49;

alter table TBPRODUTO
alter ALIQUOTA_CSOSN position 50;

alter table TBPRODUTO
alter ALIQUOTA_PIS position 51;

alter table TBPRODUTO
alter ALIQUOTA_COFINS position 52;

alter table TBPRODUTO
alter VALOR_IPI position 53;

alter table TBPRODUTO
alter PERCENTUAL_REDUCAO_BC position 54;

alter table TBPRODUTO
alter RESERVA position 55;

alter table TBPRODUTO
alter PRODUTO_NOVO position 56;

alter table TBPRODUTO
alter COR_VEICULO position 57;

alter table TBPRODUTO
alter COMBUSTIVEL_VEICULO position 58;

alter table TBPRODUTO
alter TIPO_VEICULO position 59;

alter table TBPRODUTO
alter ANO_MODELO_VEICULO position 60;

alter table TBPRODUTO
alter ANO_FABRICACAO_VEICULO position 61;

alter table TBPRODUTO
alter RENAVAM_VEICULO position 62;

alter table TBPRODUTO
alter CHASSI_VEICULO position 63;

alter table TBPRODUTO
alter KILOMETRAGEM_VEICULO position 64;

alter table TBPRODUTO
alter SITUACAO_ATUAL_VEICULO position 65;

alter table TBPRODUTO
alter SITUACAO_HISTORICO_VEICULO position 66;

alter table TBPRODUTO
alter USUARIO position 67;

alter table TBPRODUTO
alter CADASTRO_ATIVO position 68;

alter table TBPRODUTO
alter MOVIMENTA_ESTOQUE position 69;

alter table TBPRODUTO
alter COMPOR_FATURAMENTO position 70;

alter table TBPRODUTO
alter PRODUTO_IMOBILIZADO position 71;

alter table TBPRODUTO
alter ESTOQUE_APROP_LOTE position 72;

alter table TBPRODUTO
alter ZONA_FRANCA_MANAUS position 73;

alter table TBPRODUTO
alter PRECO position 74;

alter table TBPRODUTO
alter PRECO_PROMOCAO position 75;

alter table TBPRODUTO
alter CUSTOMEDIO position 76;

alter table TBPRODUTO
alter CUST_DESP_OFIC position 77;

alter table TBPRODUTO
alter CUST_DESP_GERAIS position 78;

alter table TBPRODUTO
alter CUST_DESP_ADM position 79;

alter table TBPRODUTO
alter CUST_COMISSAO position 80;

alter table TBPRODUTO
alter CUST_IMPOSTO position 81;

alter table TBPRODUTO
alter FI_RET_FINANC position 82;

alter table TBPRODUTO
alter FI_RET_PLANO position 83;

alter table TBPRODUTO
alter ULTIMA_COMPRA_DATA position 84;

alter table TBPRODUTO
alter ULTIMA_COMPRA_VALOR position 85;

alter table TBPRODUTO
alter ULTIMA_COMPRA_FORNEC position 86;

alter table TBPRODUTO
alter GERAR_SUBPRODUTO position 87;

alter table TBPRODUTO
alter PRODUTO_PAI position 88;

alter table TBPRODUTO
alter ARQUIVO_MORTO position 89;



Update TBPRODUTO Set cst2026 = '000' where cst = '000';

COMMIT WORK;

Update TBPRODUTO Set cst2026 = '040' where cst = '400';

COMMIT WORK;

ALTER TABLE SYS_IBPT
    ADD NOCIVO DMN_LOGICO_NULL;

COMMENT ON COLUMN SYS_IBPT.NOCIVO IS
'Produtos classificados como nocivos ao Meio Ambiente e a Saude:
0 - Nao
1 - Sim';

alter table SYS_IBPT
alter ID_IBPT position 1;

alter table SYS_IBPT
alter NCM_IBPT position 2;

alter table SYS_IBPT
alter EX_IBPT position 3;

alter table SYS_IBPT
alter TABELA_IBPT position 4;

alter table SYS_IBPT
alter DESCRICAO_IBPT position 5;

alter table SYS_IBPT
alter ALIQNACIONAL_IBPT position 6;

alter table SYS_IBPT
alter ALIQINTERNACIONAL_IBPT position 7;

alter table SYS_IBPT
alter ALIQESTADUAL_IBPT position 8;

alter table SYS_IBPT
alter ALIQMUNICIPAL_IBPT position 9;

alter table SYS_IBPT
alter NOCIVO position 10;

alter table SYS_IBPT
alter ATIVO position 11;


Update SYS_IBPT Set nocivo = 1 where ncm_ibpt like '2402%';
Update SYS_IBPT Set nocivo = 1 where ncm_ibpt like '2403%';
Update SYS_IBPT Set nocivo = 1 where ncm_ibpt like '2203%';
Update SYS_IBPT Set nocivo = 1 where ncm_ibpt like '2204%';
Update SYS_IBPT Set nocivo = 1 where ncm_ibpt like '2208%';
Update SYS_IBPT Set nocivo = 1 where ncm_ibpt like '3808%';
Update SYS_IBPT Set nocivo = 1 where ncm_ibpt like '2710%';
Update SYS_IBPT Set nocivo = 0 where nocivo is null;

COMMIT WORK;



ALTER TABLE SYS_IBPT ALTER COLUMN NOCIVO TYPE DMN_LOGICO;



ALTER TABLE TBPRODUTO
    ADD ALIQUOTA_CBS DECIMAL(15,2),
    ADD ALIQUOTA_IBS DECIMAL(15,2),
    ADD ALIQUOTA_IS DECIMAL(15,2);

COMMENT ON COLUMN TBPRODUTO.ALIQUOTA_CBS IS
'Nova Reforma Tributaria 2026 - Aliquota CBS (Contribuicao Sobre Bens e Servicos)
- Em substituicao ao PIS e COFINS.';

COMMENT ON COLUMN TBPRODUTO.ALIQUOTA_IBS IS
'Nova Reforma Tributaria 2026 - Aliquota IBS (Imposto Sobre Bens e Servicos)
- Em substituicao ao ICMS e ISS.';

COMMENT ON COLUMN TBPRODUTO.ALIQUOTA_IS IS
'Nova Reforma Tributaria 2026 - Aliquota IS (Imposto Seletivo)';

alter table TBPRODUTO
alter CODIGO position 1;

alter table TBPRODUTO
alter COD position 2;

alter table TBPRODUTO
alter DESCRI position 3;

alter table TBPRODUTO
alter APRESENTACAO position 4;

alter table TBPRODUTO
alter DESCRI_APRESENTACAO position 5;

alter table TBPRODUTO
alter METAFONEMA position 6;

alter table TBPRODUTO
alter MODELO position 7;

alter table TBPRODUTO
alter ANVISA position 8;

alter table TBPRODUTO
alter REFERENCIA position 9;

alter table TBPRODUTO
alter NOME_AMIGO position 10;

alter table TBPRODUTO
alter ESPECIFICACAO position 11;

alter table TBPRODUTO
alter SECAO position 12;

alter table TBPRODUTO
alter QTDE position 13;

alter table TBPRODUTO
alter FRACIONADOR position 14;

alter table TBPRODUTO
alter PESO_BRUTO position 15;

alter table TBPRODUTO
alter PESO_LIQUIDO position 16;

alter table TBPRODUTO
alter LARGURA position 17;

alter table TBPRODUTO
alter ALTURA position 18;

alter table TBPRODUTO
alter ESPESSURA position 19;

alter table TBPRODUTO
alter CUBAGEM position 20;

alter table TBPRODUTO
alter VENDA_FRACIONADA position 21;

alter table TBPRODUTO
alter UNIDADE position 22;

alter table TBPRODUTO
alter ESTOQMIN position 23;

alter table TBPRODUTO
alter CODTIPO position 24;

alter table TBPRODUTO
alter CODGRUPO position 25;

alter table TBPRODUTO
alter CODFABRICANTE position 26;

alter table TBPRODUTO
alter PERCENTUAL_MARCKUP position 27;

alter table TBPRODUTO
alter PERCENTUAL_MARGEM position 28;

alter table TBPRODUTO
alter PRECO_SUGERIDO position 29;

alter table TBPRODUTO
alter CODEMP position 30;

alter table TBPRODUTO
alter CODSECAO position 31;

alter table TBPRODUTO
alter CODORIGEM position 32;

alter table TBPRODUTO
alter CODTRIBUTACAO position 33;

alter table TBPRODUTO
alter CST position 34;

alter table TBPRODUTO
alter CSOSN position 35;

alter table TBPRODUTO
alter CST2026 position 36;

alter table TBPRODUTO
alter CCT2026 position 37;

alter table TBPRODUTO
alter CST_PIS position 38;

alter table TBPRODUTO
alter CST_COFINS position 39;

alter table TBPRODUTO
alter TABELA_IBPT position 40;

alter table TBPRODUTO
alter NCM_SH position 41;

alter table TBPRODUTO
alter CODIGO_NVE position 42;

alter table TBPRODUTO
alter CODIGO_CEST position 43;

alter table TBPRODUTO
alter CODCFOP position 44;

alter table TBPRODUTO
alter CODBARRA_EAN position 45;

alter table TBPRODUTO
alter CODUNIDADE position 46;

alter table TBPRODUTO
alter CODUNIDADE_FRACIONADA position 47;

alter table TBPRODUTO
alter ALIQUOTA_TIPO position 48;

alter table TBPRODUTO
alter ALIQUOTA position 49;

alter table TBPRODUTO
alter ALIQUOTA_CSOSN position 50;

alter table TBPRODUTO
alter ALIQUOTA_PIS position 51;

alter table TBPRODUTO
alter ALIQUOTA_COFINS position 52;

alter table TBPRODUTO
alter ALIQUOTA_CBS position 53;

alter table TBPRODUTO
alter ALIQUOTA_IBS position 54;

alter table TBPRODUTO
alter ALIQUOTA_IS position 55;

alter table TBPRODUTO
alter VALOR_IPI position 56;

alter table TBPRODUTO
alter PERCENTUAL_REDUCAO_BC position 57;

alter table TBPRODUTO
alter RESERVA position 58;

alter table TBPRODUTO
alter PRODUTO_NOVO position 59;

alter table TBPRODUTO
alter COR_VEICULO position 60;

alter table TBPRODUTO
alter COMBUSTIVEL_VEICULO position 61;

alter table TBPRODUTO
alter TIPO_VEICULO position 62;

alter table TBPRODUTO
alter ANO_MODELO_VEICULO position 63;

alter table TBPRODUTO
alter ANO_FABRICACAO_VEICULO position 64;

alter table TBPRODUTO
alter RENAVAM_VEICULO position 65;

alter table TBPRODUTO
alter CHASSI_VEICULO position 66;

alter table TBPRODUTO
alter KILOMETRAGEM_VEICULO position 67;

alter table TBPRODUTO
alter SITUACAO_ATUAL_VEICULO position 68;

alter table TBPRODUTO
alter SITUACAO_HISTORICO_VEICULO position 69;

alter table TBPRODUTO
alter USUARIO position 70;

alter table TBPRODUTO
alter CADASTRO_ATIVO position 71;

alter table TBPRODUTO
alter MOVIMENTA_ESTOQUE position 72;

alter table TBPRODUTO
alter COMPOR_FATURAMENTO position 73;

alter table TBPRODUTO
alter PRODUTO_IMOBILIZADO position 74;

alter table TBPRODUTO
alter ESTOQUE_APROP_LOTE position 75;

alter table TBPRODUTO
alter ZONA_FRANCA_MANAUS position 76;

alter table TBPRODUTO
alter PRECO position 77;

alter table TBPRODUTO
alter PRECO_PROMOCAO position 78;

alter table TBPRODUTO
alter CUSTOMEDIO position 79;

alter table TBPRODUTO
alter CUST_DESP_OFIC position 80;

alter table TBPRODUTO
alter CUST_DESP_GERAIS position 81;

alter table TBPRODUTO
alter CUST_DESP_ADM position 82;

alter table TBPRODUTO
alter CUST_COMISSAO position 83;

alter table TBPRODUTO
alter CUST_IMPOSTO position 84;

alter table TBPRODUTO
alter FI_RET_FINANC position 85;

alter table TBPRODUTO
alter FI_RET_PLANO position 86;

alter table TBPRODUTO
alter ULTIMA_COMPRA_DATA position 87;

alter table TBPRODUTO
alter ULTIMA_COMPRA_VALOR position 88;

alter table TBPRODUTO
alter ULTIMA_COMPRA_FORNEC position 89;

alter table TBPRODUTO
alter GERAR_SUBPRODUTO position 90;

alter table TBPRODUTO
alter PRODUTO_PAI position 91;

alter table TBPRODUTO
alter ARQUIVO_MORTO position 92;



ALTER TABLE TBPRODUTO
    ADD CSTIS DMN_VCHAR_03;

COMMENT ON COLUMN TBPRODUTO.CSTIS IS
'Nova Reforma Tributaria 2026 - CSTIS (Codigo de Situacao Tributaria do Imposto Seletivo)';

alter table TBPRODUTO
alter CODIGO position 1;

alter table TBPRODUTO
alter COD position 2;

alter table TBPRODUTO
alter DESCRI position 3;

alter table TBPRODUTO
alter APRESENTACAO position 4;

alter table TBPRODUTO
alter DESCRI_APRESENTACAO position 5;

alter table TBPRODUTO
alter METAFONEMA position 6;

alter table TBPRODUTO
alter MODELO position 7;

alter table TBPRODUTO
alter ANVISA position 8;

alter table TBPRODUTO
alter REFERENCIA position 9;

alter table TBPRODUTO
alter NOME_AMIGO position 10;

alter table TBPRODUTO
alter ESPECIFICACAO position 11;

alter table TBPRODUTO
alter SECAO position 12;

alter table TBPRODUTO
alter QTDE position 13;

alter table TBPRODUTO
alter FRACIONADOR position 14;

alter table TBPRODUTO
alter PESO_BRUTO position 15;

alter table TBPRODUTO
alter PESO_LIQUIDO position 16;

alter table TBPRODUTO
alter LARGURA position 17;

alter table TBPRODUTO
alter ALTURA position 18;

alter table TBPRODUTO
alter ESPESSURA position 19;

alter table TBPRODUTO
alter CUBAGEM position 20;

alter table TBPRODUTO
alter VENDA_FRACIONADA position 21;

alter table TBPRODUTO
alter UNIDADE position 22;

alter table TBPRODUTO
alter ESTOQMIN position 23;

alter table TBPRODUTO
alter CODTIPO position 24;

alter table TBPRODUTO
alter CODGRUPO position 25;

alter table TBPRODUTO
alter CODFABRICANTE position 26;

alter table TBPRODUTO
alter PERCENTUAL_MARCKUP position 27;

alter table TBPRODUTO
alter PERCENTUAL_MARGEM position 28;

alter table TBPRODUTO
alter PRECO_SUGERIDO position 29;

alter table TBPRODUTO
alter CODEMP position 30;

alter table TBPRODUTO
alter CODSECAO position 31;

alter table TBPRODUTO
alter CODORIGEM position 32;

alter table TBPRODUTO
alter CODTRIBUTACAO position 33;

alter table TBPRODUTO
alter CST position 34;

alter table TBPRODUTO
alter CSOSN position 35;

alter table TBPRODUTO
alter CST2026 position 36;

alter table TBPRODUTO
alter CCT2026 position 37;

alter table TBPRODUTO
alter CSTIS position 38;

alter table TBPRODUTO
alter CST_PIS position 39;

alter table TBPRODUTO
alter CST_COFINS position 40;

alter table TBPRODUTO
alter TABELA_IBPT position 41;

alter table TBPRODUTO
alter NCM_SH position 42;

alter table TBPRODUTO
alter CODIGO_NVE position 43;

alter table TBPRODUTO
alter CODIGO_CEST position 44;

alter table TBPRODUTO
alter CODCFOP position 45;

alter table TBPRODUTO
alter CODBARRA_EAN position 46;

alter table TBPRODUTO
alter CODUNIDADE position 47;

alter table TBPRODUTO
alter CODUNIDADE_FRACIONADA position 48;

alter table TBPRODUTO
alter ALIQUOTA_TIPO position 49;

alter table TBPRODUTO
alter ALIQUOTA position 50;

alter table TBPRODUTO
alter ALIQUOTA_CSOSN position 51;

alter table TBPRODUTO
alter ALIQUOTA_PIS position 52;

alter table TBPRODUTO
alter ALIQUOTA_COFINS position 53;

alter table TBPRODUTO
alter ALIQUOTA_CBS position 54;

alter table TBPRODUTO
alter ALIQUOTA_IBS position 55;

alter table TBPRODUTO
alter ALIQUOTA_IS position 56;

alter table TBPRODUTO
alter VALOR_IPI position 57;

alter table TBPRODUTO
alter PERCENTUAL_REDUCAO_BC position 58;

alter table TBPRODUTO
alter RESERVA position 59;

alter table TBPRODUTO
alter PRODUTO_NOVO position 60;

alter table TBPRODUTO
alter COR_VEICULO position 61;

alter table TBPRODUTO
alter COMBUSTIVEL_VEICULO position 62;

alter table TBPRODUTO
alter TIPO_VEICULO position 63;

alter table TBPRODUTO
alter ANO_MODELO_VEICULO position 64;

alter table TBPRODUTO
alter ANO_FABRICACAO_VEICULO position 65;

alter table TBPRODUTO
alter RENAVAM_VEICULO position 66;

alter table TBPRODUTO
alter CHASSI_VEICULO position 67;

alter table TBPRODUTO
alter KILOMETRAGEM_VEICULO position 68;

alter table TBPRODUTO
alter SITUACAO_ATUAL_VEICULO position 69;

alter table TBPRODUTO
alter SITUACAO_HISTORICO_VEICULO position 70;

alter table TBPRODUTO
alter USUARIO position 71;

alter table TBPRODUTO
alter CADASTRO_ATIVO position 72;

alter table TBPRODUTO
alter MOVIMENTA_ESTOQUE position 73;

alter table TBPRODUTO
alter COMPOR_FATURAMENTO position 74;

alter table TBPRODUTO
alter PRODUTO_IMOBILIZADO position 75;

alter table TBPRODUTO
alter ESTOQUE_APROP_LOTE position 76;

alter table TBPRODUTO
alter ZONA_FRANCA_MANAUS position 77;

alter table TBPRODUTO
alter PRECO position 78;

alter table TBPRODUTO
alter PRECO_PROMOCAO position 79;

alter table TBPRODUTO
alter CUSTOMEDIO position 80;

alter table TBPRODUTO
alter CUST_DESP_OFIC position 81;

alter table TBPRODUTO
alter CUST_DESP_GERAIS position 82;

alter table TBPRODUTO
alter CUST_DESP_ADM position 83;

alter table TBPRODUTO
alter CUST_COMISSAO position 84;

alter table TBPRODUTO
alter CUST_IMPOSTO position 85;

alter table TBPRODUTO
alter FI_RET_FINANC position 86;

alter table TBPRODUTO
alter FI_RET_PLANO position 87;

alter table TBPRODUTO
alter ULTIMA_COMPRA_DATA position 88;

alter table TBPRODUTO
alter ULTIMA_COMPRA_VALOR position 89;

alter table TBPRODUTO
alter ULTIMA_COMPRA_FORNEC position 90;

alter table TBPRODUTO
alter GERAR_SUBPRODUTO position 91;

alter table TBPRODUTO
alter PRODUTO_PAI position 92;

alter table TBPRODUTO
alter ARQUIVO_MORTO position 93;



alter table TBPRODUTO
alter column CODIGO position 1;

alter table TBPRODUTO
alter column COD position 2;

alter table TBPRODUTO
alter column DESCRI position 3;

alter table TBPRODUTO
alter column APRESENTACAO position 4;

alter table TBPRODUTO
alter column DESCRI_APRESENTACAO position 5;

alter table TBPRODUTO
alter column METAFONEMA position 6;

alter table TBPRODUTO
alter column MODELO position 7;

alter table TBPRODUTO
alter column ANVISA position 8;

alter table TBPRODUTO
alter column REFERENCIA position 9;

alter table TBPRODUTO
alter column NOME_AMIGO position 10;

alter table TBPRODUTO
alter column ESPECIFICACAO position 11;

alter table TBPRODUTO
alter column SECAO position 12;

alter table TBPRODUTO
alter column QTDE position 13;

alter table TBPRODUTO
alter column FRACIONADOR position 14;

alter table TBPRODUTO
alter column PESO_BRUTO position 15;

alter table TBPRODUTO
alter column PESO_LIQUIDO position 16;

alter table TBPRODUTO
alter column LARGURA position 17;

alter table TBPRODUTO
alter column ALTURA position 18;

alter table TBPRODUTO
alter column ESPESSURA position 19;

alter table TBPRODUTO
alter column CUBAGEM position 20;

alter table TBPRODUTO
alter column VENDA_FRACIONADA position 21;

alter table TBPRODUTO
alter column UNIDADE position 22;

alter table TBPRODUTO
alter column ESTOQMIN position 23;

alter table TBPRODUTO
alter column CODTIPO position 24;

alter table TBPRODUTO
alter column CODGRUPO position 25;

alter table TBPRODUTO
alter column CODFABRICANTE position 26;

alter table TBPRODUTO
alter column PERCENTUAL_MARCKUP position 27;

alter table TBPRODUTO
alter column PERCENTUAL_MARGEM position 28;

alter table TBPRODUTO
alter column PRECO_SUGERIDO position 29;

alter table TBPRODUTO
alter column CODEMP position 30;

alter table TBPRODUTO
alter column CODSECAO position 31;

alter table TBPRODUTO
alter column CODORIGEM position 32;

alter table TBPRODUTO
alter column CODTRIBUTACAO position 33;

alter table TBPRODUTO
alter column CST position 34;

alter table TBPRODUTO
alter column CSOSN position 35;

alter table TBPRODUTO
alter column CSTIS position 36;

alter table TBPRODUTO
alter column CST2026 position 37;

alter table TBPRODUTO
alter column CCT2026 position 38;

alter table TBPRODUTO
alter column CST_PIS position 39;

alter table TBPRODUTO
alter column CST_COFINS position 40;

alter table TBPRODUTO
alter column TABELA_IBPT position 41;

alter table TBPRODUTO
alter column NCM_SH position 42;

alter table TBPRODUTO
alter column CODIGO_NVE position 43;

alter table TBPRODUTO
alter column CODIGO_CEST position 44;

alter table TBPRODUTO
alter column CODCFOP position 45;

alter table TBPRODUTO
alter column CODBARRA_EAN position 46;

alter table TBPRODUTO
alter column CODUNIDADE position 47;

alter table TBPRODUTO
alter column CODUNIDADE_FRACIONADA position 48;

alter table TBPRODUTO
alter column ALIQUOTA_TIPO position 49;

alter table TBPRODUTO
alter column ALIQUOTA position 50;

alter table TBPRODUTO
alter column ALIQUOTA_CSOSN position 51;

alter table TBPRODUTO
alter column ALIQUOTA_PIS position 52;

alter table TBPRODUTO
alter column ALIQUOTA_COFINS position 53;

alter table TBPRODUTO
alter column ALIQUOTA_CBS position 54;

alter table TBPRODUTO
alter column ALIQUOTA_IBS position 55;

alter table TBPRODUTO
alter column ALIQUOTA_IS position 56;

alter table TBPRODUTO
alter column VALOR_IPI position 57;

alter table TBPRODUTO
alter column PERCENTUAL_REDUCAO_BC position 58;

alter table TBPRODUTO
alter column RESERVA position 59;

alter table TBPRODUTO
alter column PRODUTO_NOVO position 60;

alter table TBPRODUTO
alter column COR_VEICULO position 61;

alter table TBPRODUTO
alter column COMBUSTIVEL_VEICULO position 62;

alter table TBPRODUTO
alter column TIPO_VEICULO position 63;

alter table TBPRODUTO
alter column ANO_MODELO_VEICULO position 64;

alter table TBPRODUTO
alter column ANO_FABRICACAO_VEICULO position 65;

alter table TBPRODUTO
alter column RENAVAM_VEICULO position 66;

alter table TBPRODUTO
alter column CHASSI_VEICULO position 67;

alter table TBPRODUTO
alter column KILOMETRAGEM_VEICULO position 68;

alter table TBPRODUTO
alter column SITUACAO_ATUAL_VEICULO position 69;

alter table TBPRODUTO
alter column SITUACAO_HISTORICO_VEICULO position 70;

alter table TBPRODUTO
alter column USUARIO position 71;

alter table TBPRODUTO
alter column CADASTRO_ATIVO position 72;

alter table TBPRODUTO
alter column MOVIMENTA_ESTOQUE position 73;

alter table TBPRODUTO
alter column COMPOR_FATURAMENTO position 74;

alter table TBPRODUTO
alter column PRODUTO_IMOBILIZADO position 75;

alter table TBPRODUTO
alter column ESTOQUE_APROP_LOTE position 76;

alter table TBPRODUTO
alter column ZONA_FRANCA_MANAUS position 77;

alter table TBPRODUTO
alter column PRECO position 78;

alter table TBPRODUTO
alter column PRECO_PROMOCAO position 79;

alter table TBPRODUTO
alter column CUSTOMEDIO position 80;

alter table TBPRODUTO
alter column CUST_DESP_OFIC position 81;

alter table TBPRODUTO
alter column CUST_DESP_GERAIS position 82;

alter table TBPRODUTO
alter column CUST_DESP_ADM position 83;

alter table TBPRODUTO
alter column CUST_COMISSAO position 84;

alter table TBPRODUTO
alter column CUST_IMPOSTO position 85;

alter table TBPRODUTO
alter column FI_RET_FINANC position 86;

alter table TBPRODUTO
alter column FI_RET_PLANO position 87;

alter table TBPRODUTO
alter column ULTIMA_COMPRA_DATA position 88;

alter table TBPRODUTO
alter column ULTIMA_COMPRA_VALOR position 89;

alter table TBPRODUTO
alter column ULTIMA_COMPRA_FORNEC position 90;

alter table TBPRODUTO
alter column GERAR_SUBPRODUTO position 91;

alter table TBPRODUTO
alter column PRODUTO_PAI position 92;

alter table TBPRODUTO
alter column ARQUIVO_MORTO position 93;

ALTER TABLE SYS_IBPT
    ADD ALIQUOTA_IS DMN_PERCENTUAL_2;

COMMENT ON COLUMN SYS_IBPT.ALIQUOTA_IS IS
'Aliquota do Imposto Seletivo (IS) para produto nocivos a saude ou ao meio ambiente';

alter table SYS_IBPT
alter ID_IBPT position 1;

alter table SYS_IBPT
alter NCM_IBPT position 2;

alter table SYS_IBPT
alter EX_IBPT position 3;

alter table SYS_IBPT
alter TABELA_IBPT position 4;

alter table SYS_IBPT
alter DESCRICAO_IBPT position 5;

alter table SYS_IBPT
alter ALIQNACIONAL_IBPT position 6;

alter table SYS_IBPT
alter ALIQINTERNACIONAL_IBPT position 7;

alter table SYS_IBPT
alter ALIQESTADUAL_IBPT position 8;

alter table SYS_IBPT
alter ALIQMUNICIPAL_IBPT position 9;

alter table SYS_IBPT
alter NOCIVO position 10;

alter table SYS_IBPT
alter ALIQUOTA_IS position 11;

alter table SYS_IBPT
alter ATIVO position 12;

