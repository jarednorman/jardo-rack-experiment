require "spec_helper"

RSpec.describe JardoLoader do
  describe ".new" do
    subject {
      described_class.new(
        path: "foo",
        enable_reloading: enable_reloading,
        loader: loader
      )
    }

    let(:loader) { instance_double Zeitwerk::Loader }
    let(:enable_reloading) { false }

    before do
      allow(loader).to receive(:push_dir)
      allow(loader).to receive(:enable_reloading)
      allow(loader).to receive(:setup)
    end

    it "tells the loader where the source code is" do
      expect(loader).to receive(:push_dir).with("foo")

      subject
    end

    it "sets up the loader" do
      expect(loader).to receive(:setup)

      subject
    end

    it "doesn't enable reloading" do
      expect(loader).not_to receive(:enable_reloading)

      subject
    end

    context "when reloading is enabled" do
      let(:enable_reloading) { true }

      it "enables reloading" do
        expect(loader).to receive(:enable_reloading)

        subject
      end
    end
  end

  describe "reload!" do
    subject { jardo_loader.reload! }

    let(:jardo_loader) {
      described_class.new(
        path: "foo",
        enable_reloading: true,
        loader: loader
      )
    }

    let(:loader) { instance_double Zeitwerk::Loader }

    before do
      allow(loader).to receive(:push_dir)
      allow(loader).to receive(:enable_reloading)
      allow(loader).to receive(:setup)

      # Forgive me for this horrid bunch of tests. Future me should extract the
      # filesystem listening/dirty-tracking piece to a separate object. This
      # code is not liable to change once it works and so further decomposing
      # it to make it properly testable just doesn't seem worth it here on this
      # lovely Sunday afternoon.
      #
      # If you are not me and you are reading this, hello! Reaching into
      # objects to alter their internal state so that you may test their
      # behaviour is not an acceptable way to test things. I really just wanted
      # some kind of test here.
      jardo_loader.instance_variable_set :@listening, true
    end

    context "when files have changed" do
      before do
        jardo_loader.instance_variable_set :@dirty, true
      end

      it "reloads the code" do
        expect(loader).to receive(:reload)

        subject
      end
    end

    context "when files haven't changed" do
      it "doesn't reload the code" do
        expect(loader).not_to receive(:reload)

        subject
      end
    end
  end
end
