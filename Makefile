certbot:
	@sh build/bin/init-letsencrypt.sh

certbot-prod:
	@sh build/bin/init-letsencrypt.prod.sh

build:
	@docker-compose \
					-f build/docker-compose.yaml \
					build
deploy:
	@docker-compose \
					-f build/docker-compose.yaml \
					up
deploy-prod:
	@docker-compose \
					-f build.docker-compose.prod.yaml \
					up --build --force-recreate