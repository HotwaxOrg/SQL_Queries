# Question:  Product IDs Across Systems-To sync an order or product across multiple systems (e.g., Shopify, HotWax, ERP/NetSuite), the OMS needs to know each system’s unique identifier for that product. This query retrieves the Shopify ID, HotWax ID, and ERP ID (NetSuite ID) for all products.

## Attributes:
- **PRODUCT_ID**
- **INTERNAL_NAME**
- **PRODUCT_TYPE_ID**
- **ERP_ID**
- **SHOPIFY_PROD_ID**
- **SHOPIFY_PROD_SKU**

```
-- Selecting the required attributes
select
	p.PRODUCT_ID,
	p.INTERNAL_NAME,
	p.PRODUCT_TYPE_ID,
	erp.ID_VALUE as ERP_ID,
	shopify_prod.ID_VALUE as SHOPIFY_PROD_ID,
	shopify_sku.ID_VALUE as SHOPIFY_PROD_SKU
from
	PRODUCT p
	-- Fetching erp system id
left join GOOD_IDENTIFICATION erp 
    on
	p.PRODUCT_ID = erp.PRODUCT_ID
	and erp.GOOD_IDENTIFICATION_TYPE_ID = 'ERP_ID'
	-- Fetching shopify product id
left join GOOD_IDENTIFICATION shopify_prod 
    on
	p.PRODUCT_ID = shopify_prod.PRODUCT_ID
	and shopify_prod.GOOD_IDENTIFICATION_TYPE_ID = 'SHOPIFY_PROD_ID'
	-- Fetching sku id
left join GOOD_IDENTIFICATION shopify_sku 
    on
	p.PRODUCT_ID = shopify_sku.PRODUCT_ID
	and shopify_sku.GOOD_IDENTIFICATION_TYPE_ID = 'SHOPIFY_PROD_SKU';
```

-- Query Cost: 2,345,065.74

![image](https://github.com/user-attachments/assets/0fdd5d37-5dd6-4d86-ac1f-cbcdc58a3c30)

