# 3 Average Shipments per Month (Q1 2022)
Business Problem:
Operations wants to find the average number of shipments from all stores for each month in Q1 2022 (January, February, March).

## Fields to Retrieve:

- **MONTH**
- **AVERAGE_SHIPMENTS**

```
select
	extract(month from ss.STATUS_DATE) as month,
	count(s.SHIPMENT_ID) / count(distinct s.ORIGIN_FACILITY_ID) AVERAGE_SHIPMENTS
from
	shipment s
join shipment_status ss on
	ss.SHIPMENT_ID = s.SHIPMENT_ID
where
	ss.STATUS_ID = 'SHIPMENT_SHIPPED'
	and ss.status_date between '2022-01-01' and '2022-03-31'
group by
	extract(month from ss.status_date);
```

# Explanations:
The business problem required us to get the average number of shipment made by each store in the Q1 phase of 2022.
It first extracts the month from the STATUS_DATE field of the shipment_status table and groups the results by month. 
The query then counts the total number of shipments (SHIPMENT_ID) and divides it by the count of unique origin facilities (ORIGIN_FACILITY_ID).
The result provides the average number of shipments per facility for each month where the shipment status is "SHIPMENT_SHIPPED"

# Cost - 12,512.26

![image](https://github.com/user-attachments/assets/0704b1fe-6843-4326-b715-9342814ea1c2)
