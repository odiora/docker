FROM maven:alpine AS build
RUN apk add --no-cache \
    git 
RUN git clone https://github.com/odiora/simple-jar-app /home/simple-jar-app
WORKDIR /home/simple-jar-app
RUN mvn package 

FROM openjdk:8u201-jre-alpine
COPY --from=build /home/simple-jar-app/ /home/simple-jar-app/
CMD ["java", "-jar", "/home/simple-jar-app/target/simple-jar-app-0.0.1-SNAPSHOT.jar"] 
