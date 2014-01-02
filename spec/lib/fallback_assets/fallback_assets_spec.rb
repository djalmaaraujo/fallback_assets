require 'spec_helper'

describe FallbackAssets do
  specify { FallbackAssets.should be_a(Module) }

  describe "Lib Version" do

    it "must have a valid version" do
      FallbackAssets::VERSION.should_not be_nil
      FallbackAssets::VERSION.should be_a_kind_of String
    end

  end

end
