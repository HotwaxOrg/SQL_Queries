-- Question: Orders from New York

-- Fetching the columns
select
	oh.ORDER_ID,
	oh.ENTRY_DATE ,
	oh.ORDER_DATE,
	oh.STATUS_ID,
	oh.GRAND_TOTAL,
	p.FIRST_NAME,
	p.LAST_NAME,
	pa.ADDRESS1,
	pa.ADDRESS2,
	pa.CITY,
	pa.STATE_PROVINCE_GEO_ID,
	pa.POSTAL_CODE
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


-- Query Cost: 131,099.54
