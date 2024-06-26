-- Determine if there are consistent patterns of volume preceding or following price changes for chevron stock.

SELECT
    t1.Date,
    t1.Volume,
    t2.Close - t1.Close AS price_change
  FROM
    `learned-vault-378620.stocks_767.chevronstock` AS t1
    INNER JOIN `learned-vault-378620.stocks_767.chevronstock` AS t2 ON t1.Date = t2.Date - 1
