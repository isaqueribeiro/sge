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

Update or Insert Into TBTRIBUTACAO_TIPO (TPT_COD, TPT_DESCRICAO, CRT, NRT) values ('000', 'Tributação integral', 2, 1) matching (TPT_COD);
Update or Insert Into TBTRIBUTACAO_TIPO (TPT_COD, TPT_DESCRICAO, CRT, NRT) values ('010', 'Tributação com alíquotas uniformes', 2, 1) matching (TPT_COD);
Update or Insert Into TBTRIBUTACAO_TIPO (TPT_COD, TPT_DESCRICAO, CRT, NRT) values ('011', 'Tributação com alíquotas uniformes reduzidas', 2, 1) matching (TPT_COD);
Update or Insert Into TBTRIBUTACAO_TIPO (TPT_COD, TPT_DESCRICAO, CRT, NRT) values ('200', 'Alíquota reduzida', 2, 1) matching (TPT_COD);
Update or Insert Into TBTRIBUTACAO_TIPO (TPT_COD, TPT_DESCRICAO, CRT, NRT) values ('220', 'Alíquota fixa', 2, 1) matching (TPT_COD);
Update or Insert Into TBTRIBUTACAO_TIPO (TPT_COD, TPT_DESCRICAO, CRT, NRT) values ('222', 'Redução de base de cálculo', 2, 1) matching (TPT_COD);
Update or Insert Into TBTRIBUTACAO_TIPO (TPT_COD, TPT_DESCRICAO, CRT, NRT) values ('221', 'Alíquota fixa proporcional', 2, 1) matching (TPT_COD);
Update TBTRIBUTACAO_TIPO Set TPT_DESCRICAO = 'Não tributada / Isenção', NRT = 1 where (TPT_COD = '400');
Update or Insert Into TBTRIBUTACAO_TIPO (TPT_COD, TPT_DESCRICAO, CRT, NRT) values ('410', 'Imunidade e não incidência', 2, 1) matching (TPT_COD);
Update or Insert Into TBTRIBUTACAO_TIPO (TPT_COD, TPT_DESCRICAO, CRT, NRT) values ('510', 'Diferimento', 2, 1) matching (TPT_COD);
Update or Insert Into TBTRIBUTACAO_TIPO (TPT_COD, TPT_DESCRICAO, CRT, NRT) values ('515', 'Diferimento com redução de alíquota', 2, 1) matching (TPT_COD);
Update or Insert Into TBTRIBUTACAO_TIPO (TPT_COD, TPT_DESCRICAO, CRT, NRT) values ('550', 'Suspensão', 2, 1) matching (TPT_COD);
Update or Insert Into TBTRIBUTACAO_TIPO (TPT_COD, TPT_DESCRICAO, CRT, NRT) values ('620', 'Tributação monofásica', 2, 1) matching (TPT_COD);
Update or Insert Into TBTRIBUTACAO_TIPO (TPT_COD, TPT_DESCRICAO, CRT, NRT) values ('800', 'Transferência de crédito', 2, 1) matching (TPT_COD);
Update or Insert Into TBTRIBUTACAO_TIPO (TPT_COD, TPT_DESCRICAO, CRT, NRT) values ('810', 'Ajuste de IBS na ZFM', 2, 1) matching (TPT_COD);
Update or Insert Into TBTRIBUTACAO_TIPO (TPT_COD, TPT_DESCRICAO, CRT, NRT) values ('811', 'Ajustes', 2, 1) matching (TPT_COD);
Update or Insert Into TBTRIBUTACAO_TIPO (TPT_COD, TPT_DESCRICAO, CRT, NRT) values ('820', 'Tributação em declaração de regime específico', 2, 1) matching (TPT_COD);
Update or Insert Into TBTRIBUTACAO_TIPO (TPT_COD, TPT_DESCRICAO, CRT, NRT) values ('830', 'Exclusão de base de cálculo', 2, 1) matching (TPT_COD);

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



CREATE TABLE TBTRIBUTACAO_CLASSE (
    CST DMN_VCHAR_03_NN NOT NULL,
    CLASSE DMN_VCHAR_10_KEY NOT NULL,
    NOME DMN_VCHAR_100,
    DESCRICAO DMN_VCHAR_250,
    REDACAO DMN_TEXTO,
    TIPO DMN_STATUS,
    REDUCAO_IBS DMN_LOGICO DEFAULT 0,
    REDUCAO_CBS DMN_LOGICO DEFAULT 0,
    TRIBUTACAO_REGULAR DMN_LOGICO DEFAULT 0,
    CREDITO_OPERACAO DMN_LOGICO DEFAULT 0,
    IMPOSTO_MONO_PADRAO DMN_LOGICO DEFAULT 0,
    IMPOSTO_MONO_RETENCAO DMN_LOGICO DEFAULT 0,
    IMPOSTO_MONO_RETIDA DMN_LOGICO DEFAULT 0,
    IMPOSTO_MONO_DIFERIMENTO DMN_LOGICO DEFAULT 0,
    ESTORNO_CREDITO DMN_LOGICO DEFAULT 0,
    USO_NFEABI DMN_LOGICO,
    USO_NFE DMN_LOGICO,
    USO_NFCE DMN_LOGICO,
    USO_NFSE DMN_LOGICO);

ALTER TABLE TBTRIBUTACAO_CLASSE
ADD CONSTRAINT PK_TBTRIBUTACAO_CLASSE
PRIMARY KEY (CST,CLASSE);

COMMENT ON COLUMN TBTRIBUTACAO_CLASSE.CST IS
'Codigo CST (IBS/CBS)';

COMMENT ON COLUMN TBTRIBUTACAO_CLASSE.CLASSE IS
'Codigo da Classificacao Tributaria';

COMMENT ON COLUMN TBTRIBUTACAO_CLASSE.NOME IS
'Nome da Classificacao Tributaria';

COMMENT ON COLUMN TBTRIBUTACAO_CLASSE.DESCRICAO IS
'Descricao detalhada da Classificacao Tributaria';

COMMENT ON COLUMN TBTRIBUTACAO_CLASSE.REDACAO IS
'Redacao do artigo de Lei que implementa a Classificacao Tributaria';

COMMENT ON COLUMN TBTRIBUTACAO_CLASSE.TIPO IS
'Tipo da Aliquota:

0 - Sem aliquota
1 - Padrao
2 - Fixa
3 - Uniforme Nacional (Referencia)
4 - Uniforme Setorial';

COMMENT ON COLUMN TBTRIBUTACAO_CLASSE.REDUCAO_IBS IS
'Reducao do IBS:
0 - Nao
1 - Sim';

COMMENT ON COLUMN TBTRIBUTACAO_CLASSE.REDUCAO_CBS IS
'Reducao do CBS:
0 - Nao
1 - Sim';

COMMENT ON COLUMN TBTRIBUTACAO_CLASSE.TRIBUTACAO_REGULAR IS
'Tributacao Regular:
0 - Nao
1 - Sim';

COMMENT ON COLUMN TBTRIBUTACAO_CLASSE.CREDITO_OPERACAO IS
'Credito Presumido da Operacao:
0 - Nao
1 - Sim';

COMMENT ON COLUMN TBTRIBUTACAO_CLASSE.IMPOSTO_MONO_PADRAO IS
'Tributacao Monofasica Padrao:
0 - Nao
1 - Sim';

COMMENT ON COLUMN TBTRIBUTACAO_CLASSE.IMPOSTO_MONO_RETENCAO IS
'Tributacao Monofasica sujeita a Retencao:
0 - Nao
1 - Sim';

COMMENT ON COLUMN TBTRIBUTACAO_CLASSE.IMPOSTO_MONO_RETIDA IS
'Tributacao Monofasica Retida anteriormente:
0 - Nao
1 - Sim';

COMMENT ON COLUMN TBTRIBUTACAO_CLASSE.IMPOSTO_MONO_DIFERIMENTO IS
'Diferimento da Tributacao Monofasica:
0 - Nao
1 - Sim';

COMMENT ON COLUMN TBTRIBUTACAO_CLASSE.ESTORNO_CREDITO IS
'Estorno de Credito:
0 - Nao
1 - Sim';

COMMENT ON COLUMN TBTRIBUTACAO_CLASSE.USO_NFEABI IS
'Uso em NF-e ABI:
0 - Nao
1 - Sim';

COMMENT ON COLUMN TBTRIBUTACAO_CLASSE.USO_NFE IS
'Uso em NF-e (Modelo 55):
0 - Nao
1 - Sim';

COMMENT ON COLUMN TBTRIBUTACAO_CLASSE.USO_NFCE IS
'Uso em NF-e (Modelo 65):
0 - Nao
1 - Sim';

COMMENT ON COLUMN TBTRIBUTACAO_CLASSE.USO_NFSE IS
'Uso em NFS-e:
0 - Nao
1 - Sim';



COMMENT ON TABLE TBTRIBUTACAO_CLASSE IS 'Tabela de Classes Tributarias (CST IBS/CBS x Classe CST)

    Autor   :   Isaque Marinho Ribeiro
    Data    :   29/01/2026

Tabela responsavel por armazenar os codigos e as descricoes das Classes Tributarias associadas aos Codigos de
Situacao Tributaria (CST), bem como as parametrizacoes de cada CST/Classe.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    29/01/2026 - IMR :
        * Documentacao.';



ALTER TABLE TBCLIENTE
    ADD ADMININISTRACAO_PUBLICA DMN_LOGICO DEFAULT 0;

COMMENT ON COLUMN TBCLIENTE.ADMININISTRACAO_PUBLICA IS
'Cliente da Administracao Publica (Uniao, Estados, DF, Municipios, Autarquias, Fundacoes publicas, ETC.):
0 - Nao
1 - Sim';

alter table TBCLIENTE
alter CODIGO position 1;

alter table TBCLIENTE
alter TIPO position 2;

alter table TBCLIENTE
alter PESSOA_FISICA position 3;

alter table TBCLIENTE
alter CNPJ position 4;

alter table TBCLIENTE
alter NOME position 5;

alter table TBCLIENTE
alter NOMEFANT position 6;

alter table TBCLIENTE
alter INSCEST position 7;

alter table TBCLIENTE
alter INSCMUN position 8;

alter table TBCLIENTE
alter ENDER position 9;

alter table TBCLIENTE
alter COMPLEMENTO position 10;

alter table TBCLIENTE
alter BAIRRO position 11;

alter table TBCLIENTE
alter CEP position 12;

alter table TBCLIENTE
alter CIDADE position 13;

alter table TBCLIENTE
alter UF position 14;

alter table TBCLIENTE
alter FONE position 15;

alter table TBCLIENTE
alter FONECEL position 16;

alter table TBCLIENTE
alter FONECOMERC position 17;

alter table TBCLIENTE
alter EMAIL position 18;

alter table TBCLIENTE
alter SITE position 19;

alter table TBCLIENTE
alter TLG_TIPO position 20;

alter table TBCLIENTE
alter LOG_COD position 21;

alter table TBCLIENTE
alter BAI_COD position 22;

alter table TBCLIENTE
alter CID_COD position 23;

alter table TBCLIENTE
alter EST_COD position 24;

alter table TBCLIENTE
alter NUMERO_END position 25;

alter table TBCLIENTE
alter PAIS_ID position 26;

alter table TBCLIENTE
alter VALOR_LIMITE_COMPRA position 27;

alter table TBCLIENTE
alter BLOQUEADO position 28;

alter table TBCLIENTE
alter BLOQUEADO_DATA position 29;

alter table TBCLIENTE
alter BLOQUEADO_MOTIVO position 30;

alter table TBCLIENTE
alter BLOQUEADO_USUARIO position 31;

alter table TBCLIENTE
alter BLOQUEADO_AUTOMATICO position 32;

alter table TBCLIENTE
alter DESBLOQUEADO_DATA position 33;

alter table TBCLIENTE
alter VENDEDOR_COD position 34;

alter table TBCLIENTE
alter USUARIO position 35;

alter table TBCLIENTE
alter EMITIR_NFE_DEVOLUCAO position 36;

alter table TBCLIENTE
alter CUSTO_OPER_PERCENTUAL position 37;

alter table TBCLIENTE
alter CUSTO_OPER_FRETE position 38;

alter table TBCLIENTE
alter CUSTO_OPER_OUTROS position 39;

alter table TBCLIENTE
alter ENTREGA_FRACIONADA_VENDA position 40;

alter table TBCLIENTE
alter BANCO position 41;

alter table TBCLIENTE
alter AGENCIA position 42;

alter table TBCLIENTE
alter CC position 43;

alter table TBCLIENTE
alter PRACA position 44;

alter table TBCLIENTE
alter BANCO_2 position 45;

alter table TBCLIENTE
alter AGENCIA_2 position 46;

alter table TBCLIENTE
alter CC_2 position 47;

alter table TBCLIENTE
alter PRACA_2 position 48;

alter table TBCLIENTE
alter BANCO_3 position 49;

alter table TBCLIENTE
alter AGENCIA_3 position 50;

alter table TBCLIENTE
alter CC_3 position 51;

alter table TBCLIENTE
alter PRACA_3 position 52;

alter table TBCLIENTE
alter OBSERVACAO position 53;

alter table TBCLIENTE
alter DTCAD position 54;

alter table TBCLIENTE
alter ADMININISTRACAO_PUBLICA position 55;

alter table TBCLIENTE
alter ATIVO position 56;



SET TERM ^ ;

CREATE OR ALTER trigger tg_cliente_gerar_fornecedor for tbcliente
active after insert or update position 1
AS
  declare variable codigo_forn Integer;
  declare variable grupo_forn Smallint;
begin
  if ( new.emitir_nfe_devolucao = 1 ) then
  begin
    /* Buscar Fornecedor referenre ao CPF/CNPJ */
    Select first 1
      f.codforn
    from TBFORNECEDOR f
    where f.cliente_origem_cod = new.codigo
    Into
      codigo_forn;

    if ( :codigo_forn is null ) then
    begin
      /* Buscar Grupo de fornecedor */
      Select first 1
        g.grf_cod
      from TBFORNECEDOR_GRUPO g
      Into
        grupo_forn;

      if (coalesce(new.admininistracao_publica, 0) = 1) then
        grupo_forn = 6; -- Administracao Publica

      codigo_forn = Gen_id(GEN_FORNECEDOR_ID, 1);
      Insert Into TBFORNECEDOR (
          CODFORN
        , PESSOA_FISICA
        , NOMEFORN
        , NOMEFANT
        , CNPJ
        , INSCEST
        , INSCMUN
        , ENDER
        , COMPLEMENTO
        , NUMERO_END
        , CEP
        , CIDADE
        , UF
        , FONE
        , FONECEL
        , EMAIL
        , SITE
        , TLG_TIPO
        , LOG_COD
        , BAI_COD
        , CID_COD
        , EST_COD
        , PAIS_ID
        , GRF_COD
        , TRANSPORTADORA
        , BANCO
        , AGENCIA
        , CC
        , PRACA
        , BANCO_2
        , AGENCIA_2
        , CC_2
        , PRACA_2
        , BANCO_3
        , AGENCIA_3
        , CC_3
        , PRACA_3
        , OBSERVACAO
        , DTCAD
        , ATIVO
        , CLIENTE_ORIGEM
        , CLIENTE_ORIGEM_COD
        , FATURAMENTO_MINIMO
      ) values (
          :codigo_forn
        , new.pessoa_fisica
        , new.nome
        , coalesce(new.nomefant, new.nome)
        , new.cnpj
        , new.inscest
        , new.inscmun
        , new.ender
        , new.complemento
        , new.numero_end
        , new.cep
        , new.cidade
        , new.uf
        , new.fone
        , new.fonecel
        , substring(new.email from 1 for 40)
        , substring(new.site from 1 for 35)
        , new.tlg_tipo
        , new.log_cod
        , new.bai_cod
        , new.cid_cod
        , new.est_cod
        , new.pais_id
        , :grupo_forn
        , 0
        , new.banco
        , new.agencia
        , new.cc
        , new.praca
        , new.banco_2
        , new.agencia_2
        , new.cc_2
        , new.praca_2
        , new.banco_3
        , new.agencia_3
        , new.cc_3
        , new.praca_3
        , new.observacao
        , current_date
        , coalesce(new.ativo, 1)
        , new.cnpj
        , new.codigo
        , 0.0
      );
    end
    else
    begin
      Update TBFORNECEDOR f Set
          f.pessoa_fisica = new.pessoa_fisica
        , f.nomeforn = new.nome
        , f.nomefant = coalesce(new.nomefant, new.nome)
        , f.cnpj     = new.cnpj
        , f.inscest = new.inscest
        , f.inscmun = new.inscmun
        , f.ender   = new.ender
        , f.complemento = new.complemento
        , f.numero_end  = new.numero_end
        , f.cep    = new.cep
        , f.cidade = new.cidade
        , f.uf     = new.uf
        , f.fone    = new.fone
        , f.fonecel = new.fonecel
        , f.email   = substring(new.email from 1 for 40)
        , f.site    = substring(new.site from 1 for 35)
        , f.tlg_tipo = new.tlg_tipo
        , f.log_cod = new.log_cod
        , f.bai_cod = new.bai_cod
        , f.cid_cod = new.cid_cod
        , f.est_cod = new.est_cod
        , f.pais_id = new.pais_id
        , f.ativo   = coalesce(new.ativo, 1)
        , f.banco   = new.banco
        , f.agencia = new.agencia
        , f.cc      = new.cc
        , f.praca   = new.praca
        , f.banco_2   = new.banco_2
        , f.agencia_2 = new.agencia_2
        , f.cc_2      = new.cc_2
        , f.praca_2   = new.praca_2
        , f.banco_3   = new.banco_3
        , f.agencia_3 = new.agencia_3
        , f.cc_3      = new.cc_3
        , f.praca_3   = new.praca_3
        , f.observacao = new.observacao
        , f.cliente_origem     =  new.cnpj
        , f.cliente_origem_cod = new.codigo
      where f.codforn = :codigo_forn;
    end 
  end 
end^

SET TERM ; ^



CREATE OR ALTER VIEW VW_ENTE_GOVERNAMENTAL (
    CODIGO,
    DESCRICAO)
AS
Select 0 as Codigo , 'Não se aplica' as Descricao from RDB$DATABASE Union
Select 1 as Codigo , 'União'  as Descricao from RDB$DATABASE Union
Select 2 as Codigo , 'Estado' as Descricao from RDB$DATABASE Union
Select 3 as Codigo , 'Distrito Federal' as Descricao from RDB$DATABASE Union
Select 4 as Codigo , 'Município' as Descricao from RDB$DATABASE
;



ALTER TABLE TBCLIENTE
    ADD ENTE_GOVERNAMENTAL DMN_SMALLINT_N;

COMMENT ON COLUMN TBCLIENTE.ENTE_GOVERNAMENTAL IS
'Para administracao publica direta e suas autarquias e fundacoes:
0 - Nao se aplica
1 - Uniao
2 - Estado
3 - Distrito Federal
4 - Municipio';

alter table TBCLIENTE
alter CODIGO position 1;

alter table TBCLIENTE
alter TIPO position 2;

alter table TBCLIENTE
alter PESSOA_FISICA position 3;

alter table TBCLIENTE
alter CNPJ position 4;

alter table TBCLIENTE
alter NOME position 5;

alter table TBCLIENTE
alter NOMEFANT position 6;

alter table TBCLIENTE
alter INSCEST position 7;

alter table TBCLIENTE
alter INSCMUN position 8;

alter table TBCLIENTE
alter ENDER position 9;

alter table TBCLIENTE
alter COMPLEMENTO position 10;

alter table TBCLIENTE
alter BAIRRO position 11;

alter table TBCLIENTE
alter CEP position 12;

alter table TBCLIENTE
alter CIDADE position 13;

alter table TBCLIENTE
alter UF position 14;

alter table TBCLIENTE
alter FONE position 15;

alter table TBCLIENTE
alter FONECEL position 16;

alter table TBCLIENTE
alter FONECOMERC position 17;

alter table TBCLIENTE
alter EMAIL position 18;

alter table TBCLIENTE
alter SITE position 19;

alter table TBCLIENTE
alter TLG_TIPO position 20;

alter table TBCLIENTE
alter LOG_COD position 21;

alter table TBCLIENTE
alter BAI_COD position 22;

alter table TBCLIENTE
alter CID_COD position 23;

alter table TBCLIENTE
alter EST_COD position 24;

alter table TBCLIENTE
alter NUMERO_END position 25;

alter table TBCLIENTE
alter PAIS_ID position 26;

alter table TBCLIENTE
alter VALOR_LIMITE_COMPRA position 27;

alter table TBCLIENTE
alter BLOQUEADO position 28;

alter table TBCLIENTE
alter BLOQUEADO_DATA position 29;

alter table TBCLIENTE
alter BLOQUEADO_MOTIVO position 30;

alter table TBCLIENTE
alter BLOQUEADO_USUARIO position 31;

alter table TBCLIENTE
alter BLOQUEADO_AUTOMATICO position 32;

alter table TBCLIENTE
alter DESBLOQUEADO_DATA position 33;

alter table TBCLIENTE
alter VENDEDOR_COD position 34;

alter table TBCLIENTE
alter USUARIO position 35;

alter table TBCLIENTE
alter EMITIR_NFE_DEVOLUCAO position 36;

alter table TBCLIENTE
alter CUSTO_OPER_PERCENTUAL position 37;

alter table TBCLIENTE
alter CUSTO_OPER_FRETE position 38;

alter table TBCLIENTE
alter CUSTO_OPER_OUTROS position 39;

alter table TBCLIENTE
alter ENTREGA_FRACIONADA_VENDA position 40;

alter table TBCLIENTE
alter BANCO position 41;

alter table TBCLIENTE
alter AGENCIA position 42;

alter table TBCLIENTE
alter CC position 43;

alter table TBCLIENTE
alter PRACA position 44;

alter table TBCLIENTE
alter BANCO_2 position 45;

alter table TBCLIENTE
alter AGENCIA_2 position 46;

alter table TBCLIENTE
alter CC_2 position 47;

alter table TBCLIENTE
alter PRACA_2 position 48;

alter table TBCLIENTE
alter BANCO_3 position 49;

alter table TBCLIENTE
alter AGENCIA_3 position 50;

alter table TBCLIENTE
alter CC_3 position 51;

alter table TBCLIENTE
alter PRACA_3 position 52;

alter table TBCLIENTE
alter OBSERVACAO position 53;

alter table TBCLIENTE
alter DTCAD position 54;

alter table TBCLIENTE
alter ENTE_GOVERNAMENTAL position 55;

alter table TBCLIENTE
alter ADMININISTRACAO_PUBLICA position 56;

alter table TBCLIENTE
alter ATIVO position 57;



SET TERM ^ ;

CREATE trigger tg_cliente_tratar for tbcliente
active before insert or update position 1
AS
begin
  new.admininistracao_publica = iif(coalesce(new.ente_governamental, 0) > 0, 1, 0);
end^

SET TERM ; ^

COMMENT ON TRIGGER TG_CLIENTE_TRATAR IS 'Trigger Tratar Dados Cliente.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   29/01/2026

Trigger responsavel por tratar dados sensiveis do cliente a fim de validar determinadas regras de negocio.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    29/01/2026 - IMR :
        * Criacao e documentacao.';



ALTER TABLE TBFORNECEDOR
    ADD ENTE_GOVERNAMENTAL DMN_SMALLINT_N;

COMMENT ON COLUMN TBFORNECEDOR.ENTE_GOVERNAMENTAL IS
'Para administracao publica direta e suas autarquias e fundacoes:
0 - Nao se aplica
1 - Uniao
2 - Estado
3 - Distrito Federal
4 - Municipio';

alter table TBFORNECEDOR
alter CODFORN position 1;

alter table TBFORNECEDOR
alter TIPO position 2;

alter table TBFORNECEDOR
alter PESSOA_FISICA position 3;

alter table TBFORNECEDOR
alter NOMEFORN position 4;

alter table TBFORNECEDOR
alter NOMEFANT position 5;

alter table TBFORNECEDOR
alter CNPJ position 6;

alter table TBFORNECEDOR
alter INSCEST position 7;

alter table TBFORNECEDOR
alter INSCMUN position 8;

alter table TBFORNECEDOR
alter ENDER position 9;

alter table TBFORNECEDOR
alter COMPLEMENTO position 10;

alter table TBFORNECEDOR
alter NUMERO_END position 11;

alter table TBFORNECEDOR
alter CEP position 12;

alter table TBFORNECEDOR
alter CIDADE position 13;

alter table TBFORNECEDOR
alter UF position 14;

alter table TBFORNECEDOR
alter CONTATO position 15;

alter table TBFORNECEDOR
alter FONE position 16;

alter table TBFORNECEDOR
alter FONECEL position 17;

alter table TBFORNECEDOR
alter FONEFAX position 18;

alter table TBFORNECEDOR
alter EMAIL position 19;

alter table TBFORNECEDOR
alter SITE position 20;

alter table TBFORNECEDOR
alter TLG_TIPO position 21;

alter table TBFORNECEDOR
alter LOG_COD position 22;

alter table TBFORNECEDOR
alter BAI_COD position 23;

alter table TBFORNECEDOR
alter CID_COD position 24;

alter table TBFORNECEDOR
alter EST_COD position 25;

alter table TBFORNECEDOR
alter PAIS_ID position 26;

alter table TBFORNECEDOR
alter GRF_COD position 27;

alter table TBFORNECEDOR
alter ENTE_GOVERNAMENTAL position 28;

alter table TBFORNECEDOR
alter TRANSPORTADORA position 29;

alter table TBFORNECEDOR
alter BANCO position 30;

alter table TBFORNECEDOR
alter AGENCIA position 31;

alter table TBFORNECEDOR
alter CC position 32;

alter table TBFORNECEDOR
alter PRACA position 33;

alter table TBFORNECEDOR
alter BANCO_2 position 34;

alter table TBFORNECEDOR
alter AGENCIA_2 position 35;

alter table TBFORNECEDOR
alter CC_2 position 36;

alter table TBFORNECEDOR
alter PRACA_2 position 37;

alter table TBFORNECEDOR
alter BANCO_3 position 38;

alter table TBFORNECEDOR
alter AGENCIA_3 position 39;

alter table TBFORNECEDOR
alter CC_3 position 40;

alter table TBFORNECEDOR
alter PRACA_3 position 41;

alter table TBFORNECEDOR
alter OBSERVACAO position 42;

alter table TBFORNECEDOR
alter DTCAD position 43;

alter table TBFORNECEDOR
alter ATIVO position 44;

alter table TBFORNECEDOR
alter CLIENTE_ORIGEM position 45;

alter table TBFORNECEDOR
alter CLIENTE_ORIGEM_COD position 46;

alter table TBFORNECEDOR
alter FATURAMENTO_MINIMO position 47;

alter table TBFORNECEDOR
alter FORNECEDOR_FUNCIONARIO position 48;



SET TERM ^ ;

CREATE OR ALTER trigger tg_cliente_gerar_fornecedor for tbcliente
active after insert or update position 1
AS
  declare variable codigo_forn Integer;
  declare variable grupo_forn Smallint;
begin
  if ( new.emitir_nfe_devolucao = 1 ) then
  begin
    /* Buscar Fornecedor referenre ao CPF/CNPJ */
    Select first 1
      f.codforn
    from TBFORNECEDOR f
    where f.cliente_origem_cod = new.codigo
    Into
      codigo_forn;

    if ( :codigo_forn is null ) then
    begin
      /* Buscar Grupo de fornecedor */
      Select first 1
        g.grf_cod
      from TBFORNECEDOR_GRUPO g
      Into
        grupo_forn;

      if (coalesce(new.admininistracao_publica, 0) = 1) then
        grupo_forn = 6; -- Administracao Publica

      codigo_forn = Gen_id(GEN_FORNECEDOR_ID, 1);
      Insert Into TBFORNECEDOR (
          CODFORN
        , PESSOA_FISICA
        , NOMEFORN
        , NOMEFANT
        , CNPJ
        , INSCEST
        , INSCMUN
        , ENDER
        , COMPLEMENTO
        , NUMERO_END
        , CEP
        , CIDADE
        , UF
        , FONE
        , FONECEL
        , EMAIL
        , SITE
        , TLG_TIPO
        , LOG_COD
        , BAI_COD
        , CID_COD
        , EST_COD
        , PAIS_ID
        , GRF_COD
        , ENTE_GOVERNAMENTAL
        , TRANSPORTADORA
        , BANCO
        , AGENCIA
        , CC
        , PRACA
        , BANCO_2
        , AGENCIA_2
        , CC_2
        , PRACA_2
        , BANCO_3
        , AGENCIA_3
        , CC_3
        , PRACA_3
        , OBSERVACAO
        , DTCAD
        , ATIVO
        , CLIENTE_ORIGEM
        , CLIENTE_ORIGEM_COD
        , FATURAMENTO_MINIMO
      ) values (
          :codigo_forn
        , new.pessoa_fisica
        , new.nome
        , coalesce(new.nomefant, new.nome)
        , new.cnpj
        , new.inscest
        , new.inscmun
        , new.ender
        , new.complemento
        , new.numero_end
        , new.cep
        , new.cidade
        , new.uf
        , new.fone
        , new.fonecel
        , substring(new.email from 1 for 40)
        , substring(new.site from 1 for 35)
        , new.tlg_tipo
        , new.log_cod
        , new.bai_cod
        , new.cid_cod
        , new.est_cod
        , new.pais_id
        , :grupo_forn
        , coalesce(new.ente_governamental, 0)
        , 0
        , new.banco
        , new.agencia
        , new.cc
        , new.praca
        , new.banco_2
        , new.agencia_2
        , new.cc_2
        , new.praca_2
        , new.banco_3
        , new.agencia_3
        , new.cc_3
        , new.praca_3
        , new.observacao
        , current_date
        , coalesce(new.ativo, 1)
        , new.cnpj
        , new.codigo
        , 0.0
      );
    end
    else
    begin
      Update TBFORNECEDOR f Set
          f.pessoa_fisica = new.pessoa_fisica
        , f.nomeforn = new.nome
        , f.nomefant = coalesce(new.nomefant, new.nome)
        , f.cnpj     = new.cnpj
        , f.inscest = new.inscest
        , f.inscmun = new.inscmun
        , f.ender   = new.ender
        , f.complemento = new.complemento
        , f.numero_end  = new.numero_end
        , f.cep    = new.cep
        , f.cidade = new.cidade
        , f.uf     = new.uf
        , f.fone    = new.fone
        , f.fonecel = new.fonecel
        , f.email   = substring(new.email from 1 for 40)
        , f.site    = substring(new.site from 1 for 35)
        , f.tlg_tipo = new.tlg_tipo
        , f.log_cod = new.log_cod
        , f.bai_cod = new.bai_cod
        , f.cid_cod = new.cid_cod
        , f.est_cod = new.est_cod
        , f.pais_id = new.pais_id
        , f.ativo   = coalesce(new.ativo, 1)
        , f.banco   = new.banco
        , f.agencia = new.agencia
        , f.cc      = new.cc
        , f.praca   = new.praca
        , f.banco_2   = new.banco_2
        , f.agencia_2 = new.agencia_2
        , f.cc_2      = new.cc_2
        , f.praca_2   = new.praca_2
        , f.banco_3   = new.banco_3
        , f.agencia_3 = new.agencia_3
        , f.cc_3      = new.cc_3
        , f.praca_3   = new.praca_3
        , f.observacao = new.observacao
        , f.cliente_origem     =  new.cnpj
        , f.cliente_origem_cod = new.codigo
      where f.codforn = :codigo_forn;
    end 
  end 
end^

SET TERM ; ^



SET TERM ^ ;

CREATE OR ALTER trigger tg_cliente_gerar_fornecedor for tbcliente
active after insert or update position 1
AS
  declare variable codigo_forn Integer;
  declare variable grupo_forn Smallint;
begin
  if ( new.emitir_nfe_devolucao = 1 ) then
  begin
    /* Buscar Fornecedor referenre ao CPF/CNPJ */
    Select first 1
      f.codforn
    from TBFORNECEDOR f
    where f.cliente_origem_cod = new.codigo
    Into
      codigo_forn;

    if ( :codigo_forn is null ) then
    begin
      /* Buscar Grupo de fornecedor */
      Select first 1
        g.grf_cod
      from TBFORNECEDOR_GRUPO g
      Into
        grupo_forn;

      if (coalesce(new.admininistracao_publica, 0) = 1) then
        grupo_forn = 6; -- Administracao Publica

      codigo_forn = Gen_id(GEN_FORNECEDOR_ID, 1);
      Insert Into TBFORNECEDOR (
          CODFORN
        , PESSOA_FISICA
        , NOMEFORN
        , NOMEFANT
        , CNPJ
        , INSCEST
        , INSCMUN
        , ENDER
        , COMPLEMENTO
        , NUMERO_END
        , CEP
        , CIDADE
        , UF
        , FONE
        , FONECEL
        , EMAIL
        , SITE
        , TLG_TIPO
        , LOG_COD
        , BAI_COD
        , CID_COD
        , EST_COD
        , PAIS_ID
        , GRF_COD
        , ENTE_GOVERNAMENTAL
        , TRANSPORTADORA
        , BANCO
        , AGENCIA
        , CC
        , PRACA
        , BANCO_2
        , AGENCIA_2
        , CC_2
        , PRACA_2
        , BANCO_3
        , AGENCIA_3
        , CC_3
        , PRACA_3
        , OBSERVACAO
        , DTCAD
        , ATIVO
        , CLIENTE_ORIGEM
        , CLIENTE_ORIGEM_COD
        , FATURAMENTO_MINIMO
      ) values (
          :codigo_forn
        , new.pessoa_fisica
        , new.nome
        , coalesce(new.nomefant, new.nome)
        , new.cnpj
        , new.inscest
        , new.inscmun
        , new.ender
        , new.complemento
        , new.numero_end
        , new.cep
        , new.cidade
        , new.uf
        , new.fone
        , new.fonecel
        , substring(new.email from 1 for 40)
        , substring(new.site from 1 for 35)
        , new.tlg_tipo
        , new.log_cod
        , new.bai_cod
        , new.cid_cod
        , new.est_cod
        , new.pais_id
        , :grupo_forn
        , coalesce(new.ente_governamental, 0)
        , 0
        , new.banco
        , new.agencia
        , new.cc
        , new.praca
        , new.banco_2
        , new.agencia_2
        , new.cc_2
        , new.praca_2
        , new.banco_3
        , new.agencia_3
        , new.cc_3
        , new.praca_3
        , new.observacao
        , current_date
        , coalesce(new.ativo, 1)
        , new.cnpj
        , new.codigo
        , 0.0
      );
    end
    else
    begin
      Update TBFORNECEDOR f Set
          f.pessoa_fisica = new.pessoa_fisica
        , f.nomeforn = new.nome
        , f.nomefant = coalesce(new.nomefant, new.nome)
        , f.cnpj     = new.cnpj
        , f.inscest = new.inscest
        , f.inscmun = new.inscmun
        , f.ender   = new.ender
        , f.complemento = new.complemento
        , f.numero_end  = new.numero_end
        , f.cep    = new.cep
        , f.cidade = new.cidade
        , f.uf     = new.uf
        , f.fone    = new.fone
        , f.fonecel = new.fonecel
        , f.email   = substring(new.email from 1 for 40)
        , f.site    = substring(new.site from 1 for 35)
        , f.tlg_tipo = new.tlg_tipo
        , f.log_cod = new.log_cod
        , f.bai_cod = new.bai_cod
        , f.cid_cod = new.cid_cod
        , f.est_cod = new.est_cod
        , f.pais_id = new.pais_id
        , f.ativo   = coalesce(new.ativo, 1)
        , f.banco   = new.banco
        , f.agencia = new.agencia
        , f.cc      = new.cc
        , f.praca   = new.praca
        , f.banco_2   = new.banco_2
        , f.agencia_2 = new.agencia_2
        , f.cc_2      = new.cc_2
        , f.praca_2   = new.praca_2
        , f.banco_3   = new.banco_3
        , f.agencia_3 = new.agencia_3
        , f.cc_3      = new.cc_3
        , f.praca_3   = new.praca_3
        , f.observacao = new.observacao
        , f.cliente_origem     =  new.cnpj
        , f.cliente_origem_cod = new.codigo
      where f.codforn = :codigo_forn;
    end 
  end 
end^

SET TERM ; ^

COMMENT ON TRIGGER TG_CLIENTE_GERAR_FORNECEDOR IS 'Trigger Gerar Fornecedor do Cliente.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   15/10/2013

Trigger responsavel por inserir/atualizar um registro de fornecedor corrrespondente ao registro do clientes quando for
permitido para este gerar NF-e de devolucao.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    29/01/2026 - IMR :
        * Insercao de novos dados para dar suporte a emissao de NF-e de acordo com a nova Reforma Tributaria.

    17/08/2014 - IMR :
        * Insercao na rotinas de novos campos referentes a dados financeiros (Banco, Agencia, Conta e Praca)
          para que o registro do cliente/fornecedor venha suportar ate 3 contas correntes diferentes.';



COMMENT ON TABLE TBCLIENTE IS 'Tabela de Clientes

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/01/2011

Tabela responsavel por armazenar os dados referentes aos clientes mantidos pelos sistemas de gestao.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    29/01/2026 - IMR :
        + Criacao dos campos ENTE_GOVERNAMENTAL e ADMININISTRACAO_PUBLICA  para dar suporte a emissao de NF-e de acordo
          com a nova Reforma Tributaria.

    19/01/2016 - IMR :
        + Criacao do campo BLOQUEADO_AUTOMATICO como referencial para o sistema de
          gestao identificar quais registros de clientes foram bloqueados de forma
          automatica por ele.

    26/05/2015 - IMR :
        + Criacao dos campos ATIVO para controle dos cadastros ativos.

    29/05/2014 - IMR :
        + Criacao do campos NOMEFANT para que seja possivel pesquisar clientes tambem pelo NOME FANTASIA, uma vez que
          o sistema esta permitindo apenas pela RAZAO SOCIAL (NOME).

    28/05/2014 - IMR :
        + Criacao dos campos BANCO, AGENCIA, CC e OBSERVACAO para atender solicitacoes do novo cliente.

    17/08/2014 - IMR :
        + Criacao de novos campos referentes a dados financeiros (Banco, Agencia, Conta e Praca)
          para que o registro do cliente venha suportar ate 3 contas correntes diferentes.';



COMMENT ON TABLE TBFORNECEDOR IS 'Tabela Fornecedores

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/01/2013

Tabela responsavel por armazenar os dados dos fornecedores cadastrados no sistema.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    29/01/2026 - IMR :
        + Criacao do campo ENTE_GOVERNAMENTAL para dar suporte a emissao de NF-e de acordo
          com a nova Reforma Tributaria.

    26/05/2015 - IMR :
        + Criacao dos campos ATIVO para controle dos cadastros ativos.

    28/05/2014 - IMR :
        + Criacao dos campos BANCO, AGENCIA, CC e OBSERVACAO para atender solicitacoes do novo cliente.

    22/05/2014 - IMR :
        + Criacao do campos NOMEFANT para que seja possivel pesquisar fornecedor tambem pelo NOME FANTASIA, uma vez que
          o sistema esta permitindo apenas pela RAZAO SOCIAL.

    17/08/2014 - IMR :
        + Criacao de novos campos referentes a dados financeiros (Banco, Agencia, Conta e Praca)
          para que o registro do fornecedor venha suportar ate 3 contas correntes diferentes.';



ALTER TABLE SYS_ALIQUOTA_ICMS
    ADD PERCENTUAL_REDUTOR_IBSCBS DMN_PERCENTUAL DEFAULT 0.0;

COMMENT ON COLUMN SYS_ALIQUOTA_ICMS.PERCENTUAL_REDUTOR_IBSCBS IS
'Percentual de 0 a 100';


SET TERM ^ ;

CREATE OR ALTER procedure GET_ALIQUOTA_ICMS (
    UF_ORIGEM DMN_VCHAR_02,
    UF_DESTINO DMN_VCHAR_02)
returns (
    ALIQUOTA_INTER DMN_PERCENTUAL,
    ALIQUOTA_INTRA DMN_PERCENTUAL,
    ALIQUOTA_ST DMN_PERCENTUAL,
    PERCENTUAL_REDUTOR_IBSCBS DMN_PERCENTUAL)
as
begin
  -- Buscando o ICMS Inter (Estado de Origem - ICMS do proprio Estado)
  Select first 1
      a.aliquota
    , coalesce(a.percentual_redutor_ibscbs, 0.0) as redutor_ibscbs
  from SYS_ALIQUOTA_ICMS a
  where a.uf_origem  = :uf_origem
    and a.uf_destino = :uf_origem
  Into
      aliquota_inter
    , percentual_redutor_ibscbs;

  -- Buscando o ICMS Intra (Estado de Destino)
  Select first 1
    a.aliquota
  from SYS_ALIQUOTA_ICMS a
  where a.uf_origem  = :uf_destino
    and a.uf_destino = :uf_destino
  Into
    aliquota_intra;

  -- Buscando o ICMS de Destino
  Select first 1
    a.aliquota
  from SYS_ALIQUOTA_ICMS a
  where a.uf_origem  = :uf_origem
    and a.uf_destino = :uf_destino
  Into
    aliquota_st;

  suspend;
end^

SET TERM ; ^



create view vw_tributacao_ibs_cbs
as
Select
    trb.tpt_cod as codigo
  , trb.tpt_descricao as descricao
  , trim(trb.tpt_cod || ' - ' || trb.tpt_descricao) as descricao_full
  , trb.crt as regime
from TBTRIBUTACAO_TIPO trb
where (trb.nrt = 1)
order by
    trb.tpt_cod
;


ALTER TABLE TBTRIBUTACAO_CLASSE
    ADD REDUCAO_IBS_PERC DMN_PERCENTUAL,
    ADD REDUCAO_CBS_PERC DMN_PERCENTUAL;

COMMENT ON COLUMN TBTRIBUTACAO_CLASSE.REDUCAO_IBS_PERC IS
'Percentual de Reducao do IBS';

COMMENT ON COLUMN TBTRIBUTACAO_CLASSE.REDUCAO_CBS_PERC IS
'Percentual de Reducao do CBS';

alter table TBTRIBUTACAO_CLASSE
alter CST position 1;

alter table TBTRIBUTACAO_CLASSE
alter CLASSE position 2;

alter table TBTRIBUTACAO_CLASSE
alter NOME position 3;

alter table TBTRIBUTACAO_CLASSE
alter DESCRICAO position 4;

alter table TBTRIBUTACAO_CLASSE
alter REDACAO position 5;

alter table TBTRIBUTACAO_CLASSE
alter TIPO position 6;

alter table TBTRIBUTACAO_CLASSE
alter REDUCAO_IBS position 7;

alter table TBTRIBUTACAO_CLASSE
alter REDUCAO_IBS_PERC position 8;

alter table TBTRIBUTACAO_CLASSE
alter REDUCAO_CBS position 9;

alter table TBTRIBUTACAO_CLASSE
alter REDUCAO_CBS_PERC position 10;

alter table TBTRIBUTACAO_CLASSE
alter TRIBUTACAO_REGULAR position 11;

alter table TBTRIBUTACAO_CLASSE
alter CREDITO_OPERACAO position 12;

alter table TBTRIBUTACAO_CLASSE
alter IMPOSTO_MONO_PADRAO position 13;

alter table TBTRIBUTACAO_CLASSE
alter IMPOSTO_MONO_RETENCAO position 14;

alter table TBTRIBUTACAO_CLASSE
alter IMPOSTO_MONO_RETIDA position 15;

alter table TBTRIBUTACAO_CLASSE
alter IMPOSTO_MONO_DIFERIMENTO position 16;

alter table TBTRIBUTACAO_CLASSE
alter ESTORNO_CREDITO position 17;

alter table TBTRIBUTACAO_CLASSE
alter USO_NFEABI position 18;

alter table TBTRIBUTACAO_CLASSE
alter USO_NFE position 19;

alter table TBTRIBUTACAO_CLASSE
alter USO_NFCE position 20;

alter table TBTRIBUTACAO_CLASSE
alter USO_NFSE position 21;



SET TERM ^ ;

CREATE trigger tg_tributacao_classe_reduz for tbtributacao_classe
active before insert or update position 0
AS
begin
  new.reducao_ibs_perc = coalesce(new.reducao_ibs_perc, 0.0);
  new.reducao_cbs_perc = coalesce(new.reducao_cbs_perc, 0.0);

  new.reducao_ibs = iif(coalesce(new.reducao_ibs_perc, 0.0) > 0.0, 1, 0);
  new.reducao_cbs = iif(coalesce(new.reducao_cbs_perc, 0.0) > 0.0, 1, 0);
end^

SET TERM ; ^



SET TERM ^ ;

CREATE OR ALTER trigger tg_tributacao_classe_reduz for tbtributacao_classe
active before insert or update position 0
AS
begin
  new.reducao_ibs_perc = coalesce(new.reducao_ibs_perc, 0.0);
  new.reducao_cbs_perc = coalesce(new.reducao_cbs_perc, 0.0);

  new.reducao_ibs = iif(coalesce(new.reducao_ibs_perc, 0.0) > 0.0, 1, 0);
  new.reducao_cbs = iif(coalesce(new.reducao_cbs_perc, 0.0) > 0.0, 1, 0);
end^

SET TERM ; ^

COMMENT ON TRIGGER TG_TRIBUTACAO_CLASSE_REDUZ IS 'Trigger Reducao IBS/CBS (Reforma Tributaria 2026)

    Autor   :   Isaque M. Ribeiro
    Data    :   27/04/2026

Trigger responsavel por definir o flag de reducao de IBS/CBS de acordo com os percentuais de reducao
informados.

Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    27/04/2026 - IMR :
        * Atualizacao/documentacao da trigger.';



SET TERM ^ ;

CREATE OR ALTER trigger tg_tributacao_classe_reduz for tbtributacao_classe
active before insert or update position 0
AS
begin
  if ((coalesce(new.descricao, '') != '') and (char_length(new.descricao) > 250)) then
    new.descricao = substring(trim(new.descricao) from 1 for 250);

  new.reducao_ibs_perc = coalesce(new.reducao_ibs_perc, 0.0);
  new.reducao_cbs_perc = coalesce(new.reducao_cbs_perc, 0.0);

  new.reducao_ibs = iif(coalesce(new.reducao_ibs_perc, 0.0) > 0.0, 1, 0);
  new.reducao_cbs = iif(coalesce(new.reducao_cbs_perc, 0.0) > 0.0, 1, 0);
end^

SET TERM ; ^



SET TERM ^ ;

CREATE OR ALTER trigger tg_tributacao_classe_reduz for tbtributacao_classe
active before insert or update position 0
AS
begin
  if ((coalesce(new.descricao, '') != '') and (char_length(new.descricao) > 250)) then
    new.descricao = substring(trim(new.descricao) from 1 for 200);

  new.reducao_ibs_perc = coalesce(new.reducao_ibs_perc, 0.0);
  new.reducao_cbs_perc = coalesce(new.reducao_cbs_perc, 0.0);

  new.reducao_ibs = iif(coalesce(new.reducao_ibs_perc, 0.0) > 0.0, 1, 0);
  new.reducao_cbs = iif(coalesce(new.reducao_cbs_perc, 0.0) > 0.0, 1, 0);
end^

SET TERM ; ^

