-- Problem Statement: Total Items in Various Virtual Facilities

-- Query to get the stock of product in virtual facilities
select
	ii.PRODUCT_ID ,
	ii.FACILITY_ID ,
	ii.QUANTITY_ON_HAND_TOTAL ,
	ii.AVAILABLE_TO_PROMISE_TOTAL ,
	f.FACILITY_TYPE_ID
from
	inventory_item ii
join facility f on
	f.FACILITY_ID = ii.FACILITY_ID
where
	f.FACILITY_TYPE_ID = 'VIRTUAL_FACILITY'
	or f.FACILITY_TYPE_ID = 'CONFIGURATION';


-- Cost: 59,409.3
