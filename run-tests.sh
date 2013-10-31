#!/bin/bash -e

function run_tests(){
  local version=$1
  export BUNDLE_GEMFILE="gemfiles/rails-$version"
  bundle install
  rake testbed:current:all
}
export -f run_tests

bundle install
mkdir -p spec/testbeds
bundle exec generate-testbeds

run_tests "3.2"
run_tests "4.0"
run_tests "3.1"
