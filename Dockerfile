FROM mcr.microsoft.com/java/jre:8-zulu-alpine
ENV VERSION 1.0.0

ADD https://github.com/redskap/swagger-brake/releases/download/$VERSION/swagger-brake-$VERSION-cli.jar swagger-brake.jar

COPY entrypoint.sh entrypoint.sh

RUN chmod +x entrypoint.sh

WORKDIR /app

ENTRYPOINT ["/entrypoint.sh"]
