Dockerised Medic webapp stack
=============================

# Please note, this is **_experimental_**.

Run medic's stack using Docker.

# Get started

1. make sure that docker is installed and running
2. `make`

# Change version

You can upgrade to any build of the medic stack available in the [builds repository](https://staging.dev.medicmobile.org/_couch/_utils/database.html?builds).

## From admin UI

If the current version supports it, browse to https://localhost:8083/medic/_design/medic/_rewrite/#/configuration/upgrade and use the upgrade UI.

## From local machine

	curl --insecure \
	     --header "Content-Type: application/json" \
	     --data '{ "version": "upgrades-from-api" }' \
	     https://admin:pass@localhost:8083/api/upgrade

## From inside container

	curl --header "Content-Type: application/json" \
	     --data '{ "version": "upgrades-from-api" \
	     http://admin:pass@localhost:5988/api/upgrade

# TODO

* Make sure that horticulturalist restarts medic-api and medic-sentinel on upgrade
* Fix all the inline TODOs
