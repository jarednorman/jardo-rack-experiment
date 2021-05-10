module Jardo
  class Action
    class << self
      def call(env)
        request = Rack::Request.new(env)
        new.call(request)
      end
    end

    def render(response)
      [
        response.status,
        {"Content-Type" => response.content_type},
        [response.body]
      ]
    end
  end
end
