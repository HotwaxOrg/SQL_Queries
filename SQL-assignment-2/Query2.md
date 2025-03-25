# Question: Orders from New York - Companies often want region-specific analysis to plan local marketing, staffing, or promotions in certain areas—here, specifically, New York.

## Attributes
- **ORDER_ID**  
- **CUSTOMER_NAME**  
- **STREET_ADDRESS** (or shipping address detail)  
- **CITY**  
- **STATE_PROVINCE**  
- **POSTAL_CODE**  
- **TOTAL_AMOUNT**  
- **ORDER_DATE**  
- **ORDER_STATUS**
```
-- Fetching the columns
select
	oh.ORDER_ID,
	p.FIRST_NAME,
	p.LAST_NAME,
	pa.ADDRESS1,
	pa.ADDRESS2,
	pa.CITY,
	pa.STATE_PROVINCE_GEO_ID,
	pa.POSTAL_CODE,
	oh.GRAND_TOTAL TOTAL_AMOUNT,
	oh.ORDER_DATE,
	oh.STATUS_ID
from
	order_header oh
	-- Filtering out the customers
join order_role or2 on
	or2.ORDER_ID = oh.ORDER_ID
	and or2.ROLE_TYPE_ID like '%customer'
	-- Fetching the name of the person
join person p on
	p.PARTY_ID = or2.PARTY_ID
	-- Fetching the contact details of the order
join order_contact_mech ocm on
	ocm.order_id = oh.ORDER_ID
	and ocm.CONTACT_MECH_PURPOSE_TYPE_ID = 'SHIPPING_LOCATION'
join contact_mech cm on
	cm.CONTACT_MECH_ID = ocm.CONTACT_MECH_ID
join postal_address pa on
	pa.CONTACT_MECH_ID = cm.CONTACT_MECH_ID
	-- Filtering out records based on our requirements
where
	pa.STATE_PROVINCE_GEO_ID = 'NY'
group by
	oh.order_id
;
```

-- Query Cost: 52,636.58

![image](https://github.com/user-attachments/assets/d362637e-cbf3-40a6-834b-33eae1adde53)
