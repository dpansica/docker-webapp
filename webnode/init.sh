#!/bin/sh

#https://a1e0be1239c0d61b656f71ef86b60686b0544f05:x-oauth-basic@github.com/dpansica/


set CONTEXT_PATH=/archetype/
set DEPLOY_URL=http://localhost:8080

git clone $0$1

cd $1

chmod u+x ./src/main/frontend/build-by-env.sh

mvn clean install -Dspring-boot.run.profiles=bashparam

cp target/$1.war /usr/local/tomcat/webapps/


