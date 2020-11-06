require 'bundler/setup'
require 'sinatra'
require 'require_all'
require 'sinatra/activerecord'

configure :development do
  set :database, 'sqlite3:db/database.db'
end


require_all 'application'
