# --
# 1. INSTALL
# ---------

berry:
	@corepack enable
	@yarn init -2
	@yarn set version stable
	@git checkout package.json
	@echo '💬 [APP] Initialized yarn@berry ✨'

init:
	@yarn unlink && yarn link
	@yarn install
	@echo '💬 [APP] Workpaces Initialized ✨'

doppler:
	@brew install dopplerhq/cli/doppler
	@doppker login
	@echo '💬 [APP] Installed DopplerCLI ✨'

setup:
	@doppler setup
	@cd apps/web && doppler secrets download --no-file --format env > .env
	@yarn web prisma generate
	@echo '💬 [APP] Finished Workspaces Setups ✨'

env:
	@cd apps/web && doppler secrets download --no-file --format env > .env
	@echo '💬 [APP] Generated Environments ✨'

# --
# 2. BUILD
# ---------
init-prisma:
	@yarn prisma-app prisma:init
	@echo '💬 [PRISMA] Generated apps/prisma-app⚡️'

generate:
	@yarn prisma-app prisma generate
	@echo '💬 [PRISMA] Generated apps/prisma-app⚡️'

migrate:
	@yarn prisma-app prisma migrate dev
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
	@head -n 1 ./.env

envs:
	@cat ./.env
