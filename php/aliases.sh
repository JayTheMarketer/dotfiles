#!/bin/sh

if which composer >/dev/null; then
  alias csu='composer self-update'
  alias cu='composer update'
  alias cr='composer require'
  alias crm='composer remove'
  alias ci='composer install'
  alias ccp='composer create-project'
  alias cdu='composer dump-autoload'
  alias cdo='composer dump-autoload --optimize-autoloader'
  alias cgu='composer global update'
  alias cgr='composer global require'
  alias cgrm='composer global remove'
  alias cshow='composer global show'
  alias clist='composer global show'

  # Update & cleanup global composer packages
  alias composeup="composer selfupdate; composer global update; composer clear-cache"
fi

if which laravel >/dev/null; then
  alias la5='php artisan'
  alias la5cache='php artisan cache:clear'
  alias la5routes='php artisan route:list'
  alias la5vendor='php artisan vendor:publish'
fi
