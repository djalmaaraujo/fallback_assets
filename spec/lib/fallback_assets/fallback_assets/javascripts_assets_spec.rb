require 'spec_helper'

describe "FallbackAssets::JavascriptsAssets" do
  specify { FallbackAssets::JavascriptsAssets.should be_a(Module) }

  let(:settings) { YAML.load_file("spec/fixtures/config/fallback_assets.yml") }

  before(:each) do
    stub_const "Rails", double(root: "spec/fixtures")
    stub_const "RAILS_ENV", "development"
  end

  describe "#fallback_javascript" do
    it "returns an javascript asset for default environment" do
      expect(FallbackAssets::JavascriptsAssets.fallback_javascript(:jquery)).to eq "jquery.js"
    end

    it "returns an javascript asset for production environment" do
      stub_const "RAILS_ENV", "production"
      expect(FallbackAssets::JavascriptsAssets.fallback_javascript(:jquery)).to eq "//cdn/jquery.min.js"
    end

    it "returns false when trying to load a existing stylesheet in config file" do
      expect(FallbackAssets::JavascriptsAssets.fallback_javascript(:normalize)).to be_false
    end

  end

end
