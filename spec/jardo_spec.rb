require "spec_helper"

RSpec.describe Jardo do
  describe ".rack_app" do
    subject { described_class.rack_app }

    it { is_expected.to respond_to(:call) }
  end
end
