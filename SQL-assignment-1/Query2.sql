-- Question:  List All Active Physical Products

-- Selecting required attributes
select
	p.PRODUCT_ID,
	p.PRODUCT_TYPE_ID,
	p.INTERNAL_NAME
from
	PRODUCT p
	-- Joining product type and product entity to find physical product
join 
    PRODUCT_TYPE pt on
	p.PRODUCT_TYPE_ID = pt.PRODUCT_TYPE_ID
where
	pt.IS_PHYSICAL = 'Y'
	and (p.SALES_DISCONTINUATION_DATE is null
		or p.SALES_DISCONTINUATION_DATE > NOW())
	and (p.SUPPORT_DISCONTINUATION_DATE is null
		or p.SUPPORT_DISCONTINUATION_DATE > NOW());


-- Query Cost: 108,187.99
