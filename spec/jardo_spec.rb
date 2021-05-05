require "spec_helper"

RSpec.describe Jardo do
  describe ".application" do
    subject { described_class.application }

    it { is_expected.to respond_to(:call) }
  end
end
