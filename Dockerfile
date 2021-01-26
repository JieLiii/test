FROM registry.cn-hangzhou.aliyuncs.com/jackinjava/jre8:v1
RUN ls /usr/local
COPY target/test-0.0.1-SNAPSHOT.jar /usr/local/tmp/app.jar
ENTRYPOINT ["java","-jar","/usr/local/tmp/app.jar"]
EXPOSE 8080
