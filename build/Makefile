certbot:
	@sh bin/init-letsencrypt.sh

certbot-prod:
	@sh bin/init-letsencrypt.prod.sh

build:
	@docker-compose \
					-f docker-compose.yaml \
					build
deploy:
	@docker-compose \
					-f docker-compose.yaml \
					up
deploy-prod:
	@docker-compose \
					-f docker-compose.prod.yaml \
					up --build --force-recreate