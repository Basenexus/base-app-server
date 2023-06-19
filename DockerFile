#
# Build stage
#
FROM gradle:7.6.1-jdk17 AS build
COPY . .
RUN gradle assemble

#
# Package stage
#
FROM openjdk:17
COPY --from=build /libs/base-app-server-0.0.1-SNAPSHOT.jar server.jar
# ENV PORT=8080
EXPOSE 8080
ENTRYPOINT ["java","-jar","server.jar"]