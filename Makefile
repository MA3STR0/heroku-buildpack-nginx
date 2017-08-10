build: build-heroku-16 build-cedar-14 build-cedar-10

build-heroku-16:
	@echo "Building Nginx in docker for heroku-16..."
	@docker run -v $(shell pwd):/buildpack --rm -it -e "STACK=heroku-16" -w /buildpack heroku/heroku:16 bash -c 'apt-get update && apt-get install -y build-essential zlib1g-dev && scripts/build_nginx /buildpack/bin/nginx-heroku-16'
	@echo ""

build-cedar-14:
	@echo "Building Nginx in docker for cedar-14..."
	@docker run -v $(shell pwd):/buildpack --rm -it -e "STACK=cedar-14" -w /buildpack heroku/cedar:14 bash -c 'scripts/build_nginx /buildpack/bin/nginx-cedar-14'
	@echo ""

build-cedar-10:
	@echo "Building Nginx in docker for cedar..."
	@docker run -v $(shell pwd):/buildpack --rm -it -e "STACK=cedar" -w /buildpack heroku/cedar:10 bash -c 'scripts/build_nginx /buildpack/bin/nginx-cedar'
	@echo ""

shell:
	@echo "Opening heroku-16 shell..."
	@docker run -v $(shell pwd):/buildpack --rm -it -e "STACK=heroku-16" -e "PORT=5000" -w /buildpack heroku/heroku:16 bash
	@echo ""
