FROM maven:3.5-jdk-8-alpine as build
WORKDIR /app
COPY pom.xml pom.xml
COPY jpa jpa
COPY backend_generated_app_8fb117ee_3ccc_4e4a_b547_276c04fdd8c1 backend_generated_app_8fb117ee_3ccc_4e4a_b547_276c04fdd8c1
RUN mvn clean package -DnoTest=true

FROM openjdk:8-jre-alpine
WORKDIR /app
COPY --from=build /app/backend_generated_app_8fb117ee_3ccc_4e4a_b547_276c04fdd8c1/target/generated_app-0.0.1-SNAPSHOT.jar /app
EXPOSE 8080
ENTRYPOINT ["sh", "-c"]
CMD ["java -jar generated_app-0.0.1-SNAPSHOT.jar"]