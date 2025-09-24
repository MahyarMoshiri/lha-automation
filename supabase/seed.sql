insert into properties (alto_id,status,title,price,bedrooms,city,postcode)
values ('DEMO-123','Available','Demo Flat',2500,2,'London','E1 1AA')
on conflict (alto_id) do nothing;
