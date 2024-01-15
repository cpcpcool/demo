FROM openjdk:17-jdk-slim

## HOME DIR ===========================
## (작업할 위치) 배포 jar 옮겨줄 경로
## 경로가 없을 경우, 생성 후 이동
## 이후 명령어는 WORKDIRECTORY에서 실행
WORKDIR /good

## Copy files
## [문법] COPY 현재파일위치 복사할 위치
## 현재위치 (배포 jar파일 ./은 /good 기준 이름변경가능)
COPY build/libs/demo-0.0.1-SNAPSHOT.jar ./demo.jar

COPY hello.sh ./hello.sh

## RUN 리눅스 명령어
## hello.sh 파일에 실행 권한 추가 chmod(changemod)
RUN chmod +x ./hello.sh

## /good에 hello.sh를 실행하라
ENTRYPOINT [ "sh", "./hello.sh" ]