CREATE DESCENDING INDEX IDX_TBESTOQUE_ALMOX_QTDED
ON TBESTOQUE_ALMOX COMPUTED BY (coalesce(qtde, 0));

CREATE INDEX IDX_TBESTOQUE_ALMOX_QTDEA
ON TBESTOQUE_ALMOX COMPUTED BY (coalesce(qtde, 0));



