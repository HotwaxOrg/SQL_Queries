select  p.party_id, per.first_name, per.last_name, cm.INFO_STRING,  tn.CONTACT_NUMBER
from party p
join party_role pr on pr.PARTY_ID = p.PARTY_ID  and pr.ROLE_TYPE_ID = 'CUSTOMER'
join person per on per.party_id = p.party_id
join party_contact_mech pcm on pcm.PARTY_ID = p.PARTY_ID 
join contact_mech cm on cm.CONTACT_MECH_ID = pcm.CONTACT_MECH_ID and cm.CONTACT_MECH_TYPE_ID != 'POSTAL_ADDRESS'
left join telecom_number tn on tn.CONTACT_MECH_ID = pcm.CONTACT_MECH_ID
where p.CREATED_DATE between '2023-06-01' and '2023-06-30';