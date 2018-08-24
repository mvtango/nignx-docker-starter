
SHELL := /bin/bash

PWD   := $(shell pwd)

MODE := -it
PORT := 80
run:
	docker run $(MODE) --restart=unless-stopped \
                    -v $(PWD)/html:/usr/share/nginx/html:ro \
                    -v $(PWD)/conf/nginx.conf:/etc/nginx/nginx.conf:ro  \
		    -v $(PWD)/conf/conf.d:/etc/nginx/conf.d \
		    --network=local \
		    --name webserver \
                    -p $(PORT):80 nginx:mainline-alpine 



