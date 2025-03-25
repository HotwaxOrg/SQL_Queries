# New Customers Acquired in June 2023

## Query Details
The following SQL query retrieves details of new customers acquired in June 2023, including their party ID, first name, last name, email, phone number, and entry date.

### Selected Attributes:
- **PARTY_ID** - Unique identifier for the customer
- **FIRST_NAME** - First name of the customer
- **LAST_NAME** - Last name of the customer
- **EMAIL** - Contact email address
- **PHONE** - Contact phone number
- **ENTRY_DATE** - The date when the customer was added

## SQL Query
```sql
SELECT
    p.party_id,
    per.first_name,
    per.last_name,
    cm.INFO_STRING AS Email,
    tn.CONTACT_NUMBER AS Phone,
    p.CREATED_DATE AS Entry_Date
FROM
    party p
    -- Fetching records of customers
    JOIN party_role pr ON pr.PARTY_ID = p.PARTY_ID
    AND pr.ROLE_TYPE_ID = 'CUSTOMER'
    
    -- Fetching first name and last name of customers
    JOIN person per ON per.party_id = p.party_id
    
    -- Fetching contact mechanism of parties
    JOIN party_contact_mech pcm ON pcm.PARTY_ID = p.PARTY_ID
    
    -- Fetching email IDs of parties and ensuring non-postal contact methods
    JOIN contact_mech cm ON cm.CONTACT_MECH_ID = pcm.CONTACT_MECH_ID
    AND cm.CONTACT_MECH_TYPE_ID != 'POSTAL_ADDRESS'
    
    -- Fetching contact numbers with LEFT JOIN to include missing records
    LEFT JOIN telecom_number tn ON tn.CONTACT_MECH_ID = pcm.CONTACT_MECH_ID
WHERE
    p.CREATED_DATE BETWEEN '2023-06-01' AND '2023-06-30';

## Query Cost: 17,147.92

![image](https://github.com/user-attachments/assets/569913af-e420-45bb-9d7d-ec40ee5af907)

