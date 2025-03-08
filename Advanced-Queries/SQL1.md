# Query1 - Non Return Refunds
Get a list of all refund payments made on orders due to cancelations. No return refunds should be included.

The expected fields in the result are:
Order Id
Payment internal Id
Payment manual reference
Payment parent reference
Refund amount from payment pref

```
select
	oh.ORDER_ID,
	opp.PAYMENT_METHOD_ID PAYMENT_INTERNAL_ID,
	opp.MANUAL_REF_NUM PAYMENT_MANUAL_REFERENCE, 
	opp.PARENT_REF_NUM PAYMENT_PARENT_REFERENCE,
	opp.MAX_AMOUNT REFUNDED_AMOUNT
from
	order_header oh
join order_payment_preference opp on
	opp.ORDER_ID = oh.ORDER_ID
join order_item oi on
	oi.ORDER_ID = oh.ORDER_ID
	and oi.STATUS_ID = 'ITEM_CANCELLED'
where
	oh.ORDER_ID not in (
	select
		ri.ORDER_ID
	from
		return_item ri );
```
# Cost - 75,693.78

