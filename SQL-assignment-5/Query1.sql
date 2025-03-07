-- Question 1: Investigating BOPIS Order Import Delays
-- The client has reported delays in BOPIS (Buy Online, Pickup In Store) order import times from Shopify to OMS. To investigate:
-- 
-- Identify the time taken for an order to be created in Shopify and subsequently approved in OMS. Orders are only visible in the BOPIS App after approval.
-- During spike periods, identify other jobs that ran within the same 30-minute window to assess the server load.
-- Write an SQL query to:
-- 
-- Calculate the time difference between order creation in Shopify and approval in OMS.
-- List jobs executed within a 30-minute window during identified spikes.

-- Time difference between order creation and approval in OMS.
select
	oh.ORDER_ID, timestampdiff(minute, oh.ORDER_DATE, os.STATUS_DATETIME)
from
	order_header oh
join order_status os on
	os.ORDER_ID = oh.ORDER_ID
where
	oh.ORDER_TYPE_ID = 'SALES_ORDER' and os.STATUS_ID = 'ORDER_APPROVED';

-- List jobs executed within 30 min window during identified spikes
select
	js.JOB_ID,
	js.JOB_NAME,
	js.STATUS_ID,
	js.SERVICE_NAME
from
	job_sandbox js
where
	TIME(js.RUN_TIME) between "${spikeHours}" and "${spikeHourse}";