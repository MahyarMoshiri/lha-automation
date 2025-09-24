# LHA Automation (n8n)

This repo bootstraps infra and data model for P0–P9. Start with P0: Alto → Supabase staging.

## Quick start
1) Copy `.env.example` to `.env` and fill values.
2) `make up`  → starts Postgres, Redis, n8n, and proxy.
3) Apply Supabase schema locally or in your project: run the SQL in /supabase.
4) Build the n8n workflow for P0 using `workflows/P0_alto_ingest.TEMPLATE.json` as a guide.
5) Export finalized workflows back into `/workflows` and commit.

## Environments
Use separate `.env` files per env (dev/stage/prod). Same compose file.

## Security
Do not commit real secrets. Rotate tokens regularly. Enable HTTPS on your domain.
