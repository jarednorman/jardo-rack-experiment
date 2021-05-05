module Jardo
  class << self
    def application
      @application ||= Application.new
    end
  end

  class Application
    def call(env)
      [200, {'Content-Type' => 'text/plain'}, ['Jardo.dev v1']]
    end
  end
end
