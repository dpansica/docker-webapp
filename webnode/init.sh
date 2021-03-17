git clone https://a1e0be1239c0d61b656f71ef86b60686b0544f05:x-oauth-basic@github.com/dpansica/archetype.git

cd archetype

mvn clean install -Dspring-boot.run.profiles=prodhttps

cp target/archetype.war /usr/local/tomcat/webapps/


