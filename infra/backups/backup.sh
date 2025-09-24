#!/usr/bin/env bash
set -euo pipefail
TS=$(date +%Y%m%d_%H%M%S)
OUT="infra/backups/backup_${TS}.tar.gz"
mkdir -p infra/backups
docker compose exec -T postgres pg_dump -U ${POSTGRES_USER:-n8n} ${POSTGRES_DB:-n8n} > /tmp/db.sql
tar -czf "$OUT" /tmp/db.sql
rm -f /tmp/db.sql
echo "Backup written: $OUT"
