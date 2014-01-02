require 'spec_helper'

describe "FallbackAssets::StylesheetsAssets" do
  specify { FallbackAssets::StylesheetsAssets.should be_a(Module) }

  let(:settings) { YAML.load_file("spec/fixtures/config/fallback_assets.yml") }

  before(:each) do
    stub_const "Rails", double(root: "spec/fixtures")
    stub_const "RAILS_ENV", "development"
  end

  describe "#fallback_stylesheet" do
    it "returns an stylesheet asset for default environment" do
      expect(FallbackAssets::StylesheetsAssets.fallback_stylesheet(:normalize)).to eq "normalize.css"
    end

    it "returns an stylesheet asset for production environment" do
      stub_const "RAILS_ENV", "production"
      expect(FallbackAssets::StylesheetsAssets.fallback_stylesheet(:normalize)).to eq "//cdn/normalize.min.css"
    end

    it "returns false when trying to load a existing javascript in config file" do
      expect(FallbackAssets::StylesheetsAssets.fallback_stylesheet(:jquery)).to be_false
    end

  end

end
