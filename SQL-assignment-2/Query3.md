# Question: Top-Selling Product in New York - Merchandising teams need to identify the best-selling product(s) in a specific region (New York) for targeted restocking or promotions.

## Attributes
- **PRODUCT_ID**
- **INTERNAL_NAME**
- **TOTAL_QUANTITY**
- **CITY**
- **STATE**
- **TOTAL_REVENUE**

```
-- Selecting the columns
select
	p.PRODUCT_ID,
	p.INTERNAL_NAME ,
	sum(oi.QUANTITY) Total_Quantity,
	pa.CITY ,
	pa.STATE_PROVINCE_GEO_ID STATE,
	sum(oi.UNIT_PRICE) Total_Revenue
from
	order_item oi
	-- Fetching out the product details
join product p on
	p.PRODUCT_ID = oi.PRODUCT_ID
	-- Fetching out the grand total of revenue 
join order_header oh on
	oh.ORDER_ID = oi.ORDER_ID
	-- Fetching the contact details
join order_contact_mech ocm on
	ocm.ORDER_ID = oh.ORDER_ID
	and ocm.CONTACT_MECH_PURPOSE_TYPE_ID like '%location'
join postal_address pa on
	pa.CONTACT_MECH_ID = ocm.CONTACT_MECH_ID
	-- Applying filter to the records
where
	pa.STATE_PROVINCE_GEO_ID = 'NY'
group by
	p.PRODUCT_ID,
	pa.CITY ,
	pa.STATE_PROVINCE_GEO_ID
having
	SUM(oi.QUANTITY) = (
	select
		MAX(total_quantity)
	from
		(
		select
			SUM(oi2.QUANTITY) as total_quantity,
			pa2.CITY
		from
			order_item oi2
		join order_contact_mech ocm2 on
			ocm2.ORDER_ID = oi2.ORDER_ID
		join postal_address pa2 on
			pa2.CONTACT_MECH_ID = ocm2.CONTACT_MECH_ID
		where
			pa2.STATE_PROVINCE_GEO_ID = 'NY'
		group by
			pa2.CITY,
			oi2.PRODUCT_ID
    ) as city_sales
	where
		city_sales.CITY = pa.CITY
)
order by
	total_quantity desc;
```

-- Query Cost: 35,369.66

![image](https://github.com/user-attachments/assets/c948cab3-2321-41d6-ad84-6d5ccbad3f33)
