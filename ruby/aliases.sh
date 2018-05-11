#!/bin/sh

if which ruby >/dev/null; then
  alias rb="ruby"
  alias sgem='sudo gem' # Run sudo gem on system ruby, not active ruby.
  alias rfind='find . -name "*.rb" | xargs grep -n' # Find ruby file
  alias gin="gem install"
  alias gun="gem uninstall"
  alias gli="gem list"
  alias migrate='rake db:migrate'
  alias gemup="gem update --system; gem update; gem cleanup" # Update & cleanup ruby gems
fi

if which rails >/dev/null; then
  alias ror='bundle exec rails'
  alias rorc='bundle exec rails console'
  alias rordc='bundle exec rails dbconsole'
  alias rordm='bundle exec rake db:migrate'
  alias rordM='bundle exec rake db:migrate db:test:clone'
  alias rordr='bundle exec rake db:rollback'
  alias rorg='bundle exec rails generate'
  alias rorl='tail -f "$(ruby-app-root)/log/development.log"'
  alias rorlc='bundle exec rake log:clear'
  alias rorp='bundle exec rails plugin'
  alias rorr='bundle exec rails runner'
  alias rors='bundle exec rails server'
  alias rorsd='bundle exec rails server --debugger'
  alias rorx='bundle exec rails destroy'
fi
