
SELECT
  i.invoiceId,
  i.category,
  count(i.invoiceId) as numItems,
  sum(i.totalCost) as total -- total cost with tier rates

FROM ehr_billing.invoicedItems i

GROUP BY i.invoiceId, i.category