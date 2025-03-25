# Question:  Payment Captured but Not Shipped - Finance teams want to ensure revenue is recognized properly. If payment is captured but no shipment has occurred, it warrants further review.

## Attributes
- **ORDER_ID**
- **ORDER_STATUS**
- **PAYMENT_STATUS**
- **SHIPMENT_STATUS**

```
-- Fetching the attributes
select
	oh.ORDER_ID ,
	oh.STATUS_ID,
	opp.STATUS_ID PAYMENT_STATUS,
	s.STATUS_ID SHIPMENT_STATUS
from
	order_header oh
	-- Getting the payment details
join order_payment_preference opp on
	opp.ORDER_ID = oh.ORDER_ID
	-- Getting the shipment details
join shipment s on
	s.PRIMARY_ORDER_ID = oh.ORDER_ID
	-- Filtering out records as per our requirements
where
	opp.STATUS_ID = 'PAYMENT_SETTLED' and s.STATUS_ID != 'SHIPMENT_SHIPPED';
```

-- Query Cost: 24,324.58

![image](https://github.com/user-attachments/assets/972a2472-af1e-4220-a846-a50d7b886c4c)

