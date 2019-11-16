


/*------ SYSDBA 15/11/2019 19:05:33 --------*/

ALTER TABLE TBVENDAS_VOLUME
    ADD CUBAGEM DMN_PERCENTUAL_4;

COMMENT ON COLUMN TBVENDAS_VOLUME.CUBAGEM IS
'Cubagem (m3) dos produtos da venda.

Observacao: Para lancamento livre ou calculado (Largura x Altura x Espessura).';




/*------ SYSDBA 15/11/2019 19:10:13 --------*/

COMMENT ON COLUMN TBVENDAS_VOLUME.CUBAGEM IS
'Volume/Cubagem (m3) dos produtos da venda.

Observacao: Para lancamento livre ou calculado (Largura x Altura x Espessura).';

