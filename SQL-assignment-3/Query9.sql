-- Fetching out the columns and counting the number of facilities
select
	p.PRODUCT_ID ,
	p.PRODUCT_NAME ,
	count(p.FACILITY_ID) FacilityCount
from
	product p
group by
	p.PRODUCT_ID;
