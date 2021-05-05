module Jardo
  class Action
    class << self
      def call(env)
        new.call(env)
      end
    end
  end
end
