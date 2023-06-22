# avro-test

Step1 : Download avro-tools-1.9.1.jar from below location

https://repo1.maven.org/maven2/org/apache/avro/avro-tools/1.9.1/

Step2 : Download sample.avdl from below location

https://github.com/StudentLearner7/avro-test/blob/main/sample.avdl

Step3: Convert avdl to json using below command

java -jar avro-tools-1.9.1.jar  idl sample.avdl sample.json


---
Test

https://chat.openai.com/share/12f3c952-b792-408f-913c-037150aa911f
version: '3'
services:
  kogito-runtime:
    image: quay.io/kiegroup/kogito-runtime-jvm:latest
    ports:
      - 8080:8080

  kogito-management-console:
    image: quay.io/kiegroup/kogito-management-console:latest
    ports:
      - 8280:8280

  kogito-task-console:
    image: quay.io/kiegroup/kogito-task-console:latest
    ports:
      - 8180:8180

