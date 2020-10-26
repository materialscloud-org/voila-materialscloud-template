.PHONY: serve serve_iframe build build_nocache

VOILA=./example-notebooks/voila.json

serve: voila
	sed -i "s|TEMPLATE_NAME|materialscloud|g" ${VOILA}
	docker-compose -f docker/docker-compose.yml up voila

serve_iframe: voila
	sed -i "s|TEMPLATE_NAME|materialscloud-iframe|g" ${VOILA}
	docker-compose -f docker/docker-compose.yml up voila

build:
	docker-compose -f docker/docker-compose.yml build voila

build_nocache:
	docker-compose -f docker/docker-compose.yml build --no-cache voila

voila:
	@echo "{" > ${VOILA}
	@echo "  \"VoilaConfiguration\": {" >> ${VOILA}
	@echo "    \"enable_nbextensions\": true," >> ${VOILA}
	@echo "    \"theme\": \"light\"," >> ${VOILA}
	@echo "    \"template\": \"TEMPLATE_NAME\"" >> ${VOILA}
	@echo "  }," >> ${VOILA}
	@echo "  \"MappingKernelManager\": {" >> ${VOILA}
	@echo "    \"cull_idle_timeout\": 120," >> ${VOILA}
	@echo "    \"cull_interval\": 60" >> ${VOILA}
	@echo "  }," >> ${VOILA}
	@echo "  \"Voila\": {" >> ${VOILA}
	@echo "    \"tornado_settings\": {" >> ${VOILA}
	@echo "      \"headers\": {" >> ${VOILA}
	@echo "        \"Content-Security-Policy\": \"frame-ancestors *; report-uri /api/security/csp-report\"" >> ${VOILA}
	@echo "      }" >> ${VOILA}
	@echo "    }" >> ${VOILA}
	@echo "  }" >> ${VOILA}
	@echo "}" >> ${VOILA}
