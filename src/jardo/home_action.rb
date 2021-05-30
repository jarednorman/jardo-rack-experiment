module Jardo
  class HomeAction < Action
    def call(request)
      render Jardo ::Page.new(content: ["<p>Coming soon.</p>"])
    end
  end
end
