require "spec_helper"

RSpec.describe Jardo::Layout do
  describe "#render" do
    subject {
      layout.render(
        content: ["<p>", "foo", "</p>"]
      )
    }

    let(:layout) { described_class.new }

    it "renders the content within the layout" do
      expect(subject).to include "<p>foo</p>"
    end
  end
end
