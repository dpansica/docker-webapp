FROM tomcat:9.0

#RUN apt-get update && apt-get install -y 

RUN mkdir -p /home/app

ENV HOME=/home/app

RUN groupadd -r app && useradd -r -g app -d /home/app -s /sbin/nologin -c "Docker image user" app

RUN chgrp app /usr/local/tomcat/webapps

RUN chmod -R g+rwx /usr/local/tomcat

COPY init.sh /home/app

COPY ROOT.war /usr/local/tomcat/webapps

RUN chown -R app:app $HOME

WORKDIR $HOME

RUN chmod u+x init.sh

USER app



 

