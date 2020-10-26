.PHONY: serve serve_iframe build build_nocache

serve:
	sed -i "s|materialscloud-iframe|materialscloud|g" ./example-notebooks/voila.json
	docker-compose -f docker/docker-compose.yml up voila

serve_iframe:
	sed -i "s|materialscloud|materialscloud-iframe|g" ./example-notebooks/voila.json
	docker-compose -f docker/docker-compose.yml up voila

build:
	docker-compose -f docker/docker-compose.yml build voila

build_nocache:
	docker-compose -f docker/docker-compose.yml build --no-cache voila
