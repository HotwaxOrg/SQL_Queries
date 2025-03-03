-- Fetching the columns
select
	distinct p.PRODUCT_ID ,
	p.PRODUCT_NAME ,
	ii.FACILITY_ID ,
	ii.QUANTITY_ON_HAND_TOTAL ,
	ii.AVAILABLE_TO_PROMISE_TOTAL,
	pf.REORDER_QUANTITY ,
	pf.LAST_UPDATED_STAMP DateChecked
from
	product p
-- Fetching the inventory details of the product
join inventory_item ii on
	ii.PRODUCT_ID = p.PRODUCT_ID
-- Fetching the reorder quantity abnd last updated stamp
join product_facility pf on
	pf.PRODUCT_ID = p.PRODUCT_ID
;
