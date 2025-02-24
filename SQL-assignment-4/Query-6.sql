-- Getting the attributes
select
	oh.ORDER_ID,
	os.SHIPMENT_ID,
	oisg.FACILITY_ID,
	ss.STATUS_DATE,
	oh.ORDER_DATE,
	count(os.SHIP_GROUP_SEQ_ID) TOTAL_ITEMS,
	pa.STATE_PROVINCE_GEO_ID CUSTOMER_STATE
from
	order_header oh
	-- Getting the shipment id
join order_shipment os on
	os.ORDER_ID = oh.ORDER_ID
	-- Facility of the shipment
join order_item_ship_group oisg on
	oisg.ORDER_ID = os.ORDER_ID
	-- Status of the shipment
join shipment_status ss on
	ss.SHIPMENT_ID = os.SHIPMENT_ID
	-- Customer state
join order_contact_mech ocm on
	ocm.ORDER_ID = os.ORDER_ID
join postal_address pa on
	pa.CONTACT_MECH_ID = ocm.CONTACT_MECH_ID
	-- Getting the facility type
join facility f on 
	f.FACILITY_ID = oisg.FACILITY_ID
	-- Filtering the records
where
	ss.STATUS_ID = 'SHIPMENT_SHIPPED'
	and ocm.CONTACT_MECH_PURPOSE_TYPE_ID like '%LOCATION'
	and ss.STATUS_DATE between '2024-12-06' and '2024-12-31'
	and f.FACILITY_ID like '%STORE'
group by
	oh.ORDER_ID,
	os.SHIPMENT_ID,
	oisg.FACILITY_ID,
	ss.STATUS_DATE,
	oh.ORDER_DATE,
	pa.STATE_PROVINCE_GEO_ID;

