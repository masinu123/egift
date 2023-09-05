# README

* Ruby version
3.1.4

* Rails version
7.0.7.2

* System dependencies
Yarn
Nodejs
PostgreSQL (direct install or through Docker)
VScode with related extensions

* Configuration
run 'bundle install'

* Database creation
A live PostgreSQL Database
then fullfill host, port, username, password of your database into database.yml file

Example file:

default: &default
  adapter: postgresql
  encoding: unicode
  pool: <%= ENV.fetch('RAILS_MAX_THREADS', 5) %>
  host: <%= ENV.fetch('DATABASE_HOST', '127.0.0.1') %>
  port: <%= ENV.fetch('DATABASE_PORT', 5432) %>
  username: postgres
  password: ''
development:
  <<: *default
  database: egift-dev
test:
  <<: *default
  database: egift-test

* Database initialization
run 'rails db:create' / 'rake db:create'
run 'rails db:migrate' / 'rake db:migrate'
run 'rails db:seed' / 'rake db:seed'

seed file will create 2 account
admin@egift.com/111111 which is admin account with all system right

* How to run the test suite
run 'guard'
then 'all' to run all the test suite

*** After all the config above
run 'rails server' to start project at localhost:3000
use the admin account to login

Hope you enjoy my project!!!