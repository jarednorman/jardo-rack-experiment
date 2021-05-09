require "spec_helper"

RSpec.describe JardoLoaderMiddleware do
  describe "#call" do
    it "invokes the reloader and calls the app" do
      app = ->(env) { [200, {}, "blah"] }

      expect(JARDO_LOADER).to receive(:reload!)

      expect(described_class.new(app).call({}))
        .to eq([200, {}, "blah"])
    end
  end
end
