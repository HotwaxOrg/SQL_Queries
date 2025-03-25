## Question:  Newly Created Sales Orders and Payment Methods - Finance teams need to see new orders and their payment methods for reconciliation and fraud checks.

## Attributes
- **ORDER_ID**
- **GRAND_TOTAL**
- **PAYMENT_METHOD**
- **SHOPIFY_ORDER_ID**

```
-- Retrieving the columns
select
	oh.ORDER_ID ,
	oh.GRAND_TOTAL ,
	opp.PAYMENT_METHOD_TYPE_ID PAYMENT_METHOD,
	oh.EXTERNAL_ID SHOPIFY_ORDER_ID
from
	order_header oh
	-- Joining the order payment pref entity to get the payment mehthod type
join order_payment_preference opp on
	opp.ORDER_ID = oh.ORDER_ID
	-- Filtering our the recent orders
where
	oh.STATUS_ID = 'ORDER_CREATED';
```


-- Query Cost: 5,689.06

![image](https://github.com/user-attachments/assets/f064ea6c-069b-4c2e-8a7e-b5d1eebecdb6)
