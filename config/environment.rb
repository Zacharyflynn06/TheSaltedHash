ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
require 'carrierwave'
require 'carrierwave/orm/activerecord'

Bundler.require(:default, ENV['SINATRA_ENV'])

require "dotenv/load"

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

CarrierWave.configure do |config|
  config.root = "."
end

require './app/controllers/application_controller'
require_all 'app'
