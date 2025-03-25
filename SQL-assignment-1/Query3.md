# Question:  Products Missing NetSuite ID- A product cannot sync to NetSuite unless it has a valid NetSuite ID. The OMS needs a list of all products that still need to be created or updated in NetSuite.

## Attributes:
- **PRODUCT_ID**
- **INTERNAL_NAME**
- **PRODUCT_TYPE_ID**
- **NETSUITE_ID**

```
-- Selecting the attributes 
SELECT 
    p.PRODUCT_ID, 
    p.INTERNAL_NAME, 
    p.PRODUCT_TYPE_ID, 
    gi.ID_VALUE AS NETSUITE_ID
FROM 
    PRODUCT p
    -- Applying joins on our entities on product id
LEFT JOIN 
    GOOD_IDENTIFICATION gi ON p.PRODUCT_ID = gi.PRODUCT_ID
    AND gi.GOOD_IDENTIFICATION_TYPE_ID = 'ERP_ID'
    -- Filtering our erp id that are null
WHERE 
    gi.ID_VALUE IS NULL ;
```

-- Query Cost: 835,433.5

![image](https://github.com/user-attachments/assets/fb072e6d-511a-4180-98ca-7b74dd97a667)
