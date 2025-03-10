-- Question: Items Where QOH and ATP Differ

-- Fetching the columns
select
	p.PRODUCT_ID ,
	ii.FACILITY_ID ,
	ii.QUANTITY_ON_HAND_TOTAL ,
	ii.AVAILABLE_TO_PROMISE_TOTAL ,
	(ii.QUANTITY_ON_HAND_TOTAL - ii.AVAILABLE_TO_PROMISE_TOTAL ) as Difference
from
	product p
	-- Fetching the QOH and ATP and Facility id	
join inventory_item ii on
	ii.PRODUCT_ID = p.PRODUCT_ID;

-- Query Cost: 2,367,489.86
