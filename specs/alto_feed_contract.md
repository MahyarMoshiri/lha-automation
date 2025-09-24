Goal: Pull only status = "Available" properties from Alto Client Feed Export (v13+).
Inputs:
- Auth: token/handshake provided by Alto
- Endpoints: GetChangedProperties, GetChangedFiles (XML)
- Fields to map -> /supabase/schema.sql columns (see properties + property_media)
Output:
- Upsert into properties/property_media with alto_id as external key.
- Record delta into property_changes.
- Only enqueue to channel_queue after human approval (P1), not in P0.
