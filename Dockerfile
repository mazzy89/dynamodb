FROM alpine:3.4

RUN apk add --no-cache openjdk7-jre

COPY build/dynamodb_local_latest /tmp/dynamodb_local_latest

WORKDIR /tmp/dynamodb_local_latest

EXPOSE 8000

CMD ["java", "-Djava.library.path=./DynamoDBLocal_lib", "-jar", "DynamoDBLocal.jar", "-sharedDb"]
