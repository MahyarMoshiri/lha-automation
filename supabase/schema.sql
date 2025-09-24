-- Properties (staging from Alto)
create table if not exists properties (
  id uuid primary key default gen_random_uuid(),
  alto_id text unique not null,
  status text not null, -- Available, Let Agreed, etc.
  title text,
  description text,
  price numeric,
  currency text default 'GBP',
  bedrooms int,
  bathrooms int,
  property_type text,
  address_line1 text,
  address_line2 text,
  city text,
  postcode text,
  latitude numeric,
  longitude numeric,
  listed_at timestamptz,
  updated_at timestamptz default now()
);

-- Media (photos/floorplans)
create table if not exists property_media (
  id uuid primary key default gen_random_uuid(),
  alto_id text not null,
  url text not null,
  kind text default 'photo', -- photo | floorplan
  position int default 0,
  checksum text,
  updated_at timestamptz default now(),
  unique(alto_id, url)
);

-- Change log (delta tracking)
create table if not exists property_changes (
  id bigserial primary key,
  alto_id text not null,
  change_type text not null,   -- created | updated | status_change
  payload jsonb not null,
  detected_at timestamptz default now()
);

-- Channel queue (for later phases)
create table if not exists channel_queue (
  id bigserial primary key,
  alto_id text not null,
  channel text not null,       -- instagram | facebook | x | gumtree
  state text not null default 'pending', -- pending|approved|posted|failed
  payload jsonb,
  last_error text,
  updated_at timestamptz default now()
);

create index if not exists idx_properties_alto_id on properties(alto_id);
create index if not exists idx_media_alto_id on property_media(alto_id);
create index if not exists idx_queue_state on channel_queue(state);
