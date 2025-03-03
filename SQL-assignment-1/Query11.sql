-- Question: Product Threshold Value

-- Fetching the attributes
select
	pf.product_id,
	pf.facility_id,
	pf.minimum_stock
from
	product_facility pf
join facility f on
	f.facility_id = pf.facility_id
where
	f.FACILITY_TYPE_ID = "CONFIGURATION"
	and pf.minimum_stock is not null
group by
	pf.product_id;



-- Query Cost: 28,069.21
