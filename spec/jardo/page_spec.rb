require "spec_helper"

RSpec.describe Jardo::Page do
  specify { expect(described_class.new(content: []).status).to eq 200 }
  specify { expect(described_class.new(content: []).content_type).to eq "text/html" }

  describe "#body" do
    subject { page.body }

    let(:page) {
      described_class.new(
        content: ["foo", "bar"],
        layout: layout
      )
    }

    let(:layout) { instance_double Jardo::Layout }

    before do
      allow(layout)
        .to receive(:render)
        .with(["foo", "bar"])
        .and_return "whatever"
    end

    it { is_expected.to eq "whatever" }
  end
end
