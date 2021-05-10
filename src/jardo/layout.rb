module Jardo
  class Layout
    def render(content:, title: "Jared Norman")
      <<~HTML
        <html>
          <head>
            <title>#{title} | jardo.dev</title>

            <link rel="preconnect" href="https://fonts.gstatic.com">
            <link href="https://fonts.googleapis.com/css2?family=JetBrains+Mono&display=swap" rel="stylesheet"> 

            <style>
              body {
                font-family: "JetBrains Mono";
              }
            </style>
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
