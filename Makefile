.PHONY: build

develop:
	yarn develop

build:
	yarn build
	rm -rf build/site && cp -r public build/site

docker_build: build
	docker build -t chrissearle/www_cso:`git rev-parse --short HEAD` build

package: docker_build
	docker tag chrissearle/www_cso:`git rev-parse --short HEAD` chrissearle/www_cso:staging

stage:
	docker push chrissearle/www_cso:`git rev-parse --short HEAD`
	docker push chrissearle/www_cso:staging

promote:
	docker tag chrissearle/www_cso:staging chrissearle/www_cso:latest
	docker push chrissearle/www_cso:latest

run:
	docker run -d -p 8088:80 chrissearle/www_cso:`git rev-parse --short HEAD`

run_stage:
	docker run -d -p 8088:80 chrissearle/www_cso:staging

clean:
	rm -rf build/site