# Tech Tapir

## Clone Repo

1. `> ssh-keygen -t rsa -b 4096 -C "dallan.bhatti@techtapir.com" -f $HOME/.ssh/github`
2. `> cat $HOME/.ssh/github.pub`
3. Copy and Paste the output into Github Profile
4. `> ssh-agent bash -c 'ssh-add $HOME/.ssh/github; git clone git@github.com:dallanb/techtapir.git'`  
   4a. `> eval 'ssh-agent -s'` (Linux)
5. `> ssh-add $HOME/.ssh/github`

## Prepare Submodules

1. `> git submodule update --init --force --remote --merge`

## Add Submodule

1. `> git submodule add git@github.com:dallanb/<reponame>.git services/<reponame>`

## Remove Submodule

1. `> git submodule deinit services/<reponame>`
2. `> git rm services/<reponame>`
b
## Apply a Submodule

1. `> git submodule update --init services/<reponame>`

## Batch Submodule Operation

1. `> git submodule foreach --recursive 'git pull origin dev'`

## Initialize from Flask-SDK

1. `> git remote add other git@github.com:dallanb/flask-sdk.git`
2. `> git pull other dev --allow-unrelated-histories`

## Diagrams
- [System Component Diagram](https://drive.google.com/file/d/1wI9KgLVSBMGdCZI7l0wpYpSfIZ9m6E2y/view?usp=sharing)
- [System Interaction Diagram](https://drive.google.com/file/d/1I4qd8TWiNAW0mLw97XzvMVPcviF5VnoR/view?usp=sharing)
- [Automated Build Overview](https://drive.google.com/file/d/1F-E_JWUe55KcaqDOAZV_Y7XK2gjsSDr4/view?usp=sharing)
- [Jenkins Workflow](https://drive.google.com/file/d/1sQJjAZoJCgqOaCbvPW0UmWWJXgOSjgZM/view?usp=sharing)
- [Development Network Topology](https://drive.google.com/file/d/1EwzkqHFXOWuR-XdLA_s6_-S01Va6To-J/view?usp=sharing)
- [Production Network Topology](https://drive.google.com/file/d/19aA7H-7ja94zW2KS6yB4uXldcWZDkNvy/view?usp=sharing)

## ELK Setup
[deviantony setup](https://github.com/deviantony/docker-elk#initial-setup)

## ELK Approach

In the ELK services (Elasticsearch, Kibana, Logstash) the project is brought up with a dummy password. In order to update this
password we will bring up the project with a docker-compose for ELK and then generate passwords. After the passwords are generated we will
bring up the main docker-compose with configuration files that use these new passwords

## Kong

### Konga Setup

#### Add Consumer

```
POST localhost:8001/consumers/
{
  "username": "konga",
  "custom_id": "1"
}
```

#### Add Service

```
POST 0.0.0.0:8001/services/
{
  "name": "api-v1-admin",
  "url": "http://kong:8001"
}
```

#### Add Route

```
POST 0.0.0.0:8001/services/api-v1-admin/routes/
{
  "name": "default-admin",
  "paths": ["/admin"]
}
```

#### Add Key Auth Plugin

```
POST 0.0.0.0:8001/services/api-v1-admin/plugins/
{
  "name": "key-auth"
}
```

#### Generate API Key

```
curl --location --request POST 'http://localhost:8001/consumers/konga/key-auth'
```

#### Configure Konga to use Kong Admin API

```
1. Open Browser to 0.0.0.0:1337
2. Navigate To Connections
3. + New Connection
4. Key Auth tab
    - Name: api-v1-admin
    - Loopback API URL: http://kong:8000/admin
    - API KEY: <previously generated API key>
```

### Auth Setup

#### Add Service

```
POST 0.0.0.0:8001/services/
{
  "name": "api-v1-auth",
  "url": "http://auth:5000"
}
```

#### Add Route

```
POST 0.0.0.0:8001/services/api-v1-auth/routes/
{
  "name": "default-auth",
  "paths": ["/api/v1/auth"]
}
```

### Alternative Kong Setup Instructions
https://getstream.io/blog/build-a-chat-app-with-stream-and-kong/
docker network create kong-net

docker run -d --name kong-database --network=kong-net \
  -p 5432:5432 -e "POSTGRES_USER=kong" -e "POSTGRES_PASSWORD=password"\
  -e "POSTGRES_DB=kong" postgres:9.6

docker run --rm --network=kong-net -e "KONG_DATABASE=postgres" \
  -e "KONG_PG_HOST=kong-database" -e "KONG_CASSANDRA_CONTACT_POINTS=kong-database" \
  -e "KONG_PG_PASSWORD=password" \
  kong:latest kong migrations bootstrap

docker run -d --name kong --network=kong-net -e "KONG_DATABASE=postgres" \
  -e "KONG_PG_HOST=kong-database" -e "KONG_CASSANDRA_CONTACT_POINTS=kong-database" \
  -e "KONG_PG_PASSWORD=password" \
  -e "KONG_PROXY_ACCESS_LOG=/dev/stdout" -e "KONG_ADMIN_ACCESS_LOG=/dev/stdout" \
  -e "KONG_PROXY_ERROR_LOG=/dev/stderr" -e "KONG_ADMIN_ERROR_LOG=/dev/stderr" \
  -e "KONG_ADMIN_LISTEN=0.0.0.0:8001, 0.0.0.0:8444 ssl" -p 8000:8000 -p 8443:8443 \
  -p 8001:8001 -p 8444:8444 kong:latest

## Let's Encrypt Wildcard Certificates for HAProxy with Cloudflare DNS Challenge
This is a good tutorial that I followed for setting up a wildcard certificate on my HAProxy Load Balancer Raspberry Pi  
https://docs.j7k6.org/letsencrypt-haproxy-cloudflare-wildcard-cert/

## Configure Adminer to use MongoDB

1. Go to portainer and enter adminer console as root
2. `> apk add autoconf gcc g++ make libffi-dev openssl-dev`
3. `> pecl install mongodb`
4. `> echo "extension=mongodb.so" > /usr/local/etc/php/conf.d/docker-php-ext-mongodb.ini`
5. restart docker container

## Mongo Home Creation

Due to lack of permissions from the container we must manually create a home directory for mongo that will allow
for saving of data from the container onto our host machine. To do this we will need to create a directory in data/{env} folder 
and chown this directory to user and group 999. We will also need to map this directory to volume in container at path /home/mongodb.

## AWS Components

Region: Oregon US-WEST 2
