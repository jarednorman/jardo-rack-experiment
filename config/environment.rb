ENV["RACK_ENV"] ||= "development"

require 'rubygems'
require 'bundler'

Bundler.require(:default, ENV["RACK_ENV"])

require 'json'

$LOAD_PATH << File.join(File.dirname(__FILE__), "../lib")

require 'jardo_loader'
require 'jardo_loader_middleware'

JARDO_LOADER = JardoLoader.new(
  path: File.join(File.dirname(__FILE__), "../src/"),
  enable_reloading: ENV["RACK_ENV"] == "development"
)
