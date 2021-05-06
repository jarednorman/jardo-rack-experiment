require "spec_helper"

RSpec.describe Jardo::Action do
  describe ".call" do
    subject { action.call(env) }

    let(:action) {
      Class.new(described_class) do
        def call(request); end
      end
    }

    let(:env) { {some: "hash"} }

    it "delegates request handling to an instance" do
      expect_any_instance_of(action).to receive(:call) do |_instance, request|
        expect(request.env).to eq({some: "hash"})
        [200, {}, "success"]
      end

      expect(subject).to eq [200, {}, "success"]
    end
  end
end
