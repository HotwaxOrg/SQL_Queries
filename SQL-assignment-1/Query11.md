# Question: Product Threshold Value - The retailer has set a threshild value for products that are sold online, in order to avoid over selling

## Attributes
- **PRODUCT_ID**
- **THRESHOLD**

```
-- Fetching the attributes
select
	pf.product_id,
	pf.minimum_stock threshold
from
	product_facility pf
join facility f on
	f.facility_id = pf.facility_id
where
	f.FACILITY_TYPE_ID = "CONFIGURATION"
	and pf.minimum_stock is not null
group by
	pf.product_id;;
```


-- Query Cost: 28,069.21

![image](https://github.com/user-attachments/assets/9ef74ec6-f7af-4488-ab1e-be3c0d043ba8)
