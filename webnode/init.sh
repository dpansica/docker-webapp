#!/bin/bash

if [ ! -v "CONTEXT_PATH" ]
then
      CONTEXT_PATH=\\/archetype\\/
fi

if [ ! -v "DEPLOY_URL" ]
then
      DEPLOY_URL=http:\\/\\/localhost:8080
fi

if [ ! -v "OBJECTDB_URL" ]
then
      OBJECTDB_URL=objectdb:\\/\\/localhost:6136\\/$CONTEXT_PATH.odb
fi

if [ ! -v "OBJECTDB_USER" ]
then
      OBJECTDB_USER=admin
fi

if [ ! -v "OBJECTDB_PASSWORD" ]
then
      OBJECTDB_PASSWORD=admin
fi

git clone $1$2

cd $2

sed -i "s/https:\/\/www.punto61caffetteria.it\//$DEPLOY_URL/" ./src/main/frontend/src/environments/environment.prod.ts

sed -i "s/www.punto61caffetteria.it/$DEPLOY_URL/" ./etc/apache2/sites-enabled/archetype.conf
sed -i "s/archetype/$CONTEXT_PATH/" ./etc/apache2/sites-enabled/archetype.conf

chmod u+x ./src/main/frontend/build-by-env.sh

mvn clean install -Dspring-boot.run.profiles=bashparam

cp target/$2.war /usr/local/tomcat/webapps/


