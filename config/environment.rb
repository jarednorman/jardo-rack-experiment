ENV["RACK_ENV"] ||= "development"

require 'rubygems'
require 'bundler'

Bundler.require(:default, ENV["RACK_ENV"])

JARDO_LOADER = Zeitwerk::Loader.new.tap do |loader|
  loader.push_dir(
    File.join(File.dirname(__FILE__), "../src/")
  )

  loader.enable_reloading if ENV["RACK_ENV"] == "development"
  loader.setup
end
