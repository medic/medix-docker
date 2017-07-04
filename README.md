Dockerised Medic webapp stack
=============================

# Please note, this is **_experimental_**.

Run medic's stack using Docker.

# Get started

1. make sure that docker is installed and running
2. `make`

# Change version

You can upgrade to any build of the medic stack available in the [builds repository](https://staging.dev.medicmobile.org/_couch/_utils/database.html?builds).

## From local machine

	curl --insecure --header "Content-Type: application/json" https://admin:pass@localhost:8083/api/upgrade --data '{ "version": "upgrades-from-api" }'

## From inside container

	curl --header "Content-Type: application/json" http://admin:pass@localhost:5988/api/upgrade --data '{ "version": "upgrades-from-api"
