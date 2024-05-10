-- Is there a correlation between crude oil prices and the chevron stock prices
SELECT
    corr(t1.value, t2.Open)
  FROM
    `learned-vault-378620.crudedataset.crudeprice` AS t1
    INNER JOIN `learned-vault-378620.stocks_767.chevronstock` AS t2 ON t1.date = t2.date