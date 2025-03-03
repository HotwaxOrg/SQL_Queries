-- Question: Top-Selling Product in New York

-- Selecting the columns
select
	p.PRODUCT_ID,
	p.INTERNAL_NAME ,
	sum(oi.QUANTITY) Total_Quantity,
	sum(oi.UNIT_PRICE) Total_Revenue,
	pa.CITY , pa.STATE_PROVINCE_GEO_ID 
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
	p.PRODUCT_ID, pa.CITY , pa.STATE_PROVINCE_GEO_ID 
HAVING SUM(oi.QUANTITY) = (
    SELECT MAX(total_quantity)
    FROM (
        SELECT SUM(oi2.QUANTITY) AS total_quantity, pa2.CITY
        FROM order_item oi2
        JOIN order_contact_mech ocm2 ON ocm2.ORDER_ID = oi2.ORDER_ID
        JOIN postal_address pa2 ON pa2.CONTACT_MECH_ID = ocm2.CONTACT_MECH_ID
        WHERE pa2.STATE_PROVINCE_GEO_ID = 'NY'
        GROUP BY pa2.CITY, oi2.PRODUCT_ID
    ) AS city_sales
    WHERE city_sales.CITY = pa.CITY
)
order by total_quantity desc;


-- Query Cost: 41,920.73
