class JardoLoaderMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    JARDO_LOADER.reload!

    @app.call(env)
  end
end
