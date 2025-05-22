-- Enable storage if not already enabled
create extension if not exists "storage" schema "extensions";

-- Create the products bucket if it doesn't exist
insert into storage.buckets (id, name, public)
values ('products', 'products', true)
on conflict (id) do nothing;

-- Set up storage policies
create policy "Public Access"
on storage.objects for select
using ( bucket_id = 'products' );

create policy "Admin Upload Access"
on storage.objects for insert
to authenticated
with check (
  bucket_id = 'products' AND
  auth.email() = 'admin@example.com'
);

create policy "Admin Delete Access"
on storage.objects for delete
to authenticated
using (
  bucket_id = 'products' AND
  auth.email() = 'admin@example.com'
);