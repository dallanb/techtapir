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



deploy-event-qaw:
	@docker-compose \
					-f build/docker-compose.event.qaw.yaml \
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

deploy-kafka:
	@docker-compose \
					-f build/docker-compose.kafka.yaml \
					--env-file build/env/.env \
					-p kafka up --build --remove-orphans -d

deploy-kafka-qaw:
	@docker-compose \
					-f build/docker-compose.kafka.qaw.yaml \
					--env-file build/env/.env \
					-p kafka up --build --remove-orphans -d

deploy-data:
	@docker-compose \
					-f build/docker-compose.data.yaml \
					--env-file build/env/.env \
					-p data up --build --remove-orphans -d

deploy-data-qaw:
	@docker-compose \
					-f build/docker-compose.data.qaw.yaml \
					--env-file build/env/.env \
					-p data up --build --remove-orphans -d

deploy-web:
	@docker-compose \
					-f build/docker-compose.web.yaml \
					--env-file build/env/.env \
					-p web up --build --remove-orphans -d

deploy-konga:
	@docker-compose \
					-f build/docker-compose.konga.yaml \
					--env-file build/env/.env \
					-p konga up --build --remove-orphans -d

deploy-nfs:
	@docker-compose \
					-f build/docker-compose.nfs.yaml \
					--env-file build/env/.env \
					-p nfs up --build --remove-orphans -d

deploy-certbot:
	@docker-compose \
					-f build/docker-compose.certbot.yaml \
					--env-file build/env/.env \
					-p certbot up --build --remove-orphans -d

deploy-certbot-renew:
	@docker-compose \
					-f build/docker-compose.certbot.renew.yaml \
					--env-file build/env/.env \
					-p certbot up --build --remove-orphans -d

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


down-event-qaw:
	@docker-compose \
					-f build/docker-compose.event.qaw.yaml \
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

down-kafka:
	@docker-compose \
					-f build/docker-compose.kafka.yaml \
					-p kafka down -v --remove-orphans

down-kafka-qaw:
	@docker-compose \
					-f build/docker-compose.kafka.qaw.yaml \
					-p kafka down -v --remove-orphans

down-data:
	@docker-compose \
					-f build/docker-compose.data.yaml \
					-p data down --remove-orphans

down-data-qaw:
	@docker-compose \
					-f build/docker-compose.data.qaw.yaml \
					-p data down --remove-orphans

down-static:
	@docker-compose \
					-f build/docker-compose.static.yaml \
					-p static down --remove-orphans

down-web:
	@docker-compose \
					-f build/docker-compose.web.yaml \
					-p web down --remove-orphans

down-konga:
	@docker-compose \
					-f build/docker-compose.konga.yaml \
					-p konga down --remove-orphans


down-nfs:
	@docker-compose \
					-f build/docker-compose.nfs.yaml \
					-p nfs down --remove-orphans

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

kong-prepare-prod:
	@docker-compose \
					-f build/prepare/docker-compose.kong.prod.prepare.yaml \
					--env-file build/env/.env \
					up --build

kong-prepare-rpi:
	@docker-compose \
					-f build/prepare/docker-compose.kong.rpi.prepare.yaml \
					--env-file build/env/.env \
					up --build

reset-backend-db:
	@bash bin/reset-db.sh
