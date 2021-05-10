require "spec_helper"

RSpec.describe Jardo::HomeAction do
  describe "#call" do
    subject { described_class.new.call(request) }

    let(:request) { Rack::Request.new({}) }

    specify { expect(subject.first).to eq 200 }
  end
end
