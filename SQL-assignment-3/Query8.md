# Problem Statement: List of Warehouse Pickers - Warehouse managers need a list of employees responsible for picking and packing orders to manage shifts, productivity, and training needs.

## Attributes
- **PARTY_ID**
- **NAME**
- **ROLE_TYPE_ID**
- **FACILITY_ID**
- **STATUS**

```
-- Fetching the columns
select
	pr.PARTY_ID ,
	p2.FIRST_NAME ,
	p2.LAST_NAME ,
	pr.ROLE_TYPE_ID ,
	p.FACILITY_ID ,
	pty.STATUS_ID
from
	picklist p
	-- Fetching the party details
join picklist_role pr on
	pr.PICKLIST_ID = p.PICKLIST_ID
join person p2 on
	p2.PARTY_ID = pr.PARTY_ID
join party pty on
	pty.PARTY_ID = pr.PARTY_ID
join facility f on
	f.FACILITY_ID = p.FACILITY_ID
where
	f.FACILITY_TYPE_ID like '%WAREHOUSE';
```

-- Cost: 2,511.23

![image](https://github.com/user-attachments/assets/be3b7fda-731a-4dfa-842a-5b2d4be7864a)

