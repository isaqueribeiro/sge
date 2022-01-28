


/*------ SYSDBA 19/01/2022 10:33:39 --------*/

CREATE OR ALTER VIEW VW_FORMA_PAGTO_NFC_E(
    CODIGO,
    DESCRICAO)
AS
Select first 1 '01' as codigo, 'Dinheiro' as descricao          from rdb$database union
Select first 1 '02' as codigo, 'Cheque' as descricao            from rdb$database union
Select first 1 '03' as codigo, 'Cartao de Credito' as descricao from rdb$database union
Select first 1 '04' as codigo, 'Cartao de Debito' as descricao  from rdb$database union
Select first 1 '05' as codigo, 'Credito Loja' as descricao      from rdb$database union
Select first 1 '06' as codigo, 'Boleto Bancario' as descricao   from rdb$database union
Select first 1 '07' as codigo, 'Deposito Bancario' as descricao from rdb$database union
Select first 1 '08' as codigo, 'Pix - Pagamento Instantaneo' as descricao from rdb$database union
Select first 1 '09' as codigo, 'Transferencia Bancaria' as descricao      from rdb$database union
Select first 1 '10' as codigo, 'Vale Alimentacao' as descricao  from rdb$database union
Select first 1 '11' as codigo, 'Vale Refeicao' as descricao     from rdb$database union
Select first 1 '12' as codigo, 'Vale Presente' as descricao     from rdb$database union
Select first 1 '13' as codigo, 'Vale Combustivel' as descricao  from rdb$database union
Select first 1 '14' as codigo, 'Duplicata Mercantil' as descricao from rdb$database union
Select first 1 '15' as codigo, 'Programa Fidelidade' as descricao from rdb$database union
Select first 1 '99' as codigo, 'Outros' as descricao              from rdb$database


;




/*------ SYSDBA 21/01/2022 12:06:42 --------*/

CREATE DESCENDING INDEX IDX_TBCONTA_CORRENTE_SALDO_DT2
ON TBCONTA_CORRENTE_SALDO (DATA_SALDO);

CREATE INDEX IDX_TBCONTA_CORRENTE_SALDO_DT1
ON TBCONTA_CORRENTE_SALDO (DATA_SALDO);




/*------ SYSDBA 21/01/2022 16:36:41 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_CONTA_CORRENTE_SALDO (
    CONTA_CORRENTE integer,
    DATA_MOVIMENTO date)
as
declare variable data_saldo Date;
declare variable DATA_SALDO_ANT date;
declare variable VALOR_SALDO_ANT numeric(15,2);
declare variable TOTAL_CREDITO_DIA numeric(15,2);
declare variable TOTAL_DEBITO_DIA numeric(15,2);
declare variable TOTAL_SALDO_DIA numeric(15,2);
begin
  -- Identificar a maior data de saldo anterior a data informada
  Select
    max(s2.Data_saldo)
  from TBCONTA_CORRENTE_SALDO s2
  where (s2.Codigo     = :Conta_corrente)
    and (s2.Data_saldo < :Data_movimento)
  Into
    data_saldo;

  -- Buscar Saldo anterior
  Select
      s1.Data_saldo
    , s1.Valor_saldo
  from TBCONTA_CORRENTE_SALDO s1
  where (s1.Codigo     = :Conta_corrente)
    and (s1.Data_saldo = :data_saldo)
  into
      Data_saldo_ant
    , Valor_saldo_ant;

  -- Gravar Saldo anterior caso nao exista
  if ( :Data_saldo_ant is null ) then
  begin
    Data_saldo_ant  = :Data_movimento - 1;
    Valor_saldo_ant = 0;

    Insert Into TBCONTA_CORRENTE_SALDO (
        Codigo
      , Data_saldo
      , Valor_saldo
    ) values (
        :Conta_corrente
      , :Data_saldo_ant
      , :Valor_saldo_ant
    );
  end 

  -- Consolidar Creditos e Debitos do dia
  Select
      sum( Case when upper(m.Tipo) = 'C' then m.Valor else 0 end )
    , sum( Case when upper(m.Tipo) = 'D' then m.Valor else 0 end )
  from TBCAIXA_MOVIMENTO m
  where m.Situacao = 1 -- Confirmado
    and m.Conta_corrente = :Conta_corrente
    and cast(m.Datahora as Date ) = :Data_movimento
  into
      Total_credito_dia
    , Total_debito_dia;

  Total_saldo_dia = :Valor_saldo_ant + coalesce(:Total_credito_dia, 0) - coalesce(:Total_debito_dia, 0);

  /* Gerar Saldo Conta Corrente do Dia */
  if ( not Exists(
    Select
      s3.Codigo
    from TBCONTA_CORRENTE_SALDO s3
    where s3.Codigo = :Conta_corrente
      and s3.Data_saldo = :Data_movimento
  ) ) then
  begin

    -- Inserir Saldo do Dia
    Insert Into TBCONTA_CORRENTE_SALDO (
        Codigo
      , Data_saldo
      , Valor_saldo
    ) values (
        :Conta_corrente
      , :Data_movimento
      , :Total_saldo_dia
    );

   end
   else
   begin

     -- Atualizar Saldo do Dia
     Update TBCONTA_CORRENTE_SALDO s Set
       s.Valor_saldo = :Total_saldo_dia
     where s.Codigo = :Conta_corrente
       and s.Data_saldo = :Data_movimento;

   end 
end
^

SET TERM ; ^




/*------ SYSDBA 21/01/2022 16:37:44 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_CONTA_CORRENTE_SALDO_V2 (
    CONTA_CORRENTE integer,
    DATA_INICIAL date,
    DATA_FINAL date)
as
declare variable DATA_MOVIMENTO date;
declare variable data_saldo Date;
declare variable DATA_SALDO_ANT date;
declare variable VALOR_SALDO_ANT numeric(15,2);
declare variable TOTAL_CREDITO_DIA numeric(15,2);
declare variable TOTAL_DEBITO_DIA numeric(15,2);
declare variable TOTAL_SALDO_DIA numeric(15,2);
begin
    -- Montar Periodo
    data_movimento = :data_inicial;
    while (:data_movimento <= :data_final) do
    begin

      -- Identificar a maior data de saldo anterior a data informada
      Select
        max(s2.Data_saldo)
      from TBCONTA_CORRENTE_SALDO s2
      where (s2.Codigo     = :Conta_corrente)
        and (s2.Data_saldo < :Data_movimento)
      Into
        data_saldo;
    
      -- Buscar Saldo anterior
      Select
          s1.Data_saldo
        , s1.Valor_saldo
      from TBCONTA_CORRENTE_SALDO s1
      where (s1.Codigo     = :Conta_corrente)
        and (s1.Data_saldo = :data_saldo)
      into
          Data_saldo_ant
        , Valor_saldo_ant;
    
      -- Gravar Saldo anterior caso nao exista
      if ( :Data_saldo_ant is null ) then
      begin
        Data_saldo_ant  = :Data_movimento - 1;
        Valor_saldo_ant = 0;
    
        Insert Into TBCONTA_CORRENTE_SALDO (
            Codigo
          , Data_saldo
          , Valor_saldo
        ) values (
            :Conta_corrente
          , :Data_saldo_ant
          , :Valor_saldo_ant
        );
      end 
    
      -- Consolidar Creditos e Debitos do dia
      Select
          sum( Case when upper(m.Tipo) = 'C' then m.Valor else 0 end )
        , sum( Case when upper(m.Tipo) = 'D' then m.Valor else 0 end )
      from TBCAIXA_MOVIMENTO m
      where m.Situacao = 1 -- Confirmado
        and m.Conta_corrente = :Conta_corrente
        and cast(m.Datahora as Date ) = :Data_movimento
      into
          Total_credito_dia
        , Total_debito_dia;
    
      Total_saldo_dia = :Valor_saldo_ant + coalesce(:Total_credito_dia, 0) - coalesce(:Total_debito_dia, 0);
    
      /* Gerar Saldo Conta Corrente do Dia */
      if ( not Exists(
        Select
          s3.Codigo
        from TBCONTA_CORRENTE_SALDO s3
        where s3.Codigo = :Conta_corrente
          and s3.Data_saldo = :Data_movimento
      ) ) then
      begin
    
        -- Inserir Saldo do Dia
        Insert Into TBCONTA_CORRENTE_SALDO (
            Codigo
          , Data_saldo
          , Valor_saldo
        ) values (
            :Conta_corrente
          , :Data_movimento
          , :Total_saldo_dia
        );
    
      end
      else
      begin
    
         -- Atualizar Saldo do Dia
         Update TBCONTA_CORRENTE_SALDO s Set
           s.Valor_saldo = :Total_saldo_dia
         where s.Codigo = :Conta_corrente
           and s.Data_saldo = :Data_movimento;
    
       end 

       -- Proxima data
       data_movimento = dateadd(day, 1, :data_movimento);
    end
end
^

SET TERM ; ^




/*------ SYSDBA 26/01/2022 11:19:31 --------*/

COMMENT ON COLUMN TBFORMPAGTO.FORMAPAGTO_NFCE IS
'Forma de Pagamento para NFC-e (Campo Obrigatorio):
01 - Dinheiro
02 - Cheque
03 - Cartao de Credito
04 - Cartao de Debito
05 - Credito Loja
06 - Boleto
07 - Deposito
08 - Pix
09 - Transferencia
10 - Vale Alimentacao
11 - Vale Refeicao
12 - Vale Presente
13 - Vale Combustivel
14 - Duplicata
99 - Outros

TpcnFormaPagamento = (fpDinheiro, fpCheque, fpCartaoCredito, fpCartaoDebito, fpCreditoLoja,
                      fpValeAlimentacao, fpValeRefeicao, fpValePresente, fpValeCombustivel,
                      fpDuplicataMercantil, fpBoletoBancario, fpDepositoBancario,
                      fpPagamentoInstantaneo, fpTransfBancario, fpProgramaFidelidade,
                      fpSemPagamento, fpRegimeEspecial, fpOutro);';




/*------ SYSDBA 26/01/2022 11:19:45 --------*/

CREATE INDEX IDX_TBFORMPAGTO_NFCE
ON TBFORMPAGTO (FORMAPAGTO_NFCE);




/*------ SYSDBA 27/01/2022 10:53:24 --------*/

CREATE INDEX IDX_TBCAIXA_DATA_ASC
ON TBCAIXA (DATA_ABERTURA);

CREATE DESCENDING INDEX IDX_TBCAIXA_DATA_DESC
ON TBCAIXA (DATA_ABERTURA);




/*------ SYSDBA 27/01/2022 10:54:08 --------*/

CREATE INDEX IDX_TBCAIXA_SITUACAO
ON TBCAIXA (SITUACAO);




/*------ SYSDBA 27/01/2022 12:59:20 --------*/

CREATE INDEX IDX_TBBANCO_BOLETO_BNC_EMP
ON TBBANCO_BOLETO (BCO_COD,EMPRESA);

