module Jardo
  class Page
    def initialize(content:, layout: Jardo::Layout.new)
      @content = content
      @layout = layout
    end

    def status
      200
    end

    def content_type
      "text/html"
    end

    def body
      @layout.render(@content)
    end
  end
end
