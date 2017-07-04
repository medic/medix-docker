.PHONY: default build run kill

default: build run

build:
	docker build --tag medix:whattt .

run:
	mkdir -p temp/root/couchdb
	docker run \
		-p 5994:5984 \
		-v couchdb:/usr/local/var/lib/couchdb \
		-e COUCHDB_DBNAME=medic \
		-e COUCHDB_USERNAME=admin \
		-e COUCHDB_PASSWORD=pass \
		medix

kill:
	docker ps | grep medix | cut -d' ' -f1 | xargs docker kill
