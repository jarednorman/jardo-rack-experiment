ENV["RACK_ENV"] ||= "development"

require 'rubygems'
require 'bundler'

Bundler.require(:default, ENV["RACK_ENV"])

Zeitwerk::Loader.new.tap do |loader|
  loader.push_dir File.join(File.dirname(__FILE__), "../src/")
  loader.setup
end

require_relative "application"
