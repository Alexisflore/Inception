name = inception

all:
	if [ ! -f srcs/requirements/nginx/tools/inception-nopass.key ] || [ ! -f srcs/requirements/nginx/tools/inception.crt ]; then \
	mkcert alfloren.42.fr ;\
	mv alfloren.42.fr-key.pem srcs/requirements/nginx/tools/private.key ;\
	mv alfloren.42.fr.pem srcs/requirements/nginx/tools/certificate.crt ;\
	fi
	@bash srcs/requirements/wordpress/tools/make_dir.sh
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d

build:
	@bash srcs/requirements/wordpress/tools/make_dir.sh
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

down:
	@printf "Stopping configuration ${name}...\n"
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env down

re: clean all

clean: down
	@docker stop $(docker ps -qa)
	@docker rm $(docker ps -qa)
	@docker rmi -f $(docker images -qa)
	@docker volume rm $(docker volume ls -q)
	@docker network rm $(docker network ls -q) 2>/dev/null
	@docker system prune -a

.PHONY	: all build down re clean
