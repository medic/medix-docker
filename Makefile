.PHONY: default clean build run kill

LOCAL_COUCH_PORT=5994

default: build run

clean:
	rm -rf build

build:
	mkdir -p build/dist
	wget -c --output-document build/ddoc.json \
		--header='Accept: application/json' \
		'https://staging.dev.medicmobile.org/_couch/builds/upgrades-from-api?attachments=true'
	jq 'del(._rev)' build/ddoc.json > build/dist/ddoc.json
	cp -r src/* build/dist/
	docker build --tag medix .

run:
	mkdir -p temp/root/couchdb
	docker run -i -t \
		-p ${LOCAL_COUCH_PORT}:5984 \
		-p 5999:80 \
		-v couchdb:/usr/local/var/lib/couchdb \
		medix

kill:
	docker ps | grep medix | cut -d' ' -f1 | xargs docker kill
