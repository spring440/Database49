Insert into personAddress
Select person_ID, address_id
From person p
Inner join address c on c.address_id = p.person_ID