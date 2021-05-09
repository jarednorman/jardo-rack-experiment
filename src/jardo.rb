module Jardo
  class << self
    def rack_app
      @rack_app ||= Rack::Builder.new do
        use JardoLoaderMiddleware

        run Jardo.router
      end.to_app
    end

    def router
      Hanami::Router.new do
        root to: HomeAction
      end
    end
  end
end
