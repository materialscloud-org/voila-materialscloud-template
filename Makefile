.PHONY: serve serve_iframe clean

serve: clean
	echo "TEMPLATE=materialscloud" > .env
	docker-compose -f docker/docker-compose.yml up voila

serve_iframe: clean
	echo "TEMPLATE=materialscloud-iframe" > .env
	docker-compose -f docker/docker-compose.yml up voila

build:
	docker-compose -f docker/docker-compose.yml build voila

clean:
	rm -f .env
