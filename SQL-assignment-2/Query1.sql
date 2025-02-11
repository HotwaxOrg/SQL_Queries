-- Retrieving the columns
select
	oh.order_id,
	oh.status_id,
	oh.order_date,
	or2.PARTY_ID,
	p.FIRST_NAME ,
	p.LAST_NAME ,
	pa.ADDRESS1 ,
	pa.ADDRESS2 ,
	pa.CITY ,
	pa.STATE_PROVINCE_GEO_ID ,
	pa.POSTAL_CODE ,
	pa.COUNTRY_GEO_ID
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
where
	((oh.ORDER_DATE between '2023-10-01' and '2023-10-31')
		and (oh.STATUS_ID = 'ORDER_CREATED'))
	or (oh.STATUS_ID = 'ORDER_COMPLETED'
		and oh.ENTRY_DATE between '2023-10-01' and '2023-10-31')
group by
	oh.ORDER_ID;