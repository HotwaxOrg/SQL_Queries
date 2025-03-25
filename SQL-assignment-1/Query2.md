# Question:  List All Active Physical Products: Merchandising teams often need a list of all physical products to manage logistics, warehousing, and shipping.

## Attributes:
- **PRODUCT_ID**
- **PRODUCT_TYPE_ID** 
- **INTERNAL_NAME**

```
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
```

-- Query Cost: 108,187.99

![Screenshot from 2025-03-25 10-02-23](https://github.com/user-attachments/assets/db482c89-134d-4f30-a488-48b79836595a)



