# DynamoDB Docker Image

Run:

    make

This will download the latest AWS DynamoDB version and build/tag the Docker image
containing OpenJDK version 7.

Run the following command to remove the artifacts:

    make clean

Run Docker container:

    make run

This will expose the port `8000` to the host machine and it will be possible to access
to the database.

### More info
http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DynamoDBLocal.html
