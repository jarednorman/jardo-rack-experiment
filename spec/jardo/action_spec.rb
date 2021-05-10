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

  describe "#render" do
    subject { action.render response }

    let(:action) { described_class.new }

    let(:response) {
      double "response",
        status: 200,
        body: {foo: "bar"}.to_json,
        content_type: "application/json"
    }

    it "returns a Rack response" do
      expect(subject).to eq [
        200,
        {"Content-Type" => "application/json"},
        ['{"foo":"bar"}']
      ]
    end
  end
end
