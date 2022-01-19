


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

