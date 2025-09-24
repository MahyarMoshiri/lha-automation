#!/usr/bin/env bash
set -euo pipefail
FILE="$1"
if [ -z "$FILE" ]; then echo "Usage: make restore FILE=path.tar.gz"; exit 1; fi
tar -xzf "$FILE" -C /tmp
docker compose exec -T postgres psql -U ${POSTGRES_USER:-n8n} -d ${POSTGRES_DB:-n8n} < /tmp/db.sql
echo "Restore completed."
