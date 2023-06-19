#
# Build stage
#
FROM gradle:7.6.1-jdk17 AS build
COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src
RUN gradle assemble --no-daemon

#
# Package stage
#
FROM openjdk:17

EXPOSE 8080

RUN mkdir /app

COPY --from=build /home/gradle/src/build/libs/*.jar /app/base-app-server.jar
# ENV PORT=8080
EXPOSE 8080
ENTRYPOINT ["java","-jar", "/app/base-app-server.jar"]

