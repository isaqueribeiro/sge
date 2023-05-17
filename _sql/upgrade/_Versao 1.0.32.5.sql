/*------ SYSDBA 03/05/2023 23:43:04 --------*/

ALTER TABLE TBUSERS
    ADD CODIGO DMN_INTEGER_NN DEFAULT 0;

COMMENT ON COLUMN TBUSERS.CODIGO IS
'Codigo';



/*------ SYSDBA 03/05/2023 23:47:08 --------*/

execute block
as
  declare variable codigo DMN_INTEGER_N;
  declare variable login DMN_USUARIO;
begin
  Select
    max(usr.codigo)
  from TBUSERS usr
  Into
    codigo;

  codigo = coalesce(:codigo, 0) + 1;

  for
    Select
      usr.nome
    from TBUSERS usr
    where (coalesce(usr.codigo, 0) = 0)
    Order by
      usr.nome
    Into
      login
  do
  begin
    Update TBUSERS usr Set
      usr.codigo = :codigo
    where (usr.nome = :login)
      and (coalesce(usr.codigo, 0) = 0);

    codigo = (:codigo + 1);
  end
end;

/*------ SYSDBA 03/05/2023 23:47:12 --------*/

COMMIT WORK;


/*------ SYSDBA 04/05/2023 13:45:35 --------*/

ALTER TABLE TBFUNCAO
    ADD ATIVO DMN_LOGICO;


/*------ SYSDBA 04/05/2023 13:45:39 --------*/

UPDATE TBFUNCAO
SET ATIVO = 1;

/*----------- OBJETOS PENDENTES -----------*/

CREATE OR ALTER TRIGGER TG_CONTPAG_BAIXA_SEQ FOR TBCONTPAG_BAIXA
ACTIVE
BEFORE INSERT
POSITION 0 
AS
begin
  if (coalesce(new.seq, 0) = 0) then
  begin
    Select
      max(new.seq)
    from TBCONTPAG_BAIXA a
    where (a.anolanc = new.anolanc)
      and (a.numlanc = new.numlanc)
    Into
      new.seq;

    new.seq = (coalesce(new.seq, 0) + 1);
  end
end;

CREATE OR ALTER TRIGGER TG_CONTREC_BAIXA_SEQ FOR TBCONTREC_BAIXA
ACTIVE
BEFORE INSERT
POSITION 0 
AS
begin
  if (coalesce(new.seq, 0) = 0) then
  begin
    Select
      max(new.seq)
    from TBCONTREC_BAIXA a
    where (a.anolanc = new.anolanc)
      and (a.numlanc = new.numlanc)
    Into
      new.seq;

    new.seq = (coalesce(new.seq, 0) + 1);
  end
end;

CREATE INDEX IDX_TBCLIENTE_CELULAR
  ON TBCLIENTE (FONECEL);

CREATE INDEX IDX_TBCLIENTE_EMAIL
  ON TBCLIENTE (EMAIL);

CREATE INDEX IDX_TBCLIENTE_FONE
  ON TBCLIENTE (FONE);

CREATE INDEX IDX_TBCONTA_CORRENTE_SALDO_DT1
  ON TBCONTA_CORRENTE_SALDO (DATA_SALDO);

CREATE DESC INDEX IDX_TBCONTA_CORRENTE_SALDO_DT2
  ON TBCONTA_CORRENTE_SALDO (DATA_SALDO);

CREATE INDEX IDX_TBCONTPAG_DATAVENC_ASC
  ON TBCONTPAG (DTVENC);

CREATE DESC INDEX IDX_TBCONTPAG_DATAVENC_DESC
  ON TBCONTPAG (DTVENC);

CREATE INDEX IDX_TBCONTPAG_QUITADO
  ON TBCONTPAG (QUITADO);

CREATE INDEX IDX_TBFORNECEDOR_CNPJ
  ON TBFORNECEDOR (CNPJ);

CREATE INDEX IDX_TBPRODUTO_ARQUIVO_MORTO
  ON TBPRODUTO (ARQUIVO_MORTO);

ALTER TABLE TBPRODUTO_CLIENTE ADD CONSTRAINT FK_TBPRODUTO_CLIENTE_PRD FOREIGN KEY (PRODUTO) REFERENCES TBPRODUTO (COD) ON UPDATE CASCADE ON DELETE CASCADE;


