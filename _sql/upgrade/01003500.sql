

ALTER TABLE TBREQUISICAO_ALMOX
    ADD RESPOSAVEL_RETIRADA DMN_VCHAR_150;

COMMENT ON COLUMN TBREQUISICAO_ALMOX.RESPOSAVEL_RETIRADA IS
'Responsavel pela retirada';



alter table TBREQUISICAO_ALMOX
alter column ANO position 1;

alter table TBREQUISICAO_ALMOX
alter column CONTROLE position 2;

alter table TBREQUISICAO_ALMOX
alter column NUMERO position 3;

alter table TBREQUISICAO_ALMOX
alter column EMPRESA position 4;

alter table TBREQUISICAO_ALMOX
alter column TIPO position 5;

alter table TBREQUISICAO_ALMOX
alter column CCUSTO_ORIGEM position 6;

alter table TBREQUISICAO_ALMOX
alter column CCUSTO_DESTINO position 7;

alter table TBREQUISICAO_ALMOX
alter column INSERCAO_DATA position 8;

alter table TBREQUISICAO_ALMOX
alter column INSERCAO_USUARIO position 9;

alter table TBREQUISICAO_ALMOX
alter column DATA_EMISSAO position 10;

alter table TBREQUISICAO_ALMOX
alter column REQUISITANTE position 11;

alter table TBREQUISICAO_ALMOX
alter column COMPETENCIA position 12;

alter table TBREQUISICAO_ALMOX
alter column STATUS position 13;

alter table TBREQUISICAO_ALMOX
alter column MOTIVO position 14;

alter table TBREQUISICAO_ALMOX
alter column OBS position 15;

alter table TBREQUISICAO_ALMOX
alter column VALOR_TOTAL position 16;

alter table TBREQUISICAO_ALMOX
alter column ATENDIMENTO_USUARIO position 17;

alter table TBREQUISICAO_ALMOX
alter column ATENDIMENTO_DATA position 18;

alter table TBREQUISICAO_ALMOX
alter column CANCEL_USUARIO position 19;

alter table TBREQUISICAO_ALMOX
alter column CANCEL_DATA position 20;

alter table TBREQUISICAO_ALMOX
alter column CANCEL_MOTIVO position 21;

alter table TBREQUISICAO_ALMOX
alter column RESPOSAVEL_RETIRADA position 22;

alter table TBREQUISICAO_ALMOX
alter column VEICULO position 23;

alter table TBREQUISICAO_ALMOX
alter column MOTORISTA position 24;

ALTER TABLE TBREQUISICAO_ALMOX ALTER RESPOSAVEL_RETIRADA TO RESPONSAVEL_RETIRADA;

