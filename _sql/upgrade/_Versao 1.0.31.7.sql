


/*------ SYSDBA 17/02/2022 09:14:08 --------*/

CREATE INDEX IDX_TBCONTPAG_DATAVENC_ASC
ON TBCONTPAG (DTVENC);

CREATE INDEX IDX_TBCONTPAG_QUITADO
ON TBCONTPAG (QUITADO);

CREATE DESCENDING INDEX IDX_TBCONTPAG_DATAVENC_DESC
ON TBCONTPAG (DTVENC);




/*------ SYSDBA 17/02/2022 09:16:01 --------*/

CREATE INDEX IDX_TBFORNECEDOR_CNPJ
ON TBFORNECEDOR (CNPJ);




/*------ SYSDBA 25/02/2022 18:37:53 --------*/

SET TERM ^ ;

CREATE trigger tg_contpag_baixa_seq for tbcontpag_baixa
active before insert position 0
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
end
^

SET TERM ; ^

COMMENT ON TRIGGER TG_CONTPAG_BAIXA_SEQ IS 'Trigger Registrar Sequencial (Baixa de Contas A Pagar)

    Autor   :   Isaque Marinho Ribeiro
    Data    :   25/02/2022

Trigger responsavel por gerar o sequencial para o registro de baixa quando este
nao for informado.';




/*------ SYSDBA 25/02/2022 18:39:17 --------*/

SET TERM ^ ;

CREATE trigger tg_contrec_baixa_seq for tbcontrec_baixa
active before insert position 0
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
end
^

SET TERM ; ^

COMMENT ON TRIGGER TG_CONTREC_BAIXA_SEQ IS 'Trigger Gerar Sequencial (Baixa de Contas A Receber)

    Autor   :   Isaque Marinho Ribeiro
    Data    :   25/02/2022

Trigger responsavel por gerar o sequencial para o registro de baixa quando este
nao for informado.';




/*------ SYSDBA 25/02/2022 18:39:27 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_contpag_baixa_seq for tbcontpag_baixa
active before insert position 0
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
end
^

SET TERM ; ^

COMMENT ON TRIGGER TG_CONTPAG_BAIXA_SEQ IS 'Trigger Gerar Sequencial (Baixa de Contas A Pagar)

    Autor   :   Isaque Marinho Ribeiro
    Data    :   25/02/2022

Trigger responsavel por gerar o sequencial para o registro de baixa quando este
nao for informado.';

