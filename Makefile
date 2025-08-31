PROJECT_NAME = "claim-submission-app"

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
	@rm -rf ./temp

clean-image:
	@docker image prune -f

format:
	@cd backend && \
		pnpm run format
	@cd api-test && \
		pnpm run format
	@cd frontend && \
		pnpm run format

lint:
	@echo "Checking lint issue in backend..." && \
		cd backend && \
		pnpm run lint .
	@echo "Checking lint issue in api-test..." && \
		cd api-test && \
		pnpm run lint .
	@echo "Checking lint issue in frontend..." && \
		cd frontend && \
		pnpm run lint .

lint/fix:
	@echo "Checking lint issue in backend..." && \
		cd backend && \
		pnpm run lint . --fix
	@echo "Checking lint issue in api-test..." && \
		cd api-test && \
		pnpm run lint . --fix
	@echo "Checking lint issue in frontend..." && \
		cd frontend && \
		pnpm run lint . --fix

install:
	@chmod +x ./scripts/reinstall.sh && \
		./scripts/reinstall.sh

test/unit:
	@cd backend && \
		pnpm run test

test/api:
	@cd api-test && \
		pnpm run test

db/data/up:
	@cd backend && \
		npm run build && \
		npm run seed:run

db/data/down:
	@cd backend && \
		npm run build && \
		DOTENV_CONFIG_PATH=../.env npx node -r dotenv/config ./dist/config/db-scripts/data-down.js

db/data/reset:
	@$(MAKE) db/data/down
	@cd backend && \
		npm run seed:run