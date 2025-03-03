-- Question: Retrieve the Current Facility (Physical or Virtual) of Open Orders

-- Fetching the required columns
select
	oh.ORDER_ID ,
	oh.STATUS_ID ,
	ii.FACILITY_ID ,
	f.FACILITY_NAME ,
	f.FACILITY_TYPE_ID
from
	order_header oh
	-- Fetching the inventory item details of an order
join inventory_item_detail iid on
	iid.ORDER_ID = oh.ORDER_ID
	-- Fetching the inventory of an item
join inventory_item ii on
	ii.INVENTORY_ITEM_ID = iid.INVENTORY_ITEM_ID
	-- Fetching the facility details
join facility f on
	f.FACILITY_ID = ii.FACILITY_ID
	-- Applying filters on the records
where
	oh.STATUS_ID = 'ORDER_APPROVED';

-- Query Cost: 15,631,140
