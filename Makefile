.PHONY: default clean build run kill

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
	# Expose all the services for dev/debug.  Really we should only need 80 & 443
	docker run -i -t \
		-p 8080:5984 \
		-p 8081:5988 \
		-p 8082:80 \
		-p 8083:443 \
		-v couchdb:/usr/local/var/lib/couchdb \
		medix

kill:
	docker ps | grep medix | cut -d' ' -f1 | xargs docker kill
