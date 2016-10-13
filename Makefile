# Application Definition
APPNAME=ptycoin-web
VERSION=$(shell git describe --tags)

# GCP Config
GCP_PROJECT=gfts-internal
NAMESPACE=gcr.io/$(GCP_PROJECT)
LOCATION=us-central1-b
CLUSTER=prod

# Docker Settings
INSTANCE=$(APPNAME)_default

build:  
	docker build -t $(NAMESPACE)/$(APPNAME) -t $(NAMESPACE)/$(APPNAME):$(VERSION) .
	sed 's~{{IMAGE}}~$(NAMESPACE)/$(APPNAME):$(VERSION)~g' docker-compose.tmpl.yml > docker-compose.yml
	sed 's~{{IMAGE}}~$(NAMESPACE)/$(APPNAME):$(VERSION)~g' gcp.tmpl.yml > gcp.yml

rundev: build
	docker-compose up --build

push:	build
	gcloud config set project $(GCP_PROJECT)
	gcloud docker push $(NAMESPACE)/$(APPNAME):$(VERSION)

deploy: push
	gcloud config set project $(GCP_PROJECT)
	gcloud container clusters get-credentials --zone $(LOCATION) $(CLUSTER)
	kubectl apply -f gcp.yml
