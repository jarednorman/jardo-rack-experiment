class JardoLoader
  def initialize(path:, enable_reloading:, loader: Zeitwerk::Loader.new)
    @loader = loader

    @loader.push_dir path
    @loader.enable_reloading if enable_reloading
    @loader.setup
  end

  def reload!
    start_reloading!

    if @dirty
      @dirty = false
      @loader.reload
    end
  end

  private

  def start_reloading!
    return if @listening

    Listen.to(*@loader.dirs) do
      @dirty = true
    end.start if @loader.reloading_enabled?

    @listening = true
  end
end
