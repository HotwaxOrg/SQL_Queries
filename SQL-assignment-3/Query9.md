# Problem Statement: Total Facilities That Sell the Product - Retailers want to see how many (and which) facilities (stores, warehouses, virtual sites) currently offer a product for sale.

## Attributes
- **PRODUCT_ID**
- **PRODUCT_NAME**
- **FACILITY_COUNT**

```
-- Fetching out the columns and counting the number of facilities
select
	p.PRODUCT_ID ,
	p.PRODUCT_NAME ,
	count(p.FACILITY_ID) FacilityCount
from
	product p
group by
	p.PRODUCT_ID;
```

-- Cost: 80,133.02

![image](https://github.com/user-attachments/assets/b885084c-d19b-41d5-956a-b116bee1f810)
