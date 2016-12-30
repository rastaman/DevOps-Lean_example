# Security Microservices
This is a security microservice. It will authenticate all comunications between microservices and frontend. 

# Setup guide

# Setup Mongodb - https://hub.docker.com/_/mongo/

docker run --name security_app -p 27017:27017 -d mongo --auth

Add the following user for the example to work.

docker exec -it security_app mongo admin
connecting to: admin
db.createUser({ user: 'jphan', pwd: 'someyoungguy', roles: [ "readWriteAnyDatabase", "dbAdminAnyDatabase", "userAdminAnyDatabase" ] });

testing account

mongo admin -u jphan -p someyoungguy

mongo 192.168.1.134:27017/auth admin -u jphan -p someyoungguy

JWT auth model examples used.

https://scotch.io/tutorials/authenticate-a-node-js-api-with-json-web-tokens


