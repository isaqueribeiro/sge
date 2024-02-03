CREATE DOMAIN DMN_LOGICO_NULL AS
SMALLINT
DEFAULT 0
CHECK (value between 0 and 1);


ALTER TABLE TBCAIXA
    ADD CONFERIDO DMN_LOGICO_NULL,
    ADD USUARIO_CONFER DMN_USUARIO,
    ADD DATAHORA_CONFER DMN_DATETIME;

COMMENT ON COLUMN TBCAIXA.CONFERIDO IS
'Caixa conferido:
0 - Nao
1 - Sim';

COMMENT ON COLUMN TBCAIXA.USUARIO_CONFER IS
'Usuario da conferencia';

COMMENT ON COLUMN TBCAIXA.DATAHORA_CONFER IS
'Data/hora da conferencia';



COMMENT ON TABLE TBCAIXA IS 'Tabela Caixa (Fluxo)

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/01/2013

Tabela responsavel por armazenar todos os registros de caixa.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    28/10/2015 - IMR:
        + Criacao dos campos CONFERIDO, USUARIO_CONFER e DATAHORA_CONFER para documentar as conferencias do caixa
          feitas pelo gerencia financeira da instituicao.';



COMMENT ON TABLE TBCAIXA IS 'Tabela Caixa (Fluxo)

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/01/2013

Tabela responsavel por armazenar todos os registros de caixa.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    02/02/2024 - IMR:
        + Criacao dos campos CONFERIDO, USUARIO_CONFER e DATAHORA_CONFER para documentar as conferencias do caixa
          feitas pelo gerencia financeira da instituicao.';



ALTER TABLE TBCAIXA
ADD CONSTRAINT FK_TBCAIXA_USUARIO_CONFER
FOREIGN KEY (USUARIO_CONFER)
REFERENCES TBUSERS(NOME);



CREATE INDEX IDX_TBCAIXA_CONFERIDO
ON TBCAIXA (CONFERIDO);



SET TERM ^ ;

CREATE OR ALTER trigger tg_caixa_numero for tbcaixa
active before insert position 0
AS
begin
  if (new.numero is null) then
  begin
    Select
      g.generator_id
    from GET_GENERATOR('GEN_CAIXA', cast(new.ano as varchar(4))) g
    Into
      new.numero;
  end

  new.conferido = 0;
end^

SET TERM ; ^



ALTER TABLE TBCAIXA_MOVIMENTO
    ADD CONFERIDO DMN_LOGICO_NULL;

COMMENT ON COLUMN TBCAIXA_MOVIMENTO.CONFERIDO IS
'Movimento conferido:
0 - Nao
1 - Sim';



CREATE INDEX IDX_TBCAIXA_MOVIMENTO_CONF
ON TBCAIXA_MOVIMENTO (CONFERIDO);

SET TERM ^ ;

CREATE OR ALTER trigger tg_caixa_movimento_numero for tbcaixa_movimento
active before insert position 0
AS
begin
  IF (New.Numero IS NULL) Then
  begin
    Select
      g.generator_id
    from GET_GENERATOR('GEN_CX_MOVIMENTO', cast(new.ano as varchar(4))) g
    Into
      new.Numero;
  end

  new.conferido = 0;
end^

SET TERM ; ^

Update TBCAIXA Set conferido = 0 where coalesce(conferido, -1) < 0;

Update TBCAIXA_MOVIMENTO Set conferido = 0 where coalesce(conferido, -1) < 0;




CREATE DESCENDING INDEX IDX_TBCAIXA_MOVIMENTO_DATAD
ON TBCAIXA_MOVIMENTO (DATAHORA);

