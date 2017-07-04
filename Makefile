.PHONY: default clean build run kill

LOCAL_COUCH_PORT=5994

default: clean build run

clean:
	rm -rf build

build:
	mkdir -p build/dist
	cp -r src/root build/dist/
	wget -c -o build/dist/ddoc.json 'https://staging.dev.medicmobile.org/_couch/builds/upgrades-from-api?attachments=true'
	docker build --tag medix:whattt .

run:
	mkdir -p temp/root/couchdb
	docker run -i \
		-p ${LOCAL_COUCH_PORT}:5984 \
		-v couchdb:/usr/local/var/lib/couchdb \
		-e COUCHDB_DBNAME=medic \
		-e COUCHDB_USERNAME=admin \
		-e COUCHDB_PASSWORD=pass \
		medix

kill:
	docker ps | grep medix | cut -d' ' -f1 | xargs docker kill
