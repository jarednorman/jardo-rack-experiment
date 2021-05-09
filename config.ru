require_relative "config/environment"

run -> (env) { Jardo.rack_app.call(env) }
