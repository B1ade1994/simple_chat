#!/bin/bash
set -e

bundle check || bundle install
./bin/rails db:prepare

exec "$@"
