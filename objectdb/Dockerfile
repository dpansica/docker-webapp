FROM debian:buster
RUN apt-get update && apt-get install -y \
	wget \
	unzip \
	openjdk-11-jre
	
RUN mkdir -p /home/app

ENV HOME=/home/app

RUN groupadd -r app && useradd -r -g app -d /home/app -s /sbin/nologin -c "Docker image user" app

WORKDIR $HOME
	
RUN wget https://www.objectdb.com/get-file/da4ee7f6-4486-47b9-bb8d-6f345208ea94/devkit/objectdb-2.8.4.zip

RUN unzip objectdb-2.8.4.zip

ENV APP_HOME=/home/app/objectdb-2.8.4

RUN chown -R app:app $APP_HOME

WORKDIR $APP_HOME/bin

RUN chmod u+x server.sh

USER app

CMD ["./server.sh", "start"]


