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
SELECT 
    gi.product_id,
    MAX(CASE
        WHEN gi.good_identification_type_id = 'SHOPIFY_PROD_ID' THEN gi.id_value
    END) AS SHOPIFY_ID,
    MAX(CASE
        WHEN gi.good_identification_type_id = 'SKU' THEN gi.id_value
    END) AS HOTWAX_ID,
    MAX(CASE
        WHEN gi.good_identification_type_id = 'ERP_ID' THEN gi.id_value
    END) AS NETSUITE_ID
FROM
    good_identification gi
GROUP BY gi.product_id;
```

-- Query Cost: 2,345,065.74

![image](https://github.com/user-attachments/assets/0fdd5d37-5dd6-4d86-ac1f-cbcdc58a3c30)

