FROM openjdk:7-jre

ADD build/dynamodb_local.tar.gz /tmp/dynamodb_local
WORKDIR /tmp/dynamodb_local

EXPOSE 8000

CMD ["java", "-Djava.library.path=./DynamoDBLocal_lib", "-jar", "DynamoDBLocal.jar", "-sharedDb"]
