.PHONY: all setup build clean run

IMAGE=iflix/dynamodb
VERSION=1.0.0

all: setup build

.DELETE_ON_ERROR:
setup:
	@echo "Downloading build/dynamodb_local.tar.gz"
	@-mkdir -p build/
	curl -Lf -s -o build/dynamodb_local.tar.gz http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_latest.tar.gz

build: build/dynamodb_local.tar.gz
	@echo "Bulding Docker image $(IMAGE)"
	docker build -t $(IMAGE):$(VERSION) -q .

clean:
	-rm -r build/

run:
	docker run -it --rm -p 8000:8000 --name dynamodb-local $(IMAGE):$(VERSION)
