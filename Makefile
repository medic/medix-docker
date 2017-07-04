.PHONY: default clean build run kill

LOCAL_COUCH_PORT=5994

default: build run

clean:
	rm -rf build

build:
	mkdir -p build/dist
	wget -c --output-document build/dist/ddoc.json 'https://staging.dev.medicmobile.org/_couch/builds/upgrades-from-api?attachments=true'
	cp -r src/root/* build/dist/
	docker build --tag medix .

run:
	mkdir -p temp/root/couchdb
	docker run -i -t \
		-p ${LOCAL_COUCH_PORT}:5984 \
		-v couchdb:/usr/local/var/lib/couchdb \
		medix

kill:
	docker ps | grep medix | cut -d' ' -f1 | xargs docker kill
