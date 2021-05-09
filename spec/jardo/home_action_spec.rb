require "spec_helper"

RSpec.describe Jardo::HomeAction do
  describe "#call" do
    subject { described_class.new.call(request) }

    let(:request) { Rack::Request.new({}) }

    it { is_expected.to eq [200, {"Content-Type" => "text/plain"}, ["Jardo.dev v2"]] }
  end
end
