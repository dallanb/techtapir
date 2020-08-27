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

build-prod:
	@docker-compose \
					-f build/docker-compose.prod.yaml \
					--env-file build/env/.env.prod \
					build
deploy:
	@docker-compose \
					-f build/docker-compose.yaml \
					--env-file build/env/.env \
					up --build --remove-orphans
deploy-prod:
	@docker-compose \
					-f build/docker-compose.prod.yaml \
					--env-file build/env/.env.prod \
					up --build --force-recreate -d

down:
	@docker-compose \
					-f build/docker-compose.yaml \
					down --remove-orphans

down-prod:
	@docker-compose \
					-f build/docker-compose.prod.yaml \
					down --rmi all --remove-orphans

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
