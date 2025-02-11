-- Selecting the columns
select
	p.PRODUCT_ID,
	p.INTERNAL_NAME ,
	sum(oi.QUANTITY) Total_Quantity,
	sum(oh.GRAND_TOTAL) Total_Revenue
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
	p.PRODUCT_ID
order by total_quantity desc;