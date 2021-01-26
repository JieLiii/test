FROM registry.cn-hangzhou.aliyuncs.com/jackinjava/jre8:v1
RUN mkdir -p /usr/local/tmp && ls
COPY target/test-0.0.1-SNAPSHOT.jar /usr/local/tmp/app.jar
ENTRYPOINT ["java","-jar","/usr/local/tmp/app.jar"]
EXPOSE 8080