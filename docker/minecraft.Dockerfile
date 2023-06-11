FROM ubuntu:22.04

WORKDIR /workdir
RUN apt-get update && \
	apt-get install -y --no-install-recommends \
	curl openjdk-18-jdk git

ENV MC_VERSION 1.20

RUN curl -O https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
RUN java -jar BuildTools.jar --rev $MC_VERSION

EXPOSE 25565

WORKDIR /world
CMD ["bash", "-c", "java -jar /workdir/spigot-$MC_VERSION.jar"]
