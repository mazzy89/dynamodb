.PHONY: all setup decompress build clean run

VERSION=1.0.0

all: setup decompress build

.DELETE_ON_ERROR:
setup:
	echo "Downloading build/dynamodb_local_latest.tar.gz"
	@-mkdir -p build/
	curl -Lf -o build/dynamodb_local_latest.tar.gz http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_latest.tar.gz

decompress: build/dynamodb_local_latest.tar.gz
	echo "Extracting build/dynamodb_local_latest.tar.gz"
	@-mkdir -p build/dynamodb_local_latest
	tar -xzf build/dynamodb_local_latest.tar.gz -C build/dynamodb_local_latest

build: build/dynamodb_local_latest
	docker build -t iflix/dynamodb:$(VERSION) -q .

clean:
	-rm -r build/

run:
	docker run -it --rm -p 8000:8000 --name dynamodb-local iflix/dynamodb:$(VERSION)
