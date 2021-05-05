module Jardo
  class << self
    def application
      Rack::Builder.new do
        run Jardo.router
      end
    end

    def router
      @router ||= Hanami::Router.new do
        root to: HomeAction
      end
    end
  end
end
