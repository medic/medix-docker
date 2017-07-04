.PHONY: default build run kill

LOCAL_COUCH_PORT=5994

default: build run

build:
	docker build --tag medix:whattt .

run:
	mkdir -p temp/root/couchdb
	docker run \
		-p ${LOCAL_COUCH_PORT}:5984 \
		-v couchdb:/usr/local/var/lib/couchdb \
		-e COUCHDB_DBNAME=medic \
		-e COUCHDB_USERNAME=admin \
		-e COUCHDB_PASSWORD=pass \
		medix

kill:
	docker ps | grep medix | cut -d' ' -f1 | xargs docker kill
