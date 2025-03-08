# Query3 - Duplicate Orders
Fetch a list of all orders imported from Shopify that are duplicates. There can be more than 1 duplicate.
## Expected Fields in the Result

- **Order Name**  
- **Order Id**  
- **Duplicate of Order Id**

```
select
	oh.ORDER_NAME ,
	oh.ORDER_ID,
	oh2.ORDER_ID
from
	order_header oh
join order_header oh2 on
	oh2.EXTERNAL_ID = oh.EXTERNAL_ID
	and oh2.ORDER_ID != oh.ORDER_ID;
```

# Cost - 78,557.94
# Explanation -
This problem statement require us to find the orders that were duplicated from shopify.
This SQL query identifies duplicate orders by checking for records with the same EXTERNAL_ID in the order_header table.
It performs a self-join on order_header, ensuring that the second instance of the order (oh2) has a different ORDER_ID than the first (oh)

![image](https://github.com/user-attachments/assets/39830700-d1e1-48b6-acc5-c4601f6ed7d4)

