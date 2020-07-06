.PHONY: build

certbot:
	@sh build/bin/init-letsencrypt.sh

certbot-prod:
	@sh build/bin/init-letsencrypt.prod.sh

build:
	@docker-compose \
					-f build/docker-compose.yaml \
					build

build-prod:
	@docker-compose \
					-f build/docker-compose.prod.yaml \
					build
deploy:
	@docker-compose \
					-f build/docker-compose.yaml \
					up --build
deploy-prod:
	@docker-compose \
					-f build/docker-compose.prod.yaml \
					up --build --force-recreate -d

down:
	@docker-compose \
					-f build/docker-compose.yaml \
					down --remove-orphans

down-prod:
	@docker-compose \
					-f build/docker-compose.prod.yaml \
					down --rmi all --remove-orphans
