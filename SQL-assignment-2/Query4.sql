-- Question: Store-Specific (Facility-Wise) Revenue

-- Fetching the attributes
select
	f.FACILITY_ID ,
	f.FACILITY_TYPE_ID ,
	count(oi.ORDER_ID) Total_Orders,
	sum(oi.UNIT_PRICE) Total_Revenue
,
	CONCAT(
        MIN(DATE(oh.ORDER_DATE)), ' to ', MAX(DATE(oh.ORDER_DATE))
    ) as Date_Range
from
	order_item oi
	-- Getting the order details
join order_header oh on
	oh.ORDER_ID = oi.ORDER_ID
	-- Getting the shipment details
join order_shipment os on
	os.order_id = oi.order_id
join shipment s on
	s.SHIPMENT_ID = os.SHIPMENT_ID
	-- Getting the facility details
join facility f on
	f.FACILITY_ID = s.ORIGIN_FACILITY_ID
group by
	f.FACILITY_ID
order by
	total_orders desc;


-- Query Cost: 262,736.98
