FROM alpine/git AS clone
WORKDIR /app
RUN git clone <CODECOMMIT_REPO_URL>


FROM maven:3.5-jdk-8-alpine AS build
WORKDIR /app
COPY --from=clone /app/HelloWorld /app
RUN mvn package

FROM tomcat:8.0
WORKDIR /app
COPY --from=build /app/target/SampleServlet.war /usr/local/tomcat/webapps/
EXPOSE 8080