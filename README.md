# base_template
This is a base template created for quickly creating data processing applications/API micro services.


# Setup guide

# Setup Mongodb - https://hub.docker.com/_/mongo/

docker run --name security_app -d mongo --auth

Add the following user for the example to work.

docker exec -it security_app mongo admin
connecting to: admin
db.createUser({ user: 'jphan', pwd: 'some-young-guy', roles: [ { role: "userAdminAnyDatabase", db: "admin" } ] });
