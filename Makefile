SHELL := /bin/bash

up:
	docker compose up -d

down:
	docker compose down

logs:
	docker compose logs -f --tail=100

ps:
	docker compose ps

backup:
	bash infra/backups/backup.sh

restore:
	bash infra/backups/restore.sh
