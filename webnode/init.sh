#!/bin/bash

cd /usr/local/tomcat/webapps/

curl -H 'Authorization: token a1e0be1239c0d61b656f71ef86b60686b0544f05' -H 'Accept: application/vnd.github.v3.raw' -O -L https://api.github.com/repos/dpansica/archetype/contents/staging/archetype.war

