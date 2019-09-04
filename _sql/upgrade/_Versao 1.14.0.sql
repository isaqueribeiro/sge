


/*------ SYSDBA 17/07/2019 16:00:35 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_vendasitens_custo for tvendasitens
active before insert or update position 30
AS
begin
  Select
      p.customedio
    , p.customedio * coalesce(new.qtde, 0.0)
  from TBPRODUTO p
  where (p.cod = new.codprod)
  Into
      new.pcusto
    , new.total_custo;
end^

SET TERM ; ^




/*------ SYSDBA 17/07/2019 16:00:54 --------*/

COMMENT ON COLUMN TVENDASITENS.CODPROD IS
'Produto';




/*------ SYSDBA 04/09/2019 08:37:41 --------*/

ALTER TABLE TBVENDAS
    ADD LOTE_NFE_CODIGO DMN_INTEGER_N;

COMMENT ON COLUMN TBVENDAS.LOTE_NFE_CODIGO IS
'Código do lote de envio (Interno para NFe.Ide.cNF - Componente ACBr).';

alter table TBVENDAS
alter ANO position 1;

alter table TBVENDAS
alter CODCONTROL position 2;

alter table TBVENDAS
alter CODEMP position 3;

alter table TBVENDAS
alter CODCLIENTE position 4;

alter table TBVENDAS
alter CODCLI position 5;

alter table TBVENDAS
alter DTVENDA position 6;

alter table TBVENDAS
alter COMPETENCIA position 7;

alter table TBVENDAS
alter STATUS position 8;

alter table TBVENDAS
alter TOTALVENDA_BRUTA position 9;

alter table TBVENDAS
alter DESCONTO position 10;

alter table TBVENDAS
alter DESCONTO_CUPOM position 11;

alter table TBVENDAS
alter TOTALVENDA position 12;

alter table TBVENDAS
alter TOTALCUSTO position 13;

alter table TBVENDAS
alter INDEX_VALOR position 14;

alter table TBVENDAS
alter DTFINALIZACAO_VENDA position 15;

alter table TBVENDAS
alter OBS position 16;

alter table TBVENDAS
alter DADOS_ENTREGA position 17;

alter table TBVENDAS
alter FORMAPAG position 18;

alter table TBVENDAS
alter FATDIAS position 19;

alter table TBVENDAS
alter SERIE position 20;

alter table TBVENDAS
alter NFE position 21;

alter table TBVENDAS
alter MODELO_NF position 22;

alter table TBVENDAS
alter DATAEMISSAO position 23;

alter table TBVENDAS
alter HORAEMISSAO position 24;

alter table TBVENDAS
alter CFOP position 25;

alter table TBVENDAS
alter VERIFICADOR_NFE position 26;

alter table TBVENDAS
alter XML_NFE position 27;

alter table TBVENDAS
alter XML_NFE_FILENAME position 28;

alter table TBVENDAS
alter VENDEDOR_COD position 29;

alter table TBVENDAS
alter USUARIO position 30;

alter table TBVENDAS
alter FORMAPAGTO_COD position 31;

alter table TBVENDAS
alter CONDICAOPAGTO_COD position 32;

alter table TBVENDAS
alter VENDA_PRAZO position 33;

alter table TBVENDAS
alter PRAZO_01 position 34;

alter table TBVENDAS
alter PRAZO_02 position 35;

alter table TBVENDAS
alter PRAZO_03 position 36;

alter table TBVENDAS
alter PRAZO_04 position 37;

alter table TBVENDAS
alter PRAZO_05 position 38;

alter table TBVENDAS
alter PRAZO_06 position 39;

alter table TBVENDAS
alter PRAZO_07 position 40;

alter table TBVENDAS
alter PRAZO_08 position 41;

alter table TBVENDAS
alter PRAZO_09 position 42;

alter table TBVENDAS
alter PRAZO_10 position 43;

alter table TBVENDAS
alter PRAZO_11 position 44;

alter table TBVENDAS
alter PRAZO_12 position 45;

alter table TBVENDAS
alter LOTE_NFE_ANO position 46;

alter table TBVENDAS
alter LOTE_NFE_NUMERO position 47;

alter table TBVENDAS
alter LOTE_NFE_CODIGO position 48;

alter table TBVENDAS
alter LOTE_NFE_RECIBO position 49;

alter table TBVENDAS
alter NFE_ENVIADA position 50;

alter table TBVENDAS
alter NFE_DENEGADA position 51;

alter table TBVENDAS
alter NFE_DENEGADA_MOTIVO position 52;

alter table TBVENDAS
alter CANCEL_USUARIO position 53;

alter table TBVENDAS
alter CANCEL_DATAHORA position 54;

alter table TBVENDAS
alter CANCEL_MOTIVO position 55;

alter table TBVENDAS
alter NFE_MODALIDADE_FRETE position 56;

alter table TBVENDAS
alter NFE_TRANSPORTADORA position 57;

alter table TBVENDAS
alter NFE_PLACA_VEICULO position 58;

alter table TBVENDAS
alter NFE_PLACA_UF position 59;

alter table TBVENDAS
alter NFE_PLACA_RNTC position 60;

alter table TBVENDAS
alter NFE_VALOR_BASE_ICMS position 61;

alter table TBVENDAS
alter NFE_VALOR_ICMS position 62;

alter table TBVENDAS
alter NFE_VALOR_BASE_ICMS_SUBST position 63;

alter table TBVENDAS
alter NFE_VALOR_ICMS_SUBST position 64;

alter table TBVENDAS
alter NFE_VALOR_TOTAL_PRODUTO position 65;

alter table TBVENDAS
alter NFE_VALOR_FRETE position 66;

alter table TBVENDAS
alter NFE_VALOR_SEGURO position 67;

alter table TBVENDAS
alter NFE_VALOR_DESCONTO position 68;

alter table TBVENDAS
alter NFE_VALOR_TOTAL_II position 69;

alter table TBVENDAS
alter NFE_VALOR_TOTAL_IPI position 70;

alter table TBVENDAS
alter NFE_VALOR_PIS position 71;

alter table TBVENDAS
alter NFE_VALOR_COFINS position 72;

alter table TBVENDAS
alter NFE_VALOR_OUTROS position 73;

alter table TBVENDAS
alter NFE_VALOR_TOTAL_NOTA position 74;

alter table TBVENDAS
alter CUSTO_OPER_PERCENTUAL position 75;

alter table TBVENDAS
alter CUSTO_OPER_FRETE position 76;

alter table TBVENDAS
alter CUSTO_OPER_OUTROS position 77;

alter table TBVENDAS
alter GERAR_ESTOQUE_CLIENTE position 78;

alter table TBVENDAS
alter CAIXA_ANO position 79;

alter table TBVENDAS
alter CAIXA_NUM position 80;

alter table TBVENDAS
alter CAIXA_PDV position 81;

alter table TBVENDAS
alter DNFE_COMPRA_ANO position 82;

alter table TBVENDAS
alter DNFE_COMPRA_COD position 83;

alter table TBVENDAS
alter DNFE_FORMA position 84;

alter table TBVENDAS
alter DNFE_UF position 85;

alter table TBVENDAS
alter DNFE_CNPJ_CPF position 86;

alter table TBVENDAS
alter DNFE_IE position 87;

alter table TBVENDAS
alter DNFE_COMPETENCIA position 88;

alter table TBVENDAS
alter DNFE_SERIE position 89;

alter table TBVENDAS
alter DNFE_NUMERO position 90;

alter table TBVENDAS
alter DNFE_MODELO position 91;

alter table TBVENDAS
alter DNFE_CHAVE position 92;

alter table TBVENDAS
alter DECF_MODELO position 93;

alter table TBVENDAS
alter DECF_NUMERO position 94;

alter table TBVENDAS
alter DECF_COO position 95;




/*------ SYSDBA 04/09/2019 08:37:52 --------*/

ALTER TABLE TBVENDAS ALTER COLUMN LOTE_NFE_NUMERO TYPE DMN_INTEGER_N;




/*------ SYSDBA 04/09/2019 08:39:31 --------*/

ALTER TABLE TBCOMPRAS ALTER COLUMN LOTE_NFE_NUMERO TYPE DMN_INTEGER_N;




/*------ SYSDBA 04/09/2019 08:40:09 --------*/

ALTER TABLE TBCOMPRAS
    ADD LOTE_NFE_CODIGO DMN_INTEGER_N;

COMMENT ON COLUMN TBCOMPRAS.LOTE_NFE_CODIGO IS
'Código do lote de envio (Interno para NFe.Ide.cNF - Componente ACBr).';

alter table TBCOMPRAS
alter ANO position 1;

alter table TBCOMPRAS
alter CODCONTROL position 2;

alter table TBCOMPRAS
alter CODEMP position 3;

alter table TBCOMPRAS
alter CODFORN position 4;

alter table TBCOMPRAS
alter TIPO_ENTRADA position 5;

alter table TBCOMPRAS
alter TIPO_DOCUMENTO position 6;

alter table TBCOMPRAS
alter TIPO_MOVIMENTO position 7;

alter table TBCOMPRAS
alter NF position 8;

alter table TBCOMPRAS
alter NFSERIE position 9;

alter table TBCOMPRAS
alter MODELO_NF position 10;

alter table TBCOMPRAS
alter LOTE_NFE_ANO position 11;

alter table TBCOMPRAS
alter LOTE_NFE_NUMERO position 12;

alter table TBCOMPRAS
alter LOTE_NFE_CODIGO position 13;

alter table TBCOMPRAS
alter LOTE_NFE_RECIBO position 14;

alter table TBCOMPRAS
alter NFE_ENVIADA position 15;

alter table TBCOMPRAS
alter NFE_DENEGADA position 16;

alter table TBCOMPRAS
alter NFE_DENEGADA_MOTIVO position 17;

alter table TBCOMPRAS
alter VERIFICADOR_NFE position 18;

alter table TBCOMPRAS
alter XML_NFE position 19;

alter table TBCOMPRAS
alter XML_NFE_FILENAME position 20;

alter table TBCOMPRAS
alter DTLANCAMENTO position 21;

alter table TBCOMPRAS
alter DTEMISS position 22;

alter table TBCOMPRAS
alter HREMISS position 23;

alter table TBCOMPRAS
alter DTENT position 24;

alter table TBCOMPRAS
alter NFCFOP position 25;

alter table TBCOMPRAS
alter NATUREZA position 26;

alter table TBCOMPRAS
alter STATUS position 27;

alter table TBCOMPRAS
alter CALCULAR_TOTAIS position 28;

alter table TBCOMPRAS
alter IPI position 29;

alter table TBCOMPRAS
alter ICMSBASE position 30;

alter table TBCOMPRAS
alter ICMSVALOR position 31;

alter table TBCOMPRAS
alter ICMSSUBSTBASE position 32;

alter table TBCOMPRAS
alter ICMSSUBSTVALOR position 33;

alter table TBCOMPRAS
alter FRETE position 34;

alter table TBCOMPRAS
alter OUTROSCUSTOS position 35;

alter table TBCOMPRAS
alter DESCONTO position 36;

alter table TBCOMPRAS
alter VALORSEGURO position 37;

alter table TBCOMPRAS
alter VALORTOTAL_II position 38;

alter table TBCOMPRAS
alter VALORTOTAL_IPI position 39;

alter table TBCOMPRAS
alter VALORPIS position 40;

alter table TBCOMPRAS
alter VALORCOFINS position 41;

alter table TBCOMPRAS
alter TOTALPROD position 42;

alter table TBCOMPRAS
alter TOTALNF position 43;

alter table TBCOMPRAS
alter INDEX_VALOR position 44;

alter table TBCOMPRAS
alter OBS position 45;

alter table TBCOMPRAS
alter USUARIO position 46;

alter table TBCOMPRAS
alter FORMAPAGTO_COD position 47;

alter table TBCOMPRAS
alter CONDICAOPAGTO_COD position 48;

alter table TBCOMPRAS
alter COMPRA_PRAZO position 49;

alter table TBCOMPRAS
alter PRAZO_01 position 50;

alter table TBCOMPRAS
alter PRAZO_02 position 51;

alter table TBCOMPRAS
alter PRAZO_03 position 52;

alter table TBCOMPRAS
alter PRAZO_04 position 53;

alter table TBCOMPRAS
alter PRAZO_05 position 54;

alter table TBCOMPRAS
alter PRAZO_06 position 55;

alter table TBCOMPRAS
alter PRAZO_07 position 56;

alter table TBCOMPRAS
alter PRAZO_08 position 57;

alter table TBCOMPRAS
alter PRAZO_09 position 58;

alter table TBCOMPRAS
alter PRAZO_10 position 59;

alter table TBCOMPRAS
alter PRAZO_11 position 60;

alter table TBCOMPRAS
alter PRAZO_12 position 61;

alter table TBCOMPRAS
alter DTFINALIZACAO_COMPRA position 62;

alter table TBCOMPRAS
alter TIPO_DESPESA position 63;

alter table TBCOMPRAS
alter CANCEL_USUARIO position 64;

alter table TBCOMPRAS
alter CANCEL_DATAHORA position 65;

alter table TBCOMPRAS
alter CANCEL_MOTIVO position 66;

alter table TBCOMPRAS
alter AUTORIZACAO_ANO position 67;

alter table TBCOMPRAS
alter AUTORIZACAO_CODIGO position 68;

alter table TBCOMPRAS
alter AUTORIZACAO_EMPRESA position 69;

alter table TBCOMPRAS
alter DNFE_ENTRADA_ANO position 70;

alter table TBCOMPRAS
alter DNFE_ENTRADA_COD position 71;

alter table TBCOMPRAS
alter DNFE_SAIDA_ANO position 72;

alter table TBCOMPRAS
alter DNFE_SAIDA_COD position 73;

alter table TBCOMPRAS
alter DNFE_FORMA position 74;

alter table TBCOMPRAS
alter DNFE_UF position 75;

alter table TBCOMPRAS
alter DNFE_CNPJ_CPF position 76;

alter table TBCOMPRAS
alter DNFE_IE position 77;

alter table TBCOMPRAS
alter DNFE_COMPETENCIA position 78;

alter table TBCOMPRAS
alter DNFE_SERIE position 79;

alter table TBCOMPRAS
alter DNFE_NUMERO position 80;

alter table TBCOMPRAS
alter DNFE_MODELO position 81;

alter table TBCOMPRAS
alter DNFE_CHAVE position 82;

alter table TBCOMPRAS
alter DECF_MODELO position 83;

alter table TBCOMPRAS
alter DECF_NUMERO position 84;

alter table TBCOMPRAS
alter DECF_COO position 85;

