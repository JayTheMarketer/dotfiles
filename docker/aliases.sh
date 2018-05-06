#!/usr/bin/env bash

if which docker >/dev/null; then
  alias dco='docker-compose'
  alias dcb='docker-compose build'
  alias dce='docker-compose exec'
  alias dcps='docker-compose ps'
  alias dcrestart='docker-compose restart'
  alias dcrm='docker-compose rm'
  alias dcr='docker-compose run'
  alias dcstop='docker-compose stop'
  alias dcup='docker-compose up'
  alias dcdn='docker-compose down'
  alias dcl='docker-compose logs'
  alias dclf='docker-compose logs -f'
  alias dckill='docker kill $(docker ps -aq)' # kill all containers
  alias dcrmvl='docker volume rm $(docker volume ls -qf dangling=true)' # remove all orphaned volumes
fi
