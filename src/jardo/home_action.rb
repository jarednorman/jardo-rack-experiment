module Jardo
  class HomeAction < Action
    def call(env)
      [200, {"Content-Type" => "text/plain"}, ["Jardo.dev v1"]]
    end
  end
end
