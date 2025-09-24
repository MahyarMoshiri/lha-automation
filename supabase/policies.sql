-- Example RLS defaults; adjust to your project
alter table properties enable row level security;
alter table property_media enable row level security;

-- Public can read (for website)
create policy "public read properties" on properties
for select using (true);

create policy "public read property_media" on property_media
for select using (true);
