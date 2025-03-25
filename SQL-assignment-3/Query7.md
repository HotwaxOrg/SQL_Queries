# Problem Statement: Store with Most One-Day Shipped Orders (Last Month) - Identify which facility (store) handled the highest volume of “one-day shipping” orders in the previous month, useful for operational benchmarking.

## Attributes
- **FACILITY_ID**
- **FACILITY_NAME**
- **TOTAL_ONE_DAY_SHIP_ORDER**
- **REPORTING_PERIOD**

```
-- Fetching the columns
select
	oisg.FACILITY_ID ,
	f.FACILITY_NAME ,
	count(oisg.ORDER_ID) TotalOneDayShipOrder ,
	CONCAT(
        MIN(DATE(oisg.ESTIMATED_SHIP_DATE)), ' to ', MAX(DATE(oisg.ESTIMATED_SHIP_DATE))
    ) as ReportingPeriod
from
	order_item_ship_group oisg
	-- Fetching the shipment status and details
join order_shipment os on
	os.ORDER_ID = oisg.ORDER_ID
join shipment s on
	s.SHIPMENT_ID = os.SHIPMENT_ID
	-- Fetching the facility information
join shipment_status ss on
	ss.SHIPMENT_ID = s.SHIPMENT_ID
join facility f on
	f.FACILITY_ID = oisg.FACILITY_ID
	-- Filtering out the orders that were shipped in one day
where
	oisg.SHIPMENT_METHOD_TYPE_ID = 'NEXT_DAY'
	and s.STATUS_ID = 'SHIPMENT_SHIPPED'
	and ss.STATUS_DATE between '2023-12-01' and '2023-12-31'
group by
	oisg.FACILITY_ID
order by
	TotalOneDayShipOrder desc;
```

-- Cost: 81,781.21

![image](https://github.com/user-attachments/assets/ceca3023-9d28-4e05-a287-2c1af4f2b2f7)

