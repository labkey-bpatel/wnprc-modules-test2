PARAMETERS(StartDate TIMESTAMP, EndDate TIMESTAMP)

SELECT DISTINCT
  misc.Id,
  misc.date,
  misc.billingDate,
  misc.project,
  coalesce(misc.debitedaccount, misc.project.account) AS debitedAccount,
  misc.chargetype,
  misc.chargeId,
  misc.chargeCategory, --adjustment or reversal
  misc.objectid AS sourceRecord,
  misc.comment,
  misc.objectid,
  misc.created,
  misc.createdby,
  misc.taskId,
  misc.creditedaccount,
  misc.container,
  misc.sourceInvoicedItem,
  misc.unitCost,
  misc.quantity,
  misc.project.account AS currentActiveAlias,
  misc.project.inves AS investigator,
  TRUE AS isMiscCharge
FROM ehr_billing.miscCharges misc
WHERE cast(misc.date AS date) >= CAST(StartDate AS date) AND cast(misc.date AS date) <= CAST(EndDate AS date)