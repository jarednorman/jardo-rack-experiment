module Jardo
  class Action
    class << self
      def call(env)
        request = Rack::Request.new(env)
        new.call(request)
      end
    end
  end
end
