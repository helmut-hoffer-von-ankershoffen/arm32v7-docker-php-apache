# arm32v7-docker-php-apache

Enter `make help` to see available commands.

## Goals

* Base image for arm32v7 with capabilities equivalent to `webdevops/php-apache-dev`
* Build automation
* Distribution via Docker hub

## Tasks

### Phase 0: Spike

- [x] Build for arm32v7 using Docker for Mac
- [x] Push to private docker registry of [Project ceil](https://github.com/helmuthva/ceil) using Ansible

### Phase 1: Basic capabilities

- [ ] supervisord
- [ ] php-fpm
- [ ] php-cli
- [ ] ...

###  Phase 2: Automation and Distribution

- [ ] Build in cloud
- [ ] Provide using Docker Hub
 
###  Phase 3: Cloud

- [ ] Build for armv64 (Amazon Graviton)
