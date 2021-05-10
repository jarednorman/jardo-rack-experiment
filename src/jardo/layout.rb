module Jardo
  class Layout
    def render(content)
      <<~HTML
        <html>
          <head>
            <title>Jardo.dev</title>
          </head>
          <body>
            <h1>Jardo.dev</h1>
            #{content.join}
          </body>
        </html>
      HTML
    end
  end
end
