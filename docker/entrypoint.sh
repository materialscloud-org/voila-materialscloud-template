#!/usr/bin/env bash

voila --template=${TEMPLATE} --enable_nbextensions=True --Voila.tornado_settings=$'{"headers":{"Content-Security-Policy":"frame-ancestors \'*\' localhost:*; report-uri /api/security/csp-report" }}' /home/voila/example-notebooks
