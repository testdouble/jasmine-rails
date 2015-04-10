#!/bin/bash -e

function install_gems(){
  local version=$1
  export BUNDLE_GEMFILE="gemfiles/rails-$version"
  bundle install --no-binstubs
}
export -f install_gems

function run_tests(){
  local version=$1
  export BUNDLE_GEMFILE="gemfiles/rails-$version"
  bundle exec rake testbed:current:all
}
export -f run_tests

bundle install

install_gems "3.2"
install_gems "4.0"
install_gems "4.0-jasmine-2"
install_gems "4.1"

mkdir -p spec/testbeds
export BUNDLE_GEMFILE=""
generate-testbeds

run_tests "3.2"
run_tests "4.0"
run_tests "4.0-jasmine-2"
run_tests "4.1"
