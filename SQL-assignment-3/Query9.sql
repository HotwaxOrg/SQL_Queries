-- Problem Statement: Total Facilities That Sell the Product

-- Fetching out the columns and counting the number of facilities
select
	p.PRODUCT_ID ,
	p.PRODUCT_NAME ,
	count(p.FACILITY_ID) FacilityCount
from
	product p
group by
	p.PRODUCT_ID;


-- Cost: 80,133.02
