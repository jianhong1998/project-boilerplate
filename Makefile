PROJECT_NAME = "claim-submission-app"

# Docker commands (not handled by TurboRepo)
up/build:
	@docker compose \
		-p ${PROJECT_NAME} \
		up --build -w --remove-orphans

up:
	@docker compose \
		-p ${PROJECT_NAME} \
		up -w

down:
	@docker compose \
		-p ${PROJECT_NAME} \
		down && \
		$(MAKE) clean-image

down/clean:
	@$(MAKE) down && \
		$(MAKE) clean && \
		$(MAKE) clean-image

clean:
	@rm -rf ./backend/temp
	@rm -rf postgres-data
	@pnpm run clean

clean-image:
	@docker image prune -f

# TurboRepo delegated commands
build:
	@pnpm run build

dev:
	@pnpm run dev

format:
	@pnpm run format

lint:
	@pnpm run lint

lint/fix:
	@pnpm run lint:fix

install:
	@pnpm install

test:
	@pnpm run test

test/unit:
	@pnpm run test:unit

test/api:
	@pnpm run test:api

# Database commands using TurboRepo
db/data/up:
	@pnpm run db:seed

db/data/down:
	@cd backend && \
		pnpm run build && \
		DOTENV_CONFIG_PATH=../.env npx node -r dotenv/config ./dist/config/db-scripts/data-down.js

db/data/reset:
	@pnpm run db:reset