FROM openjdk:8-jdk

RUN git clone https://github.com/esotok/Pruebadev

WORKDIR Pruebadev

RUN ./gradlew build

EXPOSE 8080

CMD ./gradlew bootRun
