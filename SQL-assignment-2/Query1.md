# Question: Shipping Addresses for October 2023 Orders - Customer Service might need to verify addresses for orders placed or completed in October 2023. This helps ensure shipments are delivered correctly and prevents address-related issues.

## Attributes
- **ORDER_ID**  
- **PARTY_ID** (Customer ID)  
- **CUSTOMER_NAME** (or **FIRST_NAME** / **LAST_NAME**)  
- **STREET_ADDRESS**  
- **CITY**  
- **STATE_PROVINCE**  
- **POSTAL_CODE**  
- **COUNTRY_CODE**  
- **ORDER_STATUS**  
- **ORDER_DATE**  

```
-- Retrieving the columns
select
	oh.order_id,
	or2.PARTY_ID CUSTOMER_ID,
	p.FIRST_NAME ,
	p.LAST_NAME ,
	pa.ADDRESS1 ,
	pa.ADDRESS2 ,
	pa.CITY ,
	pa.STATE_PROVINCE_GEO_ID ,
	pa.POSTAL_CODE ,
	pa.COUNTRY_GEO_ID,
	oh.status_id,
	oh.order_date
from
	order_header oh
	-- Fetching all the orders placed by a customer
join order_role or2 on
	or2.ORDER_ID = oh.ORDER_ID
	and or2.ROLE_TYPE_ID like "%customer"
	-- Fetching a customer firstname and lastname
join person p on
	p.PARTY_ID = or2.PARTY_ID
	-- Fetching the contact mechanism of the customer
join order_contact_mech ocm on
	ocm.ORDER_ID = oh.ORDER_ID
	-- Fetching the postal details of the customer
join contact_mech cm on
	cm.CONTACT_MECH_ID = ocm.CONTACT_MECH_ID
	and ocm.CONTACT_MECH_PURPOSE_TYPE_ID = 'SHIPPING_LOCATION'
join postal_address pa on
	pa.CONTACT_MECH_ID = cm.CONTACT_MECH_ID
	-- Filtering our records based on the our requirements
join order_status os on
	os.order_id = oh.order_id
where
	oh.STATUS_ID in ("ORDER_CREATED", "ORDER_COMPLETED") and
	 (os.STATUS_DATETIME between '2023-10-01' and '2023-10-31')
group by
	oh.ORDER_ID;
```

-- Query Cost: 51,097.95

![image](https://github.com/user-attachments/assets/ae76058b-2480-4c75-865f-a32b9e95dc07)
