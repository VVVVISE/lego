checkout:
	@git checkout package.json
	@git checkout yarn.lock

# --
# 1. INSTALL
# ---------

berry:
	@corepack enable
	@yarn init -2 -w
	@yarn set version stable
	@make checkout
	@echo '💬 [APP] Initialized yarn@berry ✨'

init:
	@yarn unlink && yarn link && yarn
	@echo '💬 [APP] Workpaces Initialized ✨'

doppler:
	@brew install dopplerhq/cli/doppler
	@doppker login
	@echo '💬 [APP] Installed DopplerCLI ✨'

setup:
	@doppler setup
	@cd apps/web && doppler secrets download --no-file --format env > .env
	@cd apps/prisma-app && cp dotenv.dev .env
	@yarn prisma-app prisma generate
	@echo '💬 [APP] Finished Workspaces Setups ✨'

env:
	@cd apps/web && doppler secrets download --no-file --format env > .env
	@cd apps/prisma-app && cp dotenv.dev .env
	@echo '💬 [APP] Generated Environments ✨'

# --
# 2. BUILD
# ---------
init-prisma:
	@yarn prisma-app prisma:init
	@echo '💬 [PRISMA] Generated apps/prisma-app⚡️'

generate:
	@yarn prisma-app prisma:generate
	@echo '💬 [PRISMA] Generated apps/prisma-app⚡️'

migrate:
	@yarn prisma-app prisma:migrate
	@echo '💬 [PRISMA] Migrated apps/prisma-app⚡️'

## this short hand
prisma:
	@yarn prisma-app prisma generate
	@yarn prisma-app prisma studio
	@echo '💬 [PRISMA] generated apps/prisma-app⚡️'

dev:
	@yarn web dev
	@echo '💬 [APP] Booted up apps/web ⚡️'

# --
# shell shorthands
# ---------

envthis:
	@head -n 1 ./apps/web/.env

envs:
	@cat ./apps/web/.env
