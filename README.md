# Huncho

## Clone Repo

1. `> ssh-keygen -t rsa -b 4096 -C "dallan.bhatti@cybertapir.com" -f $HOME/.ssh/github`
2. `> cat $HOME/.ssh/github.pub`
3. Copy and Paste the output into Github Profile
4. `> ssh-agent bash -c 'ssh-add $HOME/.ssh/github; git clone git@github.com:dallanb/huncho.git'`  
4a. `> eval 'ssh-agent -s'` (Linux)  
5. `> ssh-add $HOME/.ssh/github`

## Prepare Submodules
1. `> git submodule update --init --force --remote --merge`

## Add Submodule
1. `> git submodule add git@github.com:dallanb/<reponame>.git services/<reponame>`

## Remove Submodule
1. `> git submodule deinit git@github.com:dallanb/<reponame>.git`
2. `> git rm git@github.com:dallanb/<reponame>.git`

## ELK Setup
[deviantony setup](https://github.com/deviantony/docker-elk#initial-setup)

## ELK Approach
In the ELK services (Elasticsearch, Kibana, Logstash) the project is brought up with a dummy password. In order to update this
password we will bring up the project with a docker-compose for ELK and then generate passwords. After the passwords are generated we will 
bring up the main docker-compose with configuration files that use these new passwords

