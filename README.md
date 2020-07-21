# Huncho

## Clone Repo

1. `> ssh-keygen -t rsa -b 4096 -C "dallan.bhatti@cybertapir.com" -f $HOME/.ssh/github`
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



