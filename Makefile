.PHONY: build

certbot:
	@sh build/bin/init-letsencrypt.sh

certbot-prod:
	@sh build/bin/init-letsencrypt.prod.sh

build:
	@docker-compose \
					-f build/docker-compose.yaml \
					--env-file build/env/.env \
					build --no-cache

build-qaw:
	@docker-compose \
					-f build/docker-compose.qaw.yaml \
					--env-file build/env/.env \
					build --no-cache

build-prod:
	@docker-compose \
					-f build/docker-compose.prod.yaml \
					--env-file build/env/.env.prod \
					build
deploy:
	@docker-compose \
					-f build/docker-compose.yaml \
					--env-file build/env/.env \
					up --build --remove-orphans -d
deploy-qaw:
	@docker-compose \
					-f build/docker-compose.qaw.yaml \
					--env-file build/env/.env \
					-p qaw up --build --remove-orphans -d
deploy-prod:
	@docker-compose \
					-f build/docker-compose.prod.yaml \
					--env-file build/env/.env.prod \
					-p prod up --build --force-recreate -d
deploy-frontend:
	@docker-compose \
					-f build/docker-compose.frontend.yaml \
					--env-file build/env/.env \
					-p frontend up --build --remove-orphans -d

deploy-backend:
	@docker-compose \
					-f build/docker-compose.backend.yaml \
					--env-file build/env/.env \
					-p backend up --build --remove-orphans -d


deploy-event:
	@docker-compose \
					-f build/docker-compose.event.yaml \
					--env-file build/env/.env \
					-p event up --build --remove-orphans -d

deploy-event-rpi:
	@docker-compose \
					-f build/docker-compose.event.rpi.yaml \
					--env-file build/env/.env \
					-p event up --build --remove-orphans -d
deploy-monitoring:
	@docker-compose \
					-f build/docker-compose.monitoring.yaml \
					--env-file build/env/.env \
					-p monitoring up --build --remove-orphans -d

deploy-kong-rpi:
	@docker-compose \
					-f build/docker-compose.kong.rpi.yaml \
					--env-file build/env/.env \
					-p kong up --build --remove-orphans -d

deploy-static:
	@docker-compose \
					-f build/docker-compose.static.yaml \
					--env-file build/env/.env \
					-p static up --build --remove-orphans -d

deploy-webhook:
	@docker-compose \
					-f build/docker-compose.webhook.yaml \
					--env-file build/env/.env \
					-p webhook up --build --remove-orphans -d

down:
	@docker-compose \
					-f build/docker-compose.yaml \
					down --remove-orphans

down-qaw:
	@docker-compose \
					-f build/docker-compose.qaw.yaml \
					-p qaw down --remove-orphans

down-prod:
	@docker-compose \
					-f build/docker-compose.prod.yaml \
					-p prod down --rmi all --remove-orphans

down-frontend:
	@docker-compose \
					-f build/docker-compose.frontend.yaml \
					-p frontend down --remove-orphans

down-backend:
	@docker-compose \
					-f build/docker-compose.backend.yaml \
					-p backend down --remove-orphans

down-event:
	@docker-compose \
					-f build/docker-compose.event.yaml \
					-p event down --remove-orphans

down-event-rpi:
	@docker-compose \
					-f build/docker-compose.event.rpi.yaml \
					-p event down --remove-orphans
down-monitoring:
	@docker-compose \
					-f build/docker-compose.monitoring.yaml \
					-p monitoring down --remove-orphans

down-kong-rpi:
	@docker-compose \
					-f build/docker-compose.kong.rpi.yaml \
					-p kong down --remove-orphans

down-webhook:
	@docker-compose \
					-f build/docker-compose.webhook.yaml \
					-p webhook down --remove-orphans

down-static:
	@docker-compose \
					-f build/docker-compose.static.yaml \
					-p static down --remove-orphans

elk-prepare:
	@docker-compose \
					-f build/prepare/docker-compose.elk.prepare.yaml \
					--env-file build/env/.env \
					up --build

elk-generate-pwd:
	@docker-compose \
					-f build/prepare/docker-compose.elk.prepare.yaml \
                    exec -T elasticsearch bin/elasticsearch-setup-passwords auto --batch \
                    | tee secrets/elk/passwords.txt

elk-apply-pwd:
	@sh build/bin/generate-elk-secrets.sh



kong-prepare:
	@docker-compose \
					-f build/prepare/docker-compose.kong.prepare.yaml \
					--env-file build/env/.env \
					up --build

kong-prepare-qaw:
	@docker-compose \
					-f build/prepare/docker-compose.kong.qaw.prepare.yaml \
					--env-file build/env/.env \
					up --build

kong-prepare-rpi:
	@docker-compose \
					-f build/prepare/docker-compose.kong.rpi.prepare.yaml \
					--env-file build/env/.env \
					up --build

reset-backend-db:
	@bash bin/reset-db.sh