FROM tomcat:9.0
RUN apt-get update && apt-get install -y \
	git \
	maven \
	jq \
	apache2

RUN a2enmod proxy && a2enmod proxy_http && a2enmod proxy_balancer && a2enmod lbmethod_byrequests

COPY archetype.conf /etc/apache2/sites-enabled/

RUN mkdir -p /home/app

ENV HOME=/home/app

RUN groupadd -r app && useradd -r -g app -d /home/app -s /sbin/nologin -c "Docker image user" app

RUN chgrp app /usr/local/tomcat/webapps

RUN chmod g+rwx /usr/local/tomcat/webapps

COPY init.sh /home/app

RUN chown -R app:app $HOME

WORKDIR $HOME

RUN chmod u+x init.sh

USER app



 

