module Jardo
  class << self
    def application
      Rack::Builder.new do
        run Jardo.router
      end
    end

    def router
      @router ||= Hanami::Router.new do
        root to: ->(env) {
          [200, {"Content-Type" => "text/plain"}, ["Jardo.dev v1"]]
        }
      end
    end
  end
end
